-- Procedimientos para tabla Doctores
-- Búsqueda por correo y contraseña 
DELIMITER $$
Create procedure selecAllUDoctores
(IN cor varchar(50), IN pa varchar(20))
BEGIN
	select * from usuario_doctor where correo = cor 
    and pass = pa;
END$$
DELIMITER 

-- drop procedure selecAllUDoctores;
call selecAllUDoctores('pedro@gmail.com','123')

-- Procedimientos para archivo "eliminardoctor.php"
	-- Busqueda por Usuario
	DELIMITER $$
	Create procedure busquedaXUDoctores
	(IN usuario varchar(50))
	BEGIN
		select * from doctor where correo = usuario;
	END$$
	DELIMITER 
	call busquedaXUDoctores('pedro@gmail.com');
	
    -- Eliminación por "id"
		-- Tabla doctor
		DELIMITER $$
		Create procedure eliminarXIdDoctores
		(IN id varchar(6))
		BEGIN
			delete from doctor where id_doctor = id;
		END$$
		DELIMITER 
        
	-- Tabla Usuario_doctor
		DELIMITER $$
		Create procedure eliminarXIdUsDoctores
		(IN id varchar(6))
		BEGIN
			delete from usuario_doctor where id_doctor = id;
		END$$
		DELIMITER 
        -- drop procedure eliminarXIdDoctores;
	    -- drop procedure eliminarXIdUsDoctores;
	    -- call eliminarXIdDoctores(9);
        -- call eliminarXIdUsDoctores(9);

-- Procedimientos para el archivo "modificardoctor.php"
-- UPDATE
	DELIMITER $$
	Create procedure updateDoctores
	(
		IN id varchar(6),
		IN nom varchar(30),
		IN pat varchar(30),
		IN mat varchar(30),
		IN ed varchar(3),
		IN sex varchar(10),
		IN estate varchar(30),
		IN city varchar(30),
		IN cale varchar(30),
		IN num varchar(6),
		IN tel varchar(10)
    )
	BEGIN
		UPDATE doctor SET nombre = nom, paterno = pat, materno = mat,
        edad = ed, sexo = sex, estado= estate, ciudad = city,
        calle = cale, numero = num, telefono = tel where id_doctor = id;
	END$$
	DELIMITER 
    drop procedure updateDoctores;
    call updateDoctores('11','Alejandra','Corin','Coral','25','Mujer','jalisco','cd guzman','Medellin','102','3411234560');
    select * from doctor;
    
-- Procedimientos para el archivo "registrarDoctor.php"
-- Insert
	DELIMITER $$
	Create procedure insertDoctores
	(
		IN nom varchar(30),
		IN mat varchar(30),
		IN pat varchar(30),
		IN ed INT,
		IN sex varchar(10),
		IN estate varchar(30),
		IN city varchar(30),
		IN cale varchar(30),
		IN num INT,
        IN cor varchar(30),
        IN passw varchar(20),
   		IN tel varchar(10)
    )
	BEGIN
		INSERT INTO `doctor` (`nombre`, `paterno`, `materno`, `edad`, `sexo`, `estado`, `ciudad`, `calle`, `numero`, `correo`, `pass`, `telefono`)
        values (nom, pat, mat, ed, sex, estate, city, cale, num, cor, passw, tel);
	END$$
	DELIMITER 
    -- drop procedure insertDoctores;
	-- call insertDoctores('Alejandra','Durán','Barrón',30,'Mujer','jalisco','cd guzman','privada de medellin',325,'ale@gmail.com','123','3411234560');
select * from doctor;