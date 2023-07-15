package com.diseño.MultiCom.controller;

import com.diseño.MultiCom.model.Usuario;
import org.springframework.web.bind.annotation.*;
import com.diseño.MultiCom.dto.*;

import com.diseño.MultiCom.jwt.*;
import com.diseño.MultiCom.logic.myFuntions;
import com.diseño.MultiCom.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*; 
import org.springframework.security.authentication.*;  
import org.springframework.security.crypto.password.PasswordEncoder;  

@RestController
@RequestMapping("/recovery")
@CrossOrigin

public class RecoveryPasswordController {

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    UserService usuarioService;

    @Autowired
    RoleService rolService;

    @Autowired
    JwtProvider jwtProvider;  

    @PostMapping("/password")
    public ResponseEntity<?> recoverypassword(@RequestBody _RecoveryPassword recoveryFrom){
    	String msg ;
    	
        if(!usuarioService.existsByEmail( recoveryFrom.getEmail() )) 
        	return new ResponseEntity<Object>(new _Message("Correo no registrado."), HttpStatus.NOT_FOUND); 
        
        try {
        	
        	String newPassword = myFuntions.generatedID();
        	
        	Usuario user = usuarioService.getByEmail( recoveryFrom.getEmail() ).get();
        	user.setContrasena( passwordEncoder.encode( newPassword ) ); 
        	
        	usuarioService.save( user );  
        	
        	msg = myFuntions.sendMail( recoveryFrom.getEmail() , "Se cambiò su contraseña correctamente.", newPassword );
            System.out.println(msg);
        	return new ResponseEntity<Object>(new _Message("Se reestableció su contraseña."), HttpStatus.OK);
		} catch (Exception e) {
			msg = e.getMessage();
        	return new ResponseEntity<Object>(new _Message(msg), HttpStatus.BAD_REQUEST);  
		} 
    } 
	
}

