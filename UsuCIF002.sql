ALTER SESSION SET CURRENT_SCHEMA = adminLonja;

select * from facturasCliente;

select * from facturas_pendientes_pago;


--Llama a la funcion Consultar_Facturas_Credito donde se le pide al cliente un a�o para consultar en la base de datos.

DECLARE
    v_A�o int;
    v_resultado VARCHAR2(100);
    
BEGIN

    v_A�o := ('&Ingrese_el_a�o_de_consulta');
    v_resultado := Consultar_Facturas_Credito(v_A�o);
    
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;



