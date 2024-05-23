CREATE DATABASE  IF NOT EXISTS `inventario` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inventario`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: inventario
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `idinventario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`idinventario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,'tel141-router',5),(2,'tel142-router',7),(3,'tel143-router',4);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `inventario_idinventario` int NOT NULL,
  `usuario_idusuario` int NOT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date NOT NULL,
  PRIMARY KEY (`inventario_idinventario`,`usuario_idusuario`),
  KEY `fk_inventario_has_usuario_usuario1_idx` (`usuario_idusuario`),
  KEY `fk_inventario_has_usuario_inventario1_idx` (`inventario_idinventario`),
  CONSTRAINT `fk_inventario_has_usuario_inventario1` FOREIGN KEY (`inventario_idinventario`) REFERENCES `inventario` (`idinventario`),
  CONSTRAINT `fk_inventario_has_usuario_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (2,1,'2024-05-23','2024-05-31'),(2,2,'2024-05-23','2024-05-24');
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idrol` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ADMIN'),(2,'ALUMNO'),(3,'PROFESOR');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint NOT NULL,
  `LAST_ACCESS_TIME` bigint NOT NULL,
  `MAX_INACTIVE_INTERVAL` int NOT NULL,
  `EXPIRY_TIME` bigint NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` VALUES ('fcf3a27c-4358-447b-bb0e-aecc2e82418f','2730b808-cde9-4b2e-bb1d-ce0b4136ef44',1716429666687,1716429783913,1800,1716431583913,NULL);
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` VALUES ('fcf3a27c-4358-447b-bb0e-aecc2e82418f','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '¨\Ì\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\Ô∑\»/¢˚\’\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$675e0c78-addf-4f12-a6c9-95c25fc291dc'),('fcf3a27c-4358-447b-bb0e-aecc2e82418f','SPRING_SECURITY_LAST_EXCEPTION',_binary '¨\Ì\0sr\0Rorg.springframework.security.authentication.InternalAuthenticationServiceException¨ReÛòP\0\0xr\0Jorg.springframework.security.authentication.AuthenticationServiceException\È\Èhh~t,\ƒ\0\0xr\09org.springframework.security.core.AuthenticationExceptionQ0\‚gT\0\0xr\0\Zjava.lang.RuntimeExceptionû_G\n4É\Â\0\0xr\0java.lang.Exception\–˝>\Z;\ƒ\0\0xr\0java.lang.Throwable\’\∆5\'9w∏\À\0L\0causet\0Ljava/lang/Throwable;L\0\rdetailMessaget\0Ljava/lang/String;[\0\nstackTracet\0[Ljava/lang/StackTraceElement;L\0suppressedExceptionst\0Ljava/util/List;xpsr\0<org.springframework.dao.TransientDataAccessResourceException˜sJp≠˙\0\0xr\04org.springframework.dao.TransientDataAccessException@D*&\ÎGì˙\0\0xr\0+org.springframework.dao.DataAccessException∑®Bw\ \Z\≈\n\0\0xr\0/org.springframework.core.NestedRuntimeExceptionK~vHÀèü\0\0\0xq\0~\0sr\0java.sql.SQLException°\È0\€>u\‹\0I\0\nvendorCodeL\0SQLStateq\0~\0L\0nextt\0Ljava/sql/SQLException;xq\0~\0q\0~\0t\0\"Column Index out of range, 3 > 2. ur\0[Ljava.lang.StackTraceElement;F*<<˝\"9\0\0xp\0\0\0^sr\0java.lang.StackTraceElementa	≈ö&6›Ö\0B\0formatI\0\nlineNumberL\0classLoaderNameq\0~\0L\0declaringClassq\0~\0L\0fileNameq\0~\0L\0\nmethodNameq\0~\0L\0\nmoduleNameq\0~\0L\0\rmoduleVersionq\0~\0xp\0\0\0Åt\0appt\0%com.mysql.cj.jdbc.exceptions.SQLErrort\0\rSQLError.javat\0createSQLExceptionppsq\0~\0\0\0\0aq\0~\0q\0~\0q\0~\0\Zq\0~\0ppsq\0~\0\0\0\0Yq\0~\0q\0~\0q\0~\0\Zq\0~\0ppsq\0~\0\0\0\0?q\0~\0q\0~\0q\0~\0\Zq\0~\0ppsq\0~\0\0\0˝q\0~\0t\0&com.mysql.cj.jdbc.result.ResultSetImplt\0ResultSetImpl.javat\0checkColumnBoundsppsq\0~\0\0\0q\0~\0q\0~\0 q\0~\0!t\0	getObjectppsq\0~\0\0\0\√q\0~\0q\0~\0 q\0~\0!t\0\ngetBooleanppsq\0~\0ˇˇˇˇq\0~\0t\0+com.zaxxer.hikari.pool.HikariProxyResultSett\0HikariProxyResultSet.javaq\0~\0&ppsq\0~\0\0\0\0ªq\0~\0t\0@org.springframework.security.provisioning.JdbcUserDetailsManagert\0JdbcUserDetailsManager.javat\0	mapToUserppsq\0~\0\0\0\0^q\0~\0t\09org.springframework.jdbc.core.RowMapperResultSetExtractort\0 RowMapperResultSetExtractor.javat\0extractDatappsq\0~\0\0\0\0=q\0~\0q\0~\0/q\0~\00q\0~\01ppsq\0~\0\0\0\›q\0~\0t\0,org.springframework.jdbc.core.JdbcTemplate$1t\0JdbcTemplate.javat\0doInPreparedStatementppsq\0~\0\0\0íq\0~\0t\0*org.springframework.jdbc.core.JdbcTemplateq\0~\05t\0executeppsq\0~\0\0\0\”q\0~\0q\0~\08q\0~\05t\0queryppsq\0~\0\0\0Úq\0~\0q\0~\08q\0~\05q\0~\0;ppsq\0~\0\0\0ˇq\0~\0q\0~\08q\0~\05q\0~\0;ppsq\0~\0\0\09q\0~\0q\0~\08q\0~\05q\0~\0;ppsq\0~\0\0\0\0µq\0~\0q\0~\0+q\0~\0,t\0loadUsersByUsernameppsq\0~\0\0\0\0∏q\0~\0t\0>org.springframework.security.core.userdetails.jdbc.JdbcDaoImplt\0JdbcDaoImpl.javat\0loadUserByUsernameppsq\0~\0\0\0\0gq\0~\0t\0Iorg.springframework.security.authentication.dao.DaoAuthenticationProvidert\0DaoAuthenticationProvider.javat\0retrieveUserppsq\0~\0\0\0\0Öq\0~\0t\0Yorg.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvidert\0.AbstractUserDetailsAuthenticationProvider.javat\0authenticateppsq\0~\0\0\0\0∂q\0~\0t\0;org.springframework.security.authentication.ProviderManagert\0ProviderManager.javaq\0~\0Lppsq\0~\0\0\0\0\…q\0~\0q\0~\0Nq\0~\0Oq\0~\0Lppsq\0~\0\0\0\0Uq\0~\0t\0Torg.springframework.security.web.authentication.UsernamePasswordAuthenticationFiltert\0)UsernamePasswordAuthenticationFilter.javat\0attemptAuthenticationppsq\0~\0\0\0\0\Áq\0~\0t\0Vorg.springframework.security.web.authentication.AbstractAuthenticationProcessingFiltert\0+AbstractAuthenticationProcessingFilter.javat\0doFilterppsq\0~\0\0\0\0\›q\0~\0q\0~\0Vq\0~\0Wq\0~\0Xppsq\0~\0\0\0vq\0~\0t\0Dorg.springframework.security.web.FilterChainProxy$VirtualFilterChaint\0FilterChainProxy.javaq\0~\0Xppsq\0~\0\0\0\0kq\0~\0t\0Corg.springframework.security.web.authentication.logout.LogoutFiltert\0LogoutFilter.javaq\0~\0Xppsq\0~\0\0\0\0]q\0~\0q\0~\0^q\0~\0_q\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0Éq\0~\0t\00org.springframework.security.web.csrf.CsrfFiltert\0CsrfFilter.javat\0doFilterInternalppsq\0~\0\0\0\0tq\0~\0t\03org.springframework.web.filter.OncePerRequestFiltert\0OncePerRequestFilter.javaq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0[q\0~\0t\0)org.springframework.web.filter.CorsFiltert\0CorsFilter.javaq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0Zq\0~\0t\0:org.springframework.security.web.header.HeaderWriterFiltert\0HeaderWriterFilter.javat\0doHeadersAfterppsq\0~\0\0\0\0Kq\0~\0q\0~\0pq\0~\0qq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0Rq\0~\0t\0Dorg.springframework.security.web.context.SecurityContextHolderFiltert\0 SecurityContextHolderFilter.javaq\0~\0Xppsq\0~\0\0\0\0Eq\0~\0q\0~\0wq\0~\0xq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0>q\0~\0t\0Worg.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFiltert\0%WebAsyncManagerIntegrationFilter.javaq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0*q\0~\0t\0?org.springframework.security.web.session.DisableEncodeUrlFiltert\0DisableEncodeUrlFilter.javaq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0\Èq\0~\0t\01org.springframework.security.web.FilterChainProxyq\0~\0\\q\0~\0eppsq\0~\0\0\0\0øq\0~\0q\0~\0Üq\0~\0\\q\0~\0Xppsq\0~\0\0\0\0qq\0~\0t\0Aorg.springframework.web.filter.CompositeFilter$VirtualFilterChaint\0CompositeFilter.javaq\0~\0Xppsq\0~\0\0\0\0\√q\0~\0t\0Borg.springframework.web.servlet.handler.HandlerMappingIntrospectort\0HandlerMappingIntrospector.javat\0\Zlambda$createCacheFilter$3ppsq\0~\0\0\0\0qq\0~\0q\0~\0âq\0~\0äq\0~\0Xppsq\0~\0\0\0\0Jq\0~\0t\0.org.springframework.web.filter.CompositeFilterq\0~\0äq\0~\0Xppsq\0~\0\0\0\0\Êq\0~\0t\0vorg.springframework.security.config.annotation.web.configuration.WebMvcSecurityConfiguration$CompositeFilterChainProxyt\0 WebMvcSecurityConfiguration.javaq\0~\0Xppsq\0~\0\0\0`q\0~\0t\04org.springframework.web.filter.DelegatingFilterProxyt\0\ZDelegatingFilterProxy.javat\0invokeDelegateppsq\0~\0\0\0q\0~\0q\0~\0ñq\0~\0óq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0t\0/org.apache.catalina.core.ApplicationFilterChaint\0ApplicationFilterChain.javat\0internalDoFilterppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0dq\0~\0t\03org.springframework.web.filter.RequestContextFiltert\0RequestContextFilter.javaq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0]q\0~\0t\00org.springframework.web.filter.FormContentFiltert\0FormContentFilter.javaq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0éq\0~\0t\0<org.springframework.session.web.http.SessionRepositoryFiltert\0SessionRepositoryFilter.javaq\0~\0eppsq\0~\0\0\0\0Rq\0~\0t\09org.springframework.session.web.http.OncePerRequestFilterq\0~\0hq\0~\0Xppsq\0~\0\0\0`q\0~\0q\0~\0ñq\0~\0óq\0~\0òppsq\0~\0\0\0q\0~\0q\0~\0ñq\0~\0óq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0\…q\0~\0t\06org.springframework.web.filter.CharacterEncodingFiltert\0CharacterEncodingFilter.javaq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0ßq\0~\0t\0-org.apache.catalina.core.StandardWrapperValvet\0StandardWrapperValve.javat\0invokeppsq\0~\0\0\0\0Zq\0~\0t\0-org.apache.catalina.core.StandardContextValvet\0StandardContextValve.javaq\0~\0Ωppsq\0~\0\0\0\‚q\0~\0t\03org.apache.catalina.authenticator.AuthenticatorBaset\0AuthenticatorBase.javaq\0~\0Ωppsq\0~\0\0\0\0sq\0~\0t\0*org.apache.catalina.core.StandardHostValvet\0StandardHostValve.javaq\0~\0Ωppsq\0~\0\0\0\0]q\0~\0t\0+org.apache.catalina.valves.ErrorReportValvet\0ErrorReportValve.javaq\0~\0Ωppsq\0~\0\0\0\0Jq\0~\0t\0,org.apache.catalina.core.StandardEngineValvet\0StandardEngineValve.javaq\0~\0Ωppsq\0~\0\0\0Xq\0~\0t\0+org.apache.catalina.connector.CoyoteAdaptert\0CoyoteAdapter.javat\0serviceppsq\0~\0\0\0áq\0~\0t\0(org.apache.coyote.http11.Http11Processort\0Http11Processor.javaq\0~\0\–ppsq\0~\0\0\0\0?q\0~\0t\0(org.apache.coyote.AbstractProcessorLightt\0AbstractProcessorLight.javat\0processppsq\0~\0\0\0Äq\0~\0t\04org.apache.coyote.AbstractProtocol$ConnectionHandlert\0AbstractProtocol.javaq\0~\0\◊ppsq\0~\0\0\0\»q\0~\0t\06org.apache.tomcat.util.net.NioEndpoint$SocketProcessort\0NioEndpoint.javat\0doRunppsq\0~\0\0\0\04q\0~\0t\0.org.apache.tomcat.util.net.SocketProcessorBaset\0SocketProcessorBase.javat\0runppsq\0~\0\0\0ßq\0~\0t\01org.apache.tomcat.util.threads.ThreadPoolExecutort\0ThreadPoolExecutor.javat\0	runWorkerppsq\0~\0\0\0ìq\0~\0t\08org.apache.tomcat.util.threads.ThreadPoolExecutor$Workerq\0~\0\Âq\0~\0\‚ppsq\0~\0\0\0\0?q\0~\0t\0:org.apache.tomcat.util.threads.TaskThread$WrappingRunnablet\0TaskThread.javaq\0~\0\‚ppsq\0~\0\0\0Hpt\0java.lang.Threadt\0Thread.javaq\0~\0\‚t\0	java.baset\017.0.10sr\0java.util.Collections$EmptyListz∏¥<ßû\ﬁ\0\0xpx\0\0\0\0t\0S1009pt\0àPreparedStatementCallback; SQL [SELECT correo, contrasena  FROM inventario.usuario WHERE correo = ?]; Column Index out of range, 3 > 2. uq\0~\0\0\0\0Vsq\0~\0\0\0\0|q\0~\0t\0?org.springframework.jdbc.support.SQLStateSQLExceptionTranslatort\0#SQLStateSQLExceptionTranslator.javat\0doTranslateppsq\0~\0\0\0\0kq\0~\0t\0Gorg.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslatort\0+AbstractFallbackSQLExceptionTranslator.javat\0	translateppsq\0~\0\0\0\0tq\0~\0q\0~\0˚q\0~\0¸q\0~\0˝ppsq\0~\0\0\0q\0~\0q\0~\08q\0~\05t\0translateExceptionppsq\0~\0\0\0•q\0~\0q\0~\08q\0~\05q\0~\09ppsq\0~\0\0\0\”q\0~\0q\0~\08q\0~\05q\0~\0;ppsq\0~\0\0\0Úq\0~\0q\0~\08q\0~\05q\0~\0;ppsq\0~\0\0\0ˇq\0~\0q\0~\08q\0~\05q\0~\0;ppsq\0~\0\0\09q\0~\0q\0~\08q\0~\05q\0~\0;ppsq\0~\0\0\0\0µq\0~\0q\0~\0+q\0~\0,q\0~\0@ppsq\0~\0\0\0\0∏q\0~\0q\0~\0Bq\0~\0Cq\0~\0Dppsq\0~\0\0\0\0gq\0~\0q\0~\0Fq\0~\0Gq\0~\0Hppsq\0~\0\0\0\0Öq\0~\0q\0~\0Jq\0~\0Kq\0~\0Lppsq\0~\0\0\0\0∂q\0~\0q\0~\0Nq\0~\0Oq\0~\0Lppsq\0~\0\0\0\0\…q\0~\0q\0~\0Nq\0~\0Oq\0~\0Lppsq\0~\0\0\0\0Uq\0~\0q\0~\0Rq\0~\0Sq\0~\0Tppsq\0~\0\0\0\0\Áq\0~\0q\0~\0Vq\0~\0Wq\0~\0Xppsq\0~\0\0\0\0\›q\0~\0q\0~\0Vq\0~\0Wq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0kq\0~\0q\0~\0^q\0~\0_q\0~\0Xppsq\0~\0\0\0\0]q\0~\0q\0~\0^q\0~\0_q\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0Éq\0~\0q\0~\0cq\0~\0dq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0[q\0~\0q\0~\0kq\0~\0lq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0Zq\0~\0q\0~\0pq\0~\0qq\0~\0rppsq\0~\0\0\0\0Kq\0~\0q\0~\0pq\0~\0qq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0Rq\0~\0q\0~\0wq\0~\0xq\0~\0Xppsq\0~\0\0\0\0Eq\0~\0q\0~\0wq\0~\0xq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0>q\0~\0q\0~\0|q\0~\0}q\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0*q\0~\0q\0~\0Åq\0~\0Çq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0\Èq\0~\0q\0~\0Üq\0~\0\\q\0~\0eppsq\0~\0\0\0\0øq\0~\0q\0~\0Üq\0~\0\\q\0~\0Xppsq\0~\0\0\0\0qq\0~\0q\0~\0âq\0~\0äq\0~\0Xppsq\0~\0\0\0\0\√q\0~\0q\0~\0åq\0~\0çq\0~\0éppsq\0~\0\0\0\0qq\0~\0q\0~\0âq\0~\0äq\0~\0Xppsq\0~\0\0\0\0Jq\0~\0q\0~\0ëq\0~\0äq\0~\0Xppsq\0~\0\0\0\0\Êq\0~\0q\0~\0ìq\0~\0îq\0~\0Xppsq\0~\0\0\0`q\0~\0q\0~\0ñq\0~\0óq\0~\0òppsq\0~\0\0\0q\0~\0q\0~\0ñq\0~\0óq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0dq\0~\0q\0~\0†q\0~\0°q\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0]q\0~\0q\0~\0¶q\0~\0ßq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0éq\0~\0q\0~\0¨q\0~\0≠q\0~\0eppsq\0~\0\0\0\0Rq\0~\0q\0~\0Øq\0~\0hq\0~\0Xppsq\0~\0\0\0`q\0~\0q\0~\0ñq\0~\0óq\0~\0òppsq\0~\0\0\0q\0~\0q\0~\0ñq\0~\0óq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0\…q\0~\0q\0~\0µq\0~\0∂q\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0ßq\0~\0q\0~\0ªq\0~\0ºq\0~\0Ωppsq\0~\0\0\0\0Zq\0~\0q\0~\0øq\0~\0¿q\0~\0Ωppsq\0~\0\0\0\‚q\0~\0q\0~\0\¬q\0~\0\√q\0~\0Ωppsq\0~\0\0\0\0sq\0~\0q\0~\0\≈q\0~\0\∆q\0~\0Ωppsq\0~\0\0\0\0]q\0~\0q\0~\0\»q\0~\0\…q\0~\0Ωppsq\0~\0\0\0\0Jq\0~\0q\0~\0\Àq\0~\0\Ãq\0~\0Ωppsq\0~\0\0\0Xq\0~\0q\0~\0\Œq\0~\0\œq\0~\0\–ppsq\0~\0\0\0áq\0~\0q\0~\0\“q\0~\0\”q\0~\0\–ppsq\0~\0\0\0\0?q\0~\0q\0~\0\’q\0~\0\÷q\0~\0\◊ppsq\0~\0\0\0Äq\0~\0q\0~\0\Ÿq\0~\0\⁄q\0~\0\◊ppsq\0~\0\0\0\»q\0~\0q\0~\0\‹q\0~\0\›q\0~\0\ﬁppsq\0~\0\0\0\04q\0~\0q\0~\0\‡q\0~\0\·q\0~\0\‚ppsq\0~\0\0\0ßq\0~\0q\0~\0\‰q\0~\0\Âq\0~\0\Êppsq\0~\0\0\0ìq\0~\0q\0~\0\Ëq\0~\0\Âq\0~\0\‚ppsq\0~\0\0\0\0?q\0~\0q\0~\0\Íq\0~\0\Îq\0~\0\‚ppsq\0~\0\0\0Hpq\0~\0\Ìq\0~\0\Óq\0~\0\‚q\0~\0\Ôq\0~\0q\0~\0Úxq\0~\0Ùuq\0~\0\0\0\0Ksq\0~\0\0\0\0vq\0~\0q\0~\0Fq\0~\0Gq\0~\0Hppsq\0~\0\0\0\0Öq\0~\0q\0~\0Jq\0~\0Kq\0~\0Lppsq\0~\0\0\0\0∂q\0~\0q\0~\0Nq\0~\0Oq\0~\0Lppsq\0~\0\0\0\0\…q\0~\0q\0~\0Nq\0~\0Oq\0~\0Lppsq\0~\0\0\0\0Uq\0~\0q\0~\0Rq\0~\0Sq\0~\0Tppsq\0~\0\0\0\0\Áq\0~\0q\0~\0Vq\0~\0Wq\0~\0Xppsq\0~\0\0\0\0\›q\0~\0q\0~\0Vq\0~\0Wq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0kq\0~\0q\0~\0^q\0~\0_q\0~\0Xppsq\0~\0\0\0\0]q\0~\0q\0~\0^q\0~\0_q\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0Éq\0~\0q\0~\0cq\0~\0dq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0[q\0~\0q\0~\0kq\0~\0lq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0Zq\0~\0q\0~\0pq\0~\0qq\0~\0rppsq\0~\0\0\0\0Kq\0~\0q\0~\0pq\0~\0qq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0Rq\0~\0q\0~\0wq\0~\0xq\0~\0Xppsq\0~\0\0\0\0Eq\0~\0q\0~\0wq\0~\0xq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0>q\0~\0q\0~\0|q\0~\0}q\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0*q\0~\0q\0~\0Åq\0~\0Çq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0vq\0~\0q\0~\0[q\0~\0\\q\0~\0Xppsq\0~\0\0\0\0\Èq\0~\0q\0~\0Üq\0~\0\\q\0~\0eppsq\0~\0\0\0\0øq\0~\0q\0~\0Üq\0~\0\\q\0~\0Xppsq\0~\0\0\0\0qq\0~\0q\0~\0âq\0~\0äq\0~\0Xppsq\0~\0\0\0\0\√q\0~\0q\0~\0åq\0~\0çq\0~\0éppsq\0~\0\0\0\0qq\0~\0q\0~\0âq\0~\0äq\0~\0Xppsq\0~\0\0\0\0Jq\0~\0q\0~\0ëq\0~\0äq\0~\0Xppsq\0~\0\0\0\0\Êq\0~\0q\0~\0ìq\0~\0îq\0~\0Xppsq\0~\0\0\0`q\0~\0q\0~\0ñq\0~\0óq\0~\0òppsq\0~\0\0\0q\0~\0q\0~\0ñq\0~\0óq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0dq\0~\0q\0~\0†q\0~\0°q\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0]q\0~\0q\0~\0¶q\0~\0ßq\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0éq\0~\0q\0~\0¨q\0~\0≠q\0~\0eppsq\0~\0\0\0\0Rq\0~\0q\0~\0Øq\0~\0hq\0~\0Xppsq\0~\0\0\0`q\0~\0q\0~\0ñq\0~\0óq\0~\0òppsq\0~\0\0\0q\0~\0q\0~\0ñq\0~\0óq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0\…q\0~\0q\0~\0µq\0~\0∂q\0~\0eppsq\0~\0\0\0\0tq\0~\0q\0~\0gq\0~\0hq\0~\0Xppsq\0~\0\0\0\0Øq\0~\0q\0~\0õq\0~\0úq\0~\0ùppsq\0~\0\0\0\0ñq\0~\0q\0~\0õq\0~\0úq\0~\0Xppsq\0~\0\0\0\0ßq\0~\0q\0~\0ªq\0~\0ºq\0~\0Ωppsq\0~\0\0\0\0Zq\0~\0q\0~\0øq\0~\0¿q\0~\0Ωppsq\0~\0\0\0\‚q\0~\0q\0~\0\¬q\0~\0\√q\0~\0Ωppsq\0~\0\0\0\0sq\0~\0q\0~\0\≈q\0~\0\∆q\0~\0Ωppsq\0~\0\0\0\0]q\0~\0q\0~\0\»q\0~\0\…q\0~\0Ωppsq\0~\0\0\0\0Jq\0~\0q\0~\0\Àq\0~\0\Ãq\0~\0Ωppsq\0~\0\0\0Xq\0~\0q\0~\0\Œq\0~\0\œq\0~\0\–ppsq\0~\0\0\0áq\0~\0q\0~\0\“q\0~\0\”q\0~\0\–ppsq\0~\0\0\0\0?q\0~\0q\0~\0\’q\0~\0\÷q\0~\0\◊ppsq\0~\0\0\0Äq\0~\0q\0~\0\Ÿq\0~\0\⁄q\0~\0\◊ppsq\0~\0\0\0\»q\0~\0q\0~\0\‹q\0~\0\›q\0~\0\ﬁppsq\0~\0\0\0\04q\0~\0q\0~\0\‡q\0~\0\·q\0~\0\‚ppsq\0~\0\0\0ßq\0~\0q\0~\0\‰q\0~\0\Âq\0~\0\Êppsq\0~\0\0\0ìq\0~\0q\0~\0\Ëq\0~\0\Âq\0~\0\‚ppsq\0~\0\0\0\0?q\0~\0q\0~\0\Íq\0~\0\Îq\0~\0\‚ppsq\0~\0\0\0Hpq\0~\0\Ìq\0~\0\Óq\0~\0\‚q\0~\0\Ôq\0~\0q\0~\0Úx'),('fcf3a27c-4358-447b-bb0e-aecc2e82418f','SPRING_SECURITY_SAVED_REQUEST',_binary '¨\Ì\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0êt\0\0sr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie\0\0\0\0\0\0l\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xpˇˇˇˇ\0\0\0\0\0ppt\0SESSIONpt\00MjczMGI4MDgtY2RlOS00YjJlLWJiMWQtY2UwYjQxMzZlZjQ0xsr\0java.util.TreeMap¡ˆ>-%j\Ê\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\Â\Œ\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0átext/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0es-ES,es;q=0.9xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\08SESSION=MjczMGI4MDgtY2RlOS00YjJlLWJiMWQtY2UwYjQxMzZlZjQ0xt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0A\"Chromium\";v=\"124\", \"Google Chrome\";v=\"124\", \"Not-A.Brand\";v=\"99\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0documentxt\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0navigatext\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0nonext\0sec-fetch-usersq\0~\0\0\0\0w\0\0\0t\0?1xt\0upgrade-insecure-requestssq\0~\0\0\0\0w\0\0\0t\01xt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0oMozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~¯`ú0˘\Ï\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xpˇˇˇˇt\0ESq\0~\0t\0esq\0~\0q\0~\0xsq\0~\0?ˇˇˇˇq\0~\0q\0~\0q\0~\0Bq\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0\0xppt\0\r/dispositivost\0\"http://localhost:8080/dispositivost\0httpt\0	localhostt\0\r/dispositivos');
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `rol_idrol` int NOT NULL,
  `profesor` int DEFAULT NULL,
  `prestamos_idprestamos` int DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_rol_idx` (`rol_idrol`),
  KEY `fk_usuario_usuario1_idx` (`profesor`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`),
  CONSTRAINT `fk_usuario_usuario1` FOREIGN KEY (`profesor`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Jose',3,NULL,2,'jose@profesor.com','123','Vargas'),(2,'Juan',2,1,2,'juan@alumno.com','123','Torres');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 21:16:56
