
INSERT INTO ARMADOR (CIF,NOMBRE,APELLIDOS,TELEFONO) VALUES ('A11111111','PESCA S.A.',null,'610000000');
INSERT INTO ARMADOR (CIF,NOMBRE,APELLIDOS,TELEFONO) VALUES ('A22222222','Transporte Marítimo Ltd',null,'620000000');
INSERT INTO ARMADOR (CIF,NOMBRE,APELLIDOS,TELEFONO) VALUES ('B33333333','Sergio',' Peces Garcia','630000000');


INSERT INTO BARCOS (MATRICULA,CIF_ARMADOR,CLASE,NOMBRE,NOMBRE_CAPITAN) values ('M1','A11111111','Arrastrero','Mar Azul','Jacinto Benavente');
INSERT INTO BARCOS (MATRICULA,CIF_ARMADOR,CLASE,NOMBRE,NOMBRE_CAPITAN) values ('M2','A22222222','Cangrejero','Oceanic','Sebastian El Cano');
INSERT INTO BARCOS (MATRICULA,CIF_ARMADOR,CLASE,NOMBRE,NOMBRE_CAPITAN) values ('M3','B33333333','Atunero','Viento Libre','Ana Rodríguez');
INSERT INTO BARCOS (MATRICULA,CIF_ARMADOR,CLASE,NOMBRE,NOMBRE_CAPITAN) values ('M4','A11111111','Atunero','Marino','Laura Martínez');


INSERT INTO Caladeros (Nombre, Extension, Ubicacion) VALUES ('Caladero A', 100.5, 'Atlántico');
INSERT INTO Caladeros (Nombre, Extension, Ubicacion) VALUES ('Caladero B', 75.2, 'Mediterráneo');
INSERT INTO Caladeros (Nombre, Extension, Ubicacion) VALUES ('Caladero C', 50.8, 'Mar del Norte');
INSERT INTO Caladeros (Nombre, Extension, Ubicacion) VALUES ('Caladero D', 120.3, 'Pacífico');
INSERT INTO Caladeros (Nombre, Extension, Ubicacion) VALUES ('Caladero E', 90.0, 'Mar de Barents');


INSERT INTO Especies (Codigo, Nombre, Tipo) VALUES (1, 'Salmón', 'Pez');
INSERT INTO Especies (Codigo, Nombre, Tipo) VALUES (2, 'Atún', 'Pez');
INSERT INTO Especies (Codigo, Nombre, Tipo) VALUES (3, 'Calamar', 'Cefalópodo');
INSERT INTO Especies (Codigo, Nombre, Tipo) VALUES (4, 'Gamba', 'Crustáceo');
INSERT INTO Especies (Codigo, Nombre, Tipo) VALUES (5, 'Merluza', 'Pez');
INSERT INTO Especies (Codigo, Nombre, Tipo) VALUES (6, 'Pulpo', 'Cefalópodo');
INSERT INTO Especies (Codigo, Nombre, Tipo) VALUES (7, 'Bacalao', 'Pez');


INSERT INTO Lotes (Codigo, Cod_especie, Fecha_Recepcion, Cajas, Kilos_Totales, Precio_Kilo_Salida) VALUES (100, 2, '30-04-2024', 50, 100.5,25);
INSERT INTO Lotes (Codigo, Cod_especie, Fecha_Recepcion, Cajas, Kilos_Totales, Precio_Kilo_Salida) VALUES (101, 1, '30-04-2024', 20, 25.5,50 );
INSERT INTO Lotes (Codigo, Cod_especie, Fecha_Recepcion, Cajas, Kilos_Totales, Precio_Kilo_Salida) VALUES (102, 1, '01-05-2024', 30, 10,75);
INSERT INTO Lotes (Codigo, Cod_especie, Fecha_Recepcion, Cajas, Kilos_Totales, Precio_Kilo_Salida) VALUES (103, 1, '01-05-2024', 30, 10,45);
INSERT INTO Lotes (Codigo, Cod_especie, Fecha_Recepcion, Cajas, Kilos_Totales, Precio_Kilo_Salida) VALUES (104, 1, '01-05-2024', 60, 20,60);
INSERT INTO Lotes (Codigo, Cod_especie, Fecha_Recepcion, Cajas, Kilos_Totales, Precio_Kilo_Salida) VALUES (105, 3, '02-05-2024', 15, 100,60);
INSERT INTO Lotes (Codigo, Cod_especie, Fecha_Recepcion, Cajas, Kilos_Totales, Precio_Kilo_Salida) VALUES (106, 4, '02-05-2024', 30, 50,50);
INSERT INTO Lotes (Codigo, Cod_especie, Fecha_Recepcion, Cajas, Kilos_Totales, Precio_Kilo_Salida) VALUES (107, 5, '02-05-2024', 40, 40,70);
INSERT INTO Lotes (Codigo, Cod_especie, Fecha_Recepcion, Cajas, Kilos_Totales, Precio_Kilo_Salida) VALUES (108, 6, '03-05-2024', 20, 20,100);
INSERT INTO Lotes (Codigo, Cod_especie, Fecha_Recepcion, Cajas, Kilos_Totales, Precio_Kilo_Salida) VALUES (109, 7, '03-05-2024', 10, 50.5,120);
INSERT INTO Lotes (Codigo, Cod_especie, Fecha_Recepcion, Cajas, Kilos_Totales, Precio_Kilo_Salida) VALUES (110, 7, '03-05-2024', 45, 25.5,100);


INSERT INTO Capturas (Matricula_Barco, Nombre_Caladero, Codigo_Lote, Fecha_Inicio_Captura, Fecha_Fin_Captura) VALUES ('M1', 'Caladero A', 100, '20-04-2024','30-04-2024');
INSERT INTO Capturas (Matricula_Barco, Nombre_Caladero, Codigo_Lote, Fecha_Inicio_Captura, Fecha_Fin_Captura) VALUES ('M1', 'Caladero A', 101, '20-04-2024','30-04-2024');
INSERT INTO Capturas (Matricula_Barco, Nombre_Caladero, Codigo_Lote, Fecha_Inicio_Captura, Fecha_Fin_Captura) VALUES ('M2', 'Caladero B', 102, '25-04-2024','01-05-2024');
INSERT INTO Capturas (Matricula_Barco, Nombre_Caladero, Codigo_Lote, Fecha_Inicio_Captura, Fecha_Fin_Captura) VALUES ('M2', 'Caladero B', 103, '25-04-2024','01-05-2024');
INSERT INTO Capturas (Matricula_Barco, Nombre_Caladero, Codigo_Lote, Fecha_Inicio_Captura, Fecha_Fin_Captura) VALUES ('M2', 'Caladero C', 104, '30-05-2024','01-05-2024');
INSERT INTO Capturas (Matricula_Barco, Nombre_Caladero, Codigo_Lote, Fecha_Inicio_Captura, Fecha_Fin_Captura) VALUES ('M4', 'Caladero D', 105, '27-04-2024','02-05-2024');
INSERT INTO Capturas (Matricula_Barco, Nombre_Caladero, Codigo_Lote, Fecha_Inicio_Captura, Fecha_Fin_Captura) VALUES ('M4', 'Caladero D', 106, '27-04-2024','02-05-2024');
INSERT INTO Capturas (Matricula_Barco, Nombre_Caladero, Codigo_Lote, Fecha_Inicio_Captura, Fecha_Fin_Captura) VALUES ('M4', 'Caladero D', 107, '27-04-2024','02-05-2024');
INSERT INTO Capturas (Matricula_Barco, Nombre_Caladero, Codigo_Lote, Fecha_Inicio_Captura, Fecha_Fin_Captura) VALUES ('M3', 'Caladero C', 108, '17-04-2024','03-05-2024');
INSERT INTO Capturas (Matricula_Barco, Nombre_Caladero, Codigo_Lote, Fecha_Inicio_Captura, Fecha_Fin_Captura) VALUES ('M3', 'Caladero C', 109, '17-04-2024','03-05-2024');
INSERT INTO Capturas (Matricula_Barco, Nombre_Caladero, Codigo_Lote, Fecha_Inicio_Captura, Fecha_Fin_Captura) VALUES ('M3', 'Caladero C', 110, '17-04-2024','03-05-2024');


INSERT INTO Pescaderias (Cif, Nombre, Calle, Numero, Localidad, CP, Paga) VALUES ('CIF001', 'Pescados del Mar', 'Calle del Pescador', 123, 'Granada', '18001','contado');
INSERT INTO Pescaderias (Cif, Nombre, Calle, Numero, Localidad, CP, Paga, Numero_Cuenta, Cuota_inicial, Fecha_VTO) VALUES ('CIF002', 'Mariscos Frescos', 'Avenida del Puerto', 456, 'Málaga', '29001','credito', 'ES123456789', 700.00, 30);
INSERT INTO Pescaderias (Cif, Nombre, Calle, Numero, Localidad, CP, Paga, Numero_Cuenta, Cuota_inicial, Fecha_VTO) VALUES ('CIF003', 'Pescadería del Mar', 'Calle del Pescador', 789, 'Almería', '04001', 'credito', 'ES9985956525', 600.00, 60);
INSERT INTO Pescaderias (Cif, Nombre, Calle, Numero, Localidad, CP, Paga) VALUES ('CIF004', 'Pescaderia Recio', 'Rue del Percebe', 13, 'Granada', '18001','contado');


INSERT INTO Pescaderias_telefonos VALUES ('CIF001','600000000');
INSERT INTO Pescaderias_telefonos VALUES ('CIF001','600000001');
INSERT INTO Pescaderias_telefonos VALUES ('CIF001','600000002');
INSERT INTO Pescaderias_telefonos VALUES ('CIF002','600000003');
INSERT INTO Pescaderias_telefonos VALUES ('CIF003','600000004');
INSERT INTO Pescaderias_telefonos VALUES ('CIF003','600000005');
INSERT INTO Pescaderias_telefonos VALUES ('CIF004','600000006');
INSERT INTO Pescaderias_telefonos VALUES ('CIF004','600000007');




---PARAR AQUÍ Y EXPLICAR LO QUE NOS VA A INSERTAR. TRIGGER QUE ANTES DE INSERTAR NOS CREA SEGÚN SEA C O V UN FC O UN FV.
---PARAR AQUÍ Y EXPLICAR LO QUE NOS VA A INSERTAR. TRIGGER QUE ANTES DE INSERTAR NOS CREA SEGÚN SEA C O V UN FC O UN FV.
---PARAR AQUÍ Y EXPLICAR LO QUE NOS VA A INSERTAR. TRIGGER QUE ANTES DE INSERTAR NOS CREA SEGÚN SEA C O V UN FC O UN FV.

INSERT INTO facturas (Tipo,Fecha) VALUES ('c','30-04-2024');
INSERT INTO facturas (Tipo,Fecha) VALUES ('v','30-04-2024');
INSERT INTO facturas (Tipo,Fecha) VALUES ('c','01-05-2024');
INSERT INTO facturas (Tipo,Fecha) VALUES ('v','01-05-2024');
INSERT INTO facturas (Tipo,Fecha) VALUES ('v','01-05-2024');
INSERT INTO facturas (Tipo,Fecha) VALUES ('c','02-05-2024');
INSERT INTO facturas (Tipo,Fecha) VALUES ('v','02-05-2024');
INSERT INTO facturas (Tipo,Fecha) VALUES ('v','02-05-2024');
INSERT INTO facturas (Tipo,Fecha) VALUES ('c','03-05-2024');
INSERT INTO facturas (Tipo,Fecha) VALUES ('v','03-05-2024');
INSERT INTO facturas (Tipo,Fecha) VALUES ('v','03-05-2024');


--EXPLICAR EL TRIGGER tr_importe_factura_venta, antes de insertar en esta tabla Ventas, multiplica de lotes el número de kilos, por el precio alcanzado
--(tercera columna de values)

INSERT INTO Ventas (Codigo_Lote,CIF_Pescaderia,Precio_kilo_venta) values (100,'CIF001',40);
INSERT INTO Ventas (Codigo_Lote,CIF_Pescaderia,Precio_kilo_venta) values (101,'CIF001',80);
INSERT INTO Ventas (Codigo_Lote,CIF_Pescaderia,Precio_kilo_venta) values (102,'CIF002',120);
INSERT INTO Ventas (Codigo_Lote,CIF_Pescaderia,Precio_kilo_venta) values (103,'CIF003',60);
INSERT INTO Ventas (Codigo_Lote,CIF_Pescaderia,Precio_kilo_venta) values (104,'CIF003',90);
INSERT INTO Ventas (Codigo_Lote,CIF_Pescaderia,Precio_kilo_venta) values (105,'CIF001',95);
INSERT INTO Ventas (Codigo_Lote,CIF_Pescaderia,Precio_kilo_venta) values (106,'CIF002',75);
INSERT INTO Ventas (Codigo_Lote,CIF_Pescaderia,Precio_kilo_venta) values (107,'CIF002',100);
INSERT INTO Ventas (Codigo_Lote,CIF_Pescaderia,Precio_kilo_venta) values (108,'CIF004',120);
INSERT INTO Ventas (Codigo_Lote,CIF_Pescaderia,Precio_kilo_venta) values (109,'CIF003',150);
INSERT INTO Ventas (Codigo_Lote,CIF_Pescaderia,Precio_kilo_venta) values (110,'CIF003',130);


--EXPLICAR QUE EL TRIGGER tr_actualizar_fecha_vto suma la cantidad de días de credito a los clientes de credito
-- e inserta la fecha resultante en la columan Fecha_Vto. Lo clientes de contado, esta fecha sale a 'null'.

INSERT INTO Facturas_Venta (Numero_Factura, CIF_Pescaderia, Codigo_Lote) VALUES ('FV1001','CIF001', 100);
INSERT INTO Facturas_Venta (Numero_Factura, CIF_Pescaderia, Codigo_Lote) VALUES ('FV1001','CIF001', 101); 
INSERT INTO Facturas_Venta (Numero_Factura, CIF_Pescaderia, Codigo_Lote) VALUES ('FV1003','CIF002', 102);
INSERT INTO Facturas_Venta (Numero_Factura, CIF_Pescaderia, Codigo_Lote) VALUES ('FV1004','CIF003', 103);
INSERT INTO Facturas_Venta (Numero_Factura, CIF_Pescaderia, Codigo_Lote) VALUES ('FV1004','CIF003', 104);
INSERT INTO Facturas_Venta (Numero_Factura, CIF_Pescaderia, Codigo_Lote) VALUES ('FV1006','CIF001', 105);
INSERT INTO Facturas_Venta (Numero_Factura, CIF_Pescaderia, Codigo_Lote) VALUES ('FV1007','CIF002', 106);
INSERT INTO Facturas_Venta (Numero_Factura, CIF_Pescaderia, Codigo_Lote) VALUES ('FV1007','CIF002', 107);
INSERT INTO Facturas_Venta (Numero_Factura, CIF_Pescaderia, Codigo_Lote) VALUES ('FV1009','CIF004', 108);
INSERT INTO Facturas_Venta (Numero_Factura, CIF_Pescaderia, Codigo_Lote) VALUES ('FV1010','CIF003', 109);
INSERT INTO Facturas_Venta (Numero_Factura, CIF_Pescaderia, Codigo_Lote) VALUES ('FV1010','CIF003', 110);


INSERT INTO Facturas_Venta_Pagadas (Numero_Factura) VALUES ('FV1001');
INSERT INTO Facturas_Venta_Pagadas (Numero_Factura) VALUES ('FV1003');
INSERT INTO Facturas_Venta_Pagadas (Numero_Factura) VALUES ('FV1004');
INSERT INTO Facturas_Venta_Pagadas (Numero_Factura) VALUES ('FV1006');
INSERT INTO Facturas_Venta_Pagadas (Numero_Factura) VALUES ('FV1007');
INSERT INTO Facturas_Venta_Pagadas (Numero_Factura) VALUES ('FV1009');
INSERT INTO Facturas_Venta_Pagadas (Numero_Factura) VALUES ('FV1010');


select * from facturas_venta_pagadas;

--recordar modificar la FV1003 con el pago el 27/05/24


INSERT INTO Facturas_Compra (Codigo_Lote, Numero_Factura) VALUES (100,'FC1000');
INSERT INTO Facturas_Compra (Codigo_Lote, Numero_Factura) VALUES (101,'FC1000');
INSERT INTO Facturas_Compra (Codigo_Lote, Numero_Factura) VALUES (102,'FC1002');
INSERT INTO Facturas_Compra (Codigo_Lote, Numero_Factura) VALUES (103,'FC1002');
INSERT INTO Facturas_Compra (Codigo_Lote, Numero_Factura) VALUES (104,'FC1002');
INSERT INTO Facturas_Compra (Codigo_Lote, Numero_Factura) VALUES (105,'FC1005');
INSERT INTO Facturas_Compra (Codigo_Lote, Numero_Factura) VALUES (106,'FC1005');
INSERT INTO Facturas_Compra (Codigo_Lote, Numero_Factura) VALUES (107,'FC1005');
INSERT INTO Facturas_Compra (Codigo_Lote, Numero_Factura) VALUES (108,'FC1008');
INSERT INTO Facturas_Compra (Codigo_Lote, Numero_Factura) VALUES (109,'FC1008');
INSERT INTO Facturas_Compra (Codigo_Lote, Numero_Factura) VALUES (110,'FC1008');

