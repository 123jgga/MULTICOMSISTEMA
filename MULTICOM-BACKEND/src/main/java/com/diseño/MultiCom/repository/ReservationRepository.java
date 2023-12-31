package com.diseño.MultiCom.repository;

import com.diseño.MultiCom.model.Reserva;
import com.diseño.MultiCom.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ReservationRepository extends JpaRepository<Reserva, Integer> {
    Optional<Reserva> findByHoraInicio(String horaInicio);
    Optional<Reserva> findByHoraFin(String horaFin); 
    List<Reserva> findByUsuario(Usuario usuario);
    Optional<Reserva> findById(int id);
    
    boolean existsByFecha(String fecha);
    boolean existsByHoraInicio(String horaInicio);
    boolean existsByHoraFin(String horaFin);
}