ALTER SESSION SET CURRENT_SCHEMA = adminLonja;

select * from facturasCliente;

select * from facturas_pendientes_pago;


--Llama a la funcion Consultar_Facturas_Credito donde se le pide al cliente un año para consultar en la base de datos.

DECLARE
    v_Año int;
    v_resultado VARCHAR2(100);
    
BEGIN

    v_Año := ('&Ingrese_el_año_de_consulta');
    v_resultado := Consultar_Facturas_Credito(v_Año);
    
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;



