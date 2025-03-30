-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: comercio
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `id_fornecedor` int NOT NULL,
  `nomeProduto` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `valorCusto` decimal(10,2) NOT NULL,
  `valorVenda` decimal(10,2) NOT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_produto_categoria` (`id_categoria`),
  KEY `fk_produto_fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_produto_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,6,5,'Blanditiis','Borges',294.63,885.69,'Minima cupiditate minima omnis.'),(2,1,3,'Quas','Mendes da Costa Ltda.',188.72,730.67,'Sequi voluptatibus doloremque quae quidem tempore.'),(3,5,16,'Modi','Rios',23.50,646.78,'Distinctio maxime culpa nemo.'),(4,4,9,'Rerum','Souza Marques S/A',250.15,938.81,'Ratione perferendis quod dolorem minima doloremque harum.'),(5,4,19,'Occaecati','Freitas S/A',171.58,109.69,'Porro tempora nulla aliquam.'),(6,1,10,'Laudantium','Fonseca',458.74,602.47,'Cum illum beatae consequatur unde.'),(7,10,16,'Hic','Costa',318.75,553.15,'Explicabo corrupti deleniti aliquid.'),(8,1,3,'Harum','Rodrigues Moura S/A',176.27,833.25,'Voluptas quam ea cumque id quos voluptatum.'),(9,8,14,'Aspernatur','Oliveira',402.17,492.52,'Unde nesciunt iste aliquam aliquam.'),(10,3,14,'Sapiente','Cardoso',316.65,934.91,'Ducimus voluptatibus odio animi a unde mollitia.'),(11,4,9,'Minus','Teixeira Cunha e Filhos',172.92,129.63,'Quam veniam eaque voluptatibus non aliquam exercitationem.'),(12,5,7,'Ea','Sales S/A',83.16,122.47,'Quia consequatur velit at necessitatibus minus.'),(13,5,8,'Iusto','Rodrigues S.A.',382.38,767.39,'Repellendus dicta odio iusto libero reiciendis.'),(14,2,10,'Illum','Viana',261.54,783.20,'Error voluptatibus libero expedita nisi corporis ea quam.'),(15,8,15,'Minus','Teixeira',111.18,421.39,'Nam asperiores fuga deserunt quo quasi.'),(16,6,19,'Officiis','Cardoso',460.90,762.25,'Eius repudiandae doloremque odio veniam nam aliquid.'),(17,3,1,'Nisi','da Rosa S.A.',111.97,806.92,'Architecto minus officia qui enim odio.'),(18,4,1,'Consequatur','Camargo - EI',186.25,153.58,'Itaque quas quas quod.'),(19,3,1,'Similique','Ramos',469.07,159.86,'Natus ex fugit magnam nihil.'),(20,1,12,'Molestias','Pires',245.15,566.82,'Sed suscipit voluptatem qui ex.'),(21,3,7,'Ad','Fonseca',237.64,47.61,'Beatae adipisci illo et temporibus.'),(22,5,7,'Porro','da Rocha - EI',457.92,123.64,'Ducimus explicabo suscipit fugiat unde quas reprehenderit.'),(23,3,7,'Ducimus','Correia da Costa S.A.',418.04,330.94,'Vel autem at nihil praesentium magni.'),(24,7,1,'Tenetur','Nascimento',181.13,298.90,'Id vero tempore amet necessitatibus consequuntur explicabo.'),(25,3,12,'Ipsum','Moura Silva S.A.',116.12,162.01,'Inventore asperiores laudantium debitis dicta nihil.'),(26,9,4,'Ducimus','Pacheco da Cruz - ME',29.93,919.31,'Rerum debitis eligendi vitae aperiam alias aut corrupti.'),(27,2,5,'Modi','Novaes da Costa - ME',329.39,136.55,'Minima voluptatum voluptatibus perspiciatis quos tempore modi.'),(28,8,10,'Recusandae','da Paz e Filhos',405.25,682.03,'Sint tempora aut.'),(29,6,19,'Distinctio','Farias Mendonça S.A.',490.26,831.89,'Quas deleniti officia libero fugiat numquam.'),(30,1,4,'Iure','Leão',497.61,763.12,'Expedita soluta repudiandae ex asperiores unde.'),(31,5,3,'Saepe','Gomes da Conceição Ltda.',68.75,762.24,'Maiores aliquam officiis facilis debitis.'),(32,10,8,'Autem','Pacheco',419.92,683.69,'Consectetur dolorem id nulla temporibus id aliquid.'),(33,2,6,'Corrupti','Albuquerque',486.65,402.38,'Tempora ad eaque minus soluta.'),(34,7,2,'Ullam','Nogueira Oliveira S/A',150.48,518.64,'Voluptas nemo distinctio.'),(35,6,5,'Vero','Silveira',423.00,645.61,'Ratione culpa error qui similique harum modi.'),(36,7,17,'Vel','Novais Aparecida - ME',66.66,739.32,'Doloremque quas cumque corporis.'),(37,8,5,'Ea','Guerra - ME',60.13,161.25,'Voluptatibus itaque voluptas beatae.'),(38,10,15,'Architecto','Cassiano',397.76,840.06,'Eligendi debitis optio dolorem doloremque magni quidem nihil.'),(39,6,11,'Magnam','Fogaça Viana - ME',34.44,467.78,'In quibusdam odit laudantium nesciunt debitis.'),(40,10,18,'Fugiat','Pastor Sampaio S/A',288.25,592.35,'Neque vero placeat eaque nemo.'),(41,5,18,'Repudiandae','Lima S/A',345.23,37.45,'Ipsa natus error ea molestias repellendus.'),(42,9,9,'Accusantium','Rios',124.86,878.22,'Molestiae cum corrupti rerum ipsam accusamus.'),(43,8,20,'Ad','Sampaio Rocha - EI',163.33,755.66,'Error tempora unde ducimus nisi.'),(44,4,20,'Deleniti','da Mata - ME',133.15,214.43,'Ratione deleniti accusantium fugiat.'),(45,10,1,'Dolorum','Pacheco',358.60,136.10,'Quidem necessitatibus illum eius commodi dolores eaque.'),(46,2,14,'Qui','Cavalcante',363.80,71.96,'Unde dolorum unde.'),(47,8,2,'Nostrum','Araújo S.A.',24.04,804.48,'Dolor eius unde placeat corrupti quam neque possimus.'),(48,4,10,'Libero','Macedo',173.09,210.70,'Excepturi vero debitis ipsam.'),(49,5,13,'Minus','da Cruz da Mota S/A',307.12,38.07,'Nostrum exercitationem mollitia fuga non vel debitis.'),(50,4,1,'Nesciunt','Fogaça - ME',47.78,27.21,'Distinctio voluptatum occaecati harum velit laboriosam unde.'),(51,9,2,'Dignissimos','Silveira S/A',216.21,587.77,'Exercitationem voluptates dolorum adipisci dolor.'),(52,3,1,'Eveniet','Albuquerque e Filhos',418.73,675.82,'Aliquid libero nemo aspernatur.'),(53,4,11,'Minus','Farias Nascimento S/A',127.13,942.61,'Nam quod exercitationem possimus placeat aspernatur quos mollitia.'),(54,8,9,'Tempore','Souza Dias Ltda.',221.94,977.71,'Sint recusandae repellat distinctio.'),(55,7,12,'Saepe','da Luz Sousa e Filhos',187.29,945.38,'Temporibus qui porro.'),(56,6,5,'Recusandae','Viana da Luz e Filhos',324.50,860.26,'Enim accusantium corrupti sint quos quos.'),(57,9,15,'Reprehenderit','Ferreira',484.69,506.17,'Laborum ratione quos architecto quos voluptatibus illum.'),(58,7,1,'Odio','Cardoso S/A',458.00,905.47,'Porro totam quibusdam officia sunt.'),(59,1,9,'Architecto','Viana Casa Grande S.A.',63.59,601.80,'Delectus esse exercitationem veniam.'),(60,5,3,'Alias','Aragão',396.63,955.19,'Velit iusto nihil blanditiis earum ipsam expedita porro.'),(61,2,6,'Excepturi','da Paz',383.12,641.68,'Tempore enim eius impedit.'),(62,1,5,'Molestias','da Rocha',461.95,992.21,'Tempora laboriosam molestiae mollitia repellat.'),(63,1,5,'Quo','Monteiro Ltda.',91.41,476.72,'Animi numquam autem cumque minus sit.'),(64,2,8,'Adipisci','Silveira e Filhos',286.31,246.03,'Iste maiores praesentium officiis.'),(65,2,20,'Harum','Jesus Jesus e Filhos',247.48,792.93,'Consectetur numquam fuga asperiores similique.'),(66,7,17,'Vero','Rios',154.61,587.92,'Expedita eveniet nobis perferendis iusto tenetur.'),(67,6,9,'Quae','Costela',400.71,430.43,'Molestias nulla doloribus ipsum architecto quaerat.'),(68,2,9,'Beatae','Ferreira',11.39,310.45,'Aliquam pariatur maiores commodi.'),(69,9,6,'Qui','Andrade',117.92,673.66,'Ut repellat exercitationem iusto natus.'),(70,2,19,'Et','Abreu Albuquerque - EI',195.48,579.64,'Quibusdam deleniti in eaque.'),(71,1,7,'Ex','Sales Montenegro - ME',414.73,413.92,'Quasi numquam architecto quam.'),(72,3,2,'Natus','Leão Aparecida S.A.',66.41,214.97,'A eum voluptatibus libero recusandae iusto fugiat.'),(73,4,14,'Possimus','Rezende',136.15,107.92,'Voluptatem esse mollitia commodi quaerat dolor aspernatur.'),(74,2,20,'Soluta','Vieira Pacheco S.A.',91.47,858.23,'Sint harum rem dolorem aspernatur.'),(75,3,15,'Quae','Pastor',484.22,41.15,'Architecto dolore animi facilis aperiam delectus.'),(76,8,4,'Odio','Moreira e Filhos',413.52,195.95,'Commodi fugiat dolor aperiam.'),(77,2,19,'Facere','Viana Alves S/A',262.42,178.26,'Ipsa assumenda ipsa non beatae minus ipsa illum.'),(78,5,6,'Cumque','Pires',496.88,206.08,'Odit doloremque maxime alias deleniti ratione explicabo.'),(79,7,3,'Esse','Nascimento',50.93,490.02,'Est atque dolorem ratione expedita aut voluptas.'),(80,5,6,'Possimus','Santos Moreira - ME',240.46,860.52,'Numquam quae illo aspernatur.'),(81,3,3,'Eum','Vieira Duarte S/A',186.90,926.70,'Aliquid voluptate provident architecto aliquid accusantium.'),(82,2,20,'Reiciendis','da Luz Silva Ltda.',405.58,252.04,'Modi accusamus aliquid sunt eveniet ea.'),(83,10,7,'Dolorem','Andrade',341.97,345.07,'Molestias provident ab maxime.'),(84,4,18,'Quis','Moura - ME',201.26,891.96,'Iure facilis saepe laudantium nihil possimus.'),(85,2,16,'Vitae','Teixeira',456.32,453.79,'Voluptatem rerum mollitia iste.'),(86,7,17,'Aspernatur','Cardoso Oliveira - EI',413.32,963.80,'Ut necessitatibus vel.'),(87,1,17,'Dolorum','Pastor Pastor Ltda.',20.45,97.38,'Est ex occaecati architecto corporis reiciendis porro.'),(88,6,4,'Assumenda','Pires Montenegro - EI',399.14,668.44,'Eos numquam repudiandae distinctio.'),(89,4,17,'Ad','Cavalcanti Ltda.',306.27,904.63,'Blanditiis deserunt facilis magni repellat reiciendis voluptatum.'),(90,1,9,'Non','da Paz - ME',253.50,431.48,'Voluptates quis dolorem harum.'),(91,1,17,'Exercitationem','Pimenta',170.99,50.58,'Nihil cupiditate modi nobis sapiente maxime.'),(92,2,17,'Quis','Cunha',138.94,525.77,'Praesentium iusto sed nostrum temporibus hic deleniti.'),(93,3,15,'Inventore','Rios',389.04,966.96,'Consequuntur saepe ullam placeat laudantium id.'),(94,7,12,'Quisquam','Almeida Farias e Filhos',49.58,324.37,'Molestiae optio dolore quis atque deserunt.'),(95,5,20,'Debitis','Câmara',131.64,893.60,'Aliquid rerum magni aspernatur voluptates.'),(96,7,18,'Harum','Cardoso e Filhos',283.68,652.59,'Voluptatum fugit impedit.'),(97,10,20,'Repellat','Cirino e Filhos',312.88,864.43,'Facere nemo eos consectetur perferendis.'),(98,7,10,'Blanditiis','Moreira',156.51,89.75,'Labore minima aliquid deserunt.'),(99,10,18,'Nostrum','Leão',431.75,217.68,'Suscipit cumque aliquam dolor consequuntur nulla velit.'),(100,2,3,'Similique','Correia - EI',25.23,353.30,'Eaque consequatur nulla veritatis nemo beatae occaecati.');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-24 21:13:59
