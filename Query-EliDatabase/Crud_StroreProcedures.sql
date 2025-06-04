DELIMITER //
CREATE PROCEDURE Manage_Person (
IN p_Operation VARCHAR(10),
IN p_IdPersona INT NULL,
IN p_FullNane VARCHAR(100),
INT p_Age INT,
INT p_PhoneNumber CHAR(10),
INT p_Address VARCHAR(200)
OUT Result_Message VARCHAR(255)
)
BEGIN 
	DECLARE Persona_Count INT;
    
    IF Operation = 'CREATE' THEN
		IF p_FullName IS NULL OR p_Age IS NULL OR p_PhoneNumber IS NULL OR p_Address IS NULL THEN
			SET Result_Message = 'Error: Algun Campo Vacío'
		ELSE
			INSERT INTO persona(FullName,Age,PhoneNumber,Address)
            VALUES(p_FullName,p_Age,p_PhoneNumber,p_Address);
            SET Result_Message = 'Registro Guardado';
            LAST_INSERT_ID();
		END IF;
        
	ELSEIF Operation = 'READ' THEN
		SELECT COUNT(*) INTO Persona_Count FROM  persona WHERE IdPersona = p_IdPersona;
        
        IF Persona_Count = 0 THEN
			SET Result_Message = 'Persona no Encontrada';
		ELSE
			SELECT * FROM persona WHERE IdPersona = p_IdPersona
            SET Result_Message = 'Persona Encontrada'
		END IF;
	
    ELSEIF operation = 'UPDATE' THEN
		SELECT COUNT(*) INTO Persona_Count FROM persona
        IF Persona_Count = 0 THEN 
			SET Result_Message = 'Persona no Encontrada';
		ELSE
			UPDATE persona
            SET FullName = p_FullName, 
            SET Age = p_Age,
            SET PhoneNumber = p_PhoneNUmber 
        
        
        
        
        
        
			
    
		
		
    

END 


DELIMITER ;
