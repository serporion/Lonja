        -- CREACION DE TABLAS
        
CREATE TABLE Armador (
    CIF VARCHAR2(9) PRIMARY KEY,
    Nombre VARCHAR2(25),
    Apellidos VARCHAR2(50),
    Telefono VARCHAR2(15)
);        

        
CREATE TABLE Barcos (
    Matricula VARCHAR2(10) PRIMARY KEY,
    CIF_Armador VARCHAR2(9),
    Clase VARCHAR2(50),
    Nombre VARCHAR2(50),
    Nombre_Capitan VARCHAR2(50),    
    
    CONSTRAINT fk_armador_cif foreign key (CIF_Armador) references Armador(CIF)
);


CREATE TABLE Caladeros (
    Nombre VARCHAR2(50) PRIMARY KEY,
    Extension DECIMAL(10, 2),
    Ubicacion VARCHAR2(50)
);


CREATE TABLE Especies (
    Codigo VARCHAR2(15) PRIMARY KEY,
    Nombre VARCHAR2(50),
    Tipo VARCHAR2(20)
);




CREATE TABLE Lotes (
    Codigo INT PRIMARY KEY,
    Cod_especie VARCHAR2(15),
    Fecha_Recepcion DATE,
    Cajas INT,
    Kilos_Totales DECIMAL(10, 2),
    Precio_Kilo_Salida DECIMAL(10, 2),
    
    CONSTRAINT fk_especie_codigo FOREIGN KEY (Cod_especie) REFERENCES Especies(Codigo)

);


CREATE TABLE Capturas (
    Matricula_Barco VARCHAR2(10),    
    Nombre_Caladero VARCHAR(50),
    Codigo_Lote INT,
    Fecha_Inicio_Captura DATE,
    Fecha_Fin_Captura DATE,
    
    PRIMARY KEY (Matricula_Barco, Codigo_Lote, Nombre_Caladero),
    CONSTRAINT fk_barco_matricula FOREIGN KEY (Matricula_Barco) REFERENCES Barcos (Matricula),
    CONSTRAINT fk_lote_codigo FOREIGN KEY (Codigo_Lote) REFERENCES Lotes (Codigo),
    CONSTRAINT fk_caladero_nombre FOREIGN KEY (Nombre_Caladero) REFERENCES Caladeros (Nombre))

;


CREATE SEQUENCE sec_numero_factura START WITH 1000;


CREATE TABLE Facturas (
    Numero VARCHAR2(10) PRIMARY KEY,
    Tipo CHAR(1) CHECK (Tipo IN ('c', 'v')),
    Fecha DATE
);



CREATE TABLE Facturas_Compra (
    Codigo_Lote INT,    
    Numero_Factura VARCHAR2(10),
    Importe DECIMAL(10,2),

    CONSTRAINT fk_detalle PRIMARY KEY (Codigo_Lote, Numero_Factura),  
    CONSTRAINT fk_facturas_numero_fc3 FOREIGN KEY (Numero_Factura) REFERENCES Facturas(Numero),  
    CONSTRAINT fk_lotes_codigo3 FOREIGN KEY (Codigo_Lote) REFERENCES Lotes(Codigo)
  
); 



CREATE TABLE Facturas_Compra_Pagada (   
    Numero_Factura VARCHAR2(10) PRIMARY KEY,
    Importe_Total DECIMAL(10,2),
    Pagada CHAR(1) default 'n',
    Fecha_Pago date,
  
    CONSTRAINT ck_factura_pagada CHECK (Pagada IN ('s', 'n')),
    CONSTRAINT fk_facturas_numero_fc4 FOREIGN KEY (Numero_Factura) REFERENCES Facturas(Numero)
  
); 



CREATE TABLE Pescaderias (
    CIF VARCHAR2(10) PRIMARY KEY,
    Nombre VARCHAR2(50),
    Calle VARCHAR2(50),
    Numero INT,
    Localidad VARCHAR2(50),
    CP VARCHAR2(10),
    PAGA VARCHAR(10) CHECK (PAGA IN ('contado', 'credito')) NOT NULL,
    Numero_Cuenta VARCHAR2(20),
    Cuota_inicial DECIMAL(10, 2),
    Fecha_VTO int
    
);


ALTER TABLE Pescaderias ADD CONSTRAINT chk_Pescaderias_PAGA CHECK (
    (PAGA = 'contado' AND Numero_Cuenta IS NULL AND Cuota_inicial IS NULL AND Fecha_VTO IS NULL)
    OR
    (PAGA = 'credito' AND Numero_Cuenta IS NOT NULL AND Cuota_inicial IS NOT NULL AND Fecha_VTO IS NOT NULL)
);



CREATE TABLE Ventas (
    Codigo_Lote INT PRIMARY KEY,
    CIF_Pescaderia VARCHAR2(10),
    Precio_kilo_Venta INT,
    Total_Venta INT,
  
    CONSTRAINT fk_lotes_codigo FOREIGN KEY (Codigo_Lote) REFERENCES Lotes(Codigo),
    CONSTRAINT fk_pescaderia_CIF FOREIGN KEY (CIF_Pescaderia) REFERENCES Pescaderias(CIF)
  
);    


CREATE TABLE Facturas_Venta (
    Numero_Factura VARCHAR2(10),
    CIF_Pescaderia VARCHAR2(10),
    Codigo_Lote INT,    
    Fecha_VTO DATE,

    CONSTRAINT fk_detalle_fac_venta PRIMARY KEY (Numero_Factura, Codigo_Lote),
    CONSTRAINT fk_facturas_numero_venta FOREIGN KEY (Numero_Factura) REFERENCES Facturas(Numero),
    CONSTRAINT fk_factura_venta_1 FOREIGN KEY (Codigo_Lote) REFERENCES Ventas(Codigo_Lote)
    
);


CREATE TABLE Facturas_Venta_Pagadas (
    Numero_Factura VARCHAR2(10) PRIMARY KEY,
    Importe_Total DECIMAL(10, 2),
    Fecha_Pago DATE,
    
    CONSTRAINT fk_facturas_venta_pagadas FOREIGN KEY (Numero_Factura) REFERENCES Facturas(Numero)
    
);



CREATE TABLE Pescaderias_Telefonos (
    Cod_Pescaderia VARCHAR(10),
    Numero VARCHAR(20),
    
    PRIMARY KEY (Cod_Pescaderia, Numero),
    CONSTRAINT fk_pescaderia_telefono FOREIGN KEY (Cod_Pescaderia) REFERENCES Pescaderias(CIF)
);


CREATE TABLE Resumen_Ventas_Anuales (
    Año INT,
    CIF_Pescaderia VARCHAR2(10),
    Nombre_Pescaderia VARCHAR2(50),
    Importe_Total DECIMAL(10, 2),
    
    PRIMARY KEY (Año, CIF_Pescaderia),
    CONSTRAINT fk_pescaderia_ventas_resumen FOREIGN KEY (CIF_Pescaderia) REFERENCES Pescaderias(CIF)
);




CREATE TABLE Registro_Inserciones (
    ID NUMBER PRIMARY KEY,
    Tipo VARCHAR2(20),
    Numero_Factura VARCHAR2(10),
    accion VARCHAR2(50),
    fecha TIMESTAMP
);

CREATE SEQUENCE SEQ_REGISTRO_INS START WITH 1 INCREMENT BY 1;




-- VISTAS

CREATE OR REPLACE VIEW facturasCliente as select * from facturas_venta where cif_pescaderia = user;

CREATE OR REPLACE VIEW Facturas_Pendientes_Pago AS SELECT fv.Numero_Factura, fv.CIF_Pescaderia, fv.Fecha_VTO, fvp.Fecha_Pago FROM Facturas_Venta fv
LEFT JOIN Facturas_Venta_Pagadas fvp ON fv.Numero_Factura = fvp.Numero_Factura
WHERE fvp.Fecha_Pago IS NULL and CIF_Pescaderia = user;

CREATE OR REPLACE VIEW Historial_Ventas_Por_Año AS SELECT EXTRACT(YEAR FROM f.Fecha) AS Año, p.CIF AS CIF_Pescaderia, p.Nombre AS Nombre_Pescaderia, fv.Numero_Factura, v.Total_Venta, v.codigo_lote, fv.Fecha_VTO
FROM Facturas_Venta fv
JOIN Ventas v ON fv.Codigo_Lote = v.Codigo_Lote
JOIN Pescaderias p ON fv.CIF_Pescaderia = p.CIF
JOIN Facturas f ON f.Numero = fv.Numero_factura
ORDER BY Año, p.CIF, fv.Numero_Factura;





-- FUNCIONES


--Función para cliente CIF002

create or replace FUNCTION Consultar_Facturas_Credito(año IN int) RETURN VARCHAR2 
AS
    v_Numero_Factura facturas_venta.numero_factura%type;
    v_CIF_Pescaderia facturas_venta.cif_pescaderia%type;
    v_Fecha_VTO facturas_venta.fecha_vto%type;
    existe int := 0;

    CURSOR factura_cursor IS SELECT fv.Numero_Factura, fv.CIF_Pescaderia, fv.Fecha_VTO FROM Facturas_Venta fv
        JOIN Pescaderias p ON fv.CIF_Pescaderia = p.CIF
        WHERE p.PAGA = 'credito' AND fv.CIF_Pescaderia = user AND EXTRACT(YEAR FROM fv.Fecha_VTO) = año;
BEGIN
    OPEN factura_cursor;
    LOOP
        FETCH factura_cursor INTO v_Numero_Factura, v_CIF_Pescaderia, v_Fecha_VTO;
        EXIT WHEN factura_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Numero Factura: ' || v_Numero_Factura || ', CIF Pescaderia: ' || v_CIF_Pescaderia || ', Fecha VTO: ' || v_Fecha_VTO);
        existe := existe + 1;
    END LOOP;
    CLOSE factura_cursor;

    IF existe = 0 THEN
        RETURN 'No se encontraron facturas a credito para la fecha proporcionada.';
    ELSE
        RETURN 'Consulta completada.';
    END IF;
END;



--Funciones para trabajador1Lonja


CREATE OR REPLACE FUNCTION Codigo_Lote (codigo ventas.codigo_lote%type) return varchar2
AS
    v_pescaderia pescaderias.nombre%type;

BEGIN
    SELECT p.nombre into v_pescaderia FROM Pescaderias p JOIN Ventas v ON p.cif = v.cif_pescaderia where codigo_lote = codigo;
    
EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_pescaderia := 'Codigo de lote no encontrado';

    return v_pescaderia;
END;


CREATE OR REPLACE FUNCTION Total_Facturas_Pendientes(cif_pesca IN pescaderias.cif%type) Return number
AS
    v_total_importe number(10,2);
    
BEGIN
    SELECT SUM(v.Total_Venta) INTO v_total_importe FROM Facturas_Venta fv
    JOIN Ventas v ON fv.Codigo_Lote = v.Codigo_Lote
    LEFT JOIN Facturas_Venta_Pagadas fvp ON fv.Numero_Factura = fvp.Numero_Factura
    WHERE fv.CIF_Pescaderia = cif_pesca AND fvp.fecha_pago IS NULL;

    RETURN NVL(v_total_importe, 0);
    
END;
    




-- PROCEDIMIENTOS


CREATE OR REPLACE PROCEDURE Insertar_Registro_Insercion (p_Tipo in registro_inserciones.tipo%type, p_Numero_Factura IN registro_inserciones.numero_factura%type) 
AS
    v_contador int;
BEGIN

    SELECT COUNT(*) INTO v_contador FROM Registro_Inserciones
    WHERE Numero_Factura = p_Numero_Factura AND Tipo = p_Tipo;
    
    IF v_contador = 0 THEN     
    
        INSERT INTO Registro_Inserciones (ID, Tipo, Numero_Factura, Accion, Fecha)
        VALUES (SEQ_REGISTRO_INS.NEXTVAL, p_Tipo, p_Numero_Factura, 'ENABLE_VERIFICAR_JOB', SYSTIMESTAMP);
    END IF;
    
END;


CREATE OR REPLACE PROCEDURE Procesar_Registro_Inserciones AS
    v_Numero_Factura Registro_Inserciones.Numero_Factura%TYPE;
    v_Tipo Registro_Inserciones.Tipo%TYPE;
    CURSOR c_registro IS SELECT tipo,numero_factura FROM Registro_Inserciones;
BEGIN
    OPEN c_registro;
    LOOP
        FETCH c_registro INTO v_Tipo, v_Numero_Factura;
        EXIT WHEN c_registro%NOTFOUND;

        IF v_Tipo = 'Facturas_Compra' THEN
            INSERT INTO Facturas_Compra_Pagada (Numero_Factura) VALUES (v_Numero_Factura);
        END IF;

        DELETE FROM Registro_Inserciones WHERE Tipo = v_Tipo AND Numero_Factura = v_Numero_Factura;
        
    END LOOP;

    CLOSE c_registro;
   
END;


--Procedimiento que solo lo pueden ejecutar los trabajadores de la lonja con permisos que nos muestra la facturación por cliente anualmente.

CREATE OR REPLACE PROCEDURE Actualizar_Ventas_Anuales AS

    v_Año Resumen_Ventas_Anuales.Año%TYPE;
    v_CIF_Pescaderia Resumen_Ventas_Anuales.CIF_Pescaderia%TYPE;
    v_Nombre_Pescaderia Resumen_Ventas_Anuales.Nombre_Pescaderia%TYPE;
    v_Importe_Total Resumen_Ventas_Anuales.Importe_Total%TYPE;

    CURSOR c_ventas_anuales IS SELECT EXTRACT(YEAR FROM f.Fecha) AS Año, fv.CIF_Pescaderia, p.Nombre AS Nombre_Pescaderia, SUM(v.Total_Venta) AS Importe_Total FROM Facturas_Venta fv
        JOIN Facturas f on f.numero = fv.numero_factura
        JOIN Ventas v ON fv.Codigo_Lote = v.Codigo_Lote
        JOIN Pescaderias p ON fv.CIF_Pescaderia = p.CIF
        GROUP BY EXTRACT(YEAR FROM f.Fecha), fv.CIF_Pescaderia, p.Nombre;

BEGIN

    DELETE FROM Resumen_Ventas_Anuales;

    OPEN c_ventas_anuales;

    LOOP
        FETCH c_ventas_anuales INTO v_Año, v_CIF_Pescaderia, v_Nombre_Pescaderia, v_Importe_Total;
        EXIT WHEN c_ventas_anuales%NOTFOUND;

        INSERT INTO Resumen_Ventas_Anuales (Año, CIF_Pescaderia, Nombre_Pescaderia, Importe_Total)
        VALUES (v_Año, v_CIF_Pescaderia, v_Nombre_Pescaderia, v_Importe_Total);

    END LOOP;

    CLOSE c_ventas_anuales;

END;



--TRIGGERS

CREATE OR REPLACE TRIGGER tr_facturas_numero_11
BEFORE INSERT ON Facturas
FOR EACH ROW

BEGIN

    IF :NEW.Tipo = 'c' THEN
        SELECT 'FC' || sec_numero_factura.NEXTVAL INTO :NEW.Numero FROM dual;
        
    ELSIF :NEW.Tipo = 'v' THEN
        SELECT 'FV' || sec_numero_factura.NEXTVAL INTO :NEW.Numero FROM dual;
        
    END IF;
END;



CREATE OR REPLACE TRIGGER tr_importe_factura_compras
BEFORE INSERT ON Facturas_Compra
FOR EACH ROW

BEGIN

    SELECT l.Kilos_totales * l.Precio_Kilo_Salida INTO :NEW.Importe FROM Lotes l WHERE l.Codigo = :NEW.Codigo_Lote; 
    
END;



CREATE OR REPLACE TRIGGER tr_importe_factura_venta
BEFORE INSERT ON Ventas
FOR EACH ROW

BEGIN
    
    SELECT l.Kilos_totales * :NEW.Precio_Kilo_Venta INTO :NEW.Total_venta FROM Lotes l WHERE l.Codigo = :NEW.Codigo_Lote;
END;




CREATE OR REPLACE TRIGGER tr_actualizar_fecha_vto
BEFORE INSERT ON Facturas_Venta
FOR EACH ROW
    
    DECLARE
    
        v_dias_vto INT;
    BEGIN
        SELECT Fecha_VTO INTO v_dias_vto
        FROM Pescaderias
        WHERE CIF = :NEW.CIF_Pescaderia;
        
        :NEW.Fecha_VTO := SYSDATE + v_dias_vto;
END;



CREATE OR REPLACE TRIGGER tr_calcular_importe_total_v
BEFORE INSERT ON Facturas_Venta_Pagadas
FOR EACH ROW

    DECLARE

        v_importe_total DECIMAL(10,2);
        v_cif varchar2(10);
        v_fecha DATE:=NULL;
        v_paga VARCHAR2(10);

    BEGIN

        SELECT cif_pescaderia INTO v_cif FROM facturas_venta WHERE numero_factura = :new.numero_factura AND ROWNUM = 1;

        SELECT SUM(v.Total_Venta) INTO v_importe_total FROM Ventas v WHERE v.Codigo_Lote IN (
            SELECT fv.Codigo_Lote
            FROM Facturas_Venta fv
            WHERE fv.Numero_Factura = :NEW.Numero_Factura
        );

        :NEW.Importe_Total := v_importe_total;       

        SELECT paga INTO v_paga FROM pescaderias WHERE cif = v_cif;

        IF v_paga = 'contado' THEN 
            SELECT fecha INTO v_fecha FROM facturas WHERE numero = :new.numero_factura;
        END IF;

        :NEW.Fecha_pago := v_fecha;

END;



CREATE OR REPLACE TRIGGER tr_calcular_importe_total_c
BEFORE INSERT ON Facturas_Compra_Pagada
FOR EACH ROW

    DECLARE
        v_importe_total DECIMAL(10,2);
        
    BEGIN
        
        SELECT SUM(Importe) INTO v_importe_total FROM Facturas_Compra WHERE Numero_Factura = :NEW.Numero_Factura;
        
        :NEW.Importe_Total := v_importe_total;
        
END;



CREATE OR REPLACE TRIGGER tr_factura_compras_pago
AFTER INSERT ON Facturas_Compra
FOR EACH ROW
BEGIN

    Insertar_Registro_Insercion('Facturas_Compra', :NEW.Numero_Factura);
    
END;



--JOBS


-- Crear un job programado para verificar la tabla de registro y habilitar el job

    BEGIN
        DBMS_SCHEDULER.CREATE_JOB (
            job_name        => 'VERIFICAR_JOB',
            job_type        => 'PLSQL_BLOCK',
            job_action      => 'BEGIN
                                   FOR linea IN (SELECT * FROM Registro_Inserciones WHERE accion = ''ENABLE_VERIFICAR_JOB'')
                                   LOOP                                       
                                       Procesar_Registro_Inserciones;
                                       DELETE FROM Registro_Inserciones WHERE id = linea.id;
                                       
                                   END LOOP;
                               END;',
            start_date      => SYSTIMESTAMP,
            repeat_interval => 'FREQ=SECONDLY; INTERVAL=20', 
            enabled         => TRUE
        );
    END;



-- Sentencias interesantes.
SELECT job_name, log_date, status FROM dba_scheduler_job_run_details WHERE job_name = 'VERIFICAR_JOB' AND OWNER = 'ADMINLONJA' ORDER BY log_date DESC;

SELECT job_name, enabled, state, owner FROM dba_scheduler_jobs WHERE job_name = 'VERIFICAR_JOB';





-- CREAR USUARIOS Y SUS PRIVILEGIOS Y LAS 3 CONEXIONES


--CLIENTE1
    
CREATE USER CIF001 IDENTIFIED BY usuCIF001 default tablespace Lonja QUOTA 10M ON Lonja;

    -- Privilegios
    
GRANT CREATE SESSION to CIF001;

GRANT SELECT ON facturasCliente TO CIF001;





--CLIENTE2

CREATE USER CIF002 IDENTIFIED BY usuCIF002 default tablespace Lonja QUOTA 10M ON Lonja;

    -- Privilegios
    
GRANT CREATE SESSION to CIF002;

GRANT SELECT ON facturas_Pendientes_Pago TO CIF002;
GRANT SELECT ON facturasCliente TO CIF002;

GRANT EXECUTE ON Consultar_Facturas_Credito TO CIF002;



--CREAMOS UN ROL PARA LOS TRABAJADORES

    CREATE ROLE select_tablas1;

    GRANT SELECT ON Armador TO select_tablas1;
    GRANT SELECT ON Barcos TO select_tablas1;
    GRANT SELECT ON Caladeros TO select_tablas1;
    GRANT SELECT ON Capturas TO select_tablas1;
    GRANT SELECT ON Especies TO select_tablas1;
    GRANT SELECT ON Lotes TO select_tablas1;
    GRANT SELECT ON Pescaderias TO select_tablas1;
    GRANT SELECT ON Pescaderias_Telefonos TO select_tablas1;
    GRANT SELECT ON Facturas TO select_tablas1;
    GRANT SELECT ON Facturas_Compra TO select_tablas1;
    GRANT SELECT ON Facturas_Compra_Pagada TO select_tablas1;
    GRANT SELECT ON Ventas TO select_tablas1;
    GRANT SELECT ON Facturas_Venta TO select_tablas1;
    GRANT SELECT ON Facturas_Venta_Pagadas TO select_tablas1;
    GRANT SELECT ON Resumen_Ventas_Anuales TO select_tablas1;




--TRABAJADOR1LONJA

CREATE USER trabajador1Lonja IDENTIFIED BY tra1Lonja default tablespace Lonja QUOTA 100M ON Lonja;

    -- Privilegios

    GRANT CREATE SESSION to trabajador1Lonja;
    
    -- Permisos para inserción, actualización y borrado.
    GRANT INSERT any TABLE TO trabajador1Lonja;
    GRANT UPDATE any TABLE TO trabajador1Lonja;   
    GRANT DELETE any TABLE TO trabajador1Lonja;


    -- Damos permisos al trabajador1Lonja para hacer consultas.
    
    GRANT select_tablas1 TO trabajador1Lonja;
    GRANT SELECT ON Historial_Ventas_Por_Año TO trabajador1Lonja;
    
    -- Damos permisos para ejecutar las funciones correspondientes.

    GRANT EXECUTE ON Actualizar_Ventas_Anuales TO trabajador1Lonja;
    GRANT EXECUTE ON Codigo_Lote TO trabajador1Lonja;
    GRANT EXECUTE ON Total_Facturas_Pendientes TO trabajador1Lonja;








