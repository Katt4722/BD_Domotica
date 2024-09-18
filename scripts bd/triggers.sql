DELIMITER$$
DROP TRIGGER IF EXISTS AftInsElectrodomestico$$
CREATE TRIGGER AftInsElectrodomestico AFTER INSERT ON Electrodomestico
FOR EACH ROW
BEGIN
	INSERT INTO HistorialRegistro (idElectrodomestico, fechaHoraRegistro)
    VALUES (NEW.idElectrodomestico, NOW());
END$$


DELIMITER$$
DROP TRIGGER IF EXISTS BefInsElectrodomestico$$
CREATE TRIGGER BefInsElectrodomestico AFTER INSERT ON Electrodomestico
FOR EACH ROW
BEGIN
	IF NEW.Encendido = 1 AND NEW.Apagado = 1 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Un electrodomestico no puede estar encendido y apagado al mismo tiempo.';
    END IF;
END$$


-- Trigger para actualizar el consumo total cuando se inserta un nuevo registro en la tabla consumo.
DELIMITER $$
DROP TRIGGER IF EXISTS AftInsConsumo$$
CREATE TRIGGER AftInsConsumo AFTER INSERT ON Consumo
FOR EACH ROW
BEGIN
	UPDATE Electrodomestico
    SET Encendido = 0, Apagado = 1
    WHERE idElectrodomestico = NEW.idElectrodomestico;
END $$
