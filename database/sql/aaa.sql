-- --------------------------------------------------------
-- Hôte:                         localhost
-- Version du serveur:           11.8.3-MariaDB-ubu2404 - mariadb.org binary distribution
-- SE du serveur:                debian-linux-gnu
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage des données de la table db_users.t_user : ~10 rows (environ)
INSERT INTO `t_user` (`user_id`, `user_email`, `user_lastname`, `user_firstname`, `user_password`, `role_id`) VALUES
	(1, 'toto@example.fr', 'ingals', 'charles', 'azerty', 3),
	(2, 'bertrand@example.com', 'macron', 'richard', '123456', 1),
	(3, 'germaine.lustrucru@example.fr', 'lustucru', NULL, '1234', 2),
	(4, 'daniel@example.com', 'Hatcher', 'daniel', '4be3b3a4ad275152d7d6cbddda41a6e1', 1),
	(5, 'celine@example.com', 'dion', 'céline', 'rené', 2),
	(6, 'ella.danloss@example.com', 'Danloss', 'Ella', '12345', 4),
	(7, 'j.golay@example.fr', 'Golay', 'Jerry', 'azerty', 4),
	(8, 'medhi@example.fr', 'Camant', 'Medhi', 'password', 5),
	(9, 'aj@example.com', 'Javelle', 'Aude', '121180', 4),
	(10, 'jescr@example.fr', 'Scroute', 'Jessica', '231297', 6);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
