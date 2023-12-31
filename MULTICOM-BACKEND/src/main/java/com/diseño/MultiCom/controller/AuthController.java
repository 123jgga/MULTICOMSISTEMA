package com.diseño.MultiCom.controller;

import com.diseño.MultiCom.dto.JwtDto;
import com.diseño.MultiCom.dto._LoginUser;
import com.diseño.MultiCom.dto._Message;
import com.diseño.MultiCom.dto._NewUser;
import com.diseño.MultiCom.enums.RoleName;
import com.diseño.MultiCom.jwt.JwtProvider;
import com.diseño.MultiCom.logic.myFuntions;
import com.diseño.MultiCom.service.RoleService;
import com.diseño.MultiCom.service.UserService;
import com.diseño.MultiCom.model.Rol;
import com.diseño.MultiCom.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	UserService usuarioService;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	RoleService rolService;

	@Autowired
	JwtProvider jwtProvider;

	@PostMapping("/register")
	public ResponseEntity<?> register(@Valid @RequestBody _NewUser nuevoUsuario, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return new ResponseEntity<Object>(new _Message("Campos inválidos."), HttpStatus.BAD_REQUEST);

		if (usuarioService.existsByNumero(nuevoUsuario.getNumero()))
			return new ResponseEntity<Object>(new _Message("Ese número ya esta registrado."), HttpStatus.BAD_REQUEST);

		if (usuarioService.existsByEmail(nuevoUsuario.getEmail()))
			return new ResponseEntity<Object>(new _Message("Ese email ya esta registrado."), HttpStatus.BAD_REQUEST);

		String msg;

		try {
			String newPassword = myFuntions.generatedID();
			Set<Rol> roles = new HashSet<>();

			roles.add(rolService.getByRolNombre(RoleName.ROLE_CLIENTE).get());
			Usuario cliente = new Usuario(nuevoUsuario.getNombre(), nuevoUsuario.getApellido(),
					nuevoUsuario.getNumero(), nuevoUsuario.getEmail(), passwordEncoder.encode(newPassword), true);

			cliente.setRoles(roles);
			usuarioService.save(cliente);

			msg = myFuntions.sendMail(cliente.getEmail(), "Bienvenido, se le a asignado una contraseña:", newPassword);
		} catch (Exception e) {
			msg = "Error al enviar mensaje, verifique el correo.";
			return new ResponseEntity<Object>(new _Message(msg), HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<Object>(new _Message("Bienvenido, se le a asignado una contraseña, revise su gmail."),
				HttpStatus.CREATED);
	}

	@PostMapping("/users")
	public ResponseEntity<?> loginForUser(@Valid @RequestBody _LoginUser LoginUser, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return new ResponseEntity<Object>(new _Message("Campos inválidos."), HttpStatus.BAD_REQUEST);

		if (!usuarioService.existsByEmail(LoginUser.getEmail()))
			return new ResponseEntity<Object>(new _Message("Correo no registrado."), HttpStatus.NOT_FOUND);

		if (!usuarioService.getByEmail(LoginUser.getEmail()).get().getEstado())
			return new ResponseEntity<Object>(new _Message("Usted a sido dado de baja."), HttpStatus.UNAUTHORIZED);

		try {

			Authentication authentication = authenticationManager.authenticate(
					new UsernamePasswordAuthenticationToken(LoginUser.getEmail(), LoginUser.getPassword()));

			SecurityContextHolder.getContext().setAuthentication(authentication);
			String jwt = jwtProvider.generateToken(authentication);
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();

			Collection<? extends GrantedAuthority> authorities = userDetails.getAuthorities();
			List<GrantedAuthority> listAuthorities = new ArrayList<>(authorities);

			for (GrantedAuthority listAuthority : listAuthorities)
				if (listAuthority.toString().equals("ROLE_CLIENTE"))
					return new ResponseEntity<Object>(new _Message("Usted no tiene acceso al sistema."), HttpStatus.UNAUTHORIZED);

			JwtDto jwtDto = new JwtDto(jwt, userDetails, userDetails.getAuthorities());
			return new ResponseEntity<Object>(jwtDto, HttpStatus.OK);

		} catch (Exception e) {
			return new ResponseEntity<Object>(new _Message("Datos incorrectos."), HttpStatus.NOT_FOUND);
		}
	}

	@PostMapping("/clients")
	public ResponseEntity<?> loginForClient(@Valid @RequestBody _LoginUser LoginUser, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return new ResponseEntity<Object>(new _Message("Campos inválidos."), HttpStatus.BAD_REQUEST);

		if (!usuarioService.existsByEmail(LoginUser.getEmail()))
			return new ResponseEntity<Object>(new _Message("Correo no registrado."), HttpStatus.NOT_FOUND);

		if (!usuarioService.getByEmail(LoginUser.getEmail()).get().getEstado())
			return new ResponseEntity<Object>(new _Message("Usted a sido dado de baja."), HttpStatus.UNAUTHORIZED);

		try {

			Authentication authentication = authenticationManager.authenticate(
					new UsernamePasswordAuthenticationToken(LoginUser.getEmail(), LoginUser.getPassword()));

			SecurityContextHolder.getContext().setAuthentication(authentication);
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();

			Collection<? extends GrantedAuthority> authorities = userDetails.getAuthorities();
			List<GrantedAuthority> listAuthorities = new ArrayList<>(authorities);

			for (GrantedAuthority listAuthority : listAuthorities)
				if (!listAuthority.toString().equals("ROLE_CLIENTE"))
					return new ResponseEntity<Object>(new _Message("Usted no tiene acceso al sistema."), HttpStatus.UNAUTHORIZED);

			String jwt = jwtProvider.generateToken(authentication);
			JwtDto jwtDto = new JwtDto(jwt, userDetails, userDetails.getAuthorities());
			return new ResponseEntity<Object>(jwtDto, HttpStatus.OK);

		} catch (Exception e) {
			return new ResponseEntity<Object>(new _Message("Datos incorrectos."), HttpStatus.NOT_FOUND);
		}
	}

}
