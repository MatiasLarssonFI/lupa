SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `lupa_config` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `time_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `time_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

CREATE TABLE `lupa_contact_inbox` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `message` text COLLATE utf8_swedish_ci NOT NULL,
  `time_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `time_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

CREATE TABLE `lupa_service` (
  `id` int(11) NOT NULL,
  `icon_uri` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `time_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `time_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

CREATE TABLE `lupa_service_image` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `image_uri` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `time_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `time_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

CREATE TABLE `lupa_service_text` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `title` text COLLATE utf8_swedish_ci NOT NULL,
  `subtitle` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `text` text COLLATE utf8_swedish_ci NOT NULL,
  `time_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `time_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

CREATE TABLE `lupa_slide` (
  `id` int(11) NOT NULL,
  `html` text COLLATE utf8_swedish_ci NOT NULL,
  `content_target` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `time_created` datetime NOT NULL,
  `time_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

CREATE TABLE `lupa_ui_text` (
  `id` int(11) NOT NULL,
  `language` varchar(10) COLLATE utf8_swedish_ci NOT NULL,
  `code` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `content` text COLLATE utf8_swedish_ci NOT NULL,
  `time_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `time_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;


ALTER TABLE `lupa_config`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `lupa_contact_inbox`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `lupa_service`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `lupa_service_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

ALTER TABLE `lupa_service_text`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

ALTER TABLE `lupa_slide`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `lupa_ui_text`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lang_code_uniq` (`language`,`code`);


ALTER TABLE `lupa_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
ALTER TABLE `lupa_contact_inbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `lupa_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `lupa_service_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
ALTER TABLE `lupa_service_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
ALTER TABLE `lupa_slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `lupa_ui_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

ALTER TABLE `lupa_service_image`
  ADD CONSTRAINT `lupa_service_image_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `lupa_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `lupa_service_text`
  ADD CONSTRAINT `lupa_service_text_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `lupa_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


/* v2.2.0 */
ALTER TABLE `lupa_service_text`
  ADD KEY `lang` (`language`),
  ADD UNIQUE KEY `uniq` (`service_id`, `language`);

CREATE TABLE `lupa_faq_answer` (
  `id` int(11) NOT NULL,
  `image_uri` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `time_created` datetime NOT NULL,
  `time_edited` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

CREATE TABLE `lupa_faq_answer_text` (
  `id` int(11) NOT NULL,
  `faq_answer_id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `question` text COLLATE utf8_swedish_ci NOT NULL,
  `answer` text COLLATE utf8_swedish_ci NOT NULL,
  `time_created` datetime NOT NULL,
  `time_edited` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;


CREATE TABLE IF NOT EXISTS `lupa_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_swedish_ci NOT NULL,
  `description` text COLLATE utf8_swedish_ci NOT NULL,
  `thumb_url` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `time_created` datetime NOT NULL,
  `time_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1;


CREATE TABLE IF NOT EXISTS `lupa_video_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `video_url` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `mime_subtype` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `time_created` datetime NOT NULL,
  `time_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `videos_page_video_id` (`videos_page_video_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1;


ALTER TABLE `lupa_video_file` ADD FOREIGN KEY (`videos_page_video_id`) REFERENCES `lupa_video`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;


ALTER TABLE `lupa_faq_answer`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `lupa_faq_answer_text`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq` (`faq_answer_id`,`language`),
  ADD KEY `lang` (`language`);


ALTER TABLE `lupa_faq_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `lupa_faq_answer_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `lupa_faq_answer_text`
  ADD CONSTRAINT `fk_txt_faq_answer_id ` FOREIGN KEY (`faq_answer_id`) REFERENCES `lupa_faq_answer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/* End of v2.2.0 */

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
