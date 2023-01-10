-- -------------------------------------------------------------
-- TablePlus 4.6.8(424)
--
-- https://tableplus.com/
--
-- Database: bienesraices_node_mvc
-- Generation Time: 2022-06-20 11:45:37.4340
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(200) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `propiedadId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `usuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propiedadId` (`propiedadId`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`propiedadId`) REFERENCES `propiedades` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `precios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE `propiedades` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `habitaciones` int(11) NOT NULL,
  `estacionamiento` int(11) NOT NULL,
  `wc` int(11) NOT NULL,
  `calle` varchar(60) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `precioId` int(11) DEFAULT NULL,
  `categoriaId` int(11) DEFAULT NULL,
  `usuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `precioId` (`precioId`),
  KEY `categoriaId` (`categoriaId`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `propiedades_ibfk_1` FOREIGN KEY (`precioId`) REFERENCES `precios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `propiedades_ibfk_2` FOREIGN KEY (`categoriaId`) REFERENCES `categorias` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `propiedades_ibfk_3` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `categorias` (`id`, `nombre`, `createdAt`, `updatedAt`) VALUES
(1, 'Casa', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(2, 'Departamento', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(3, 'Bodega', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(4, 'Terreno', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(5, 'Cabaña', '2022-06-04 19:09:13', '2022-06-04 19:09:13');

INSERT INTO `mensajes` (`id`, `mensaje`, `createdAt`, `updatedAt`, `propiedadId`, `usuarioId`) VALUES
(1, 'Hola me interesa la propiedad, te dejo mi número 9184901481094', '2022-06-17 18:11:58', '2022-06-17 18:11:58', NULL, 2),
(3, 'Hola me interesa la propiedad, te dejo mi número 9184901481094', '2022-06-17 18:14:18', '2022-06-17 18:14:18', NULL, 2),
(4, 'Hola me interesa la propiedad, te dejo mi número 9184901481094', '2022-06-17 18:14:18', '2022-06-17 18:14:18', NULL, 2),
(7, 'Hola, me interesa la propiedad, puedes enviarme más fotos a mi celular 1021039103', '2022-06-17 22:43:56', '2022-06-17 22:43:56', NULL, 1);

INSERT INTO `precios` (`id`, `nombre`, `createdAt`, `updatedAt`) VALUES
(1, '0 - $10,000 USD', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(2, '$10,000 - $30,000 USD', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(3, '$30,000 - $50,000 USD', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(4, '$50,000 - $75,000 USD', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(5, '$75,000 - $100,000 USD', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(6, '$100,000 - $150,000 USD', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(7, '$150,000 - $200,000 USD', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(8, '$200,000 - $300,000 USD', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(9, '$300,000 - $500,000 USD', '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(10, '+ $500,000 USD', '2022-06-04 19:09:13', '2022-06-04 19:09:13');

INSERT INTO `propiedades` (`id`, `titulo`, `descripcion`, `habitaciones`, `estacionamiento`, `wc`, `calle`, `lat`, `lng`, `imagen`, `publicado`, `createdAt`, `updatedAt`, `precioId`, `categoriaId`, `usuarioId`) VALUES
('0b01ba03-b0cf-4027-82dd-fba028df2619', 'Cabaña Nueva sin utilizarse', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 2, 2, 4, '4947 E Olympic Blvd', '34.017498000000046', '-118.16319099999998', 'pupv27bibeo1g54vu8hu.jpg', 1, '2022-06-09 19:44:23', '2022-06-09 19:44:26', 10, 5, 1),
('1ae342b5-e89c-4b3f-97ed-03d52ab87ecf', 'Departamento Remodelado', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 1, 3, 3, '150 S Sunol Dr', '34.0348250065161', '-118.17838003774098', 'eu5h7g7ceoo1g54vron4.jpg', 1, '2022-06-09 19:43:00', '2022-06-17 21:42:15', 8, 2, 1),
('336ea231-b65b-47e5-b0b6-84ab3981e592', 'Cabaña en la Ciudad', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 2, 2, 4, '236 S Atlantic Blvd', '34.06048279865285', '-118.13355084009963', 'd91q1l1e3lo1g54vsbbn.jpg', 1, '2022-06-09 19:43:21', '2022-06-09 19:43:23', 9, 5, 1),
('34d06051-dc30-47d5-aea4-252fc90216e8', 'Casa Moderna de Lujo', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 4, 3, 4, '834 N Sanchez St', '34.02250536065068', '-118.09045268779383', 'qh25kvvima1g54vuv2l.jpg', 1, '2022-06-09 19:44:46', '2022-06-17 21:48:14', 10, 1, 1),
('3af9f4be-0715-4351-8c4d-b725f4440789', 'Torre Departamentos', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 2, 2, 2, '556 S Eastman Ave', '34.02902900428931', '-118.18603003313115', 'dd2qjucl01g1g54vpi39.jpg', 1, '2022-06-09 19:41:47', '2022-06-17 21:42:16', 9, 2, 1),
('461ec656-1ee8-4a63-a91a-1a306356d7dd', 'Cabaña Nueva ', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 2, 2, 2, '944 N Townsend Ave', '34.04733399117707', '-118.18814403293102', 'd3se0pu6rio1g5503vuj.jpg', 1, '2022-06-09 19:47:30', '2022-06-09 19:47:33', 7, 5, 1),
('6a860ef2-d208-4c86-9175-8aa95d8c23b5', 'Cabaña Nueva', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 1, 3, 3, 'E 3rd St', '34.03330004496188', '-118.17692756652833', 'k1iqh5l4u2o1g54vo2q5.jpg', 1, '2022-06-09 19:41:00', '2022-06-09 19:41:03', 10, 5, 1),
('73fd9952-61a2-4c9d-b877-60f0b409a6ef', 'Departamento de Lujo', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 3, 2, 4, '324 N McDonnell Ave', '34.03941200302886', '-118.16673698749707', '7cn12dpet6g1g54voqtr.jpg', 1, '2022-06-09 19:41:25', '2022-06-09 19:41:28', 7, 2, 1),
('753c670d-3b18-4f41-b46e-0ae91692262e', 'Torre Departamentos', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 2, 2, 2, '4520 E 6th St', '34.02753300221056', '-118.16916698504667', 'dclgl6h06581g55013j0.jpg', 1, '2022-06-09 19:45:55', '2022-06-09 19:45:59', 10, 2, 1),
('99481e04-0674-4072-bf7e-6aee446f5d71', 'Casa en el Bosque', 'Casa en la Playa, nueva y con 2 habitaciones', 2, 2, 3, '1127 Maple Ave', '34.03667600000006', '-118.25596299999995', 'codcfqod8v81g4tl9hru.jpg', 1, '2022-06-06 17:01:02', '2022-06-17 21:39:24', 2, 1, 1),
('9b88fbde-e189-4334-a55d-6692603de4d1', 'Casa con Alberca de Lujo', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 1, 4, 3, 'I-710 S', '34.04327002542246', '-118.1702599014017', '1bqlod7ppag1g54vtgv4.jpg', 1, '2022-06-09 19:43:59', '2022-06-09 19:44:02', 10, 1, 1),
('9b9dca3c-3fd4-4b70-b14d-9132e919600d', 'Casa Moderna', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 2, 3, 3, '1235 Dodds Cir', '34.052523017885406', '-118.19090302018026', 'kaefgoa0usg1g54vn88f.jpg', 1, '2022-06-09 19:40:32', '2022-06-09 19:40:36', 9, 1, 1),
('a8690059-dd28-4573-8796-44b3dad1d13a', 'Cabaña en el Bosque', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 2, 4, 1, '635 S Downey Rd', '34.02731201333334', '-118.18037995983863', 'nd8s9o00e7g1g5502v9o.jpg', 1, '2022-06-09 19:46:57', '2022-06-09 19:47:00', 5, 5, 1),
('aea6e044-b60d-4d88-9df9-e92a2e019381', 'Casa con Alberca', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 2, 3, 3, 'S Atlantic Blvd', '34.02223800000007', '-118.15633099999997', '8mnbaj6pdfg1g54vr35b.jpg', 1, '2022-06-09 19:42:38', '2022-06-09 19:42:42', 10, 1, 1),
('b14d11da-e382-4e73-ae61-0ee439d838b7', 'Departamento de Lujo', 'Casa en la Playa, nueva y con 2 habitaciones', 2, 2, 3, '917 Esperanza St', '34.02517500520925', '-118.19666499188014', 'b08crgq29rg1g4tkvhsm.jpg', 0, '2022-06-06 17:01:02', '2022-06-06 17:01:02', 2, 2, 1),
('b8cf3b62-6f22-49c6-808d-fb6f0add61f5', 'Departamento para 2 personas', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 2, 3, 4, '3520 E 3rd Pl', '34.03311678666196', '-118.19400545612105', 'qoa8666j5o81g5500fan.jpg', 1, '2022-06-09 19:45:33', '2022-06-09 19:45:38', 8, 2, 1),
('e3ab0462-a865-432e-afe5-f723d9b02009', 'Casa Nueva, Moderna', 'Aenean tempor tincidunt quam, et vehicula urna sodales nec. Suspendisse pharetra, urna nec consequat sodales, mi nisl accumsan ex, in efficitur est quam vel lorem. ', 2, 2, 1, 'I-710 N', '34.034183674445835', '-118.16989150574737', 'i9mmqb6b5bo1g54vqdbr.jpg', 1, '2022-06-09 19:42:16', '2022-06-09 19:42:20', 10, 1, 1);

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `token`, `confirmado`, `createdAt`, `updatedAt`) VALUES
(1, 'Juan', 'juan@juan.com', '$2b$10$UyVgkZl7UrJOiGxyVecKfu4i5por3rDRIYkI9PVioeVisuhsw9VxK', NULL, 1, '2022-06-04 19:09:13', '2022-06-04 19:09:13'),
(2, 'Pablo', 'correo@correo.com', '$2b$10$VeCy5Xm8DjQDpkBpSei4juLZmPXFXZimG9f9HMWeLtZN5zEz3FLMa', '', 1, '2022-06-06 18:25:04', '2022-06-06 18:25:04'),
(3, 'Juan Pablo', 'vendedor@vendedor.com', '$2b$10$6IgXNmFlVsoO1NYmaF1OGONYKPlqTp2I2XMoWfAsAnE6IpaXy1YxC', NULL, 1, '2022-06-17 22:34:51', '2022-06-17 22:35:16');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;