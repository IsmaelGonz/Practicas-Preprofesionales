-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: SGR
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AccionMitigacion`
--

DROP TABLE IF EXISTS `AccionMitigacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AccionMitigacion` (
  `id_accion` int NOT NULL AUTO_INCREMENT,
  `id_riesgo` int DEFAULT NULL,
  `estrategia` enum('mitigar','transferir','aceptar','evitar') DEFAULT NULL,
  `descripcion` text,
  `responsable` varchar(100) DEFAULT NULL,
  `eficacia` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_accion`),
  KEY `id_riesgo` (`id_riesgo`),
  CONSTRAINT `AccionMitigacion_ibfk_1` FOREIGN KEY (`id_riesgo`) REFERENCES `Riesgo` (`id_riesgo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccionMitigacion`
--

LOCK TABLES `AccionMitigacion` WRITE;
/*!40000 ALTER TABLE `AccionMitigacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `AccionMitigacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Autenticacion`
--

DROP TABLE IF EXISTS `Autenticacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Autenticacion` (
  `id_usuario` int NOT NULL,
  `usuario_institucional` varchar(100) DEFAULT NULL,
  `clave_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario_institucional` (`usuario_institucional`),
  CONSTRAINT `Autenticacion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autenticacion`
--

LOCK TABLES `Autenticacion` WRITE;
/*!40000 ALTER TABLE `Autenticacion` DISABLE KEYS */;
INSERT INTO `Autenticacion` VALUES (7,'ana.torres@unl.edu.ec','hashed_pw_ana'),(8,'carlos.perez@unl.edu.ec','hashed_pw_carlos'),(9,'marta.rios@unl.edu.ec','hashed_pw_marta');
/*!40000 ALTER TABLE `Autenticacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comentario`
--

DROP TABLE IF EXISTS `Comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comentario` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `id_requisito` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `comentario` text,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_comentario`),
  KEY `id_requisito` (`id_requisito`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `Comentario_ibfk_1` FOREIGN KEY (`id_requisito`) REFERENCES `Requisito` (`id_requisito`),
  CONSTRAINT `Comentario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comentario`
--

LOCK TABLES `Comentario` WRITE;
/*!40000 ALTER TABLE `Comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HistorialCambios`
--

DROP TABLE IF EXISTS `HistorialCambios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HistorialCambios` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_requisito` int DEFAULT NULL,
  `descripcion_cambio` text,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_historial`),
  KEY `id_requisito` (`id_requisito`),
  CONSTRAINT `HistorialCambios_ibfk_1` FOREIGN KEY (`id_requisito`) REFERENCES `Requisito` (`id_requisito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HistorialCambios`
--

LOCK TABLES `HistorialCambios` WRITE;
/*!40000 ALTER TABLE `HistorialCambios` DISABLE KEYS */;
/*!40000 ALTER TABLE `HistorialCambios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HistorialRevision`
--

DROP TABLE IF EXISTS `HistorialRevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HistorialRevision` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_riesgo` int DEFAULT NULL,
  `fecha_revision` date DEFAULT NULL,
  `observaciones` text,
  PRIMARY KEY (`id_historial`),
  KEY `id_riesgo` (`id_riesgo`),
  CONSTRAINT `HistorialRevision_ibfk_1` FOREIGN KEY (`id_riesgo`) REFERENCES `Riesgo` (`id_riesgo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HistorialRevision`
--

LOCK TABLES `HistorialRevision` WRITE;
/*!40000 ALTER TABLE `HistorialRevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `HistorialRevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notificacion`
--

DROP TABLE IF EXISTS `Notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notificacion` (
  `id_notificacion` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `mensaje` text,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_notificacion`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `Notificacion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notificacion`
--

LOCK TABLES `Notificacion` WRITE;
/*!40000 ALTER TABLE `Notificacion` DISABLE KEYS */;
INSERT INTO `Notificacion` VALUES (1,7,'Nuevo riesgo registrado en el proyecto.','2025-07-02 07:43:19'),(2,8,'Una acción de mitigación fue modificada.','2025-07-02 07:43:19');
/*!40000 ALTER TABLE `Notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proyecto`
--

DROP TABLE IF EXISTS `Proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proyecto` (
  `id_proyecto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `Proyecto_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proyecto`
--

LOCK TABLES `Proyecto` WRITE;
/*!40000 ALTER TABLE `Proyecto` DISABLE KEYS */;
INSERT INTO `Proyecto` VALUES (9,'Sistema de Inventario','Control de productos y stock',8);
/*!40000 ALTER TABLE `Proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RelacionRequisito`
--

DROP TABLE IF EXISTS `RelacionRequisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RelacionRequisito` (
  `id_relacion` int NOT NULL AUTO_INCREMENT,
  `id_requisito_origen` int DEFAULT NULL,
  `id_requisito_destino` int DEFAULT NULL,
  `tipo_relacion` enum('dependencia','conflicto','refinamiento') DEFAULT NULL,
  PRIMARY KEY (`id_relacion`),
  KEY `id_requisito_origen` (`id_requisito_origen`),
  KEY `id_requisito_destino` (`id_requisito_destino`),
  CONSTRAINT `RelacionRequisito_ibfk_1` FOREIGN KEY (`id_requisito_origen`) REFERENCES `Requisito` (`id_requisito`),
  CONSTRAINT `RelacionRequisito_ibfk_2` FOREIGN KEY (`id_requisito_destino`) REFERENCES `Requisito` (`id_requisito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RelacionRequisito`
--

LOCK TABLES `RelacionRequisito` WRITE;
/*!40000 ALTER TABLE `RelacionRequisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `RelacionRequisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requisito`
--

DROP TABLE IF EXISTS `Requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Requisito` (
  `id_requisito` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) DEFAULT NULL,
  `descripcion` text,
  `tipo` enum('funcional','no funcional','informacion','restriccion') DEFAULT NULL,
  `prioridad` enum('alta','media','baja') DEFAULT NULL,
  `estado` enum('propuesto','aprobado','implementado') DEFAULT NULL,
  `fuente` varchar(100) DEFAULT NULL,
  `id_proyecto` int DEFAULT NULL,
  PRIMARY KEY (`id_requisito`),
  KEY `id_proyecto` (`id_proyecto`),
  CONSTRAINT `Requisito_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requisito`
--

LOCK TABLES `Requisito` WRITE;
/*!40000 ALTER TABLE `Requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `RequisitosFuncionalesAlta`
--

DROP TABLE IF EXISTS `RequisitosFuncionalesAlta`;
/*!50001 DROP VIEW IF EXISTS `RequisitosFuncionalesAlta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `RequisitosFuncionalesAlta` AS SELECT 
 1 AS `id_requisito`,
 1 AS `titulo`,
 1 AS `descripcion`,
 1 AS `tipo`,
 1 AS `prioridad`,
 1 AS `estado`,
 1 AS `fuente`,
 1 AS `id_proyecto`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Riesgo`
--

DROP TABLE IF EXISTS `Riesgo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Riesgo` (
  `id_riesgo` int NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `categoria` enum('tecnico','proyecto','externo') DEFAULT NULL,
  `fecha_identificacion` date DEFAULT NULL,
  `nivel_probabilidad` tinyint DEFAULT NULL,
  `nivel_impacto` tinyint DEFAULT NULL,
  `nivel_riesgo` tinyint DEFAULT NULL,
  `estado` enum('activo','cerrado') DEFAULT NULL,
  `id_proyecto` int DEFAULT NULL,
  PRIMARY KEY (`id_riesgo`),
  KEY `id_proyecto` (`id_proyecto`),
  CONSTRAINT `Riesgo_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Riesgo`
--

LOCK TABLES `Riesgo` WRITE;
/*!40000 ALTER TABLE `Riesgo` DISABLE KEYS */;
INSERT INTO `Riesgo` VALUES (17,'Falla del proveedor de nube','externo','2025-06-20',5,3,15,'activo',9),(18,'Falta de experiencia del equipo','tecnico','2025-06-10',4,3,12,'activo',9);
/*!40000 ALTER TABLE `Riesgo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `rol` enum('estudiante','docente','administrador') DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (7,'Ana Torres',NULL,'estudiante'),(8,'Carlos Pérez',NULL,'docente'),(9,'Marta Ríos',NULL,'administrador'),(10,'Ana Torres',NULL,'estudiante'),(11,'Carlos Pérez',NULL,'docente'),(12,'Marta Ríos',NULL,'administrador'),(13,'Ana Torres',NULL,'estudiante'),(14,'Carlos Pérez',NULL,'docente'),(15,'Marta Ríos',NULL,'administrador');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_proyectos_con_usuarios`
--

DROP TABLE IF EXISTS `vista_proyectos_con_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vista_proyectos_con_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_proyectos_con_usuarios` AS SELECT 
 1 AS `nombre_proyecto`,
 1 AS `usuario_responsable`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_riesgos_activos_proyectos`
--

DROP TABLE IF EXISTS `vista_riesgos_activos_proyectos`;
/*!50001 DROP VIEW IF EXISTS `vista_riesgos_activos_proyectos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_riesgos_activos_proyectos` AS SELECT 
 1 AS `descripcion_riesgo`,
 1 AS `nombre_proyecto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_riesgos_externos_con_responsable`
--

DROP TABLE IF EXISTS `vista_riesgos_externos_con_responsable`;
/*!50001 DROP VIEW IF EXISTS `vista_riesgos_externos_con_responsable`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_riesgos_externos_con_responsable` AS SELECT 
 1 AS `descripcion`,
 1 AS `responsable_proyecto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_usuarios_autenticados`
--

DROP TABLE IF EXISTS `vista_usuarios_autenticados`;
/*!50001 DROP VIEW IF EXISTS `vista_usuarios_autenticados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_usuarios_autenticados` AS SELECT 
 1 AS `nombre`,
 1 AS `usuario_institucional`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_usuarios_con_notificacion`
--

DROP TABLE IF EXISTS `vista_usuarios_con_notificacion`;
/*!50001 DROP VIEW IF EXISTS `vista_usuarios_con_notificacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_usuarios_con_notificacion` AS SELECT 
 1 AS `nombre`,
 1 AS `mensaje`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `RequisitosFuncionalesAlta`
--

/*!50001 DROP VIEW IF EXISTS `RequisitosFuncionalesAlta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `RequisitosFuncionalesAlta` AS select `Requisito`.`id_requisito` AS `id_requisito`,`Requisito`.`titulo` AS `titulo`,`Requisito`.`descripcion` AS `descripcion`,`Requisito`.`tipo` AS `tipo`,`Requisito`.`prioridad` AS `prioridad`,`Requisito`.`estado` AS `estado`,`Requisito`.`fuente` AS `fuente`,`Requisito`.`id_proyecto` AS `id_proyecto` from `Requisito` where ((`Requisito`.`tipo` = 'funcional') and (`Requisito`.`prioridad` = 'alta')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_proyectos_con_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vista_proyectos_con_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_proyectos_con_usuarios` AS select `P`.`nombre` AS `nombre_proyecto`,`U`.`nombre` AS `usuario_responsable` from (`Proyecto` `P` join `Usuario` `U` on((`P`.`id_usuario` = `U`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_riesgos_activos_proyectos`
--

/*!50001 DROP VIEW IF EXISTS `vista_riesgos_activos_proyectos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_riesgos_activos_proyectos` AS select `R`.`descripcion` AS `descripcion_riesgo`,`P`.`nombre` AS `nombre_proyecto` from (`Riesgo` `R` join `Proyecto` `P` on((`R`.`id_proyecto` = `P`.`id_proyecto`))) where (`R`.`estado` = 'activo') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_riesgos_externos_con_responsable`
--

/*!50001 DROP VIEW IF EXISTS `vista_riesgos_externos_con_responsable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_riesgos_externos_con_responsable` AS select `R`.`descripcion` AS `descripcion`,`U`.`nombre` AS `responsable_proyecto` from ((`Riesgo` `R` join `Proyecto` `P` on((`R`.`id_proyecto` = `P`.`id_proyecto`))) join `Usuario` `U` on((`P`.`id_usuario` = `U`.`id_usuario`))) where (`R`.`categoria` = 'externo') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuarios_autenticados`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuarios_autenticados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuarios_autenticados` AS select `U`.`nombre` AS `nombre`,`A`.`usuario_institucional` AS `usuario_institucional` from (`Usuario` `U` join `Autenticacion` `A` on((`U`.`id_usuario` = `A`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuarios_con_notificacion`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuarios_con_notificacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuarios_con_notificacion` AS select `U`.`nombre` AS `nombre`,`N`.`mensaje` AS `mensaje`,`N`.`fecha` AS `fecha` from (`Usuario` `U` join `Notificacion` `N` on((`U`.`id_usuario` = `N`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-30 12:23:45
