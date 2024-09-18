DELIMITER $$
DROP PROCEDURE IF EXISTS altaUsuario $$
CREATE PROCEDURE altaUsuario(OUT unidUsuario INT,
							 IN unNombre VARCHAR(100),
							 IN unCorreo VARCHAR(100),
							 IN uncontrasenia CHAR(64),
							 IN unTelefono VARCHAR(20))
BEGIN 
	INSERT INTO Usuario (Nombre, Correo, contrasenia, Telefono)
				 VALUES (unNombre, unCorreo, uncontrasenia, unTelefono);
	SET unidUsuario = LAST_INSERT_ID();
END $$
 
DELIMITER $$
DROP PROCEDURE IF EXISTS altaCasa $$
CREATE PROCEDURE altaCasa (OUT unidCasa INT,
						   IN unDireccion VARCHAR(100))
BEGIN 
	INSERT INTO Casa (Direccion)
			  VALUES (unDireccion);
	SET unidCasa = LAST_INSERT_ID();
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS altaCasaUsuario $$
CREATE PROCEDURE altaCasaUsuario (IN unidUsuario INT,
								  IN unidCasa INT)
BEGIN 
	INSERT INTO casaUsuario (idUsuario, idCasa)
					 VALUES (unidUsuario, unidCasa);
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS AltaElectrodomestico $$
CREATE PROCEDURE AltaElectrodomestico (OUT unidElectrodomestico INT, 
									   IN unidCasa INT,
                                       IN unNombre VARCHAR(100),
                                       IN unTipo VARCHAR(50),
                                       IN unUbicacion VARCHAR(50),
                                       IN unEncendido BOOL,
                                       IN unApagado BOOL,
                                       IN unNroHabitaciones TINYINT)
BEGIN 
	INSERT INTO Electrodomestico (idCasa, Nombre, Tipo, Ubicacion, Encendido, Apagado, NroHabitaciones)
						  VALUES (unidCasa, unNombre, unUbicacion, unEncendido, unApagado, unNroHabitaciones);
	SET unidElectrodomestico = LAST_INSERT_ID();
END $$


DELIMITER $$
DROP PROCEDURE IF EXISTS altaHistorialRegistro $$
CREATE PROCEDURE altaHistorialRegistro (OUT unidHistorialRegistro INT,
										IN unidElectrodomestico INT,
                                        IN unFechaHoraRegistro DATETIME)
BEGIN 
	INSERT INTO HistorialRegistro (idElectrodomestico, FechaHoraRegistro)
						   VALUES (unidElectrodomestico, unidFechaHoraRegistro);
	SET unidHistorialRegistro = LAST_INSERT_ID();
END $$


DELIMITER $$
DROP PROCEDURE IF EXISTS altaConsumo $$
CREATE PROCEDURE altaConsumo (OUT unidConsumo INT,
							  IN unidElectrodomestico INT,
                              IN uninicio DATETIME,
                              IN unDuracion TIME,
                              IN unConsumoTotal FLOAT)
BEGIN 
	INSERT INTO Consumo (idElectrodomestico, inicio, Duracion, ConsumoTotal)
				 VALUES (unidElectrodomestico, uninicio, unDuracion, unConsumoTotal);
	SET unidConsumo = LAST_INSERT_ID();
END $$


-- Función para contar cuantos electrodomesticos hay en una casa.
DELIMITER $$
DROP FUNCTION IF EXISTS DispositivosEncontados $$
CREATE FUNCTION DispositivosEncontados(unIdElectrodomestico INT)
RETURNS INT UNSIGNED READS SQL DATA
BEGIN
	DECLARE cantidad INT;
	SELECT COUNT(idCasa) INTO cantidad
	FROM Casa
	WHERE idElectrodomestico = unIdElectrodomestico;
	RETURN cantidad;
END $$
