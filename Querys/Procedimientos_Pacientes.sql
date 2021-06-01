-- Procedimientos para tabla Paciente
DELIMITER $$
Create procedure selecAllUPacientes
(IN cor varchar(50), IN pa varchar(20))
BEGIN
	select * from usuario_paciente where correo = cor
    and pass = pa;
END$$
DELIMITER 

drop procedure selecAllUPacientes;
call selecAllUPacientes('Alonso@gmail.com','123')

-- Procedimientos para archivo "eliminarpaciente.php"
	-- Busqueda por Usuario
	DELIMITER $$
	Create procedure busquedaXUPacientes
	(IN usuario varchar(50))
	BEGIN
		select * from paciente where correo = usuario;
	END$$
	DELIMITER 
	call busquedaXUPacientes('alonso@gmail.com');
	
    -- Eliminación por "id"
		-- Tabla paciente
		DELIMITER $$
		Create procedure eliminarXIdPaciente
		(IN id varchar(6))
		BEGIN
			delete from paciente where id_paciente = id;
		END$$
		DELIMITER 
        
	-- Tabla Usuario_paciente
		DELIMITER $$
		Create procedure eliminarXIdUsPacientes
		(IN id varchar(6))
		BEGIN
			delete from usuario_paciente where id_paciente = id;
		END$$
		DELIMITER 
         drop procedure eliminarXIdPaciente;
	     drop procedure eliminarXIdUsPacientes;
	     call eliminarXIdPaciente(6);
         call eliminarXIdUsPacientes(6);
    select * from paciente;
    
-- Procedimientos para el archivo "modificarpaciente.php"
-- UPDATE
	DELIMITER $$
	Create procedure updatePaciente
	(
		IN id varchar(6),
		IN nom varchar(30),
		IN pat varchar(30),
		IN mat varchar(30),
        IN tel varchar(10),
		IN ed varchar(3),
		IN sex varchar(10),
		IN sangre varchar(5),
        IN estate varchar(30),
		IN city varchar(30),
		IN cale varchar(30),
		IN num varchar(6)
    )
	BEGIN
		UPDATE paciente SET nombre = nom, paterno = pat, materno = mat, 
        telefono = tel, edad = ed, sexo = sex, tipoSangre = sangre, estado= estate, ciudad = city,
        calle = cale, numero = num WHERE id_paciente = id;
	END$$
	DELIMITER 
    drop procedure updatePaciente;
    call updatePaciente('7','Jorge','Ovando','Ovando','3412587896','24','Hombre','A+','Jalisco','tuxpan','Lopez Mateos','65');
    select * from paciente;
    
-- Procedimientos para el archivo "registrarDoctor.php"
-- Insert
	DELIMITER $$
	Create procedure insertPaciente
	(
		IN nom varchar(30),
		IN pat varchar(30),
		IN mat varchar(30),
        IN tel varchar(10),
		IN ed INT,
		IN sex varchar(10),
        IN sangre varchar(5),
		IN estate varchar(30),
		IN city varchar(30),
		IN cale varchar(30),
		IN num INT,
        IN cor varchar(30),
        IN passw varchar(20)
    )
	BEGIN
		INSERT INTO `paciente` (`nombre`, `paterno`, `materno`, `telefono`, `edad`, `tipoSangre`,`sexo`, `estado`, `ciudad`, `calle`, `numero`, `correo`, `pass`)
        values (nom, pat, mat, tel, ed, sex, sangre, estate, city, cale, num, cor, passw);
	END$$
	DELIMITER 
    -- drop procedure insertPaciente;
	call insertPaciente('Alejandra','Durán','Barrón','3411234560',20,'O+','Mujer','jalisco','cd guzman','privada de medellin',325,'ale@gmail.com','123');
select * from paciente;