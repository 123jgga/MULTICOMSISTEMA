package com.diseño.MultiCom.util;

import com.diseño.MultiCom.enums.RoleName;
import com.diseño.MultiCom.model.Rol;
import com.diseño.MultiCom.model.Usuario;
import com.diseño.MultiCom.service.RoleService;
import com.diseño.MultiCom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

@Component
public class Initialize implements CommandLineRunner {

	@Autowired
	RoleService rolService;

	@Autowired
	UserService userservice;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public void run(String... args) {
		if (rolService.getRolesSize() == 0) {
			Rol rolAdmin = new Rol(RoleName.ROLE_ADMIN);
			Rol rolUser = new Rol(RoleName.ROLE_MOD);
			Rol client = new Rol(RoleName.ROLE_CLIENTE);
			rolService.save(rolAdmin);
			rolService.save(rolUser);
			rolService.save(client);
		}

		if (userservice.getUserSize() == 0) {
			Usuario useradmin = new Usuario("Edita", "Chafloque", "994470474", "umb.editachafloque@gmail.com",
					passwordEncoder.encode("123456"), true);
			Set<Rol> roles = new HashSet<>();

			roles.add(rolService.getByRolNombre(RoleName.ROLE_ADMIN).get());
			useradmin.setRoles(roles);
			userservice.save(useradmin);
		}
	}
}