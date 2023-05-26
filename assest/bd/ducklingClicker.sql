DROP SCHEMA IF EXISTS ducklingClicker;
CREATE SCHEMA ducklingClicker;
USE ducklingClicker;

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`(
    id_role INT(10) PRIMARY KEY AUTO_INCREMENT,
    name_role varchar(10) NOT NULL
);

INSERT INTO `role` VALUES(0,"Member");
INSERT INTO `role` VALUES(1,"Administrator");

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
    id_user INT(10) PRIMARY KEY AUTO_INCREMENT,
    username varchar(10) NOT NULL UNIQUE,
    email varchar(50) NOT NULL UNIQUE,
    `password` varchar(16) NOT NULL,
    avatar varchar(15),
    `role`  INT(10) NOT NULL UNIQUE DEFAULT 0,
    ducklings DOUBLE default 0,
        CONSTRAINT fk_role_user FOREIGN KEY(`role`) REFERENCES `role`(id_role)
);

INSERT INTO `user` VALUES(0,"Admin","admin@admin.com","contraseña","default.jpg",1,0);
INSERT INTO `user` VALUES(1,"ManoGafo","ManoGafo@gmail.com","123456asd","default.jpg",0,0);

DROP TABLE IF EXISTS item;
CREATE TABLE item(
    id_item INT(10) PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(10),
    `description` varchar(100),
    `image` varchar(50),
    price DOUBLE,
    production float
);

INSERT INTO item VALUES(0,"Click","Description 0","click.png",0,1);
INSERT INTO item VALUES(1,"Pea","Description 1","pea.png",10,0.1);
INSERT INTO item VALUES(2,"Rocs","Description 2","rock.png",100,2);
INSERT INTO item VALUES(3,"Snail","Description 3","snail.png",200,4);
INSERT INTO item VALUES(4,"Viking","Description 4","viking.png",300,6);
INSERT INTO item VALUES(5,"Gentleduck","Description 5","gentleduck.png",400,8);
INSERT INTO item VALUES(6,"Mecha-duck","Description 6","mecha-duck.png",500,10);

DROP TABLE IF EXISTS user_item;
CREATE TABLE user_item(
    id_user_item INT(50) PRIMARY KEY AUTO_INCREMENT,
    id_user INT(10) NOT NULL,
    id_item INT(10) NOT NULL,
    quantity INT(255) DEFAULT 0,
        CONSTRAINT fk_user_item FOREIGN KEY(id_user) REFERENCES `user`(id_user),
        CONSTRAINT fk_item_user FOREIGN KEY(id_item) REFERENCES item(id_item)
);
/* user_item OF Admin */
INSERT INTO user_item VALUES(0,0,0,0);
INSERT INTO user_item VALUES(1,0,1,0);
INSERT INTO user_item VALUES(2,0,2,0);
INSERT INTO user_item VALUES(3,0,3,0);
INSERT INTO user_item VALUES(4,0,4,0);
INSERT INTO user_item VALUES(5,0,5,0);
INSERT INTO user_item VALUES(6,0,6,0);

/* user_item OF ManoGafo */
INSERT INTO user_item VALUES(7,1,0,0);
INSERT INTO user_item VALUES(8,1,1,0);
INSERT INTO user_item VALUES(9,1,2,0);
INSERT INTO user_item VALUES(10,1,3,0);
INSERT INTO user_item VALUES(11,1,4,0);
INSERT INTO user_item VALUES(12,1,5,0);
INSERT INTO user_item VALUES(13,1,6,0);

DROP TABLE IF EXISTS upgrade;
CREATE TABLE upgrade(
    id_upgrade int(50) PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(20),
    `description` varchar(50),
    `image` varchar(50),
    price DOUBLE,
    production float
);

/* CLICKS UPGRADES ID=0 */
INSERT INTO upgrade VALUES(0,"click 1", "click are now 15% more effective", "upgradeClick1.png", 100, 1.15);
INSERT INTO upgrade VALUES(1,"click 2", "click are now 15% more effective", "upgradeClick2.png", 300, 1.15);
INSERT INTO upgrade VALUES(2,"click 3", "click are now 15% more effective", "upgradeClick3.png", 600, 1.15);
INSERT INTO upgrade VALUES(3,"click 4", "click are now 15% more effective", "upgradeClick4.png", 100, 1.15);
INSERT INTO upgrade VALUES(4,"click 5", "click are now 15% more effective", "upgradeClick5.png", 150, 1.15);

/* PEAS UPGRADES ID=1*/
INSERT INTO upgrade VALUES(5,"pea 1", "Peas are now 15% more effective", "upgradePea1.png", 150, 1.15);
INSERT INTO upgrade VALUES(6,"pea 2", "Peas are now 15% more effective", "upgradePea2.png", 300, 1.15);
INSERT INTO upgrade VALUES(7,"pea 3", "Peas are now 15% more effective", "upgradePea3.png", 300, 1.15);
INSERT INTO upgrade VALUES(8,"pea 4", "Peas are now 15% more effective", "upgradePea4.png", 150, 1.15);
INSERT INTO upgrade VALUES(9,"pea 5", "Peas are now 15% more effective", "upgradePea5.png", 00, 1.15);

/* ROCKS UPGRADES ID=2*/
INSERT INTO upgrade VALUES(10,"Rock 1", "Rocks are now 15% more effective", "upgradeRock1.png", 0, 1.15);
INSERT INTO upgrade VALUES(11,"Rock 2", "Rocks are now 15% more effective", "upgradeRock2.png", 0, 1.15);
INSERT INTO upgrade VALUES(12,"Rock 3", "Rocks are now 15% more effective", "upgradeRock3.png", 0, 1.15);
INSERT INTO upgrade VALUES(13,"Rock 4", "Rocks are now 15% more effective", "upgradeRock4.png", 0, 1.15);
INSERT INTO upgrade VALUES(14,"Rock 5", "Rocks are now 15% more effective", "upgradeRock5.png", 0, 1.15);

/* SNAILS UPGRADES ID=3*/
INSERT INTO upgrade VALUES(15,"Snail 1", "Snails are now 15% more effective", "upgradeSnail1.png", 0, 1.15);
INSERT INTO upgrade VALUES(16,"Snail 2", "Snails are now 15% more effective", "upgradeSnail2.png", 0, 1.15);
INSERT INTO upgrade VALUES(17,"Snail 3", "Snails are now 15% more effective", "upgradeSnail3.png", 0, 1.15);
INSERT INTO upgrade VALUES(18,"Snail 4", "Snails are now 15% more effective", "upgradeSnail4.png", 0, 1.15);
INSERT INTO upgrade VALUES(19,"Snail 5", "Snails are now 15% more effective", "upgradeSnail5.png", 0, 1.15);

/* VIKINGS UPGRADES ID=4*/
INSERT INTO upgrade VALUES(20,"Viking 1", "Vikings are now 15% more effective", "upgradeViking1.png", 0, 1.15);
INSERT INTO upgrade VALUES(21,"Viking 2", "Vikings are now 15% more effective", "upgradeViking2.png", 0, 1.15);
INSERT INTO upgrade VALUES(22,"Viking 3", "Vikings are now 15% more effective", "upgradeViking3.png", 0, 1.15);
INSERT INTO upgrade VALUES(23,"Viking 4", "Vikings are now 15% more effective", "upgradeViking4.png", 0, 1.15);
INSERT INTO upgrade VALUES(24,"Viking 5", "Vikings are now 15% more effective", "upgradeViking5.png", 0, 1.15);

/* GENTELDUCKS UPGRADES ID=5*/
INSERT INTO upgrade VALUES(25,"Gentleduck 1", "Gentenmens are now 15% more effective", "upgradeGentleduck1.png", 0, 1.15);
INSERT INTO upgrade VALUES(26,"Gentleduck 2", "Gentenmens are now 15% more effective", "upgradeGentleduck2.png", 0, 1.15);
INSERT INTO upgrade VALUES(27,"Gentleduck 3", "Gentenmens are now 15% more effective", "upgradeGentleduck3.png", 0, 1.15);
INSERT INTO upgrade VALUES(28,"Gentleduck 4", "Gentenmens are now 15% more effective", "upgradeGentleduck4.png", 0, 1.15);
INSERT INTO upgrade VALUES(29,"Gentleduck 5", "Gentenmens are now 15% more effective", "upgradeGentleduck5.png", 0, 1.15);

/* MECHA-DUCKS UPGRADES ID=6*/
INSERT INTO upgrade VALUES(30,"Mecha-Duck 1", "Mecha-Ducks are now 15% more effective", "upgradeMecha1.png", 0, 1.15);
INSERT INTO upgrade VALUES(31,"Mecha-Duck 2", "Mecha-Ducks are now 15% more effective", "upgradeMecha2.png", 0, 1.15);
INSERT INTO upgrade VALUES(32,"Mecha-Duck 3", "Mecha-Ducks are now 15% more effective", "upgradeMecha3.png", 0, 1.15);
INSERT INTO upgrade VALUES(33,"Mecha-Duck 4", "Mecha-Ducks are now 15% more effective", "upgradeMecha4.png", 0, 1.15);
INSERT INTO upgrade VALUES(34,"Mecha-Duck 5", "Mecha-Ducks are now 15% more effective", "upgradeMecha5.png", 0, 1.15);

/* MULTIPLE UPGRADES */
INSERT INTO Upgrade VALUES(35,"Multiple Items 1", "Alls items are now 10% more effective","MultipleUpgrade1.png",0,0);
INSERT INTO Upgrade VALUES(36,"Multiple Items 2", "Alls items are now 10% more effective","MultipleUpgrade2.png",0,0);
INSERT INTO Upgrade VALUES(37,"Multiple Items 3", "Alls items are now 10% more effective","MultipleUpgrade3.png",0,0);
INSERT INTO Upgrade VALUES(38,"Multiple Items 4", "Alls items are now 10% more effective","MultipleUpgrade4.png",0,0);
INSERT INTO Upgrade VALUES(39,"Multiple Items 5", "Alls items are now 10% more effective","MultipleUpgrade5.png",0,0);

DROP TABLE IF EXISTS item_upgrade;
CREATE TABLE item_upgrade(
    id_item_upgrade DOUBLE PRIMARY KEY AUTO_INCREMENT,
    id_item int(10) NOT NULL,
    id_upgrade int(50) NOT NULL,
        CONSTRAINT fk_item_upgrade FOREIGN KEY(id_item) REFERENCES item(id_item),
        CONSTRAINT fk_upgrade_item FOREIGN KEY(id_upgrade) REFERENCES upgrade(id_upgrade)
);

/* CLICKS UPGRADES */
INSERT INTO item_upgrade VALUES(0,0,0);
INSERT INTO item_upgrade VALUES(1,0,1);
INSERT INTO item_upgrade VALUES(2,0,2);
INSERT INTO item_upgrade VALUES(3,0,3);
INSERT INTO item_upgrade VALUES(4,0,4);
/* PEAS UPGRADES */
INSERT INTO item_upgrade VALUES(5,1,5);
INSERT INTO item_upgrade VALUES(6,1,6);
INSERT INTO item_upgrade VALUES(7,1,7);
INSERT INTO item_upgrade VALUES(8,1,8);
INSERT INTO item_upgrade VALUES(9,1,9);
/* ROCKS UPGRADES */
INSERT INTO item_upgrade VALUES(10,2,10);
INSERT INTO item_upgrade VALUES(11,2,11);
INSERT INTO item_upgrade VALUES(12,2,12);
INSERT INTO item_upgrade VALUES(13,2,13);
INSERT INTO item_upgrade VALUES(14,2,14);
/* SNAILS UPGRADES */
INSERT INTO item_upgrade VALUES(15,3,15);
INSERT INTO item_upgrade VALUES(16,3,16);
INSERT INTO item_upgrade VALUES(17,3,17);
INSERT INTO item_upgrade VALUES(18,3,18);
INSERT INTO item_upgrade VALUES(19,3,19);
/* VIKINGS UPGRADES */
INSERT INTO item_upgrade VALUES(20,4,20);
INSERT INTO item_upgrade VALUES(21,4,21);
INSERT INTO item_upgrade VALUES(22,4,22);
INSERT INTO item_upgrade VALUES(23,4,23);
INSERT INTO item_upgrade VALUES(24,4,24);
/* GENTLEDUCKS UPGRADES */
INSERT INTO item_upgrade VALUES(25,5,25);
INSERT INTO item_upgrade VALUES(26,5,26);
INSERT INTO item_upgrade VALUES(27,5,27);
INSERT INTO item_upgrade VALUES(28,5,28);
INSERT INTO item_upgrade VALUES(29,5,29);
/* MECHA-DUCKS UPGRADES */
INSERT INTO item_upgrade VALUES(30,6,30);
INSERT INTO item_upgrade VALUES(31,6,31);
INSERT INTO item_upgrade VALUES(32,6,32);
INSERT INTO item_upgrade VALUES(33,6,33);
INSERT INTO item_upgrade VALUES(34,6,34);
/* MULTIPLES UPGRADES */
    /*Multiple Items 1*/
    INSERT INTO item_upgrade VALUES(35,1,35);
    INSERT INTO item_upgrade VALUES(36,2,35);
    INSERT INTO item_upgrade VALUES(37,3,35);
    INSERT INTO item_upgrade VALUES(38,4,35);
    INSERT INTO item_upgrade VALUES(39,5,35);
    INSERT INTO item_upgrade VALUES(40,6,35);
    /*Multiple Items 2*/
    INSERT INTO item_upgrade VALUES(41,1,36);
    INSERT INTO item_upgrade VALUES(42,2,36);
    INSERT INTO item_upgrade VALUES(43,3,36);
    INSERT INTO item_upgrade VALUES(44,4,36);
    INSERT INTO item_upgrade VALUES(45,5,36);
    INSERT INTO item_upgrade VALUES(46,6,36);
    /*Multiple Items 3*/
    INSERT INTO item_upgrade VALUES(47,1,37);
    INSERT INTO item_upgrade VALUES(48,2,37);
    INSERT INTO item_upgrade VALUES(49,3,37);
    INSERT INTO item_upgrade VALUES(50,4,37);
    INSERT INTO item_upgrade VALUES(51,5,37);
    INSERT INTO item_upgrade VALUES(52,6,37);
    /*Multiple Items 4*/
    INSERT INTO item_upgrade VALUES(53,1,38);
    INSERT INTO item_upgrade VALUES(54,2,38);
    INSERT INTO item_upgrade VALUES(55,3,38);
    INSERT INTO item_upgrade VALUES(56,4,38);
    INSERT INTO item_upgrade VALUES(57,5,38);
    INSERT INTO item_upgrade VALUES(58,6,38);
    /*Multiple Items 5*/
    INSERT INTO item_upgrade VALUES(59,1,39);
    INSERT INTO item_upgrade VALUES(60,2,39);
    INSERT INTO item_upgrade VALUES(61,3,39);
    INSERT INTO item_upgrade VALUES(62,4,39);
    INSERT INTO item_upgrade VALUES(63,5,39);
    INSERT INTO item_upgrade VALUES(64,6,39);

DROP TABLE IF EXISTS upgrade_requirement;
CREATE TABLE upgrade_requirement(
    id_requirement DOUBLE PRIMARY KEY AUTO_INCREMENT,
    id_upgrade int(50) NOT NULL,
    id_item int(10) NOT NULL,
    quantity DOUBLE NOT NULL,
        CONSTRAINT fk_upgrade_requirement FOREIGN KEY(id_upgrade) REFERENCES upgrade(id_upgrade),
        CONSTRAINT fk_requirement_upgrade FOREIGN KEY(id_item) REFERENCES item(id_item)
);

/* CLICKS Upgrade Requirement */
INSERT INTO upgrade_requirement VALUES(0,0,0,100);
INSERT INTO upgrade_requirement VALUES(1,1,0,1000);
INSERT INTO upgrade_requirement VALUES(2,2,0,10000);
INSERT INTO upgrade_requirement VALUES(3,3,0,100000);
INSERT INTO upgrade_requirement VALUES(4,4,0,1000000);
/* PEAS Upgrade Requirement */
INSERT INTO upgrade_requirement VALUES(5,5,1,1);
INSERT INTO upgrade_requirement VALUES(6,6,1,1);
INSERT INTO upgrade_requirement VALUES(7,7,1,1);
INSERT INTO upgrade_requirement VALUES(8,8,1,1);
INSERT INTO upgrade_requirement VALUES(9,9,1,1);
/* ROCKS Upgrade Requirement */
INSERT INTO upgrade_requirement VALUES(10,10,2,1);
INSERT INTO upgrade_requirement VALUES(11,11,2,1);
INSERT INTO upgrade_requirement VALUES(12,12,2,1);
INSERT INTO upgrade_requirement VALUES(13,13,2,1);
INSERT INTO upgrade_requirement VALUES(14,14,2,1);
/*SNAILS upgrade Requirement*/
INSERT INTO upgrade_requirement VALUES(15,15,3,1);
INSERT INTO upgrade_requirement VALUES(16,16,3,1);
INSERT INTO upgrade_requirement VALUES(17,17,3,1);
INSERT INTO upgrade_requirement VALUES(18,19,3,1);
INSERT INTO upgrade_requirement VALUES(19,19,3,1);
/* VIKIGS Upgrade Requirement */
INSERT INTO upgrade_requirement VALUES(20,20,4,1);
INSERT INTO upgrade_requirement VALUES(21,21,4,1);
INSERT INTO upgrade_requirement VALUES(22,22,4,1);
INSERT INTO upgrade_requirement VALUES(23,23,4,1);
INSERT INTO upgrade_requirement VALUES(24,24,4,1);
/* Gentleducks Upgrade Requirement */
INSERT INTO upgrade_requirement VALUES(25,25,5,1);
INSERT INTO upgrade_requirement VALUES(26,26,5,1);
INSERT INTO upgrade_requirement VALUES(27,27,5,1);
INSERT INTO upgrade_requirement VALUES(28,28,5,1);
INSERT INTO upgrade_requirement VALUES(29,29,5,1);
/* MECHA-DUCKS Upgrade Requirement */
INSERT INTO upgrade_requirement VALUES(30,30,6,1);
INSERT INTO upgrade_requirement VALUES(31,31,6,1);
INSERT INTO upgrade_requirement VALUES(32,32,6,1);
INSERT INTO upgrade_requirement VALUES(33,33,6,1);
INSERT INTO upgrade_requirement VALUES(34,34,6,1);
/* MULTIPLE Upgrade Requirement*/
    /*Multiple Items 1*/
    INSERT INTO upgrade_requirement VALUES(35,35,1,1);
    INSERT INTO upgrade_requirement VALUES(36,35,2,1);
    INSERT INTO upgrade_requirement VALUES(37,35,3,1);
    INSERT INTO upgrade_requirement VALUES(38,35,4,1);
    INSERT INTO upgrade_requirement VALUES(39,35,5,1);
    INSERT INTO upgrade_requirement VALUES(40,35,6,1);
    /*Multiple Items 2*/
    INSERT INTO upgrade_requirement VALUES(41,36,1,1);
    INSERT INTO upgrade_requirement VALUES(42,36,2,1);
    INSERT INTO upgrade_requirement VALUES(43,36,3,1);
    INSERT INTO upgrade_requirement VALUES(44,36,4,1);
    INSERT INTO upgrade_requirement VALUES(45,36,5,1);
    INSERT INTO upgrade_requirement VALUES(46,36,6,1);
    /*Multiple Items 3*/
    INSERT INTO upgrade_requirement VALUES(47,37,1,1);
    INSERT INTO upgrade_requirement VALUES(48,37,2,1);
    INSERT INTO upgrade_requirement VALUES(49,37,3,1);
    INSERT INTO upgrade_requirement VALUES(50,37,4,1);
    INSERT INTO upgrade_requirement VALUES(51,37,5,1);
    INSERT INTO upgrade_requirement VALUES(52,37,6,1);
    /*Multiple Items 4*/
    INSERT INTO upgrade_requirement VALUES(53,38,1,1);
    INSERT INTO upgrade_requirement VALUES(54,38,2,1);
    INSERT INTO upgrade_requirement VALUES(55,38,3,1);
    INSERT INTO upgrade_requirement VALUES(56,38,4,1);
    INSERT INTO upgrade_requirement VALUES(57,38,5,1);
    INSERT INTO upgrade_requirement VALUES(58,38,6,1);
    /*Multiple Items 5*/
    INSERT INTO upgrade_requirement VALUES(59,39,1,1);
    INSERT INTO upgrade_requirement VALUES(60,39,2,1);
    INSERT INTO upgrade_requirement VALUES(61,39,3,1);
    INSERT INTO upgrade_requirement VALUES(62,39,4,1);
    INSERT INTO upgrade_requirement VALUES(63,39,5,1);
    INSERT INTO upgrade_requirement VALUES(64,39,6,1);

DROP TABLE IF EXISTS user_upgrade;
CREATE TABLE user_upgrade(
    id_user_upgrade DOUBLE PRIMARY KEY AUTO_INCREMENT,
    id_user INT(10),
    id_upgrade int(50),
        CONSTRAINT fk_user_upgrade FOREIGN KEY(id_user) REFERENCES `user`(id_user),
        CONSTRAINT fk_upgrade_user FOREIGN KEY(id_upgrade) REFERENCES upgrade(id_upgrade)
);

DROP TABLE IF EXISTS achievement;
CREATE TABLE achievement(
    id_achievement int(50) PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(20),
    `description` varchar(50),
    `image` varchar(50)
);

/* CLICK ACHIEVEMENTS */
INSERT INTO achievement VALUES(0,"click 1", "Make 1,000 duckling from clicking.", "achievementClick1.png");
INSERT INTO achievement VALUES(1,"click 2", "Make 10,000 duckling from clicking.", "achievementClick2.png");
INSERT INTO achievement VALUES(2,"click 3", "Make 10 million duckling from clicking.", "achievementClick3.png");
INSERT INTO achievement VALUES(3,"click 4", "Make 1 billion duckling from clicking.", "achievementClick4.png");
INSERT INTO achievement VALUES(4,"click 5", "Make 100 billion duckling from clicking.", "achievementClick5.png");

/* PEA ACHIEVEMENTS */
INSERT INTO achievement VALUES(5,"pea 1", "Have 1 Pea.", "achievementPea1.png");
INSERT INTO achievement VALUES(6,"pea 2", "Have 50 Peas.", "achievementPea2.png");
INSERT INTO achievement VALUES(7,"pea 3", "Have 100 Peas.", "achievementPea3.png");
INSERT INTO achievement VALUES(8,"pea 4", "Have 200 Peas.", "achievementPea4.png");
INSERT INTO achievement VALUES(9,"pea 5", "Have 300 Peas.", "achievementPea5.png");

/* ROCK ACHIEVEMENTS */
INSERT INTO achievement VALUES(10,"Rock 1", "Have 1 Rock.", "achievementRock1.png");
INSERT INTO achievement VALUES(11,"Rock 2", "Have 50 Rocks.", "achievementRock2.png");
INSERT INTO achievement VALUES(12,"Rock 3", "Have 100 Rocks.", "achievementRock3.png");
INSERT INTO achievement VALUES(13,"Rock 4", "Have 200 Rocks.", "achievementRock4.png");
INSERT INTO achievement VALUES(14,"Rock 5", "Have 300 Rocks.", "achievementRock5.png");

/* SNAIL ACHIEVEMENTS */
INSERT INTO achievement VALUES(15,"Snail 1", "Have 1 Snail.", "achievementSnail1.png");
INSERT INTO achievement VALUES(16,"Snail 2", "Have 50 Snail.", "achievementSnail2.png");
INSERT INTO achievement VALUES(17,"Snail 3", "Have 100 Snail.", "achievementSnail3.png");
INSERT INTO achievement VALUES(18,"Snail 4", "Have 200 Snail.", "achievementSnail4.png");
INSERT INTO achievement VALUES(19,"Snail 5", "Have 300 Snail.", "achievementSnail5.png");

/* VIKING ACHIEVEMENTS */
INSERT INTO achievement VALUES(20,"Viking 1", "Have 1 Viking.", "achievementViking1.png");
INSERT INTO achievement VALUES(21,"Viking 2", "Have 50 Viking.", "achievementViking2.png");
INSERT INTO achievement VALUES(22,"Viking 3", "Have 100 Viking.", "achievementViking3.png");
INSERT INTO achievement VALUES(23,"Viking 4", "Have 200 Viking.", "achievementViking4.png");
INSERT INTO achievement VALUES(24,"Viking 5", "Have 300 Viking.", "achievementViking5.png");

/* GELTENDUCK ACHIEVEMENTS */
INSERT INTO achievement VALUES(25,"Gentleduck 1", "Have 1 Gentleduck", "achievementGentenduck1.png");
INSERT INTO achievement VALUES(26,"Gentleduck 2", "Have 50 Gentleduck", "achievementGentenduck2.png");
INSERT INTO achievement VALUES(27,"Gentleduck 3", "Have 100 Gentleduck", "achievementGentenduck3.png");
INSERT INTO achievement VALUES(28,"Gentleduck 4", "Have 200 Gentleduck", "achievementGentenduck4.png");
INSERT INTO achievement VALUES(29,"Gentleduck 5", "Have 300 Gentleduck", "achievementGentenduck5.png");

/* MECHA-DUCK ACHIEVEMENTS */
INSERT INTO achievement VALUES(30,"Mecha-Duck 1", "Have 1 Mecha-Duck", "achievementMechaDuck1.png");
INSERT INTO achievement VALUES(31,"Mecha-Duck 2", "Have 50 Mecha-Duck", "achievementMechaDuck2.png");
INSERT INTO achievement VALUES(32,"Mecha-Duck 3", "Have 100 Mecha-Duck", "achievementMechaDuck3.png");
INSERT INTO achievement VALUES(33,"Mecha-Duck 4", "Have 200 Mecha-Duck", "achievementMechaDuck4.png");
INSERT INTO achievement VALUES(34,"Mecha-Duck 5", "Have 300 Mecha-Duck", "achievementMechaDuck5.png");

/* MULTIPLE ACHIEVEMENTS */
INSERT INTO achievement VALUES(35,"Multiple 1", "Have 1 object of each", "achievementMultiple1.png");
INSERT INTO achievement VALUES(36,"Multiple 2", "Have 50 objects of each", "achievementMultiple2.png");
INSERT INTO achievement VALUES(37,"Multiple 3", "Have 100 objects of each", "achievementMultiple3.png");
INSERT INTO achievement VALUES(38,"Multiple 4", "Have 200 objects of each", "achievementMultiple4.png");
INSERT INTO achievement VALUES(39,"Multiple 5", "Have 300 objects of each", "achievementMultiple5.png");


DROP TABLE IF EXISTS achievement_requirement;
CREATE TABLE achievement_requirement(
    id_requirement DOUBLE PRIMARY KEY AUTO_INCREMENT,
    id_achievement int(50) NOT NULL,
    id_item int(10) NOT NULL,
    quantity DOUBLE NOT NULL,
        CONSTRAINT fk_achievement_requirement FOREIGN KEY(id_achievement) REFERENCES achievement(id_achievement),
        CONSTRAINT fk_requirement_achievement FOREIGN KEY(id_item) REFERENCES item(id_item)
);
/* CLICKS Achievement Requirement */
INSERT INTO achievement_requirement VALUES(0,0,0,100);
INSERT INTO achievement_requirement VALUES(1,1,0,1000);
INSERT INTO achievement_requirement VALUES(2,2,0,10000);
INSERT INTO achievement_requirement VALUES(3,3,0,100000);
INSERT INTO achievement_requirement VALUES(4,4,0,1000000);
/* PEAS Achievement Requirement */
INSERT INTO achievement_requirement VALUES(5,5,1,1);
INSERT INTO achievement_requirement VALUES(6,6,1,1);
INSERT INTO achievement_requirement VALUES(7,7,1,1);
INSERT INTO achievement_requirement VALUES(8,8,1,1);
INSERT INTO achievement_requirement VALUES(9,9,1,1);
/* ROCKS Achievement Requirement */
INSERT INTO achievement_requirement VALUES(10,10,2,1);
INSERT INTO achievement_requirement VALUES(11,11,2,1);
INSERT INTO achievement_requirement VALUES(12,12,2,1);
INSERT INTO achievement_requirement VALUES(13,13,2,1);
INSERT INTO achievement_requirement VALUES(14,14,2,1);
/*SNAILS achievement Requirement*/
INSERT INTO achievement_requirement VALUES(15,15,3,1);
INSERT INTO achievement_requirement VALUES(16,16,3,1);
INSERT INTO achievement_requirement VALUES(17,17,3,1);
INSERT INTO achievement_requirement VALUES(18,19,3,1);
INSERT INTO achievement_requirement VALUES(19,19,3,1);
/* VIKIGS Achievement Requirement */
INSERT INTO achievement_requirement VALUES(20,20,4,1);
INSERT INTO achievement_requirement VALUES(21,21,4,1);
INSERT INTO achievement_requirement VALUES(22,22,4,1);
INSERT INTO achievement_requirement VALUES(23,23,4,1);
INSERT INTO achievement_requirement VALUES(24,24,4,1);
/* Gentleducks Achievement Requirement */
INSERT INTO achievement_requirement VALUES(25,25,5,1);
INSERT INTO achievement_requirement VALUES(26,26,5,1);
INSERT INTO achievement_requirement VALUES(27,27,5,1);
INSERT INTO achievement_requirement VALUES(28,28,5,1);
INSERT INTO achievement_requirement VALUES(29,29,5,1);
/* MECHA-DUCKS Achievement Requirement */
INSERT INTO achievement_requirement VALUES(30,30,6,1);
INSERT INTO achievement_requirement VALUES(31,31,6,1);
INSERT INTO achievement_requirement VALUES(32,32,6,1);
INSERT INTO achievement_requirement VALUES(33,33,6,1);
INSERT INTO achievement_requirement VALUES(34,34,6,1);
/* MULTIPLE Achievement Requirement*/
    /*Multiple Items 1*/
    INSERT INTO achievement_requirement VALUES(35,35,1,1);
    INSERT INTO achievement_requirement VALUES(36,35,2,1);
    INSERT INTO achievement_requirement VALUES(37,35,3,1);
    INSERT INTO achievement_requirement VALUES(38,35,4,1);
    INSERT INTO achievement_requirement VALUES(39,35,5,1);
    INSERT INTO achievement_requirement VALUES(40,35,6,1);
    /*Multiple Items 2*/
    INSERT INTO achievement_requirement VALUES(41,36,1,1);
    INSERT INTO achievement_requirement VALUES(42,36,2,1);
    INSERT INTO achievement_requirement VALUES(43,36,3,1);
    INSERT INTO achievement_requirement VALUES(44,36,4,1);
    INSERT INTO achievement_requirement VALUES(45,36,5,1);
    INSERT INTO achievement_requirement VALUES(46,36,6,1);
    /*Multiple Items 3*/
    INSERT INTO achievement_requirement VALUES(47,37,1,1);
    INSERT INTO achievement_requirement VALUES(48,37,2,1);
    INSERT INTO achievement_requirement VALUES(49,37,3,1);
    INSERT INTO achievement_requirement VALUES(50,37,4,1);
    INSERT INTO achievement_requirement VALUES(51,37,5,1);
    INSERT INTO achievement_requirement VALUES(52,37,6,1);
    /*Multiple Items 4*/
    INSERT INTO achievement_requirement VALUES(53,38,1,1);
    INSERT INTO achievement_requirement VALUES(54,38,2,1);
    INSERT INTO achievement_requirement VALUES(55,38,3,1);
    INSERT INTO achievement_requirement VALUES(56,38,4,1);
    INSERT INTO achievement_requirement VALUES(57,38,5,1);
    INSERT INTO achievement_requirement VALUES(58,38,6,1);
    /*Multiple Items 5*/
    INSERT INTO achievement_requirement VALUES(59,39,1,1);
    INSERT INTO achievement_requirement VALUES(60,39,2,1);
    INSERT INTO achievement_requirement VALUES(61,39,3,1);
    INSERT INTO achievement_requirement VALUES(62,39,4,1);
    INSERT INTO achievement_requirement VALUES(63,39,5,1);
    INSERT INTO achievement_requirement VALUES(64,39,6,1);



DROP TABLE IF EXISTS user_achievement;
CREATE TABLE user_achievement(
    id_user_achievement DOUBLE PRIMARY KEY AUTO_INCREMENT,
    id_user INT(10),
    id_achievement int(50),
    CONSTRAINT fk_user_Achievement FOREIGN KEY(id_user) REFERENCES `user`(id_user),
    CONSTRAINT fk_Achievement_user FOREIGN KEY(id_achievement) REFERENCES achievement(id_achievement)
);

DELIMITER //
CREATE TRIGGER Create_User_Item AFTER INSERT ON `user`
for EACH row BEGIN
    INSERT INTO user_item(id_user,id_item,quantity) VALUES (New.id_user,0,0);
    INSERT INTO user_item(id_user,id_item,quantity) VALUES (New.id_user,1,0);
    INSERT INTO user_item(id_user,id_item,quantity) VALUES (New.id_user,2,0);
    INSERT INTO user_item(id_user,id_item,quantity) VALUES (New.id_user,3,0);
    INSERT INTO user_item(id_user,id_item,quantity) VALUES (New.id_user,4,0);
    INSERT INTO user_item(id_user,id_item,quantity) VALUES (New.id_user,5,0);
    INSERT INTO user_item(id_user,id_item,quantity) VALUES (New.id_user,6,0);
END

DELIMITER //
CREATE TRIGGER Delete_All_User_Data BEFORE DELETE ON `user`
for EACH row BEGIN
    DELETE FROM user_item WHERE id_user = Old.id_user;
    DELETE FROM user_upgrade WHERE id_user = Old.id_user;
    DELETE FROM user_achievement WHERE id_user = Old.id_user;
END