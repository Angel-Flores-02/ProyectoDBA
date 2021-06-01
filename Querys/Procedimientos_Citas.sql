-- Procedimiento para la tabla cita_medica (Parte del paciente)
	-- Consulta por estados
	DELIMITER $$
	Create procedure consultaCita
	(IN estate varchar(25))
	BEGIN
		 SELECT * FROM doctor  where estado = estate;
	END$$
	DELIMITER 
	drop procedure consultaCita;
	call consultaCita('jalisco');
	select * from doctor;

	-- Insercion de datos/ creacion de cita
	DELIMITER $$
	Create procedure crearCita
	(IN idDoc varchar(6),
	IN idPac varchar(6),
	IN pac varchar(25),
	IN fecha varchar(15),
	IN hCita varchar(15))
	BEGIN
		 INSERT INTO cita_medica (`id_doctor`,`id_paciente`,`nombre_paciente`,`Fecha_Cita`,`hora_Cita`) 
		 VALUES(idDoc,idPac,pac,fecha,hCita);
	END$$
	DELIMITER 
	drop procedure crearCita;
	call crearCita('$id_doctor','$id','$nombre','$Fecha_Cita','$hora_Cita');
	select * from cita_medica;
    
	-- Consulta entre tablas cita/doctor
	DELIMITER $$
	Create procedure consultaCitaD
	(IN id varchar(6))
	BEGIN
		 select * from cita_medica join doctor on cita_medica.id_doctor = doctor.id_doctor 
         where id_paciente = id;
	END$$
	DELIMITER 
	-- drop procedure consultaCitaD;
	call consultaCitaD(5);
    
	-- Consulta entre tablas cita/doctor
	DELIMITER $$
	Create procedure eliminarCita
	(IN id varchar(6))
	BEGIN
		 DELETE FROM cita_medica where ID_Cita = id;
	END$$
	DELIMITER 
	-- drop procedure consultaCitaD;
	-- call eliminarCita();
    
   	-- Consulta por ID
	DELIMITER $$
	Create procedure consultXIdCita
	(IN id varchar(6))
	BEGIN
		 SELECT * FROM cita_medica  where ID_Cita = id;
	END$$
	DELIMITER 
	drop procedure consultXIdCita;
	call consultXIdCita('1');
	select * from cita_medica;

	-- update
	DELIMITER $$
	Create procedure updateCita
	(IN id varchar(6),
    IN fecha varchar(12),
    IN hora varchar(12))
	BEGIN
		 UPDATE cita_medica set `Fecha_Cita`=fecha,`hora_Cita`=hora WHERE ID_Cita = id;
	END$$
	DELIMITER 
	-- drop procedure updateCita;
	call updateCita('','','');
    
--    ---------------------------------------
-- ConsultaD
	-- Consulta por ID
	DELIMITER $$
	Create procedure consultXIdCitaD
	(IN id varchar(6))
	BEGIN
		 SELECT * FROM cita_medica  where id_doctor = id;
	END$$
	DELIMITER 
	-- drop procedure consultXIdCitaD;
	call consultXIdCitaD('0');
    
    -- Consulta por FECHA
	DELIMITER $$
	Create procedure consultaXCitaFecha
	(IN fecha varchar(12))
	BEGIN
		 SELECT * FROM cita_medica where Fecha_Cita = fecha;
	END$$
	DELIMITER 
	-- drop procedure consultaXCitaFecha;
	call consultaXCitaFecha('2021-05-28');
    
      -- Consulta por Hora
	DELIMITER $$
	Create procedure consultaXCitaHora
	(IN hora varchar(12))
	BEGIN
		 SELECT * FROM cita_medica where hora_Cita = hora;
	END$$
	DELIMITER 
	-- drop procedure consultaXCitaHora;
	call consultaXCitaHora('15:15:00');
    
	-- updateD
	DELIMITER $$
	Create procedure updateCitaD
	(IN id varchar(6),
    IN nombre varchar(25),
    IN fecha varchar(12),
    IN hora varchar(12))
	BEGIN
		 UPDATE cita_medica SET `nombre_paciente`=nombre,`Fecha_Cita`=fecha,`hora_Cita`=hora WHERE `ID_Cita`=id;
	END$$
	DELIMITER 
	-- drop procedure updateCita;
	call updateCitaD('1','Neftally','2021-05-28','13:15:00');
    select * from cita_medica;
