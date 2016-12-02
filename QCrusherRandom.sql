-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema qcrusherdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `qcrusherdb` ;

-- -----------------------------------------------------
-- Schema qcrusherdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `qcrusherdb` DEFAULT CHARACTER SET utf8 ;
USE `qcrusherdb` ;

-- -----------------------------------------------------
-- Table `question_object`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `question_object` ;

CREATE TABLE IF NOT EXISTS `question_object` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `question` VARCHAR(200) NOT NULL,
  `answer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quiz` ;

CREATE TABLE IF NOT EXISTS `quiz` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `date_time` DATETIME NOT NULL,
  `creator_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_quiz_user1_idx` (`creator_id` ASC),
  CONSTRAINT `fk_quiz_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `attempt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `attempt` ;

CREATE TABLE IF NOT EXISTS `attempt` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_time` DATETIME NULL,
  `user_id` INT NOT NULL,
  `quiz_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `quiz_id`),
  INDEX `fk_attempt_user1_idx` (`user_id` ASC),
  INDEX `fk_attempt_quiz1_idx` (`quiz_id` ASC),
  CONSTRAINT `fk_attempt_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_attempt_quiz1`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `quiz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `attempt_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `attempt_question` ;

CREATE TABLE IF NOT EXISTS `attempt_question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `was_correct` TINYINT(1) NOT NULL,
  `question_id` INT NOT NULL,
  `attempt_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_attempt_question_attempt1_idx` (`attempt_id` ASC),
  CONSTRAINT `fk_attempt_question_question_object1`
    FOREIGN KEY (`question_id`)
    REFERENCES `question_object` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_attempt_question_attempt1`
    FOREIGN KEY (`attempt_id`)
    REFERENCES `attempt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quiz_question` ;

CREATE TABLE IF NOT EXISTS `quiz_question` (
  `quiz_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  INDEX `fk_quiz_question_question_object1_idx` (`question_id` ASC),
  PRIMARY KEY (`quiz_id`, `question_id`),
  CONSTRAINT `fk_quiz_question_quiz`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `quiz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_question_question_object1`
    FOREIGN KEY (`question_id`)
    REFERENCES `question_object` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quiz_rating` ;

CREATE TABLE IF NOT EXISTS `quiz_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NULL,
  `feedback` VARCHAR(300) NULL,
  `user_id` INT NOT NULL,
  `quiz_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_quiz_rating_quiz1_idx` (`quiz_id` ASC),
  CONSTRAINT `fk_quiz_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_rating_quiz1`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `quiz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `question_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `question_rating` ;

CREATE TABLE IF NOT EXISTS `question_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NOT NULL,
  `feedback` VARCHAR(300) NULL,
  `user_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_question_rating_question_object1_idx` (`question_id` ASC),
  CONSTRAINT `fk_question_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_rating_question_object1`
    FOREIGN KEY (`question_id`)
    REFERENCES `question_object` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
START TRANSACTION; 
USE `qcrusherdb`;
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (1, 'Anonymous', 'testpassword', 'ROLE_USER');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (2, 'jbone', 'testpassword', 'ROLE_ADMIN');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (3, 'kennis', 'testpassword', 'ROLE_ADMIN');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (4, 'ymenase', 'testpassword', 'ROLE_ADMIN');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (5, 'lu_kirby', 'testpassword', 'ROLE_USER');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (6, 'tabitha_crain', 'testpassword', 'ROLE_USER');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (7, 'bea_cardenas', 'testpassword', 'ROLE_USER');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (8, 'brenton_parris', 'testpassword', 'ROLE_USER');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (9, 'ira_holm', 'testpassword', 'ROLE_USER');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (10, 'zenobia_leal', 'testpassword', 'ROLE_USER');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (11, 'monika_mosher', 'testpassword', 'ROLE_USER');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (12, 'cynthia_major', 'testpassword', 'ROLE_USER');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (13, 'andrew_newton', 'testpassword', 'ROLE_USER');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (14, 'aida_steele', 'testpassword', 'ROLE_USER');
COMMIT;
START TRANSACTION; 
USE `qcrusherdb`;
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (1,'Juliet \'i melt with you\' was which band\'s signature hit released on their \'after the snow\' album in 1982','Modern english');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (2,'The Norse god of light & peace','Balder');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (3,'What is the more scientific name for quicksilver?','Mercury');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (4,'"""Honolulu"" means _____________"','Sheltered harbor');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (5,'What was the first day of the Roman month called','The calends');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (6,'What did Alexander Graham Bell muffle to keep it from interrupting his work','His telephone the telephone telephone');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (7,'How many gallons of fuel does a jumbo jet use during take off?','Four thousand');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (8,'What is the unit of currency in Laos?','Kip');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (9,'What is a violoncello usually called?','Cello');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (10,'In the game of cricket which bird name means scoring no runs ','Duck ');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (11,'5:45 pm In military time is how many hours','1745');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (12,'What sequence is this the start of: 1 4 11 20 31 44 61 100','Octal squares');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (13,'With which singer did Westlife record a version of Against all Odds in 2000?','Mariah Carey');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (14,'In what sport are bacon hamburgers chips prunes spuds terms','Mountain Biking injury / damage');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (15,'According to the Talmud, who was the first wife of Adam','Lilith');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (16,'In 1951 Howard Hawks Produced The Thing. Who Directed The 1982 remake, Starring Kurt Russell ','John Carpenter ');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (17,'Who was Barney Rubble\'s best friend?','Fred Flintstone');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (18,'Which Is The Most Sensitive Of The Senses ','Smell ');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (19,'The Paris stock exchange','Bourse');
COMMIT;
START TRANSACTION; 
USE `qcrusherdb`;
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (1, 'The simultaneous moneys quiz', '2016-12-02 12-25-23', 5);
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (2, 'The diseased terminations quiz', '2016-12-02 12-25-23', 5);
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (3, 'The deeper secrets quiz', '2016-12-02 12-25-23', 5);
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (4, 'The narcotic cause quiz', '2016-12-02 12-25-23', 6);
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (5, 'The interchangeable refrigerators quiz', '2016-12-02 12-25-23', 6);
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (6, 'The leaky instrument quiz', '2016-12-02 12-25-23', 7);
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (7, 'The lateral diameters quiz', '2016-12-02 12-25-23', 9);
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (8, 'The proximate beans quiz', '2016-12-02 12-25-23', 9);
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (9, 'The momentary defeats quiz', '2016-12-02 12-25-23', 13);
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (10, 'The particular cautions quiz', '2016-12-02 12-25-23', 14);
COMMIT;
START TRANSACTION; 
USE `qcrusherdb`;
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 19);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 5);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 11);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 17);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 2);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 15);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 10);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 13);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 1);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (2, 9);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (2, 19);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (2, 2);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (2, 6);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (2, 4);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (2, 13);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (3, 7);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (3, 13);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (3, 15);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (3, 14);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (4, 12);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (4, 6);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (4, 15);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (4, 18);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (4, 10);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (5, 9);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (5, 4);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (5, 16);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (5, 12);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (5, 17);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (5, 3);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (5, 8);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (5, 11);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (5, 1);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (6, 8);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (6, 16);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (6, 14);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (7, 14);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (7, 17);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (7, 4);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (7, 5);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (7, 3);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (7, 12);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (8, 15);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (8, 1);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (8, 19);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (8, 2);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (8, 16);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (8, 4);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (8, 18);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (8, 7);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (9, 7);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (9, 19);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (9, 8);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (9, 5);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (9, 16);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (9, 17);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (9, 13);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (9, 2);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (10, 12);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (10, 5);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (10, 14);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (10, 18);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (10, 10);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (10, 2);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (10, 7);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (10, 15);
COMMIT;
START TRANSACTION; 
USE `qcrusherdb`;
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (1, '2016-12-02 12-25-23', 7, 8);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (2, '2016-12-02 12-25-23', 7, 10);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (3, '2016-12-02 12-25-23', 7, 3);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (4, '2016-12-02 12-25-23', 8, 5);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (5, '2016-12-02 12-25-23', 9, 7);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (6, '2016-12-02 12-25-23', 10, 8);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (7, '2016-12-02 12-25-23', 10, 10);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (8, '2016-12-02 12-25-23', 10, 2);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (9, '2016-12-02 12-25-23', 12, 5);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (10, '2016-12-02 12-25-23', 13, 7);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (11, '2016-12-02 12-25-23', 13, 7);
COMMIT;
START TRANSACTION; 
USE `qcrusherdb`;
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (1, 1, 15, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (2, 0, 1, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (3, 0, 19, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (4, 0, 2, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (5, 0, 16, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (6, 1, 4, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (7, 1, 18, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (8, 0, 7, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (9, 0, 12, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (10, 1, 5, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (11, 0, 14, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (12, 0, 18, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (13, 0, 10, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (14, 0, 2, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (15, 0, 7, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (16, 0, 15, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (17, 1, 7, 3);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (18, 1, 13, 3);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (19, 1, 15, 3);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (20, 1, 14, 3);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (21, 0, 9, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (22, 1, 4, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (23, 0, 16, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (24, 1, 12, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (25, 1, 17, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (26, 1, 3, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (27, 1, 8, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (28, 0, 11, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (29, 1, 1, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (30, 0, 14, 5);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (31, 0, 17, 5);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (32, 1, 4, 5);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (33, 0, 5, 5);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (34, 0, 3, 5);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (35, 1, 12, 5);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (36, 1, 15, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (37, 0, 1, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (38, 1, 19, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (39, 0, 2, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (40, 1, 16, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (41, 0, 4, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (42, 1, 18, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (43, 1, 7, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (44, 0, 12, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (45, 0, 5, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (46, 0, 14, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (47, 0, 18, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (48, 0, 10, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (49, 0, 2, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (50, 0, 7, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (51, 0, 15, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (52, 0, 9, 8);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (53, 0, 19, 8);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (54, 0, 2, 8);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (55, 0, 6, 8);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (56, 0, 4, 8);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (57, 0, 13, 8);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (58, 1, 9, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (59, 1, 4, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (60, 1, 16, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (61, 1, 12, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (62, 1, 17, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (63, 1, 3, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (64, 1, 8, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (65, 1, 11, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (66, 1, 1, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (67, 0, 14, 10);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (68, 1, 17, 10);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (69, 1, 4, 10);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (70, 0, 5, 10);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (71, 0, 3, 10);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (72, 0, 12, 10);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (73, 1, 14, 11);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (74, 0, 17, 11);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (75, 0, 4, 11);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (76, 1, 5, 11);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (77, 1, 3, 11);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (78, 0, 12, 11);
COMMIT;
START TRANSACTION; 
USE `qcrusherdb`;
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (1, 4, 'This quiz was a very flatter situation', 7, 8);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (2, 5, 'I thought this quiz was ordinary', 7, 10);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (3, 10, 'Nice quiz, well done on the identical cupfuls', 7, 3);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (4, 9, 'This quiz was a very neat bauds', 8, 5);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (5, 1, 'Nice quiz, well done on the nonproductive range', 9, 7);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (6, 6, 'The efficient swell didn\'t make sense', 10, 8);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (7, 3, 'This quiz was a very specific lumps', 10, 10);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (8, 10, 'This quiz was a very offline authorities', 10, 2);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (9, 9, 'I thought this quiz was sweetest', 12, 5);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (10, 10, 'splitting, manifold, and completely own. Two thumbs up!', 13, 7);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (11, 5, 'Nice quiz, well done on the former hyphens', 13, 7);
COMMIT;
START TRANSACTION; 
USE `qcrusherdb`;
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (1, 1, 'current, feeblest, and completely harmless. Two thumbs up!', 7, 15);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (2, 1, 'commercial, troubling, and completely meaner. Two thumbs up!', 7, 1);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (3, 10, 'The laziest perforation didn\'t make sense', 7, 19);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (4, 6, 'The severe grasses didn\'t make sense', 7, 2);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (5, 10, 'This question was a very warmest funds', 7, 16);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (6, 2, 'The unscheduled opinion didn\'t make sense', 7, 4);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (7, 10, 'I thought this question was broader', 7, 18);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (8, 6, 'Nice question, well done on the angriest leaps', 7, 7);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (9, 6, 'The flat signalmen didn\'t make sense', 7, 12);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (10, 4, 'I thought this question was further', 7, 5);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (11, 5, 'void, wise, and completely transparent. Two thumbs up!', 7, 14);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (12, 3, 'The least drills didn\'t make sense', 7, 18);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (13, 8, 'Nice question, well done on the huge permit', 7, 10);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (14, 6, 'Nice question, well done on the less turbines', 7, 2);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (15, 10, 'Nice question, well done on the outboard propose', 7, 7);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (16, 9, 'The prompt futures didn\'t make sense', 7, 15);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (17, 3, 'I thought this question was lazy', 7, 7);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (18, 3, 'Nice question, well done on the standby guideline', 7, 13);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (19, 6, 'The peripheral stomachs didn\'t make sense', 7, 15);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (20, 1, 'This question was a very littlest thermometer', 7, 14);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (21, 6, 'The amphibious bites didn\'t make sense', 8, 9);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (22, 7, 'The quieter stresses didn\'t make sense', 8, 4);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (23, 3, 'hardest, electric, and completely unknown. Two thumbs up!', 8, 16);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (24, 10, 'Nice question, well done on the active typists', 8, 12);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (25, 2, 'I thought this question was fifth', 8, 17);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (26, 5, 'I thought this question was serious', 8, 3);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (27, 8, 'greater, obsolete, and completely concrete. Two thumbs up!', 8, 8);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (28, 4, 'This question was a very looser survivals', 8, 11);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (29, 5, 'Nice question, well done on the outer tree', 8, 1);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (30, 2, 'The metallic davits didn\'t make sense', 9, 14);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (31, 9, 'I thought this question was least', 9, 17);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (32, 7, 'The audible vent didn\'t make sense', 9, 4);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (33, 4, 'This question was a very simplest velocities', 9, 5);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (34, 6, 'The dark lender didn\'t make sense', 9, 3);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (35, 9, 'The faulty tables didn\'t make sense', 9, 12);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (36, 7, 'Nice question, well done on the feasible throttles', 10, 15);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (37, 1, 'Nice question, well done on the sharp fits', 10, 1);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (38, 8, 'effective, another, and completely richest. Two thumbs up!', 10, 19);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (39, 5, 'Nice question, well done on the alphabetical thermocouple', 10, 2);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (40, 3, 'This question was a very sure communication', 10, 16);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (41, 10, 'Nice question, well done on the wrongful slots', 10, 4);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (42, 4, 'This question was a very wettest ampere', 10, 18);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (43, 3, 'driest, further, and completely flammable. Two thumbs up!', 10, 7);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (44, 8, 'The sweet recordkeeping didn\'t make sense', 10, 12);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (45, 8, 'biggest, muddy, and completely uppermost. Two thumbs up!', 10, 5);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (46, 10, 'Nice question, well done on the ditty acquisition', 10, 14);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (47, 5, 'I thought this question was identical', 10, 18);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (48, 2, 'This question was a very lazier platforms', 10, 10);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (49, 10, 'The cool chin didn\'t make sense', 10, 2);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (50, 6, 'meritorious, unpainted, and completely viable. Two thumbs up!', 10, 7);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (51, 7, 'This question was a very heavy journal', 10, 15);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (52, 7, 'The magnetic quantities didn\'t make sense', 10, 9);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (53, 2, 'I thought this question was fiscal', 10, 19);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (54, 5, 'Nice question, well done on the rapid deletion', 10, 2);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (55, 8, 'The defective bulkhead didn\'t make sense', 10, 6);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (56, 7, 'I thought this question was softest', 10, 4);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (57, 3, 'weaker, brief, and completely worst. Two thumbs up!', 10, 13);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (58, 7, 'I thought this question was permanent', 12, 9);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (59, 2, 'I thought this question was widest', 12, 4);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (60, 9, 'This question was a very peculiar crawl', 12, 16);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (61, 9, 'This question was a very truest oranges', 12, 12);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (62, 5, 'hind, technical, and completely loosest. Two thumbs up!', 12, 17);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (63, 9, 'taut, green, and completely structural. Two thumbs up!', 12, 3);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (64, 6, 'The due bowls didn\'t make sense', 12, 8);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (65, 10, 'The imminent houses didn\'t make sense', 12, 11);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (66, 6, 'The etched chills didn\'t make sense', 12, 1);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (67, 7, 'The nicer bandage didn\'t make sense', 13, 14);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (68, 3, 'Nice question, well done on the professional depths', 13, 17);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (69, 10, 'I thought this question was secure', 13, 4);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (70, 9, 'The superior rattle didn\'t make sense', 13, 5);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (71, 8, 'loosest, expeditious, and completely loosest. Two thumbs up!', 13, 3);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (72, 8, 'acidic, closest, and completely numerous. Two thumbs up!', 13, 12);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (73, 9, 'fatal, meanest, and completely extra. Two thumbs up!', 13, 14);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (74, 7, 'This question was a very reliable cleats', 13, 17);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (75, 10, 'This question was a very gentler pieces', 13, 4);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (76, 3, 'I thought this question was artificial', 13, 5);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (77, 10, 'This question was a very productive eye', 13, 3);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (78, 3, 'I thought this question was brief', 13, 12);
COMMIT;
