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
  `sort` INT UNSIGNED NOT NULL DEFAULT '0',
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
  
ALTER TABLE `lupa_service` ADD INDEX `sort` (`sort`);

/* End of v2.2.0 */


CREATE TABLE `lupa_info_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `uri` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `time_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `time_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci COMMENT='Informational text pages';


CREATE TABLE `lupa_info_page_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `uri` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `is_html` tinyint(1) NOT NULL,
  `language` char(2) COLLATE utf8_swedish_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `content` longtext COLLATE utf8_swedish_ci NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `image_uri` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `image_description` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  `time_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `time_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

ALTER TABLE `lupa_info_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq` (`uri`);

ALTER TABLE `lupa_info_page_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq` (`uri`,`language`,`position`) USING BTREE,
  ADD KEY `language` (`language`),
  ADD KEY `position` (`position`),
  ADD KEY `video` (`id`),
  ADD KEY `fk_video` (`video_id`);


ALTER TABLE `lupa_info_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
ALTER TABLE `lupa_info_page_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

ALTER TABLE `lupa_info_page_content`
  ADD CONSTRAINT `fk_uri` FOREIGN KEY (`uri`) REFERENCES `lupa_info_page` (`uri`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_video` FOREIGN KEY (`video_id`) REFERENCES `lupa_video` (`id`) ON UPDATE CASCADE;
  

CREATE TABLE `lupa_info_page_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `uri` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `language` char(2) COLLATE utf8_swedish_ci NOT NULL,
  `html_title` varchar(1000) COLLATE utf8_swedish_ci NOT NULL,
  `time_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `time_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

ALTER TABLE `lupa_info_page_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq` (`uri`,`language`),
  ADD KEY `language` (`language`),
  ADD KEY `uri` (`uri`);


ALTER TABLE `lupa_info_page_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

ALTER TABLE `lupa_info_page_meta`
  ADD CONSTRAINT `lupa_info_page_meta_ibfk_1` FOREIGN KEY (`uri`) REFERENCES `lupa_info_page` (`uri`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `lupa_service_text` add `link_uri` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NULL DEFAULT NULL AFTER text;


// -- 200630 --


CREATE TABLE `lupa_work_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_inbox_id` int(11) NOT NULL,
  `state` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `notes` varchar(2048) COLLATE utf8_swedish_ci NOT NULL DEFAULT '',
  `is_archived` tinyint(1) NOT NULL DEFAULT '0',
  `time_created` datetime NOT NULL,
  `time_state_changed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;


ALTER TABLE `lupa_work_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_inbox_id` (`contact_inbox_id`),
  ADD KEY `state` (`state`),
  ADD KEY `time_created` (`time_created`),
  ADD KEY `time_state_changed` (`time_state_changed`);


ALTER TABLE `lupa_work_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `lupa_work_item`
  ADD CONSTRAINT `contact_inbox_fk` FOREIGN KEY (`contact_inbox_id`) REFERENCES `lupa_contact_inbox` (`id`) ON UPDATE CASCADE;


ALTER TABLE `lupa_config` CHANGE `time_created` `time_created` DATETIME NOT NULL;
ALTER TABLE `lupa_config` ADD UNIQUE(`key`);
