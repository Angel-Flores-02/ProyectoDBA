-- Procedimienos para la tabla Historial
	-- buscar.php
		-- obtener todos los datos de la tabla historial
		DELIMITER $$
		Create procedure consultAllHistorial
		()
		BEGIN
			 SELECT * FROM historial ORDER by id_receta DESC ;
		END$$
		DELIMITER 
		call consultAllHistorial();
		select * from historial;
        
		-- Busqueda por paciente o doctor
		DELIMITER $$
		Create procedure busquedaHistorial
		(IN buscar varchar(20))
		BEGIN
			 SELECT * FROM historial where paciente like buscar or nombreDoctor like buscar;
		END$$
		DELIMITER 
        drop procedure busquedaHistorial;
		call busquedaHistorial('pedro');
		select * from historial;
       
        -- obtener todos los datos de la tabla historial
		DELIMITER $$
		Create procedure consultIdPHistorial
		(IN id varchar(6))
		BEGIN
			 SELECT * FROM historial WHERE id_paciente = id ORDER BY id_receta DESC ;
		END$$
		DELIMITER 
		call consultIdPHistorial(7);
		select * from historial;