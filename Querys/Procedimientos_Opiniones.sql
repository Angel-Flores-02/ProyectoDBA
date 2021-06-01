-- Procedimientos para tabla Receta
	-- Eliminación por "id"
    DELIMITER $$
	Create procedure eliminarXIdOpiniones
	(IN id varchar(6))
	BEGIN
		delete from opiniones_doctores where ID_Opinion = id;
	END$$
	DELIMITER 
	call eliminarXIdOpiniones(26);
    
    -- Consulta
     DELIMITER $$
	Create procedure consultaXIdOpinion
	(IN id varchar(6))
	BEGIN
		select * from opiniones_doctores where ID_Opinion like id;
	END$$
	DELIMITER 
   -- drop procedure consultaXIdOpinion;
	call consultaXIdOpinion(5);

	-- Update
     DELIMITER $$
	Create procedure updateOpinion
	(IN id varchar(6), IN opinion varchar(100))
	BEGIN
		UPDATE opiniones_doctores SET descripcion_Opinion = opinion WHERE ID_Opinion = id;
	END$$
	DELIMITER 
    drop procedure updateOpinion;
	call updateOpinion(5,'El servicio es muy bueno');
    select * from opiniones_doctores;
    
    -- Insert
	DELIMITER $$
	Create procedure insertarOpinion
	(IN opinion varchar(100))
	BEGIN
		INSERT INTO `opiniones_doctores` (`descripcion_Opinion`)
        VALUES (opinion);
	END$$
	DELIMITER 
   -- drop procedure insertarOpinion;
	call insertarOpinion('Vale la pena el pago, el servicio es muy bueno');
    
    -- Seleccionar todo
    DELIMITER $$
	Create procedure selectAllOpinion
	()
	BEGIN
		select * from opiniones_doctores;
	END$$
	DELIMITER 
   -- drop procedure insertarOpinion;
	call selectAllOpinion();
   