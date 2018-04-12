/*
SQLyog Community v12.5.1 (64 bit)
MySQL - 5.6.38-log : Database - webshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`webshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `webshop`;

/*Table structure for table `bag_ittem` */

DROP TABLE IF EXISTS `bag_ittem`;

CREATE TABLE `bag_ittem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `bag_ittem` */

insert  into `bag_ittem`(`id`,`user_id`,`product_id`) values 
(11,9,2);

/*Table structure for table `brand` */

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `brand` */

insert  into `brand`(`id`,`name`) values 
(1,'Levis'),
(2,'Nike'),
(3,'Edwin'),
(4,'New Balance'),
(5,'Jack & Jones'),
(6,'Paul Smith'),
(7,'Ray-Ban'),
(8,'Wood Wood');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`) values 
(4,'Man'),
(5,'Woman'),
(6,'Kid');

/*Table structure for table `color` */

DROP TABLE IF EXISTS `color`;

CREATE TABLE `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `color` */

insert  into `color`(`id`,`name`) values 
(1,'red'),
(2,'black'),
(3,'green'),
(4,'blue'),
(5,'dark blue'),
(6,'mars red');

/*Table structure for table `new_release` */

DROP TABLE IF EXISTS `new_release`;

CREATE TABLE `new_release` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `secondary_category_id` int(11) NOT NULL,
  `pick_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `secondary_category_id` (`secondary_category_id`),
  CONSTRAINT `new_release_ibfk_1` FOREIGN KEY (`secondary_category_id`) REFERENCES `secondary_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `new_release` */

insert  into `new_release`(`id`,`name`,`secondary_category_id`,`pick_url`) values 
(1,'New Balance ',16,'1522667952094_pi5.jpg'),
(2,'New Dress Colection',8,'1522668558532_v.jpg'),
(3,'New Sunglasses',18,'1522668776536_Newest-Cat-Eye-Sunglasses-Women-Brand-Designer-Twin-Beams-Sun-Glasses-Mirror-Sunglasses-Flat-Panel-Love.jpg');

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `pic_url` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK72mt33dhhs48hf9gcqrq4fxte` (`user_id`),
  CONSTRAINT `FK72mt33dhhs48hf9gcqrq4fxte` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `post` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `secondary_category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `main_pic_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`price`),
  KEY `category_id_2` (`category_id`),
  KEY `user_id` (`user_id`),
  KEY `secondary_category_id` (`secondary_category_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`secondary_category_id`) REFERENCES `secondary_category` (`id`),
  CONSTRAINT `product_ibfk_4` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`description`,`price`,`category_id`,`secondary_category_id`,`user_id`,`brand_id`,`main_pic_url`) values 
(2,'New Product','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',185,6,7,8,2,'1523461646559_2017-New-Superman-The-Boys-Cap-hip-hop-cap-snapback-hat-3-10-years-old-boys.jpg');

/*Table structure for table `product_coment` */

DROP TABLE IF EXISTS `product_coment`;

CREATE TABLE `product_coment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `product_coment` */

insert  into `product_coment`(`id`,`user_id`,`product_id`,`description`,`timestamp`) values 
(1,'9','2','Wow new review!!!!!!!','2018-04-12 11:07:41'),
(2,'9','2','review','2018-04-12 11:08:28'),
(3,'9','2','one more review','2018-04-12 12:01:02');

/*Table structure for table `product_picture` */

DROP TABLE IF EXISTS `product_picture`;

CREATE TABLE `product_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_picture_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `product_picture` */

insert  into `product_picture`(`id`,`pic_url`,`product_id`) values 
(5,'1523468143295_Brand-Hip-Hop-Caps-Snapback-Baseball-Hat-Casquette-Cap-Men-Women-Unisex-Diamond-S-Iron-Lady.jpg',2),
(6,'1523468149694_Cap-Batman-vs-Superman-Batman-V-Superman-Hat-Contrast-Logo-s.jpg',2),
(7,'1523468158400_image-hatsupjlarm5950-1-productimagenowatermark.jpg',2),
(8,'1523468167095_1257559-410_F.jpg',2);

/*Table structure for table `secondary_category` */

DROP TABLE IF EXISTS `secondary_category`;

CREATE TABLE `secondary_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `second_id` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `secondary_category` */

insert  into `secondary_category`(`id`,`name`) values 
(5,'Accessories'),
(1,'Bags'),
(7,'Caps & Hats'),
(8,'Hoodies & Sweatshirts'),
(9,'Jackets & Coats'),
(4,'Jeans'),
(11,'Jewellery'),
(12,'Jumpers & Cardigans'),
(13,'Leather Jackets'),
(14,'Long Sleeve T-Shirts'),
(15,'Loungewear'),
(16,'Shoes, Boots & Trainers'),
(3,'Shorts'),
(17,'Suits & Blazers'),
(18,'Sunglasses'),
(19,'Sweatpants'),
(20,'Swimwear'),
(6,'T-shirts'),
(21,'Trousers & Chinos'),
(22,'Underwear & Socks'),
(23,'Vests');

/*Table structure for table `size` */

DROP TABLE IF EXISTS `size`;

CREATE TABLE `size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` enum('XS','S','M','L','XL','XXL','XXXL') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `size` */

insert  into `size`(`id`,`size`) values 
(1,'L'),
(2,'M'),
(3,'S'),
(4,'XL'),
(5,'XS'),
(6,'XXL');

/*Table structure for table `slider_info` */

DROP TABLE IF EXISTS `slider_info`;

CREATE TABLE `slider_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `slider_info` */

insert  into `slider_info`(`id`,`title`,`description`) values 
(1,'Lorem Ipsum is not simply dummy','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor '),
(2,'There are many variations','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor .'),
(3,'Sed ut perspiciatis unde omnis','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor .');

/*Table structure for table `tag` */

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tag` */

insert  into `tag`(`id`,`name`) values 
(1,'design'),
(3,'fashion'),
(4,'cool'),
(5,'new');

/*Table structure for table `temp_color` */

DROP TABLE IF EXISTS `temp_color`;

CREATE TABLE `temp_color` (
  `first_id` int(11) NOT NULL,
  `second_id` int(11) NOT NULL,
  PRIMARY KEY (`first_id`,`second_id`),
  KEY `second_id` (`second_id`),
  CONSTRAINT `temp_color_ibfk_1` FOREIGN KEY (`first_id`) REFERENCES `product` (`id`),
  CONSTRAINT `temp_color_ibfk_2` FOREIGN KEY (`second_id`) REFERENCES `color` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `temp_color` */

insert  into `temp_color`(`first_id`,`second_id`) values 
(2,2),
(2,3),
(2,4),
(2,5),
(2,6);

/*Table structure for table `temp_size` */

DROP TABLE IF EXISTS `temp_size`;

CREATE TABLE `temp_size` (
  `first_id` int(11) NOT NULL,
  `second_id` int(11) NOT NULL,
  PRIMARY KEY (`first_id`,`second_id`),
  KEY `second_id` (`second_id`),
  CONSTRAINT `temp_size_ibfk_1` FOREIGN KEY (`first_id`) REFERENCES `product` (`id`),
  CONSTRAINT `temp_size_ibfk_2` FOREIGN KEY (`second_id`) REFERENCES `size` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `temp_size` */

insert  into `temp_size`(`first_id`,`second_id`) values 
(2,2),
(2,3),
(2,4);

/*Table structure for table `temp_tag` */

DROP TABLE IF EXISTS `temp_tag`;

CREATE TABLE `temp_tag` (
  `first_id` int(11) NOT NULL,
  `second_id` int(11) NOT NULL,
  UNIQUE KEY `first_id` (`first_id`,`second_id`),
  KEY `second_id` (`second_id`),
  CONSTRAINT `temp_tag_ibfk_3` FOREIGN KEY (`first_id`) REFERENCES `product` (`id`),
  CONSTRAINT `temp_tag_ibfk_4` FOREIGN KEY (`second_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `temp_tag` */

insert  into `temp_tag`(`first_id`,`second_id`) values 
(2,4),
(2,5);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  `user_type` enum('USER','ADMIN') NOT NULL DEFAULT 'USER',
  `verify` tinyint(1) DEFAULT '0',
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`surname`,`email`,`password`,`pic_url`,`user_type`,`verify`,`token`) values 
(6,'user','user','user@mail.ru','$2a$10$UmIrjs7JOw8hruyAGhDzneyX1G/cIWcHwFjCxlHfrj4M/drec2RtS','1519988118484_128.png','USER',1,NULL),
(8,'admin','admin','admin@gmail.com','$2a$10$8TVgz3QCTSv7DTR6WmtqruxqCuM.k0KZR2uxKfWoo2Jj1MKZmwFQC','1520324862540_498fa6cfdbd09b429438a2192c4df63d.jpg','ADMIN',1,NULL),
(9,'heno','sargsyan','heno7500@gmail.com','$2a$10$hHCMyjVw/bJT9GrWFH4VuO2WAL.ase.HAmDRQrPkyXILVvB6SkQF6',NULL,'USER',1,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
