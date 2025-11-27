/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos_tienda` (
  `id_articulo` int NOT NULL AUTO_INCREMENT,
  `codigo_articulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_articulo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` enum('libro','replica','recuerdo','juguete','ropa','arte','multimedia','otros') COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `costo_adquisicion` decimal(10,2) DEFAULT NULL,
  `cantidad_inventario` int DEFAULT '0',
  `id_proveedor` int DEFAULT NULL,
  `ubicacion_tienda` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_articulo`),
  UNIQUE KEY `codigo_articulo` (`codigo_articulo`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `idx_categoria` (`categoria`),
  KEY `idx_cantidad_inventario` (`cantidad_inventario`),
  CONSTRAINT `articulos_tienda_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `articulos_tienda` VALUES (1,'ART-001','Catálogo Museo 2025','libro',25.00,10.00,120,7,'Mostrador','Catálogo con todas las colecciones.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (2,'ART-002','Replica Moche','replica',45.00,20.00,40,1,'Estantería A','Replica de cerámica precolombina.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (3,'ART-003','Postal Set','recuerdo',6.00,1.50,250,8,'Mostrador','Pack de 10 postales.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (4,'ART-004','Taza Museo','recuerdo',12.00,3.00,200,8,'Mostrador','Taza con logo del museo.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (5,'ART-005','Camiseta Museo','ropa',20.00,6.00,150,14,'Estantería B','Camiseta con estampado.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (6,'ART-006','Libro Historia Colonial','libro',30.00,12.00,60,7,'Librería','Ensayo sobre la pintura colonial.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (7,'ART-007','Figura Antigua','arte',80.00,35.00,15,2,'Vitrina','Figura de colección.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (8,'ART-008','Puzzle Infantil','juguete',15.00,4.00,90,8,'Estantería Infantil','Puzzle educativo.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (9,'ART-009','DVD Documental','multimedia',12.00,5.00,70,16,'Mostrador','Documental sobre exposiciones.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (10,'ART-010','Poster Mapas','replica',10.00,2.50,100,19,'Estantería C','Poster de mapas históricos.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (11,'ART-011','Bolsa Tela','recuerdo',8.00,2.00,180,8,'Mostrador','Bolsa reutilizable.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (12,'ART-012','Collar Artesanal','arte',35.00,10.00,30,18,'Vitrina','Collar hecho a mano.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (13,'ART-013','Imanes','recuerdo',4.00,0.80,300,8,'Mostrador','Imanes con motivos del museo.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (14,'ART-014','Guía Infantil','libro',9.00,3.00,110,7,'Librería','Guía para niños.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (15,'ART-015','Reproducción Cuadro','replica',60.00,25.00,20,6,'Vitrina','Reproducción limitada.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (16,'ART-016','Juego de Mesa','juguete',28.00,10.00,45,8,'Estantería Juegos','Juego temático.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (17,'ART-017','Postal Vintage','recuerdo',3.50,0.70,220,19,'Mostrador','Postal estilo vintage.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (18,'ART-018','Llavero','recuerdo',5.00,1.00,260,8,'Mostrador','Llavero metálico.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (19,'ART-019','Cuaderno Edición','libro',14.00,4.50,95,7,'Librería','Cuaderno con ilustraciones.','2025-11-17 21:52:16');
INSERT INTO `articulos_tienda` VALUES (20,'ART-020','Replica Instrumento','replica',120.00,60.00,8,2,'Vitrina','Replica de instrumento antiguo.','2025-11-17 21:52:16');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento_identidad` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` enum('guia','administrador','cajero','seguridad','mantenimiento','gerente','atencion_cliente') COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_contratacion` date NOT NULL,
  `horario_entrada` time DEFAULT NULL,
  `horario_salida` time DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `estado` enum('activo','inactivo','vacaciones') COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `documento_identidad` (`documento_identidad`),
  KEY `idx_cargo` (`cargo`),
  KEY `idx_estado_empleado` (`estado`),
  KEY `idx_fecha_contratacion` (`fecha_contratacion`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `empleados` VALUES (1,'Carolina Mejía','EJ1001','guia','320-200-0001','carolina.m@museum.com','2019-03-15','08:00:00','16:00:00',2500.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (2,'Fernando Ruiz','EJ1002','administrador','320-200-0002','fernando.r@museum.com','2017-07-01','09:00:00','17:00:00',4200.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (3,'Daniela Vélez','EJ1003','cajero','320-200-0003','daniela.v@museum.com','2020-09-10','10:00:00','18:00:00',1800.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (4,'Miguel López','EJ1004','seguridad','320-200-0004','miguel.l@museum.com','2018-02-20','07:00:00','15:00:00',2000.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (5,'Sergio Peña','EJ1005','mantenimiento','320-200-0005','sergio.p@museum.com','2016-05-30','06:00:00','14:00:00',1900.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (6,'Laura Medina','EJ1006','gerente','320-200-0006','laura.m@museum.com','2015-01-12','08:30:00','17:30:00',6000.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (7,'Andrés Gil','EJ1007','atencion_cliente','320-200-0007','andres.g@museum.com','2021-11-01','09:00:00','17:00:00',2100.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (8,'Patricia Salazar','EJ1008','guia','320-200-0008','patricia.s@museum.com','2019-06-18','08:00:00','16:00:00',2400.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (9,'Ricardo Molina','EJ1009','cajero','320-200-0009','ricardo.m@museum.com','2022-03-21','10:00:00','18:00:00',1750.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (10,'Mónica Ruiz','EJ1010','mantenimiento','320-200-0010','monica.r@museum.com','2014-09-09','06:00:00','14:00:00',1950.00,'vacaciones','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (11,'Pablo Serrano','EJ1011','seguridad','320-200-0011','pablo.s@museum.com','2013-12-01','07:00:00','15:00:00',2050.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (12,'Liliana Torres','EJ1012','administrador','320-200-0012','liliana.t@museum.com','2010-04-20','09:00:00','17:00:00',4300.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (13,'Esteban Cruz','EJ1013','guia','320-200-0013','esteban.c@museum.com','2020-08-05','08:00:00','16:00:00',2300.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (14,'Mariana Soto','EJ1014','atencion_cliente','320-200-0014','mariana.s@museum.com','2018-10-11','09:00:00','17:00:00',2050.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (15,'Gustavo Rentería','EJ1015','mantenimiento','320-200-0015','gustavo.r@museum.com','2011-05-04','06:00:00','14:00:00',2000.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (16,'Verónica Peña','EJ1016','cajero','320-200-0016','veronica.p@museum.com','2021-02-14','10:00:00','18:00:00',1780.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (17,'Hugo Morales','EJ1017','seguridad','320-200-0017','hugo.m@museum.com','2009-07-07','07:00:00','15:00:00',2100.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (18,'Camila Ríos','EJ1018','guia','320-200-0018','camila.r@museum.com','2016-11-11','08:00:00','16:00:00',2450.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (19,'Óscar Nájera','EJ1019','administrador','320-200-0019','oscar.n@museum.com','2012-01-20','09:00:00','17:00:00',4100.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (20,'Daniela Peña','EJ1020','atencion_cliente','320-200-0020','daniela.p@museum.com','2023-05-10','09:00:00','17:00:00',2000.00,'activo','2025-11-17 21:52:16');
INSERT INTO `empleados` VALUES (21,'Juan Pérez García','12345678A','administrador','555-0123','juan.perez@empresa.com','2025-01-15','08:00:00','17:00:00',2500.50,'activo','2025-11-19 01:59:56');
INSERT INTO `empleados` VALUES (22,'María López Sánchez','87654321B','cajero',NULL,NULL,'2025-02-01',NULL,NULL,NULL,'activo','2025-11-19 02:00:32');
INSERT INTO `empleados` VALUES (23,'Carlos Ramírez Torres','11223344C','seguridad','555-0124','carlos.ramirez@empresa.com','2025-01-20',NULL,NULL,1800.00,'activo','2025-11-19 02:02:03');
INSERT INTO `empleados` VALUES (24,'Ana Martínez Ruiz','55667788D','administrador','555-0125','ana.martinez@empresa.com','2025-01-22',NULL,NULL,2600.00,'activo','2025-11-19 02:02:03');
INSERT INTO `empleados` VALUES (25,'Luis Fernández Gómez','99887766E','cajero','555-0126','luis.fernandez@empresa.com','2025-01-25',NULL,NULL,1500.00,'activo','2025-11-19 02:02:03');
INSERT INTO `empleados` VALUES (26,'Pedro González','22334455F','seguridad','555-0127','pedro.gonzalez@empresa.com','2025-02-05','09:00:00','18:00:00',1850.00,'activo','2025-11-19 02:14:22');
INSERT INTO `empleados` VALUES (27,'Laura Díaz','33445566G','cajero','555-0128','laura.diaz@empresa.com','2025-02-06','08:30:00','17:30:00',1550.00,'activo','2025-11-19 02:14:22');
INSERT INTO `empleados` VALUES (28,'Mateo Orozco','1235039141','administrador','3015663832','mateob-1097@hotmail.com','1997-12-16','10:30:00','01:30:00',1600000.00,'activo','2025-11-26 01:15:20');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas` (
  `id_entrada` int NOT NULL AUTO_INCREMENT,
  `numero_entrada` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_entrada` enum('general','estudiante','tercera_edad','ninos','grupo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_visita` date NOT NULL,
  `hora_visita` time DEFAULT NULL,
  `id_visitante` int DEFAULT NULL,
  `metodo_compra` enum('en_linea','taquilla','agencia') COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_entrada` enum('valida','usada','cancelada') COLLATE utf8mb4_unicode_ci DEFAULT 'valida',
  `fecha_compra` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `descuento_aplicado` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id_entrada`),
  UNIQUE KEY `numero_entrada` (`numero_entrada`),
  KEY `id_visitante` (`id_visitante`),
  KEY `idx_fecha_visita` (`fecha_visita`),
  KEY `idx_tipo_entrada` (`tipo_entrada`),
  KEY `idx_metodo_compra` (`metodo_compra`),
  KEY `idx_estado_entrada` (`estado_entrada`),
  KEY `idx_fecha_compra` (`fecha_compra`),
  CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`id_visitante`) REFERENCES `visitantes` (`id_visitante`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `entradas` VALUES (1,'TCK-0001','general',20.00,'2025-11-01','10:00:00',1,'en_linea','valida','2025-11-17 21:52:16',0.00);
INSERT INTO `entradas` VALUES (2,'TCK-0002','estudiante',10.00,'2025-11-02','11:00:00',2,'taquilla','valida','2025-11-17 21:52:16',5.00);
INSERT INTO `entradas` VALUES (3,'TCK-0003','tercera_edad',12.00,'2025-10-15','09:30:00',3,'agencia','valida','2025-11-17 21:52:16',4.80);
INSERT INTO `entradas` VALUES (4,'TCK-0004','ninos',0.00,'2025-09-12','14:00:00',4,'taquilla','valida','2025-11-17 21:52:16',0.00);
INSERT INTO `entradas` VALUES (5,'TCK-0005','grupo',18.00,'2025-08-20','09:00:00',5,'en_linea','valida','2025-11-17 21:52:16',9.00);
INSERT INTO `entradas` VALUES (6,'TCK-0006','general',20.00,'2025-07-05','12:00:00',6,'taquilla','usada','2025-11-17 21:52:16',0.00);
INSERT INTO `entradas` VALUES (7,'TCK-0007','estudiante',10.00,'2025-06-22','13:00:00',7,'en_linea','valida','2025-11-17 21:52:16',5.00);
INSERT INTO `entradas` VALUES (8,'TCK-0008','general',20.00,'2025-05-18','15:00:00',8,'taquilla','cancelada','2025-11-17 21:52:16',0.00);
INSERT INTO `entradas` VALUES (9,'TCK-0009','ninos',0.00,'2025-04-10','10:00:00',9,'en_linea','valida','2025-11-17 21:52:16',0.00);
INSERT INTO `entradas` VALUES (10,'TCK-0010','tercera_edad',12.00,'2025-03-25','09:00:00',10,'agencia','valida','2025-11-17 21:52:16',4.80);
INSERT INTO `entradas` VALUES (11,'TCK-0011','general',20.00,'2025-02-14','14:30:00',11,'en_linea','valida','2025-11-17 21:52:16',0.00);
INSERT INTO `entradas` VALUES (12,'TCK-0012','estudiante',10.00,'2025-01-11','11:00:00',12,'taquilla','valida','2025-11-17 21:52:16',5.00);
INSERT INTO `entradas` VALUES (13,'TCK-0013','grupo',18.00,'2024-12-20','10:00:00',13,'en_linea','usada','2025-11-17 21:52:16',9.00);
INSERT INTO `entradas` VALUES (14,'TCK-0014','general',20.00,'2024-11-30','16:00:00',14,'taquilla','valida','2025-11-17 21:52:16',0.00);
INSERT INTO `entradas` VALUES (15,'TCK-0015','ninos',500.00,'2024-10-05','09:00:00',15,'en_linea','valida','2025-11-17 21:52:16',0.00);
INSERT INTO `entradas` VALUES (16,'TCK-0016','general',20.00,'2024-09-14','10:00:00',16,'taquilla','valida','2025-11-17 21:52:16',0.00);
INSERT INTO `entradas` VALUES (17,'TCK-0017','estudiante',10.00,'2024-08-22','12:00:00',17,'agencia','valida','2025-11-17 21:52:16',5.00);
INSERT INTO `entradas` VALUES (18,'TCK-0018','general',20.00,'2024-07-11','13:00:00',18,'en_linea','valida','2025-11-17 21:52:16',0.00);
INSERT INTO `entradas` VALUES (19,'TCK-0019','tercera_edad',12.00,'2024-06-02','09:30:00',19,'taquilla','valida','2025-11-17 21:52:16',4.80);
INSERT INTO `entradas` VALUES (20,'TCK-0020','general',20.00,'2024-05-01','10:00:00',20,'en_linea','valida','2025-11-17 21:52:16',0.00);
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_crear_reserva_visita` AFTER INSERT ON `entradas` FOR EACH ROW BEGIN
    INSERT INTO reservas_visitas_guiadas (id_visita_guiada, id_entrada, estado)
    SELECT 
        vg.id_visita_guiada,
        NEW.id_entrada,
        'confirmada'
    FROM visitas_guiadas vg
    WHERE vg.fecha_visita = NEW.fecha_visita
      AND vg.estado = 'programada'
    LIMIT 1; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas_eventos` (
  `id_entrada_evento` int NOT NULL AUTO_INCREMENT,
  `id_evento` int NOT NULL,
  `id_entrada` int NOT NULL,
  PRIMARY KEY (`id_entrada_evento`),
  KEY `id_evento` (`id_evento`),
  KEY `id_entrada` (`id_entrada`),
  CONSTRAINT `entradas_eventos_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `eventos_especiales` (`id_evento`) ON DELETE CASCADE,
  CONSTRAINT `entradas_eventos_ibfk_2` FOREIGN KEY (`id_entrada`) REFERENCES `entradas` (`id_entrada`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `entradas_eventos` VALUES (1,1,1);
INSERT INTO `entradas_eventos` VALUES (2,2,2);
INSERT INTO `entradas_eventos` VALUES (3,3,3);
INSERT INTO `entradas_eventos` VALUES (4,4,4);
INSERT INTO `entradas_eventos` VALUES (5,5,5);
INSERT INTO `entradas_eventos` VALUES (6,6,6);
INSERT INTO `entradas_eventos` VALUES (7,7,7);
INSERT INTO `entradas_eventos` VALUES (8,8,8);
INSERT INTO `entradas_eventos` VALUES (9,9,9);
INSERT INTO `entradas_eventos` VALUES (10,10,10);
INSERT INTO `entradas_eventos` VALUES (11,11,11);
INSERT INTO `entradas_eventos` VALUES (12,12,12);
INSERT INTO `entradas_eventos` VALUES (13,13,13);
INSERT INTO `entradas_eventos` VALUES (14,14,14);
INSERT INTO `entradas_eventos` VALUES (15,15,15);
INSERT INTO `entradas_eventos` VALUES (16,16,16);
INSERT INTO `entradas_eventos` VALUES (17,17,17);
INSERT INTO `entradas_eventos` VALUES (18,18,18);
INSERT INTO `entradas_eventos` VALUES (19,19,19);
INSERT INTO `entradas_eventos` VALUES (20,20,20);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas_promociones` (
  `id_entrada_promocion` int NOT NULL AUTO_INCREMENT,
  `id_entrada` int NOT NULL,
  `id_promocion` int NOT NULL,
  PRIMARY KEY (`id_entrada_promocion`),
  KEY `id_entrada` (`id_entrada`),
  KEY `id_promocion` (`id_promocion`),
  CONSTRAINT `entradas_promociones_ibfk_1` FOREIGN KEY (`id_entrada`) REFERENCES `entradas` (`id_entrada`) ON DELETE CASCADE,
  CONSTRAINT `entradas_promociones_ibfk_2` FOREIGN KEY (`id_promocion`) REFERENCES `promociones` (`id_promocion`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `entradas_promociones` VALUES (1,1,1);
INSERT INTO `entradas_promociones` VALUES (2,2,2);
INSERT INTO `entradas_promociones` VALUES (3,3,4);
INSERT INTO `entradas_promociones` VALUES (4,4,5);
INSERT INTO `entradas_promociones` VALUES (5,5,3);
INSERT INTO `entradas_promociones` VALUES (6,6,11);
INSERT INTO `entradas_promociones` VALUES (7,7,2);
INSERT INTO `entradas_promociones` VALUES (8,8,6);
INSERT INTO `entradas_promociones` VALUES (9,9,5);
INSERT INTO `entradas_promociones` VALUES (10,10,4);
INSERT INTO `entradas_promociones` VALUES (11,11,1);
INSERT INTO `entradas_promociones` VALUES (12,12,2);
INSERT INTO `entradas_promociones` VALUES (13,13,3);
INSERT INTO `entradas_promociones` VALUES (14,14,8);
INSERT INTO `entradas_promociones` VALUES (15,15,5);
INSERT INTO `entradas_promociones` VALUES (16,16,7);
INSERT INTO `entradas_promociones` VALUES (17,17,2);
INSERT INTO `entradas_promociones` VALUES (18,18,1);
INSERT INTO `entradas_promociones` VALUES (19,19,4);
INSERT INTO `entradas_promociones` VALUES (20,20,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_especiales` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `codigo_evento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_evento` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_evento` enum('taller','conferencia','exhibicion_temporal','inauguracion','concierto','presentacion') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_evento` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time DEFAULT NULL,
  `capacidad_maxima` int NOT NULL,
  `precio_entrada` decimal(10,2) DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `institucion_colaboradora` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` enum('programado','realizado','cancelado') COLLATE utf8mb4_unicode_ci DEFAULT 'programado',
  PRIMARY KEY (`id_evento`),
  UNIQUE KEY `codigo_evento` (`codigo_evento`),
  KEY `idx_fecha_evento` (`fecha_evento`),
  KEY `idx_tipo_evento` (`tipo_evento`),
  KEY `idx_estado_evento` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `eventos_especiales` VALUES (1,'EVT-001','Taller de Restauración','taller','2025-11-20','09:00:00','13:00:00',30,50.00,'Taller práctico de restauración.','RestauroPlus','programado');
INSERT INTO `eventos_especiales` VALUES (2,'EVT-002','Conferencia Patrimonio','conferencia','2025-10-15','14:00:00','16:00:00',120,0.00,'Conferencia sobre patrimonio cultural.','ConsultoraMuseos','programado');
INSERT INTO `eventos_especiales` VALUES (3,'EVT-003','Inauguración Expo Textil','inauguracion','2025-01-10','18:00:00','20:00:00',200,15.00,'Apertura de La Ruta del Textil.','Galeria Norte','realizado');
INSERT INTO `eventos_especiales` VALUES (4,'EVT-004','Concierto Barroco','concierto','2024-12-05','19:00:00','21:00:00',250,25.00,'Concierto de musica barroca.','Orquesta Antigua','realizado');
INSERT INTO `eventos_especiales` VALUES (5,'EVT-005','Workshop Digital Art','taller','2025-06-10','10:00:00','16:00:00',40,60.00,'Taller de arte digital.','VisualTech','programado');
INSERT INTO `eventos_especiales` VALUES (6,'EVT-006','Presentación Libro','presentacion','2025-08-20','17:00:00','19:00:00',80,0.00,'Lanzamiento editorial.','Editorial Museo','programado');
INSERT INTO `eventos_especiales` VALUES (7,'EVT-007','Taller Infantil','taller','2025-07-12','09:00:00','12:00:00',25,10.00,'Actividad para niños.','Sala Infantil','programado');
INSERT INTO `eventos_especiales` VALUES (8,'EVT-008','Exhibicion Temporal Moda','exhibicion_temporal','2025-02-01','10:00:00','18:00:00',150,12.00,'Diseño y Moda.','Galería de Arte 1','realizado');
INSERT INTO `eventos_especiales` VALUES (9,'EVT-009','Conferencia Tecnologia','conferencia','2025-09-05','11:00:00','13:00:00',100,0.00,'Charlas sobre tecnologias emergentes.','TransBytes','programado');
INSERT INTO `eventos_especiales` VALUES (10,'EVT-010','Presentacion Musical','presentacion','2025-03-18','20:00:00','22:00:00',180,20.00,'Presentacion de grupo local.','Cultura Local','realizado');
INSERT INTO `eventos_especiales` VALUES (11,'EVT-011','Inauguracion Exposicion','inauguracion','2025-04-02','17:30:00','19:30:00',220,10.00,'Inauguración.','MuseoLogistics','programado');
INSERT INTO `eventos_especiales` VALUES (12,'EVT-012','Taller de Fotografia','taller','2025-05-22','09:00:00','13:00:00',30,45.00,'Fotografía urbana.','Galería Norte','programado');
INSERT INTO `eventos_especiales` VALUES (13,'EVT-013','Conferencia Historia','conferencia','2025-06-30','14:00:00','16:00:00',90,0.00,'Historia colonial.','Universidad Local','programado');
INSERT INTO `eventos_especiales` VALUES (14,'EVT-014','Exhibicion Infantil','exhibicion_temporal','2025-12-10','10:00:00','17:00:00',120,8.00,'Juguetes y Juegos.','SouvenirCenter','programado');
INSERT INTO `eventos_especiales` VALUES (15,'EVT-015','Taller Multimedia','taller','2025-11-01','10:00:00','15:00:00',35,55.00,'Creación multimedia.','MultimediaPro','programado');
INSERT INTO `eventos_especiales` VALUES (16,'EVT-016','Concierto Educativo','concierto','2025-09-20','10:00:00','12:00:00',200,0.00,'Concierto para escuelas.','CateringMuseo','programado');
INSERT INTO `eventos_especiales` VALUES (17,'EVT-017','Presentacion Documental','presentacion','2025-10-05','18:00:00','20:00:00',90,5.00,'Proyección documental.','Editorial Museo','programado');
INSERT INTO `eventos_especiales` VALUES (18,'EVT-018','Taller Restauracion','taller','2025-02-15','09:00:00','13:00:00',20,70.00,'Taller avanzado de restauración.','RestauroPlus','realizado');
INSERT INTO `eventos_especiales` VALUES (19,'EVT-019','Conferencia Arquitectura','conferencia','2025-05-14','15:00:00','17:00:00',110,0.00,'Arquitectura moderna.','ConsultoraMuseos','programado');
INSERT INTO `eventos_especiales` VALUES (20,'EVT-020','Noche de Museo','presentacion','2025-05-18','18:00:00','23:00:00',400,0.00,'Actividades nocturnas.','MuseoLogistics','programado');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exhibiciones` (
  `id_exhibicion` int NOT NULL AUTO_INCREMENT,
  `codigo_exhibicion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_exhibicion` enum('permanente','temporal','itinerante') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_finalizacion` date DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `numero_maximo_visitantes` int DEFAULT NULL,
  `estado` enum('activa','inactiva','mantenimiento') COLLATE utf8mb4_unicode_ci DEFAULT 'activa',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_exhibicion`),
  UNIQUE KEY `codigo_exhibicion` (`codigo_exhibicion`),
  KEY `idx_tipo_exhibicion` (`tipo_exhibicion`),
  KEY `idx_fecha_inicio` (`fecha_inicio`),
  KEY `idx_estado` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `exhibiciones` VALUES (1,'EXH-001','De la Prehistoria al Mañana','permanente','2010-06-01',NULL,'Recorrido por la evolución cultural.',500,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (2,'EXH-002','Arte Moderno Latino','temporal','2024-03-15','2025-12-31','Selección de arte moderno latinoamericano.',300,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (3,'EXH-003','Tesoros del Río','itinerante','2023-09-01','2024-09-01','Exhibición itinerante de hallazgos fluviales.',200,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (4,'EXH-004','Ciencia Interactiva','permanente','2018-01-10',NULL,'Experimenta la ciencia con interactivos.',400,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (6,'EXH-006','Arqueología Andina','permanente','2012-05-20',NULL,'Exhibe piezas arqueológicas andinas.',250,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (7,'EXH-007','Fotografía Urbana','temporal','2025-06-01','2025-11-30','Colección de fotografía urbana contemporánea.',120,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (8,'EXH-008','Arte Digital','itinerante','2024-10-01','2025-10-01','Nuevas tendencias en arte digital.',180,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (9,'EXH-009','Instrumentos Antiguos','permanente','2016-04-05',NULL,'Muestra de instrumentos musicales antiguos.',200,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (10,'EXH-010','Iconografía Religiosa','temporal','2023-11-01','2024-11-01','Piezas religiosas históricas.',100,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (11,'EXH-011','Tesoros Marinos','itinerante','2022-07-15','2023-07-15','Objetos recuperados del mar.',220,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (12,'EXH-012','Diseño y Moda','temporal','2025-02-01','2025-09-30','Moda y diseño contemporáneo.',130,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (13,'EXH-013','Historia Natural','permanente','2005-05-01',NULL,'Colecciones de historia natural.',600,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (14,'EXH-014','Pintura Colonial','permanente','1998-09-15',NULL,'Pinturas del periodo colonial.',180,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (15,'EXH-015','Juguetes y Juegos','temporal','2024-12-01','2025-04-30','Exposición de juguetes tradicionales.',90,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (16,'EXH-016','Arquitectura Moderna','temporal','2025-05-01','2026-05-01','Modelos y planos de arquitectura.',160,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (17,'EXH-017','Naturaleza Viva','itinerante','2023-03-01','2024-03-01','Exhibición sobre biodiversidad.',300,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (18,'EXH-018','Arte Popular','permanente','2011-08-20',NULL,'Artesanía y expresiones populares.',220,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (19,'EXH-019','Tecnologías Emergentes','temporal','2025-09-01','2026-03-01','Innovaciones tecnológicas en arte.',140,'activa','2025-11-17 21:52:15');
INSERT INTO `exhibiciones` VALUES (20,'EXH-020','Mapas Históricos','permanente','2000-01-01',NULL,'Colección de mapas antiguos.',100,'activa','2025-11-17 21:52:15');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exhibiciones_salas` (
  `id_exhibicion_sala` int NOT NULL AUTO_INCREMENT,
  `id_exhibicion` int NOT NULL,
  `id_sala` int NOT NULL,
  `fecha_asignacion` date NOT NULL,
  `fecha_liberacion` date DEFAULT NULL,
  PRIMARY KEY (`id_exhibicion_sala`),
  UNIQUE KEY `uk_exhibicion_sala` (`id_exhibicion`,`id_sala`),
  KEY `id_sala` (`id_sala`),
  KEY `idx_fecha_asignacion` (`fecha_asignacion`),
  CONSTRAINT `exhibiciones_salas_ibfk_1` FOREIGN KEY (`id_exhibicion`) REFERENCES `exhibiciones` (`id_exhibicion`) ON DELETE CASCADE,
  CONSTRAINT `exhibiciones_salas_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `exhibiciones_salas` VALUES (1,1,1,'2010-06-01',NULL);
INSERT INTO `exhibiciones_salas` VALUES (2,2,11,'2024-03-15','2025-12-31');
INSERT INTO `exhibiciones_salas` VALUES (3,3,9,'2023-09-01','2024-09-01');
INSERT INTO `exhibiciones_salas` VALUES (4,4,2,'2018-01-10',NULL);
INSERT INTO `exhibiciones_salas` VALUES (6,6,3,'2012-05-20',NULL);
INSERT INTO `exhibiciones_salas` VALUES (7,7,16,'2025-06-01','2025-11-30');
INSERT INTO `exhibiciones_salas` VALUES (8,8,7,'2024-10-01','2025-10-01');
INSERT INTO `exhibiciones_salas` VALUES (9,9,17,'2016-04-05',NULL);
INSERT INTO `exhibiciones_salas` VALUES (10,10,18,'2023-11-01','2024-11-01');
INSERT INTO `exhibiciones_salas` VALUES (11,11,19,'2022-07-15','2023-07-15');
INSERT INTO `exhibiciones_salas` VALUES (12,12,5,'2025-02-01','2025-09-30');
INSERT INTO `exhibiciones_salas` VALUES (13,13,13,'2005-05-01',NULL);
INSERT INTO `exhibiciones_salas` VALUES (14,14,14,'1998-09-15',NULL);
INSERT INTO `exhibiciones_salas` VALUES (15,15,8,'2024-12-01','2025-04-30');
INSERT INTO `exhibiciones_salas` VALUES (16,16,6,'2025-05-01','2026-05-01');
INSERT INTO `exhibiciones_salas` VALUES (17,17,4,'2023-03-01','2024-03-01');
INSERT INTO `exhibiciones_salas` VALUES (18,18,10,'2011-08-20',NULL);
INSERT INTO `exhibiciones_salas` VALUES (19,19,12,'2025-09-01','2026-03-01');
INSERT INTO `exhibiciones_salas` VALUES (20,20,20,'2000-01-01',NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guias` (
  `id_guia` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `especialidad` enum('historia','arqueologia','arte','ciencias','general') COLLATE utf8mb4_unicode_ci NOT NULL,
  `calificacion_promedio` decimal(3,2) DEFAULT NULL,
  `total_recorridos` int DEFAULT '0',
  PRIMARY KEY (`id_guia`),
  UNIQUE KEY `id_empleado` (`id_empleado`),
  KEY `idx_especialidad` (`especialidad`),
  CONSTRAINT `guias_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `guias` VALUES (1,1,'historia',4.50,120);
INSERT INTO `guias` VALUES (2,8,'arte',4.60,95);
INSERT INTO `guias` VALUES (3,13,'arqueologia',4.40,80);
INSERT INTO `guias` VALUES (4,18,'general',4.70,140);
INSERT INTO `guias` VALUES (5,3,'ciencias',4.10,40);
INSERT INTO `guias` VALUES (6,11,'historia',4.20,70);
INSERT INTO `guias` VALUES (7,4,'arqueologia',3.90,60);
INSERT INTO `guias` VALUES (8,16,'arte',4.30,55);
INSERT INTO `guias` VALUES (9,2,'general',4.00,30);
INSERT INTO `guias` VALUES (10,19,'historia',4.15,65);
INSERT INTO `guias` VALUES (11,5,'ciencias',3.95,45);
INSERT INTO `guias` VALUES (12,7,'general',4.25,50);
INSERT INTO `guias` VALUES (13,14,'historia',4.05,35);
INSERT INTO `guias` VALUES (14,15,'arqueologia',3.85,25);
INSERT INTO `guias` VALUES (15,6,'arte',4.80,200);
INSERT INTO `guias` VALUES (16,9,'general',3.90,20);
INSERT INTO `guias` VALUES (17,10,'arqueologia',4.00,15);
INSERT INTO `guias` VALUES (18,12,'arte',4.35,60);
INSERT INTO `guias` VALUES (19,17,'historia',4.10,40);
INSERT INTO `guias` VALUES (20,20,'general',4.20,30);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_cargos_empleados` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `cargo_anterior` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cargo_nuevo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_cambio` date NOT NULL,
  `motivo` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_historial`),
  KEY `id_empleado` (`id_empleado`),
  KEY `idx_fecha_cambio` (`fecha_cambio`),
  CONSTRAINT `historial_cargos_empleados_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `historial_cargos_empleados` VALUES (1,1,'atencion_cliente','guia','2019-03-15','Reubicación por formación');
INSERT INTO `historial_cargos_empleados` VALUES (2,2,'administrador','administrador','2017-07-01','Promoción interna');
INSERT INTO `historial_cargos_empleados` VALUES (3,3,'cajero','cajero','2020-09-10','Inicio de contrato');
INSERT INTO `historial_cargos_empleados` VALUES (4,4,'seguridad','seguridad','2018-02-20','Mantenimiento de turnos');
INSERT INTO `historial_cargos_empleados` VALUES (5,5,'mantenimiento','mantenimiento','2016-05-30','Permanente');
INSERT INTO `historial_cargos_empleados` VALUES (6,6,'gerente','gerente','2015-01-12','Contratación principal');
INSERT INTO `historial_cargos_empleados` VALUES (7,7,'atencion_cliente','atencion_cliente','2021-11-01','Continuidad laboral');
INSERT INTO `historial_cargos_empleados` VALUES (8,8,'guia','guia','2019-06-18','Formación completada');
INSERT INTO `historial_cargos_empleados` VALUES (9,9,'cajero','cajero','2022-03-21','Nuevo ingreso');
INSERT INTO `historial_cargos_empleados` VALUES (10,10,'mantenimiento','mantenimiento','2014-09-09','Contrato antiguo');
INSERT INTO `historial_cargos_empleados` VALUES (11,11,'seguridad','seguridad','2013-12-01','Turnos nocturnos');
INSERT INTO `historial_cargos_empleados` VALUES (12,12,'administrador','administrador','2010-04-20','Cargo senior');
INSERT INTO `historial_cargos_empleados` VALUES (13,13,'guia','guia','2020-08-05','Contratación');
INSERT INTO `historial_cargos_empleados` VALUES (14,14,'atencion_cliente','atencion_cliente','2018-10-11','Promoción');
INSERT INTO `historial_cargos_empleados` VALUES (15,15,'mantenimiento','mantenimiento','2011-05-04','Estabilidad laboral');
INSERT INTO `historial_cargos_empleados` VALUES (16,16,'cajero','cajero','2021-02-14','Ingreso reciente');
INSERT INTO `historial_cargos_empleados` VALUES (17,17,'seguridad','seguridad','2009-07-07','Contrato inicial');
INSERT INTO `historial_cargos_empleados` VALUES (18,18,'guia','guia','2016-11-11','Aprobación');
INSERT INTO `historial_cargos_empleados` VALUES (19,19,'administrador','administrador','2012-01-20','Ascenso');
INSERT INTO `historial_cargos_empleados` VALUES (20,20,'atencion_cliente','atencion_cliente','2023-05-10','Ingreso temporal');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idiomas_guias` (
  `id_idioma_guia` int NOT NULL AUTO_INCREMENT,
  `id_guia` int NOT NULL,
  `idioma` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel` enum('basico','intermedio','avanzado','nativo') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_idioma_guia`),
  UNIQUE KEY `uk_guia_idioma` (`id_guia`,`idioma`),
  CONSTRAINT `idiomas_guias_ibfk_1` FOREIGN KEY (`id_guia`) REFERENCES `guias` (`id_guia`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `idiomas_guias` VALUES (1,1,'Español','nativo');
INSERT INTO `idiomas_guias` VALUES (2,1,'Inglés','avanzado');
INSERT INTO `idiomas_guias` VALUES (3,2,'Español','nativo');
INSERT INTO `idiomas_guias` VALUES (4,3,'Español','nativo');
INSERT INTO `idiomas_guias` VALUES (5,4,'Francés','intermedio');
INSERT INTO `idiomas_guias` VALUES (6,5,'Inglés','avanzado');
INSERT INTO `idiomas_guias` VALUES (7,6,'Español','nativo');
INSERT INTO `idiomas_guias` VALUES (8,7,'Inglés','basico');
INSERT INTO `idiomas_guias` VALUES (9,8,'Español','nativo');
INSERT INTO `idiomas_guias` VALUES (10,9,'Alemán','intermedio');
INSERT INTO `idiomas_guias` VALUES (11,10,'Español','nativo');
INSERT INTO `idiomas_guias` VALUES (12,11,'Portugués','intermedio');
INSERT INTO `idiomas_guias` VALUES (13,12,'Español','nativo');
INSERT INTO `idiomas_guias` VALUES (14,13,'Inglés','avanzado');
INSERT INTO `idiomas_guias` VALUES (15,14,'Español','nativo');
INSERT INTO `idiomas_guias` VALUES (16,15,'Inglés','intermedio');
INSERT INTO `idiomas_guias` VALUES (17,16,'Español','nativo');
INSERT INTO `idiomas_guias` VALUES (18,17,'Inglés','basico');
INSERT INTO `idiomas_guias` VALUES (19,18,'Español','nativo');
INSERT INTO `idiomas_guias` VALUES (20,19,'Inglés','avanzado');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento_exhibiciones` (
  `id_mantenimiento_exhibicion` int NOT NULL AUTO_INCREMENT,
  `id_exhibicion` int NOT NULL,
  `fecha_mantenimiento` date NOT NULL,
  `tipo_mantenimiento` enum('preventivo','correctivo','especial') COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `costo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_mantenimiento_exhibicion`),
  KEY `id_exhibicion` (`id_exhibicion`),
  KEY `idx_tipo_mant_exhibicion` (`tipo_mantenimiento`),
  CONSTRAINT `mantenimiento_exhibiciones_ibfk_1` FOREIGN KEY (`id_exhibicion`) REFERENCES `exhibiciones` (`id_exhibicion`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `mantenimiento_exhibiciones` VALUES (1,1,'2024-06-01','preventivo','Revisión cronológica',400.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (2,2,'2025-02-15','correctivo','Cambio de vitrinas',1500.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (3,3,'2023-09-10','especial','Traslado de piezas',2500.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (4,4,'2024-08-20','preventivo','Mantenimiento interactivos',900.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (6,6,'2023-04-02','preventivo','Control de humedad',600.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (7,7,'2025-07-10','correctivo','Iluminación especial',700.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (8,8,'2024-11-11','especial','Actualización multimedia',1800.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (9,9,'2023-02-23','preventivo','Limpieza de instrumentos',350.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (10,10,'2024-12-01','correctivo','Restauración iconos',2200.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (11,11,'2023-06-15','especial','Empaque para traslado',1200.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (12,12,'2025-03-10','preventivo','Revisión general',500.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (13,13,'2024-05-05','preventivo','Chequeo taxonómico',800.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (14,14,'2023-08-08','correctivo','Limpieza marco',300.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (15,15,'2024-10-12','especial','Montaje temporal',1400.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (16,16,'2025-06-01','preventivo','Revisión de maquetas',450.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (17,17,'2023-03-20','correctivo','Mantenimiento plantas',600.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (18,18,'2024-01-22','preventivo','Control insectos',250.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (19,19,'2025-09-05','especial','Actualización tecnológica',2100.00);
INSERT INTO `mantenimiento_exhibiciones` VALUES (20,20,'2024-02-14','preventivo','Inspección mapas',300.00);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento_salas` (
  `id_mantenimiento` int NOT NULL AUTO_INCREMENT,
  `id_sala` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `tipo_mantenimiento` enum('preventivo','correctivo','restauracion') COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `costo` decimal(10,2) DEFAULT NULL,
  `id_empleado_responsable` int DEFAULT NULL,
  PRIMARY KEY (`id_mantenimiento`),
  KEY `id_sala` (`id_sala`),
  KEY `id_empleado_responsable` (`id_empleado_responsable`),
  KEY `idx_fecha_inicio_mant` (`fecha_inicio`),
  CONSTRAINT `mantenimiento_salas_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`) ON DELETE CASCADE,
  CONSTRAINT `mantenimiento_salas_ibfk_2` FOREIGN KEY (`id_empleado_responsable`) REFERENCES `empleados` (`id_empleado`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `mantenimiento_salas` VALUES (1,1,'2024-02-01','2024-02-10','preventivo','Revisión iluminación',500.00,5);
INSERT INTO `mantenimiento_salas` VALUES (2,2,'2025-01-05',NULL,'correctivo','Reparación interactivos',1500.00,15);
INSERT INTO `mantenimiento_salas` VALUES (3,3,'2023-11-12','2023-11-15','restauracion','Restauración vitrinas',2000.00,5);
INSERT INTO `mantenimiento_salas` VALUES (4,4,'2024-06-20','2024-06-25','preventivo','Limpieza profunda',300.00,15);
INSERT INTO `mantenimiento_salas` VALUES (5,5,'2025-03-02',NULL,'correctivo','Arreglo paredes',1200.00,5);
INSERT INTO `mantenimiento_salas` VALUES (6,6,'2024-09-10','2024-09-12','preventivo','Mantenimiento de equipos',800.00,5);
INSERT INTO `mantenimiento_salas` VALUES (7,7,'2023-08-01','2023-08-03','restauracion','Actualización multimedia',2500.00,16);
INSERT INTO `mantenimiento_salas` VALUES (8,8,'2025-05-10','2025-05-12','preventivo','Jornadas educativas',400.00,14);
INSERT INTO `mantenimiento_salas` VALUES (9,9,'2022-12-01','2022-12-05','correctivo','Reemplazo suelos',4000.00,15);
INSERT INTO `mantenimiento_salas` VALUES (10,10,'2025-07-01',NULL,'restauracion','Restauración especializada',5000.00,5);
INSERT INTO `mantenimiento_salas` VALUES (11,11,'2024-01-15','2024-01-20','preventivo','Iluminación',600.00,5);
INSERT INTO `mantenimiento_salas` VALUES (12,12,'2023-05-05','2023-05-06','correctivo','Reparación equipo audio',700.00,11);
INSERT INTO `mantenimiento_salas` VALUES (13,13,'2025-08-10',NULL,'preventivo','Limpieza vitrinas',350.00,15);
INSERT INTO `mantenimiento_salas` VALUES (14,14,'2024-04-02','2024-04-04','preventivo','Sala climatizada',900.00,15);
INSERT INTO `mantenimiento_salas` VALUES (15,15,'2025-11-01',NULL,'correctivo','Pintura',1100.00,5);
INSERT INTO `mantenimiento_salas` VALUES (16,16,'2023-10-10','2023-10-15','restauracion','Reacondicionamiento',3200.00,5);
INSERT INTO `mantenimiento_salas` VALUES (17,17,'2024-07-07','2024-07-09','preventivo','Verificación seguridad',450.00,11);
INSERT INTO `mantenimiento_salas` VALUES (18,18,'2022-11-11','2022-11-12','correctivo','Reparación vitrina',750.00,5);
INSERT INTO `mantenimiento_salas` VALUES (19,19,'2025-02-20','2025-02-21','preventivo','Revisión HVAC',600.00,5);
INSERT INTO `mantenimiento_salas` VALUES (20,20,'2024-03-01','2024-03-03','preventivo','Chequeo general',500.00,5);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membresias` (
  `id_membresia` int NOT NULL AUTO_INCREMENT,
  `id_visitante` int NOT NULL,
  `tipo_membresia` enum('basica','premium','vip') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `descuento_porcentaje` decimal(5,2) DEFAULT NULL,
  `estado` enum('activa','expirada','cancelada') COLLATE utf8mb4_unicode_ci DEFAULT 'activa',
  PRIMARY KEY (`id_membresia`),
  KEY `id_visitante` (`id_visitante`),
  KEY `idx_estado_membresia` (`estado`),
  KEY `idx_fecha_expiracion` (`fecha_expiracion`),
  CONSTRAINT `membresias_ibfk_1` FOREIGN KEY (`id_visitante`) REFERENCES `visitantes` (`id_visitante`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `membresias` VALUES (1,1,'basica','2024-01-10','2025-01-09',5.00,'expirada');
INSERT INTO `membresias` VALUES (2,2,'premium','2024-03-01','2025-03-01',15.00,'expirada');
INSERT INTO `membresias` VALUES (3,3,'basica','2025-02-01','2026-02-01',5.00,'activa');
INSERT INTO `membresias` VALUES (4,4,'vip','2025-05-01','2026-05-01',25.00,'activa');
INSERT INTO `membresias` VALUES (5,5,'premium','2025-06-01','2026-06-01',15.00,'activa');
INSERT INTO `membresias` VALUES (6,6,'basica','2024-07-10','2025-07-09',5.00,'expirada');
INSERT INTO `membresias` VALUES (7,7,'premium','2025-03-12','2026-03-12',15.00,'activa');
INSERT INTO `membresias` VALUES (8,8,'basica','2025-08-01','2026-08-01',5.00,'activa');
INSERT INTO `membresias` VALUES (9,9,'vip','2025-04-01','2026-04-01',25.00,'activa');
INSERT INTO `membresias` VALUES (10,10,'basica','2024-11-20','2025-11-19',5.00,'expirada');
INSERT INTO `membresias` VALUES (11,11,'premium','2025-01-15','2026-01-15',15.00,'activa');
INSERT INTO `membresias` VALUES (12,12,'basica','2025-02-20','2026-02-20',5.00,'activa');
INSERT INTO `membresias` VALUES (13,13,'vip','2024-12-01','2025-12-01',25.00,'expirada');
INSERT INTO `membresias` VALUES (14,14,'basica','2025-06-10','2026-06-10',5.00,'activa');
INSERT INTO `membresias` VALUES (15,15,'premium','2025-07-01','2026-07-01',15.00,'activa');
INSERT INTO `membresias` VALUES (16,16,'basica','2025-08-05','2026-08-05',5.00,'activa');
INSERT INTO `membresias` VALUES (17,17,'premium','2024-05-05','2025-05-05',15.00,'expirada');
INSERT INTO `membresias` VALUES (18,18,'basica','2025-09-01','2026-09-01',5.00,'activa');
INSERT INTO `membresias` VALUES (19,19,'vip','2025-10-01','2026-10-01',25.00,'activa');
INSERT INTO `membresias` VALUES (20,20,'basica','2025-08-15','2026-08-15',5.00,'activa');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id_promocion` int NOT NULL AUTO_INCREMENT,
  `nombre_promocion` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `descuento_porcentaje` decimal(5,2) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `tipo_entrada_aplicable` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` enum('activa','inactiva','expirada') COLLATE utf8mb4_unicode_ci DEFAULT 'activa',
  PRIMARY KEY (`id_promocion`),
  KEY `idx_fecha_inicio_promo` (`fecha_inicio`),
  KEY `idx_estado_promo` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `promociones` VALUES (1,'Promo Verano 2025','Descuento verano general',10.00,'2025-06-01','2025-08-31','general','activa');
INSERT INTO `promociones` VALUES (2,'Estudiantes 2025','Descuento para estudiantes',50.00,'2025-01-01','2025-12-31','estudiante','activa');
INSERT INTO `promociones` VALUES (3,'Familiares','2x1 entradas familiares',50.00,'2024-11-01','2025-12-31','grupo','activa');
INSERT INTO `promociones` VALUES (4,'Tercera Edad','Descuento tercera edad',40.00,'2025-01-01','2025-12-31','tercera_edad','activa');
INSERT INTO `promociones` VALUES (5,'Ninos Gratis','Ninos menores 6 gratis',100.00,'2024-01-01','2026-01-01','ninos','activa');
INSERT INTO `promociones` VALUES (6,'Black Friday','Descuentos especiales',30.00,'2025-11-28','2025-11-28','general','activa');
INSERT INTO `promociones` VALUES (7,'Cultura Local','Descuento residentes',20.00,'2025-03-01','2025-09-30','general','activa');
INSERT INTO `promociones` VALUES (8,'Entrada Nocturna','Descuento noche',15.00,'2025-05-01','2025-10-01','general','activa');
INSERT INTO `promociones` VALUES (9,'Miembros VIP','Descuento VIP',100.00,'2025-01-01','2026-01-01','general','activa');
INSERT INTO `promociones` VALUES (10,'Aniversario Museo','Promocion aniversario',25.00,'2025-09-01','2025-09-30','general','activa');
INSERT INTO `promociones` VALUES (11,'PromOtoño','Descuento otoño',12.50,'2025-03-01','2025-05-31','general','activa');
INSERT INTO `promociones` VALUES (12,'PromoEducativa','Descuento excursiones',20.00,'2025-04-01','2025-12-31','grupo','activa');
INSERT INTO `promociones` VALUES (13,'Entrada 2x1','Promoción 2x1',50.00,'2024-07-01','2026-07-01','general','activa');
INSERT INTO `promociones` VALUES (14,'PromJunio','Descuento mes de junio',10.00,'2025-06-01','2025-06-30','general','activa');
INSERT INTO `promociones` VALUES (15,'PromDiciembre','Ofertas de diciembre',30.00,'2025-12-01','2025-12-31','general','activa');
INSERT INTO `promociones` VALUES (16,'PromNocheMuseo','Noche de museos',20.00,'2025-05-18','2025-05-18','general','activa');
INSERT INTO `promociones` VALUES (17,'PromArteJoven','Descuento jovenes artistas',15.00,'2025-02-01','2025-08-31','general','activa');
INSERT INTO `promociones` VALUES (18,'PromRutaTextil','Promoción ruta textil',10.00,'2025-01-10','2026-01-10','general','activa');
INSERT INTO `promociones` VALUES (19,'PromFotografia','Descuento sala fotografia',18.00,'2025-06-01','2025-11-30','general','activa');
INSERT INTO `promociones` VALUES (20,'PromMapoteca','Promoción mapa historico',5.00,'2025-09-01','2026-09-01','general','activa');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacto` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci,
  `pais` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `proveedores` VALUES (1,'ArteGlobal S.A.','Lucía Fernández','310-555-0101','contacto@arteglobal.com','Calle 1 #10-20, Ciudad','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (2,'MuseoLogistics','Carlos Moreno','310-555-0102','logistics@museum.com','Av. Central 45','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (3,'Impresiones y Arte','Ana Ruiz','310-555-0103','ana@impresionesarte.com','Calle 5 #23-11','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (4,'RestauroPlus','Marcos Díaz','310-555-0104','restauro@plus.com','Carrera 7 #80-12','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (5,'Luz&Tecnica','Paula Gómez','310-555-0105','luz@tecnica.com','Zona Industrial 3','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (6,'Galeria Norte','Diego Alvarez','310-555-0106','ventas@galerianorte.com','Calle 10 #2-50','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (7,'Editorial Museo','Marta López','310-555-0107','editorial@museo.com','Av. Libro 12','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (8,'SouvenirCenter','Ricardo Peña','310-555-0108','ventas@souvenir.com','Plaza 4','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (9,'TransporteArte','Iván Torres','310-555-0109','trans@arte.com','Km 12 Ruta 2','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (10,'Seguro Patrimonial','Laura Castro','310-555-0110','seguro@patrimonial.com','Of. 301 Ed. Seguridad','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (11,'AudioGuide Co','Roberto Rios','310-555-0111','audio@guides.com','Calle 15 #9-30','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (12,'CateringMuseo','Sofía Pardo','310-555-0112','catering@museo.com','Cocina Central 1','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (13,'VisualTech','Andrés Mejía','310-555-0113','soporte@visualtech.com','Centro Tech','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (14,'PackagingArte','Gabriela Nieto','310-555-0114','pack@arte.com','Polígono 7','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (15,'Servicios Limpieza','Héctor Ramos','310-555-0115','limpieza@serv.com','Zona 6','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (16,'ConsultoraMuseos','Patricia Muñoz','310-555-0116','info@consultora.com','Of. 12','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (17,'MultimediaPro','Óscar Herrera','310-555-0117','mm@pro.com','Parque Industrial','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (18,'FabricArte','Nicolás Vega','310-555-0118','fabric@arte.com','Pol. Ind. 9','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (19,'Imprenta Rápida','Clara Medina','310-555-0119','imp@rapida.com','Calle 2 #3-4','Colombia','2025-11-17 21:52:15');
INSERT INTO `proveedores` VALUES (20,'TransBytes','Felipe Ortiz','310-555-0120','it@transbytes.com','Av. Sistemas 8','Colombia','2025-11-17 21:52:15');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quejas_sugerencias` (
  `id_queja` int NOT NULL AUTO_INCREMENT,
  `id_visitante` int DEFAULT NULL,
  `id_exhibicion` int DEFAULT NULL,
  `tipo` enum('queja','sugerencia','felicitacion') COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('pendiente','en_revision','resuelta') COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  PRIMARY KEY (`id_queja`),
  KEY `id_visitante` (`id_visitante`),
  KEY `id_exhibicion` (`id_exhibicion`),
  KEY `idx_tipo_queja` (`tipo`),
  KEY `idx_estado_queja` (`estado`),
  CONSTRAINT `quejas_sugerencias_ibfk_1` FOREIGN KEY (`id_visitante`) REFERENCES `visitantes` (`id_visitante`) ON DELETE SET NULL,
  CONSTRAINT `quejas_sugerencias_ibfk_2` FOREIGN KEY (`id_exhibicion`) REFERENCES `exhibiciones` (`id_exhibicion`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `quejas_sugerencias` VALUES (1,1,2,'felicitacion','Excelente exposición y atención.','2025-11-17 21:52:16','resuelta');
INSERT INTO `quejas_sugerencias` VALUES (2,2,4,'sugerencia','Agregar más información en carteles.','2025-11-17 21:52:16','en_revision');
INSERT INTO `quejas_sugerencias` VALUES (3,3,NULL,'queja','Sala demasiado concurrida.','2025-11-17 21:52:16','pendiente');
INSERT INTO `quejas_sugerencias` VALUES (4,4,6,'felicitacion','Personal muy amable.','2025-11-17 21:52:16','resuelta');
INSERT INTO `quejas_sugerencias` VALUES (5,5,7,'sugerencia','Más actividades para niños.','2025-11-17 21:52:16','en_revision');
INSERT INTO `quejas_sugerencias` VALUES (6,6,8,'queja','Problemas con los interactivos.','2025-11-17 21:52:16','pendiente');
INSERT INTO `quejas_sugerencias` VALUES (7,7,1,'felicitacion','Gran colección permanente.','2025-11-17 21:52:16','resuelta');
INSERT INTO `quejas_sugerencias` VALUES (8,8,3,'sugerencia','Horario de la exposición muy reducido.','2025-11-17 21:52:16','en_revision');
INSERT INTO `quejas_sugerencias` VALUES (9,9,9,'queja','Iluminación inadecuada en vitrina.','2025-11-17 21:52:16','pendiente');
INSERT INTO `quejas_sugerencias` VALUES (10,10,10,'felicitacion','Buena conservación de piezas.','2025-11-17 21:52:16','resuelta');
INSERT INTO `quejas_sugerencias` VALUES (11,11,11,'sugerencia','Mejorar señalización interna.','2025-11-17 21:52:16','en_revision');
INSERT INTO `quejas_sugerencias` VALUES (12,12,12,'queja','Asientos del auditorio en mal estado.','2025-11-17 21:52:16','pendiente');
INSERT INTO `quejas_sugerencias` VALUES (13,13,13,'felicitacion','Visita educativa fantástica.','2025-11-17 21:52:16','resuelta');
INSERT INTO `quejas_sugerencias` VALUES (14,14,14,'sugerencia','Más visitas guiadas.','2025-11-17 21:52:16','en_revision');
INSERT INTO `quejas_sugerencias` VALUES (15,15,15,'queja','Precio elevado para eventos.','2025-11-17 21:52:16','pendiente');
INSERT INTO `quejas_sugerencias` VALUES (16,16,16,'felicitacion','Taller muy bien organizado.','2025-11-17 21:52:16','resuelta');
INSERT INTO `quejas_sugerencias` VALUES (17,17,17,'sugerencia','Promociones para grupos escolares.','2025-11-17 21:52:16','en_revision');
INSERT INTO `quejas_sugerencias` VALUES (18,18,18,'queja','Ruido en sala de exhibición.','2025-11-17 21:52:16','pendiente');
INSERT INTO `quejas_sugerencias` VALUES (19,19,19,'felicitacion','Muy buena experiencia nocturna.','2025-11-17 21:52:16','resuelta');
INSERT INTO `quejas_sugerencias` VALUES (20,20,20,'sugerencia','Incrementar número de guías por visita.','2025-11-17 21:52:16','en_revision');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas_visitas_guiadas` (
  `id_reserva_visita` int NOT NULL AUTO_INCREMENT,
  `id_visita_guiada` int NOT NULL,
  `id_entrada` int NOT NULL,
  `fecha_reserva` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('confirmada','cancelada','completada') COLLATE utf8mb4_unicode_ci DEFAULT 'confirmada',
  PRIMARY KEY (`id_reserva_visita`),
  KEY `id_visita_guiada` (`id_visita_guiada`),
  KEY `id_entrada` (`id_entrada`),
  KEY `idx_estado_reserva` (`estado`),
  CONSTRAINT `reservas_visitas_guiadas_ibfk_1` FOREIGN KEY (`id_visita_guiada`) REFERENCES `visitas_guiadas` (`id_visita_guiada`) ON DELETE CASCADE,
  CONSTRAINT `reservas_visitas_guiadas_ibfk_2` FOREIGN KEY (`id_entrada`) REFERENCES `entradas` (`id_entrada`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `reservas_visitas_guiadas` VALUES (1,1,1,'2025-11-17 21:52:17','confirmada');
INSERT INTO `reservas_visitas_guiadas` VALUES (2,2,2,'2025-11-17 21:52:17','confirmada');
INSERT INTO `reservas_visitas_guiadas` VALUES (3,3,3,'2025-11-17 21:52:17','confirmada');
INSERT INTO `reservas_visitas_guiadas` VALUES (4,4,4,'2025-11-17 21:52:17','confirmada');
INSERT INTO `reservas_visitas_guiadas` VALUES (5,5,5,'2025-11-17 21:52:17','confirmada');
INSERT INTO `reservas_visitas_guiadas` VALUES (6,6,6,'2025-11-17 21:52:17','confirmada');
INSERT INTO `reservas_visitas_guiadas` VALUES (7,7,7,'2025-11-17 21:52:17','cancelada');
INSERT INTO `reservas_visitas_guiadas` VALUES (8,8,8,'2025-11-17 21:52:17','completada');
INSERT INTO `reservas_visitas_guiadas` VALUES (9,9,9,'2025-11-17 21:52:17','completada');
INSERT INTO `reservas_visitas_guiadas` VALUES (10,10,10,'2025-11-17 21:52:17','completada');
INSERT INTO `reservas_visitas_guiadas` VALUES (11,11,11,'2025-11-17 21:52:17','confirmada');
INSERT INTO `reservas_visitas_guiadas` VALUES (12,12,12,'2025-11-17 21:52:17','completada');
INSERT INTO `reservas_visitas_guiadas` VALUES (13,13,13,'2025-11-17 21:52:17','completada');
INSERT INTO `reservas_visitas_guiadas` VALUES (14,14,14,'2025-11-17 21:52:17','completada');
INSERT INTO `reservas_visitas_guiadas` VALUES (15,15,15,'2025-11-17 21:52:17','completada');
INSERT INTO `reservas_visitas_guiadas` VALUES (16,16,16,'2025-11-17 21:52:17','completada');
INSERT INTO `reservas_visitas_guiadas` VALUES (17,17,17,'2025-11-17 21:52:17','completada');
INSERT INTO `reservas_visitas_guiadas` VALUES (18,18,18,'2025-11-17 21:52:17','completada');
INSERT INTO `reservas_visitas_guiadas` VALUES (19,19,19,'2025-11-17 21:52:17','completada');
INSERT INTO `reservas_visitas_guiadas` VALUES (20,20,20,'2025-11-17 21:52:17','completada');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salas` (
  `id_sala` int NOT NULL AUTO_INCREMENT,
  `nombre_sala` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacidad_maxima` int NOT NULL,
  `tipo_sala` enum('interactiva','galeria','arqueologia','historia','arte','ciencias','multimedia') COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_sala` enum('abierta','cerrada_mantenimiento','en_restauracion') COLLATE utf8mb4_unicode_ci DEFAULT 'abierta',
  `ubicacion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sala`),
  KEY `idx_estado_sala` (`estado_sala`),
  KEY `idx_tipo_sala` (`tipo_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `salas` VALUES (1,'Sala Principal',500,'galeria','abierta','Piso 1 ala este','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (2,'Sala Interactiva A',200,'interactiva','abierta','Piso 2 ala norte','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (3,'Sala Arqueología',150,'arqueologia','abierta','Piso 1 ala norte','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (4,'Sala Historia',180,'historia','abierta','Piso 1 ala oeste','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (5,'Galería de Arte 1',120,'arte','abierta','Piso 2 ala este','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (6,'Centro de Ciencias',220,'ciencias','abierta','Piso 3','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (7,'Sala Multimedia',100,'multimedia','abierta','Piso -1','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (8,'Sala Infantil',90,'interactiva','abierta','Piso 2 ala sur','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (9,'Galería Norte',130,'arte','abierta','Piso 3 ala norte','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (10,'Sala de Restauración',50,'arqueologia','en_restauracion','Piso 0','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (11,'Sala Temporal 1',160,'galeria','abierta','Piso 2 ala oeste','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (12,'Auditorio',300,'multimedia','abierta','Piso -1','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (13,'Sala Colecciones',200,'historia','abierta','Piso 1 ala central','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (14,'Sala Documental',80,'ciencias','abierta','Piso 3 ala sur','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (15,'Galería Sur',140,'arte','cerrada_mantenimiento','Piso 2 ala sur','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (16,'Sala Fotografía',110,'arte','abierta','Piso 2','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (17,'Sala Educativa',120,'interactiva','abierta','Piso 3','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (18,'Sala Tesoros',70,'galeria','abierta','Piso 1 ala sur','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (19,'Sala Moda',90,'arte','abierta','Piso 2 ala moda','2025-11-17 21:52:15');
INSERT INTO `salas` VALUES (20,'Sala Mapoteca',60,'historia','abierta','Piso 1 ala archivo','2025-11-17 21:52:15');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salas_visitas_guiadas` (
  `id_sala_visita` int NOT NULL AUTO_INCREMENT,
  `id_visita_guiada` int NOT NULL,
  `id_sala` int NOT NULL,
  `orden_visita` int DEFAULT NULL,
  PRIMARY KEY (`id_sala_visita`),
  KEY `id_visita_guiada` (`id_visita_guiada`),
  KEY `id_sala` (`id_sala`),
  CONSTRAINT `salas_visitas_guiadas_ibfk_1` FOREIGN KEY (`id_visita_guiada`) REFERENCES `visitas_guiadas` (`id_visita_guiada`) ON DELETE CASCADE,
  CONSTRAINT `salas_visitas_guiadas_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `salas_visitas_guiadas` VALUES (1,1,1,1);
INSERT INTO `salas_visitas_guiadas` VALUES (2,1,3,2);
INSERT INTO `salas_visitas_guiadas` VALUES (3,2,11,1);
INSERT INTO `salas_visitas_guiadas` VALUES (4,2,5,2);
INSERT INTO `salas_visitas_guiadas` VALUES (5,3,4,1);
INSERT INTO `salas_visitas_guiadas` VALUES (6,3,2,2);
INSERT INTO `salas_visitas_guiadas` VALUES (7,4,6,1);
INSERT INTO `salas_visitas_guiadas` VALUES (8,4,7,2);
INSERT INTO `salas_visitas_guiadas` VALUES (9,5,3,1);
INSERT INTO `salas_visitas_guiadas` VALUES (10,5,8,2);
INSERT INTO `salas_visitas_guiadas` VALUES (11,6,9,1);
INSERT INTO `salas_visitas_guiadas` VALUES (12,7,10,1);
INSERT INTO `salas_visitas_guiadas` VALUES (13,8,12,1);
INSERT INTO `salas_visitas_guiadas` VALUES (14,9,13,1);
INSERT INTO `salas_visitas_guiadas` VALUES (15,10,14,1);
INSERT INTO `salas_visitas_guiadas` VALUES (16,11,15,1);
INSERT INTO `salas_visitas_guiadas` VALUES (17,12,16,1);
INSERT INTO `salas_visitas_guiadas` VALUES (18,13,17,1);
INSERT INTO `salas_visitas_guiadas` VALUES (19,14,18,1);
INSERT INTO `salas_visitas_guiadas` VALUES (20,15,19,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones_eventos` (
  `id_ubicacion_evento` int NOT NULL AUTO_INCREMENT,
  `id_evento` int NOT NULL,
  `id_sala` int NOT NULL,
  PRIMARY KEY (`id_ubicacion_evento`),
  KEY `id_evento` (`id_evento`),
  KEY `id_sala` (`id_sala`),
  CONSTRAINT `ubicaciones_eventos_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `eventos_especiales` (`id_evento`) ON DELETE CASCADE,
  CONSTRAINT `ubicaciones_eventos_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `ubicaciones_eventos` VALUES (1,1,12);
INSERT INTO `ubicaciones_eventos` VALUES (2,2,11);
INSERT INTO `ubicaciones_eventos` VALUES (3,3,15);
INSERT INTO `ubicaciones_eventos` VALUES (4,4,11);
INSERT INTO `ubicaciones_eventos` VALUES (5,5,7);
INSERT INTO `ubicaciones_eventos` VALUES (6,6,9);
INSERT INTO `ubicaciones_eventos` VALUES (7,7,8);
INSERT INTO `ubicaciones_eventos` VALUES (8,8,5);
INSERT INTO `ubicaciones_eventos` VALUES (9,9,6);
INSERT INTO `ubicaciones_eventos` VALUES (10,10,12);
INSERT INTO `ubicaciones_eventos` VALUES (11,11,1);
INSERT INTO `ubicaciones_eventos` VALUES (12,12,16);
INSERT INTO `ubicaciones_eventos` VALUES (13,13,14);
INSERT INTO `ubicaciones_eventos` VALUES (14,14,8);
INSERT INTO `ubicaciones_eventos` VALUES (15,15,7);
INSERT INTO `ubicaciones_eventos` VALUES (16,16,11);
INSERT INTO `ubicaciones_eventos` VALUES (17,17,12);
INSERT INTO `ubicaciones_eventos` VALUES (18,18,10);
INSERT INTO `ubicaciones_eventos` VALUES (19,19,13);
INSERT INTO `ubicaciones_eventos` VALUES (20,20,11);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_articulos` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_articulo` int NOT NULL,
  `id_visitante` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL,
  `fecha_venta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `metodo_pago` enum('efectivo','tarjeta','transferencia','digital') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_articulo` (`id_articulo`),
  KEY `id_visitante` (`id_visitante`),
  KEY `idx_fecha_venta` (`fecha_venta`),
  CONSTRAINT `ventas_articulos_ibfk_1` FOREIGN KEY (`id_articulo`) REFERENCES `articulos_tienda` (`id_articulo`) ON DELETE RESTRICT,
  CONSTRAINT `ventas_articulos_ibfk_2` FOREIGN KEY (`id_visitante`) REFERENCES `visitantes` (`id_visitante`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `ventas_articulos` VALUES (1,1,1,1,25.00,0.00,25.00,'2025-11-17 21:52:17','tarjeta');
INSERT INTO `ventas_articulos` VALUES (2,2,2,2,45.00,0.00,90.00,'2025-11-17 21:52:17','efectivo');
INSERT INTO `ventas_articulos` VALUES (3,3,3,3,6.00,0.00,18.00,'2025-11-17 21:52:17','tarjeta');
INSERT INTO `ventas_articulos` VALUES (4,4,4,1,12.00,0.00,12.00,'2025-11-17 21:52:17','digital');
INSERT INTO `ventas_articulos` VALUES (5,5,5,2,20.00,0.00,40.00,'2025-11-17 21:52:17','tarjeta');
INSERT INTO `ventas_articulos` VALUES (6,6,6,1,30.00,2.00,28.00,'2025-11-17 21:52:17','tarjeta');
INSERT INTO `ventas_articulos` VALUES (7,7,7,1,80.00,5.00,75.00,'2025-11-17 21:52:17','tarjeta');
INSERT INTO `ventas_articulos` VALUES (8,8,8,1,15.00,0.00,15.00,'2025-11-17 21:52:17','efectivo');
INSERT INTO `ventas_articulos` VALUES (9,9,9,2,12.00,0.00,24.00,'2025-11-17 21:52:17','tarjeta');
INSERT INTO `ventas_articulos` VALUES (10,10,10,1,10.00,0.00,10.00,'2025-11-17 21:52:17','efectivo');
INSERT INTO `ventas_articulos` VALUES (11,11,11,3,8.00,0.00,24.00,'2025-11-17 21:52:17','digital');
INSERT INTO `ventas_articulos` VALUES (12,12,12,1,35.00,5.00,30.00,'2025-11-17 21:52:17','tarjeta');
INSERT INTO `ventas_articulos` VALUES (13,13,13,4,4.00,0.00,16.00,'2025-11-17 21:52:17','efectivo');
INSERT INTO `ventas_articulos` VALUES (14,14,14,1,9.00,0.00,9.00,'2025-11-17 21:52:17','tarjeta');
INSERT INTO `ventas_articulos` VALUES (15,15,15,1,60.00,10.00,50.00,'2025-11-17 21:52:17','tarjeta');
INSERT INTO `ventas_articulos` VALUES (16,16,16,1,28.00,0.00,28.00,'2025-11-17 21:52:17','digital');
INSERT INTO `ventas_articulos` VALUES (17,17,17,2,3.50,0.00,7.00,'2025-11-17 21:52:17','efectivo');
INSERT INTO `ventas_articulos` VALUES (18,18,18,1,5.00,0.00,5.00,'2025-11-17 21:52:17','tarjeta');
INSERT INTO `ventas_articulos` VALUES (19,19,19,1,14.00,0.00,14.00,'2025-11-17 21:52:17','transferencia');
INSERT INTO `ventas_articulos` VALUES (20,20,20,1,120.00,20.00,100.00,'2025-11-17 21:52:17','tarjeta');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitantes` (
  `id_visitante` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento_identidad` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT (curdate()),
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_visitante`),
  UNIQUE KEY `documento_identidad` (`documento_identidad`),
  KEY `idx_documento` (`documento_identidad`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `visitantes` VALUES (1,'María González','CC100001','300-100-0001','maria.g@mail.com','2024-01-10','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (2,'Juan Pérez','CC100002','300-100-0002','juan.p@mail.com','2024-02-12','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (3,'Ana Rodríguez','CC100003','300-100-0003','ana.r@mail.com','2024-03-05','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (4,'Luis Martínez','CC100004','300-100-0004','luis.m@mail.com','2024-04-20','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (5,'Carmen Díaz','CC100005','300-100-0005','carmen.d@mail.com','2024-05-18','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (6,'Andrés Blanco','CC100006','300-100-0006','andres.b@mail.com','2024-06-22','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (7,'Paula Herrera','CC100007','300-100-0007','paula.h@mail.com','2024-07-30','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (8,'Diego Castro','CC100008','300-100-0008','diego.c@mail.com','2024-08-14','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (9,'Laura Ramos','CC100009','300-100-0009','laura.r@mail.com','2024-09-01','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (10,'Santiago Vega','CC100010','300-100-0010','santiago.v@mail.com','2024-10-05','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (11,'Natalia Moreno','CC100011','300-100-0011','natalia.m@mail.com','2024-11-11','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (12,'Pedro Alvarez','CC100012','300-100-0012','pedro.a@mail.com','2024-12-20','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (13,'Valentina Ruiz','CC100013','300-100-0013','valentina.r@mail.com','2025-01-15','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (14,'Roberto Sánchez','CC100014','300-100-0014','roberto.s@mail.com','2025-02-10','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (15,'Adriana Ortiz','CC100015','300-100-0015','adriana.o@mail.com','2025-03-03','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (16,'Felipe Moreno','CC100016','300-100-0016','felipe.m@mail.com','2025-04-08','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (17,'Sofia Peña','CC100017','300-100-0017','sofia.p@mail.com','2025-05-12','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (18,'Mario Torres','CC100018','300-100-0018','mario.t@mail.com','2025-06-20','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (19,'Elena Castro','CC100019','300-100-0019','elena.c@mail.com','2025-07-22','2025-11-17 21:52:16');
INSERT INTO `visitantes` VALUES (20,'Javier Gil','CC100020','300-100-0020','javier.g@mail.com','2025-08-30','2025-11-17 21:52:16');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitas_guiadas` (
  `id_visita_guiada` int NOT NULL AUTO_INCREMENT,
  `codigo_visita` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_guia` int NOT NULL,
  `id_exhibicion` int DEFAULT NULL,
  `fecha_visita` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `duracion_minutos` int NOT NULL,
  `numero_maximo_visitantes` int NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `estado` enum('programada','realizada','cancelada') COLLATE utf8mb4_unicode_ci DEFAULT 'programada',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_visita_guiada`),
  UNIQUE KEY `codigo_visita` (`codigo_visita`),
  KEY `id_guia` (`id_guia`),
  KEY `id_exhibicion` (`id_exhibicion`),
  KEY `idx_fecha_visita_guiada` (`fecha_visita`),
  KEY `idx_estado_visita` (`estado`),
  CONSTRAINT `visitas_guiadas_ibfk_1` FOREIGN KEY (`id_guia`) REFERENCES `guias` (`id_guia`) ON DELETE RESTRICT,
  CONSTRAINT `visitas_guiadas_ibfk_2` FOREIGN KEY (`id_exhibicion`) REFERENCES `exhibiciones` (`id_exhibicion`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `visitas_guiadas` VALUES (1,'VG-0001',1,1,'2025-11-20','10:00:00',90,30,15.00,'programada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (2,'VG-0002',2,2,'2025-10-10','11:00:00',60,25,12.00,'programada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (3,'VG-0003',3,3,'2025-09-05','09:30:00',75,20,10.00,'programada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (4,'VG-0004',4,4,'2025-08-01','14:00:00',45,20,8.00,'programada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (5,'VG-0005',5,6,'2025-07-10','10:30:00',90,35,18.00,'programada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (6,'VG-0006',6,7,'2025-06-22','13:00:00',60,25,12.00,'realizada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (7,'VG-0007',7,8,'2025-05-18','15:00:00',120,40,20.00,'cancelada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (8,'VG-0008',8,9,'2025-04-10','10:00:00',60,25,10.00,'realizada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (9,'VG-0009',9,10,'2025-03-25','09:00:00',75,30,14.00,'realizada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (10,'VG-0010',10,11,'2025-02-14','11:30:00',45,20,9.00,'realizada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (11,'VG-0011',11,12,'2025-01-25','10:00:00',60,25,11.00,'programada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (12,'VG-0012',12,13,'2024-12-10','12:00:00',90,30,16.00,'realizada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (13,'VG-0013',13,14,'2024-11-15','09:00:00',60,20,8.00,'realizada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (14,'VG-0014',14,15,'2024-10-20','14:00:00',75,25,12.00,'realizada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (15,'VG-0015',15,16,'2024-09-05','10:00:00',90,35,18.00,'realizada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (16,'VG-0016',16,17,'2024-08-01','11:00:00',60,25,11.00,'realizada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (17,'VG-0017',17,18,'2024-07-12','09:00:00',45,20,9.00,'realizada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (18,'VG-0018',18,19,'2024-06-30','10:30:00',60,25,12.00,'realizada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (19,'VG-0019',19,20,'2024-05-22','13:00:00',120,40,20.00,'realizada','2025-11-17 21:52:16');
INSERT INTO `visitas_guiadas` VALUES (20,'VG-0020',20,NULL,'2024-04-18','15:00:00',75,30,14.00,'realizada','2025-11-17 21:52:16');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitas_realizadas` (
  `id_visita_realizada` int NOT NULL AUTO_INCREMENT,
  `id_visitante` int NOT NULL,
  `id_entrada` int NOT NULL,
  `fecha_visita` date NOT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `compro_souvenir` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_visita_realizada`),
  KEY `id_visitante` (`id_visitante`),
  KEY `id_entrada` (`id_entrada`),
  KEY `idx_fecha_visita_realizada` (`fecha_visita`),
  CONSTRAINT `visitas_realizadas_ibfk_1` FOREIGN KEY (`id_visitante`) REFERENCES `visitantes` (`id_visitante`) ON DELETE CASCADE,
  CONSTRAINT `visitas_realizadas_ibfk_2` FOREIGN KEY (`id_entrada`) REFERENCES `entradas` (`id_entrada`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
