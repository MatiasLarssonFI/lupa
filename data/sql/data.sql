SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


INSERT INTO `lupa_config` (`id`, `key`, `value`, `time_edited`, `time_created`) VALUES
(1, 'color_css_uri', '/css/color-default.css', NULL, '2016-03-13 22:00:00'),
(2, 'footer_img_uri', '/data/img/footer-grey-blue.png', '2016-03-17 20:18:00', '2016-03-16 22:00:00'),
(3, 'header_logo_uri', '/data/img/logo.png', '2016-12-12 18:53:20', '2016-03-25 22:00:00'),
(4, 'contact_email', 'matias@matias-laptop', '2016-04-02 18:37:11', '2016-04-01 21:00:00'),
(5, 'mail_server', 'localhost', '2016-04-13 19:20:29', '2016-04-12 21:00:00'),
(6, 'mail_user', '', NULL, '2016-04-12 21:00:00'),
(7, 'mail_password', '', NULL, '2016-04-12 21:00:00'),
(8, 'js_src_mode', 'debug', NULL, '2016-07-15 18:00:00'),
(9, 'js_src_version', '20160812', '2016-08-12 12:51:49', '2016-07-15 18:00:00'),
(10, 'css_src_version', '20160716', NULL, '2016-07-15 18:00:00');

INSERT INTO `lupa_slide` (`id`, `language`, `html`, `content_target`, `is_published`, `time_created`, `time_edited`) VALUES
(1, 'fi', '<img src="/data/img/slides/skog5B.jpg" alt="" class="lupa-slide-image">\n<div class="carousel-caption lupa-slide-content">\n    <h3>Vailla <b class="lupa-bold text-uppercase">kaatoa</b>?</h3>\n    <p>Me Länsiuudenmaan PuuApu:ssa suoritamme puutyöt Miehekkäästi. Meillä on parhaat puutyöt, osaamme puutyöt kaikista parhaiten.</p>\n<hr class="hidden-xs">\n<a class="hidden-xs btn btn-primary btn-bold text-uppercase" href="/fi/contact">Ota yhteyttä</a>\n</div>', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-25 12:38:35'),
(2, 'fi', '<img src="/data/img/slides/skog6B.jpg" alt="" class="lupa-slide-image">\n<div class="carousel-caption lupa-slide-content">\n    <h3>Vailla <b class="lupa-bold text-uppercase">raatoa</b>?</h3>\n    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed posuere interdum sem. Quisque ligula eros ullamcorper quis, lacinia quis facilisis sed sapien.</p>\n</div>', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-25 12:38:55'),
(3, 'fi', '<img src="/data/img/slides/skog3B.jpg" alt="" class="lupa-slide-image">\n<div class="carousel-caption lupa-slide-content">\n    <h3>Hirven<b class="lupa-bold text-uppercase">kaatoa</b>?</h3>\n    <p>Stylized implementation of HTML\'s &lt;abbr&gt; element for abbreviations and acronyms to show the expanded version on hover. Abbreviations with a title attribute have a light dotted bottom border and a help cursor on hover, providing additional context on hover and to users of assistive technologies.</p>\n</div>', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-25 12:39:11'),
(4, 'fi', '<img src="/data/img/slides/skog1leikattu.jpg" alt="" class="lupa-slide-image">\n<div class="carousel-caption lupa-slide-content">\n    <h3>Hirven<b class="lupa-bold text-uppercase">kaatoa</b>?</h3>\n    <p>Stylized implementation of HTML\'s &lt;abbr&gt; element for abbreviations and acronyms to show the expanded version on hover. Abbreviations with a title attribute have a light dotted bottom border and a help cursor on hover, providing additional context on hover and to users of assistive technologies.</p>\n</div>', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-25 13:05:01');

INSERT INTO `lupa_ui_text` (`id`, `language`, `code`, `content`, `time_edited`, `time_created`) VALUES
(1, 'fi', 'FRONT_PAGE_PROMO', 'Kehitämme ja valmistamme prototyypejä ja sisustusosia puusta. Hyödynnämme mm. cnc-tekniikkaa ja puun muotopuristusta.', '2016-05-15 18:35:20', '2016-03-05 22:00:00'),
(2, 'se', 'FRONT_PAGE_PROMO', 'Vi utvecklar och tillverkar prototyper och inredningsdetaljer av trä. Cnc-fräsning och vakumlaminering ar några av de tekniker vi tillämpar.', '2016-03-06 16:17:29', '2016-03-05 22:00:00'),
(3, 'en', 'FRONT_PAGE_PROMO', 'We develop and manufacture prototypes and furniture parts from various wood materials. Cnc-routing and vacuum veneering are some of the technics at our disposal.', '2016-03-06 16:17:35', '2016-03-05 22:00:00'),
(4, 'fi', 'FRONT_PAGE_TITLE', 'Home', '2016-12-10 22:24:17', '2016-03-05 22:00:00'),
(5, 'se', 'FRONT_PAGE_TITLE', 'Home', '2016-12-10 22:24:21', '2016-03-05 22:00:00'),
(6, 'en', 'FRONT_PAGE_TITLE', 'Home', '2016-12-10 22:24:23', '2016-03-05 22:00:00'),
(7, 'fi', 'EXCEPTION_PAGE_TITLE', 'Virhe', NULL, '2016-03-05 22:00:00'),
(8, 'se', 'EXCEPTION_PAGE_TITLE', 'Fel', NULL, '2016-03-05 22:00:00'),
(9, 'en', 'EXCEPTION_PAGE_TITLE', 'Error', NULL, '2016-03-05 22:00:00'),
(10, 'fi', 'NAV_SERVICES', 'Palvelut', NULL, '2016-03-11 22:00:00'),
(11, 'se', 'NAV_SERVICES', 'Tjänster', '2016-03-12 16:20:57', '2016-03-11 22:00:00'),
(12, 'en', 'NAV_SERVICES', 'Services', '2016-03-12 16:20:54', '2016-03-11 22:00:00'),
(13, 'fi', 'NAV_GALLERY', 'Galleria', NULL, '2016-03-11 22:00:00'),
(14, 'en', 'NAV_GALLERY', 'Gallery', NULL, '2016-03-11 22:00:00'),
(15, 'se', 'NAV_GALLERY', 'Galleri', NULL, '2016-03-11 22:00:00'),
(16, 'se', 'NAV_FRONT_PAGE', 'Framsida', NULL, '2016-03-11 22:00:00'),
(17, 'fi', 'NAV_FRONT_PAGE', 'Etusivu', NULL, '2016-03-11 22:00:00'),
(18, 'en', 'NAV_FRONT_PAGE', 'Home', '2016-12-19 20:09:23', '2016-03-11 22:00:00'),
(19, 'en', 'NAV_CONTACT', 'Contact', NULL, '2016-03-11 22:00:00'),
(20, 'se', 'NAV_CONTACT', 'Kontakt', NULL, '2016-03-11 22:00:00'),
(21, 'fi', 'NAV_CONTACT', 'Yhteydenotto', NULL, '2016-03-11 22:00:00'),
(22, 'en', 'GALLERY_TITLE', 'Gallery', NULL, '2016-03-12 22:00:00'),
(23, 'fi', 'GALLERY_TITLE', 'Galleria', NULL, '2016-03-12 22:00:00'),
(24, 'se', 'GALLERY_TITLE', 'Galleri', NULL, '2016-03-12 22:00:00'),
(25, 'en', 'SERVICES_TITLE', 'Services', NULL, '2016-03-12 20:00:00'),
(26, 'fi', 'SERVICES_TITLE', 'Palvelut', NULL, '2016-03-12 20:00:00'),
(27, 'se', 'SERVICES_TITLE', 'Tjänster', NULL, '2016-03-12 20:00:00'),
(28, 'en', 'CONTACT_TITLE', 'Contact', NULL, '2016-03-11 20:00:00'),
(29, 'se', 'CONTACT_TITLE', 'Kontakt', NULL, '2016-03-11 20:00:00'),
(30, 'fi', 'CONTACT_TITLE', 'Yhteydenotto', NULL, '2016-03-11 20:00:00'),
(31, 'fi', 'CONTACT_FIELD_NAME', 'Nimesi', NULL, '2016-04-02 21:00:00'),
(32, 'fi', 'CONTACT_FIELD_EMAIL', 'Sähköpostiosoitteesi', NULL, '2016-04-02 21:00:00'),
(33, 'fi', 'CONTACT_FIELD_SUBJECT', 'Aihe', NULL, '2016-04-02 21:00:00'),
(34, 'fi', 'CONTACT_FIELD_MESSAGE', 'Viesti', NULL, '0000-00-00 00:00:00'),
(35, 'en', 'CONTACT_FIELD_NAME', 'Your name', NULL, '2016-04-02 18:00:00'),
(36, 'en', 'CONTACT_FIELD_EMAIL', 'Your e-mail address', NULL, '2016-04-02 18:00:00'),
(37, 'en', 'CONTACT_FIELD_SUBJECT', 'Subject', NULL, '2016-04-02 18:00:00'),
(38, 'en', 'CONTACT_FIELD_MESSAGE', 'Message', NULL, '0000-00-00 00:00:00'),
(39, 'se', 'CONTACT_FIELD_NAME', 'Ditt namn', NULL, '2016-04-02 18:00:00'),
(40, 'se', 'CONTACT_FIELD_EMAIL', 'Din e-postadresss', NULL, '2016-04-02 18:00:00'),
(41, 'se', 'CONTACT_FIELD_SUBJECT', 'Ämne', NULL, '2016-04-02 18:00:00'),
(42, 'se', 'CONTACT_FIELD_MESSAGE', 'Meddelande', NULL, '0000-00-00 00:00:00'),
(43, 'fi', 'CONTACT_SUBMIT', 'Lähetä viesti', NULL, '2016-04-02 21:00:00'),
(44, 'se', 'CONTACT_SUBMIT', 'Skicka meddelande', NULL, '2016-04-02 21:00:00'),
(45, 'en', 'CONTACT_SUBMIT', 'Send message', NULL, '2016-04-02 21:00:00'),
(46, 'fi', 'CONTACT_SUBMIT_TEXT', 'Kiitos yhteydenotostasi. Olemme sinuun yhteydessä pian.', NULL, '2016-04-02 21:00:00'),
(47, 'se', 'CONTACT_SUBMIT_TEXT', 'Tack. Vi kommer att vara i kontakt med dig snart.', '2016-04-13 17:40:42', '2016-04-02 21:00:00'),
(48, 'en', 'CONTACT_SUBMIT_TEXT', 'Thank you. We\'ll be in touch with you soon.', '2016-04-03 16:28:03', '2016-04-02 21:00:00'),
(49, 'fi', 'CONTACT_FIELD_ERROR_NAME', 'Nimi ei voi olla tyhjä.', NULL, '2016-04-02 18:00:00'),
(50, 'fi', 'CONTACT_FIELD_ERROR_EMAIL', 'Sähköpostiosoite on oltava oikea.', NULL, '2016-04-02 18:00:00'),
(51, 'fi', 'CONTACT_FIELD_ERROR_SUBJECT', 'Aihe ei voi olla tyhjä.', NULL, '2016-04-02 18:00:00'),
(52, 'fi', 'CONTACT_FIELD_ERROR_MESSAGE', 'Viestissä on oltava enemmän kuin kolme merkkiä.', NULL, '0000-00-00 00:00:00'),
(53, 'en', 'CONTACT_FIELD_ERROR_NAME', 'Your name can´t be empty.', NULL, '2016-04-02 15:00:00'),
(54, 'en', 'CONTACT_FIELD_ERROR_EMAIL', 'Your e-mail address must be a real address.', NULL, '2016-04-02 15:00:00'),
(55, 'en', 'CONTACT_FIELD_ERROR_SUBJECT', 'The subject can´t be empty.', NULL, '2016-04-02 15:00:00'),
(56, 'en', 'CONTACT_FIELD_ERROR_MESSAGE', 'The message must be longer than three characters.', NULL, '0000-00-00 00:00:00'),
(57, 'se', 'CONTACT_FIELD_ERROR_NAME', 'Ditt namn kan inte vara tom.', NULL, '2016-04-02 15:00:00'),
(58, 'se', 'CONTACT_FIELD_ERROR_EMAIL', 'Din e-postadresss måste vara en riktig e-postaddress.', NULL, '2016-04-02 15:00:00'),
(59, 'se', 'CONTACT_FIELD_ERROR_SUBJECT', 'Ämnet kan inte vara tom', NULL, '2016-04-02 15:00:00'),
(60, 'se', 'CONTACT_FIELD_ERROR_MESSAGE', 'Meddelandet måste vara längre än tre tecken.', NULL, '0000-00-00 00:00:00'),
(61, 'fi', 'CONTACT_FIELD_ERROR___CSRF_TOKEN', 'Pahoittelumme, mutta lomake on vanhentunut. Ole hyvä ja yritä uudelleen.', '2016-04-15 19:59:42', '2016-04-13 21:00:00'),
(62, 'en', 'CONTACT_FIELD_ERROR___CSRF_TOKEN', 'We\'re sorry but the form has expired. Please try again.', '2016-04-15 19:58:48', '2016-04-13 21:00:00'),
(63, 'se', 'CONTACT_FIELD_ERROR___CSRF_TOKEN', 'Vi ber om ursäkt men formen har löpt ut. Var god försök igen.', '2016-04-15 19:58:51', '2016-04-13 21:00:00'),
(64, 'fi', 'VIDEOS_PAGE_TITLE', 'Videoita', '2016-03-06 14:15:39', '2016-03-05 20:00:00'),
(65, 'se', 'VIDEOS_PAGE_TITLE', 'Video', NULL, '2016-03-05 20:00:00'),
(66, 'en', 'VIDEOS_PAGE_TITLE', 'Videos', NULL, '2016-03-05 20:00:00'),
(67, 'fi', 'NAV_VIDEOS', 'Videoita', '2016-05-02 18:07:48', '2016-03-11 20:00:00'),
(68, 'en', 'NAV_VIDEOS', 'Videos', '2016-05-02 18:07:29', '2016-03-11 20:00:00'),
(69, 'se', 'NAV_VIDEOS', 'Video', '2016-05-02 18:07:44', '2016-03-11 20:00:00'),
(70, 'fi', 'VIDEOS_LIST_CAPTION', 'Valitse video', '2016-05-02 21:00:00', '0000-00-00 00:00:00'),
(71, 'se', 'VIDEOS_LIST_CAPTION', 'Välj video', '2016-05-15 18:34:41', '0000-00-00 00:00:00'),
(72, 'en', 'VIDEOS_LIST_CAPTION', 'Select video', '2016-05-02 21:00:00', '0000-00-00 00:00:00'),
(73, 'en', 'CONTACT_INFO', 'Contact Information', NULL, '2016-12-19 18:00:00'),
(74, 'fi', 'CONTACT_INFO', 'Yhteystiedot', NULL, '2016-12-19 18:00:00'),
(75, 'se', 'CONTACT_INFO', 'Kontakt information', '2016-12-19 17:41:09', '2016-12-19 18:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
