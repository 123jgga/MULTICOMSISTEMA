package com.diseño.MultiCom.repository;

import com.diseño.MultiCom.model.Reclamo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClaimRepository extends JpaRepository<Reclamo, Integer> {
	
}
