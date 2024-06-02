ALTER SESSION SET CURRENT_SCHEMA = adminLonja;


-- VISTAS

SELECT * from Historial_Ventas_Por_Año;




-- CONSULTAS

-- Historico de ventas con el importe total de ventas por pescadería y cantidad de lotes vendidos a cada una.

SELECT p.Nombre AS Pescaderia, SUM(v.Total_Venta) AS Importe_Total_Ventas, COUNT(v.Codigo_Lote) AS Numero_Lotes  FROM Pescaderias p
JOIN Ventas v ON p.CIF = v.CIF_Pescaderia GROUP BY p.Nombre
ORDER BY Importe_Total_Ventas DESC;

-- Historico de ventas por pescaderías con detalle de pagos

SELECT distinct p.Nombre AS Pescaderia,fv.Numero_Factura,fv.Fecha_VTO,fvp.Importe_Total,fvp.Fecha_Pago FROM Pescaderias p
JOIN Ventas v ON p.CIF = v.CIF_Pescaderia
JOIN Facturas_Venta fv ON v.Codigo_Lote = fv.Codigo_Lote
LEFT JOIN Facturas_Venta_Pagadas fvp ON fv.Numero_Factura = fvp.Numero_Factura
ORDER BY p.Nombre, fv.Numero_Factura;


-- Historico de ventas de lotes a pescaderias

SELECT distinct p.Nombre AS Pescaderia,fv.Numero_Factura,fv.Fecha_VTO,fvp.Importe_Total,fvp.Fecha_Pago, v.codigo_lote FROM Pescaderias p
JOIN Ventas v ON p.CIF = v.CIF_Pescaderia
JOIN Facturas_Venta fv ON v.Codigo_Lote = fv.Codigo_Lote
LEFT JOIN Facturas_Venta_Pagadas fvp ON fv.Numero_Factura = fvp.Numero_Factura
ORDER BY p.Nombre, fv.Numero_Factura,v.codigo_lote;


-- Facturas de venta pendientes de pago por pescadería

SELECT distinct fv.CIF_Pescaderia, fv.Numero_Factura, fv.Fecha_VTO FROM Facturas_Venta fv 
LEFT JOIN Facturas_Venta_Pagadas fvp ON fv.Numero_Factura = fvp.Numero_Factura 
WHERE fvp.fecha_pago IS NULL;


-- Importe total y el número de facturas pendientes de pago por parte de la Lonja

SELECT COUNT(Numero_Factura) AS Nº_Fac_Pendientes, Importe_Total AS Saldo_Total_Pendiente FROM Facturas_Compra_Pagada
WHERE Pagada = 'n' GROUP by Numero_Factura,Importe_Total;


-- Historio de capturas realizadas por cada barco en cada caladero.

SELECT c.Matricula_Barco, c.Nombre_Caladero, COUNT(c.Codigo_Lote) AS Numero_Capturas, SUM(l.Kilos_Totales) AS Total_Kilos FROM Capturas c
JOIN Lotes l ON c.Codigo_Lote = l.Codigo GROUP BY c.Matricula_Barco, c.Nombre_Caladero
ORDER BY c.Matricula_Barco, c.Nombre_Caladero;


-- Historico de kilos capturados de cada especie.

SELECT e.Nombre AS Especie, SUM(l.Kilos_Totales) AS Total_Kilos FROM Especies e
JOIN Lotes l ON e.Codigo = l.Cod_especie GROUP BY e.Nombre
ORDER BY Total_Kilos DESC;




-- Bloque que consulta a la función quien se le vendió el lote que le indiquemos.

DECLARE
    v_Lote lotes.codigo%type;
    v_resultado VARCHAR2(100);
BEGIN

    v_Lote := ('&Ingrese_el_código_de_lote');
    v_resultado := Codigo_Lote(v_Lote);
    
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;



-- Bloque que consulta a la función la cantidad exacta total de deuda de los clientes a credito.

DECLARE

z number(10,2);
v_cif_pescaderia ventas.cif_pescaderia%type:='&Dame_un_CIF';

BEGIN

z:=Total_Facturas_Pendientes(v_cif_pescaderia);

DBMS_OUTPUT.PUT_LINE('El importe total de la deuda es de: '||z||' euros');

END;


-- Bloque que actualiza en una tabla el total de ventas por año para el 347 de las pescaderías.

BEGIN
    Actualizar_Ventas_Anuales;
END;

-- Visualiza los datos anteriores.
SELECT * FROM Resumen_Ventas_Anuales;


