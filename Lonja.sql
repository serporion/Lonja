        --CREACION DEL TABLESPACE AUTOINCREMENTANDOSE DE 500K EN 500K CON UN MAXIMO DE 1000M--

CREATE TABLESPACE Lonja datafile 'C:\Lonja' size 100m autoextend on next 500k maxsize 1000M;



        --CREACION DE USUARIOS--

--ADMINLONJA

CREATE USER adminLonja IDENTIFIED BY LonjaajnoL default tablespace Lonja QUOTA UNLIMITED ON Lonja;

    -- Privilegios
    
GRANT DBA TO adminLonja;



--CREO LA CONEXION LonjaAdmin, y se hace TODO lo de abajo entrando a la conexión LonjaAdmin como adminLonja después de logarse.



-- CREAR LAS TABLAS, SECUENCIAS Y VISTAS. TODAS JUNTAS.

-- CREAR LOS FUNCIONES, PROCEDIMIENTOS, TRIGGERS DE UNO EN UNO. 

-- CREAR LOS JOBS DE UNO EN UNO

-- INSERTAR LOS REGISTROS.





-- ESTE ES EL PROCEDIMIENTO DE BORRADO

--PROCEDIMIENTO DE BORRADO DEL PROYECTO.


CREATE OR REPLACE PROCEDURE Borrar_Proyecto AS
BEGIN
    -- Eliminamos las secuencias
    EXECUTE IMMEDIATE 'DROP SEQUENCE sec_numero_factura';
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_REGISTRO_INS';
   
    
    
    --Eliminación de procedimientos
    EXECUTE IMMEDIATE 'DROP PROCEDURE Insertar_Registro_Insercion';
    EXECUTE IMMEDIATE 'DROP PROCEDURE Procesar_Registro_Inserciones';
    EXECUTE IMMEDIATE 'DROP PROCEDURE Actualizar_Ventas_Anuales';
    
    --Eliminación de las funciones
    EXECUTE IMMEDIATE 'DROP FUNCTION Codigo_Lote';
    EXECUTE IMMEDIATE 'DROP FUNCTION Consultar_Facturas_Credito';
    EXECUTE IMMEDIATE 'DROP FUNCTION Total_Facturas_Pendientes';

    
    -- Eliminamos las tablas.
    EXECUTE IMMEDIATE 'DROP TABLE Resumen_Ventas_Anuales';
    EXECUTE IMMEDIATE 'DROP TABLE Facturas_Venta_Pagadas';
    EXECUTE IMMEDIATE 'DROP TABLE Facturas_Venta';
    EXECUTE IMMEDIATE 'DROP TABLE Ventas';
    EXECUTE IMMEDIATE 'DROP TABLE Facturas_Compra_Pagada';
    EXECUTE IMMEDIATE 'DROP TABLE Facturas_Compra';
    EXECUTE IMMEDIATE 'DROP TABLE Facturas';
    EXECUTE IMMEDIATE 'DROP TABLE Capturas';
    EXECUTE IMMEDIATE 'DROP TABLE Lotes';
    EXECUTE IMMEDIATE 'DROP TABLE Especies';
    EXECUTE IMMEDIATE 'DROP TABLE Caladeros';
    EXECUTE IMMEDIATE 'DROP TABLE Barcos';
    EXECUTE IMMEDIATE 'DROP TABLE Armador';
    EXECUTE IMMEDIATE 'DROP TABLE Pescaderias_Telefonos';
    EXECUTE IMMEDIATE 'DROP TABLE Pescaderias';
    EXECUTE IMMEDIATE 'DROP TABLE Registro_Inserciones';
    

     --Eliminación de vistas
    EXECUTE IMMEDIATE 'DROP VIEW FACTURASCLIENTE';
    EXECUTE IMMEDIATE 'DROP VIEW FACTURAS_PENDIENTES_PAGO';
    EXECUTE IMMEDIATE 'DROP VIEW HISTORIAL_VENTAS_POR_AÑO';	
           
    
   -- Eliminamos el rol creado.
    EXECUTE IMMEDIATE 'DROP ROLE SELECT_TABLAS1';
    
    
    -- Elimino el trabajo o job creado.    
    BEGIN
        DBMS_SCHEDULER.DROP_JOB('Verificar_job');    
    END;    
    
END;



-- Eliminación de usuarios. Fuera de un bloque PL/SQL. No se tienen suficientes 
-- privilegios para hacerlo dentro. Pero si fuera de el.

    DROP USER CIF001 cascade;
    DROP USER CIF002 cascade;
    DROP USER ADMINLONJA cascade;
    DROP USER TRABAJADOR1LONJA cascade;





---NO
---NO
--!!!!CUIDADO¡¡¡¡WARNING WARNING¡¡¡---NO EJECUTAR HASTA QUE NO ESTRICTAMENTE NECESARIO----


BEGIN
    Borrar_Proyecto;
    DBMS_OUTPUT.PUT_LINE('Lo hemos borrado todo.');

END; 




-- Otra forma de borrar tablas, vistas, secuencias.


BEGIN
  FOR t IN (SELECT table_name 
             FROM user_tables) LOOP
    EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS';
  END LOOP;
  
  FOR s IN (SELECT sequence_name 
             FROM user_sequences) LOOP
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || s.sequence_name;
  END LOOP;
  
  FOR v IN (SELECT view_name 
             FROM user_views) LOOP
    EXECUTE IMMEDIATE 'DROP VIEW ' || v.view_name;
  END LOOP;
END;
  


show user;





