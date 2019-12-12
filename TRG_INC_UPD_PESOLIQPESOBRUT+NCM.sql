   create or replace TRIGGER TRG_INC_UPD_PESOLIQPESOBRUT
      AFTER UPDATE OR INSERT
      ON TGFPRO
      FOR EACH ROW
      
   DECLARE P_COUNT INT;
   --CRIADO POR FERNANDO GONÇALVES        
   BEGIN
         
   IF (UPDATING ('PESOBRUTO') OR INSERTING)
            AND (:NEW.PESOBRUTO IS NOT NULL)
            AND (:NEW.PESOBRUTO = 0)
            THEN
               RAISE_APPLICATION_ERROR (-20101,'Campo PESO BRUTO precisa sem preenchido.');
            END IF;
      
   IF (UPDATING ('PESOLIQ') OR INSERTING)
            AND (:NEW.PESOLIQ IS NOT NULL)
            AND (:NEW.PESOLIQ = 0)
            THEN
               RAISE_APPLICATION_ERROR (-20101,'Campo PESO LIQUIDO precisa sem preenchido.');
            END IF;
            
    IF (UPDATING ('NCM') OR INSERTING)
            AND (:NEW.NCM = 0)
            THEN
                RAISE_APPLICATION_ERROR (-20101,'Campo NCM não deve possuir apenas zeros.');
            END IF;
            
    IF LENGTH(UPDATING ('NCM') OR INSERTING)
            AND (:NEW.NCM < 8)
            THEN
                RAISE_APPLICATION_ERROR (-20101,'Campo NCM deve possui 8 caracteres.');
      END IF;
   END;
