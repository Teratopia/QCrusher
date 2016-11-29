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
  `was_correct` INT NOT NULL,
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

-- -----------------------------------------------------
-- Data for table `question_object`
-- -----------------------------------------------------
START TRANSACTION;
USE `qcrusherdb`;
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (1, 'What color is a banana?', 'Yellow');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (2, 'What is 2+2?', '4');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (3, 'Is the ocean dry or wet?', 'Wet');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (4, 'What color is the sky?', 'Blue');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (5, 'What do cars drive on?', 'Roads');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (6, 'What do April showers bring?', 'May flowers');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (7, 'What color was Napoleon\'s white horse?', 'White');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (8, 'What are omelettes made from?', 'Eggs');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (9, 'What do you stick to envelopes?', 'Stamps');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (10, 'From what direction does the sun rise?', 'East');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (11, 'What is the airspeed velocity of an unladen swallow?', 'African or European?');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (12, 'What is the square root of 25?', '5');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (13, 'From what direction does the north wind blow?', 'North');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (14, 'What do baby cows drink?', 'Milk');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (15, 'What do beavers build across rivers?', 'Dams');
INSERT INTO `question_object` (`id`, `question`, `answer`) VALUES (16, 'What is the largest object in orbit around the Earth?', 'The Moon');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `qcrusherdb`;
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (1, 'jbone', 'testpassword', 'ROLE_ADMIN');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (2, 'ymenase', 'testpassword', 'ROLE_USER');
INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES (3, 'kennis', 'testpassword', 'ROLE_ADMIN');

COMMIT;


-- -----------------------------------------------------
-- Data for table `quiz`
-- -----------------------------------------------------
START TRANSACTION;
USE `qcrusherdb`;
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (1, 'A Quiz To Remember', '2016-11-19 00:00:00', 1);
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (2, 'Quiz-a-Lot', '2016-11-19 00:00:00', 2);
INSERT INTO `quiz` (`id`, `name`, `date_time`, `creator_id`) VALUES (3, 'Quizzical', '2016-11-19 00:00:00', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `attempt`
-- -----------------------------------------------------
START TRANSACTION;
USE `qcrusherdb`;
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (1, '2016-11-19 11:02:09', 1, 1);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (2, '2016-11-19 11:02:57', 1, 2);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (3, '2016-11-19 11:03:06', 1, 3);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (4, '2016-11-19 11:03:06', 2, 1);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (5, '2016-11-19 11:03:10', 2, 2);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (6, '2016-11-19 11:03:12', 2, 3);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (7, '2016-11-19 11:03:15', 3, 1);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (8, '2016-11-19 11:03:18', 3, 2);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (9, '2016-11-19 11:03:22', 3, 3);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (10, '2016-11-19 11:03:26', 1, 1);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (11, '2016-11-19 11:03:55', 1, 2);
INSERT INTO `attempt` (`id`, `date_time`, `user_id`, `quiz_id`) VALUES (12, '2016-11-19 11:04:02', 1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `attempt_question`
-- -----------------------------------------------------
START TRANSACTION;
USE `qcrusherdb`;
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (1, TRUE, 1, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (2, FALSE, 2, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (3, true, 3, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (4, false, 4, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (5, true, 5, 1);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (6, false, 6, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (7, true, 7, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (8, false, 8, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (9, true, 9, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (10, false, 10, 2);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (11, true, 11, 3);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (12, false, 12, 3);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (13, true, 13, 3);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (14, false, 14, 3);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (15, true, 15, 3);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (16, false, 1, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (17, true, 2, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (18, false, 3, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (19, true, 4, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (20, false, 5, 4);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (21, true, 6, 5);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (22, false, 7, 5);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (23, true, 8, 5);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (24, false, 9, 5);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (25, true, 10, 5);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (26, false, 11, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (61, true, 12, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (60, false, 13, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (59, true, 14, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (58, false, 15, 6);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (57, true, 1, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (56, false, 2, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (55, true, 3, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (54, false, 4, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (53, true, 5, 7);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (52, false, 6, 8);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (51, true, 7, 8);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (50, false, 8, 8);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (49, true, 9, 8);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (48, false, 10, 8);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (47, true, 11, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (46, false, 12, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (45, true, 13, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (44, false, 14, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (43, true, 15, 9);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (42, false, 1, 10);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (41, true, 2, 10);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (40, false, 3, 10);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (39, true, 4, 10);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (38, false, 5, 10);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (37, true, 6, 11);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (36, false, 7, 11);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (35, true, 8, 11);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (34, false, 9, 11);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (33, true, 10, 11);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (32, false, 11, 12);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (31, true, 12, 12);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (30, false, 13, 12);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (29, true, 14, 12);
INSERT INTO `attempt_question` (`id`, `was_correct`, `question_id`, `attempt_id`) VALUES (28, false, 15, 12);

COMMIT;


-- -----------------------------------------------------
-- Data for table `quiz_question`
-- -----------------------------------------------------
START TRANSACTION;
USE `qcrusherdb`;
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 1);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 2);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 3);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 4);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (1, 5);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (2, 6);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (2, 7);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (2, 8);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (2, 9);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (2, 10);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (3, 11);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (3, 12);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (3, 13);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (3, 14);
INSERT INTO `quiz_question` (`quiz_id`, `question_id`) VALUES (3, 15);

COMMIT;


-- -----------------------------------------------------
-- Data for table `quiz_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `qcrusherdb`;
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (1, 10, 'A thrilling quiz! Wonderful experience all around!', 1, 1);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (2, 5, 'Average. Meh. So-so.', 1, 2);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (3, 1, 'Stultifying, soporific, and thoroughly enervating.', 1, 3);
INSERT INTO `quiz_rating` (`id`, `rating`, `feedback`, `user_id`, `quiz_id`) VALUES (4, 7, 'Pretty kewl, thanks for the challenge!', 2, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `question_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `qcrusherdb`;
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (1, 10, 'My favorite question, hands down.', 1, 1);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (2, 8, 'Interesting factoid!', 1, 2);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (3, 6, 'Everybody knows this. Literally everybody.', 2, 4);
INSERT INTO `question_rating` (`id`, `rating`, `feedback`, `user_id`, `question_id`) VALUES (4, 4, 'clap clap', 3, 6);

COMMIT;

