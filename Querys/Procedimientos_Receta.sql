-- Procedimientos para tabla Receta
	-- Eliminación por "id"
	DELIMITER $$
	Create procedure eliminarXIdReceta
	(IN id varchar(6))
	BEGIN
		SET SQL_SAFE_UPDATES=0;
		delete from receta where receta.id_receta = id;
        delete from historial where historial.id_receta = id;
        SET SQL_SAFE_UPDATES=1;
	END$$
	DELIMITER 
    drop procedure eliminarXIdReceta;
	call eliminarXIdReceta(31);
    select * from receta;
    select * from historial;

        
-- Procedimientos para el archivo "guardarReceta.php"
	-- Insert
		DELIMITER $$
		Create procedure guardaReceta
		(
			IN idDoc INT,
            IN nomDoc varchar(30),
            IN patDoc varchar(30),
            IN matDoc varchar(30),
            IN idPac INT,
            IN pac varchar(50),
            IN ed INT,
            IN pe INT,
            IN tal INT,
            IN t varchar(8),
            IN f varchar(8),
            IN tempe INT,
            IN rec varchar(150)
		)
		BEGIN
			INSERT INTO `receta` (`id_doctor`,`nombreDoctor`, `paternoDoctor`, `maternoDoctor`, `id_paciente`, `paciente`, `edad`, `peso`, `talla`, `ta`, `fe`, `temp`, `receta`)
			values (idDoc, nomDoc, patDoc, matDoc, idPac, pac, ed, pe, tal, t, f, tempe, rec);
		END$$
		DELIMITER 
        DROP procedure guardaReceta;
        -- call guardaReceta(11,'Alejandra','','',7,'Jorge',24,72,46,'120/80','80',37,'Una tableta de paracetamol de 500 mg cada 8hrs.');
       
	-- Busqueda por Id
	DELIMITER $$
	Create procedure busquedaXIdReceta
	(IN id INT)
	BEGIN
		select * from receta where id_receta = id;
	END$$
	DELIMITER 
	call busquedaXIdReceta(25);
	
    -- UPDATE
	DELIMITER $$
	Create procedure updateReceta
	(
		IN id varchar(6),
		IN $paciente varchar(50),
		IN $edad varchar(3),
		IN $peso varchar(7),
		IN $talla varchar(6),
		IN $ta varchar(8),
		IN $fe varchar(8),
		IN $temp varchar(5),
		IN $receta varchar(150)
    )
	BEGIN
		SET SQL_SAFE_UPDATES=0;
		UPDATE receta SET paciente = $paciente, edad = $edad, peso = $peso, 
        talla = $talla, ta = $ta, fe = $fe, temp = $temp, receta = $receta 
        WHERE id_receta = id;
        SET SQL_SAFE_UPDATES=1;
	END$$
	DELIMITER 
    -- drop procedure updateReceta;
	 call updateReceta('27','Neftally','12','55','36','120/80','75','35','prueba cambio.');
       
    -- receta.php
    DELIMITER $$
	Create procedure consultadReceta
	(IN id varchar(6))
	BEGIN
		 SELECT * FROM receta where id_doctor = id ORDER by id_receta DESC ;
	END$$
	DELIMITER 
    call consultadReceta(11);
	select * from receta