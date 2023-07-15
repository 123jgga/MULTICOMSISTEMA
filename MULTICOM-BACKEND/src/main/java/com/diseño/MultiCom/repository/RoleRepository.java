package com.diseño.MultiCom.repository;

import com.diseño.MultiCom.model.Rol;
import com.diseño.MultiCom.enums.RoleName;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RoleRepository extends JpaRepository<Rol, Integer> {
    Optional<Rol> findByRolNombre(RoleName rolNombre);
}