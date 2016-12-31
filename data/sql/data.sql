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

INSERT INTO `lupa_service` (`id`, `time_edited`, `time_created`) VALUES
(1, NULL, '2016-12-31 14:41:27'),
(2, NULL, '2016-12-31 14:41:27'),
(3, NULL, '2016-12-31 14:41:27'),
(4, NULL, '2016-12-31 14:41:27');

INSERT INTO `lupa_service_image` (`id`, `service_id`, `image_uri`, `time_edited`, `time_created`) VALUES
(8, 2, '/data/img/services/puiden_kaataminen.jpg', '2016-12-31 13:10:43', '2016-12-31 00:00:00'),
(9, 3, '/data/img/services/sahauspalvelu.jpg', '2016-12-31 13:10:46', '2016-12-31 00:00:00'),
(10, 4, '/data/img/services/kantojyrsintä.jpg', '2016-12-31 13:10:48', '2016-12-31 00:00:00'),
(11, 1, '/data/img/services/sahauspalvelu.jpg', '2016-12-31 13:10:51', '2016-12-31 00:00:00');

INSERT INTO `lupa_service_text` (`id`, `service_id`, `language`, `title`, `text`, `time_edited`, `time_created`) VALUES
(8, 2, 'fi', 'Puunkaato, poiskuljetus ja hakettaminen', 'Suunnittelemme puillesi ja pihallesi sopivaa puunkaatoa. Kaadamme puusi kiipeilykaatona, nostokorikaatona, suorana kaatona tai muuten, aina ammatilliseen arviointiin perustuen. Tarjoamme myös risujen ja runkojen poiskuljetuksen. Haketamme usein risut poiskuljetuksen helpottamiseksi. Haketamme tarvittaessa teille sopivaa haketta omista risuistanne.', NULL, '2016-12-31 00:00:00'),
(9, 3, 'fi', 'Sahauspalvelut', 'Sahauttamalla tukkejasi voit saada ainutlaatuista puutavaraa, sellaista mitä kaupasta ei saa. Sahauttamalla tukkeja käsityönä voit saada paksuja ja leveitä lankkuja ja parruja. Jos iso tukki on hankalassa paikassa voi halkaisusahaus olla hyvä tapa saada tukki pienennetty kuljetusta varten, ja lankuista voit tehdä esimerkiksi pihapenkin. Tavanomaista puutavaraa saat kuitenkin edullisemmin ostamalla sen puutavaraliikkeestä.', NULL, '2016-12-31 00:00:00'),
(10, 4, 'fi', 'Kantojyrsintä', 'Kantojyrsinnällä pääset eroon kannoista ja juurakoista. Kantojyrsinnästä syntyvä hake soveltuu hyvin puutarhakatteeksi pensaitesi alle. Tarjoamme myös multauksen ja nurmikon kylvön, jolloin saat puun kasvupaikan täysin maisemoitua. Kanto hankaloittaa pihasi käyttöä, mm nurmikkoa leikattaessa ja lumitöissä. Kannon voi poista kaivinkoneella tai jyrsimällä. Kanto lahoaa 10-30 vuotta riippuen puulajista ja kannon koosta.', NULL, '2016-12-31 00:00:00'),
(11, 1, 'se', 'Trädvård, plantering och besiktning', 'När du planterar ditt träd med kunskap och färdighet försäkrar du att ditt träd får en god start. Träd behöver skydd och vård, särskilt i byggd miljö. Hur mår dina träd? Vi erbjuder och rekomenderar de tjänster dina träd behöver för att frodas.', NULL, '2016-12-31 00:00:00'),
(12, 2, 'se', 'Trädfällning, bortforsling och flisning', 'Vi planerar och genomför trädfällning anpassad för dina träd och din gård. Dina träd fälls med traditionell teknik, genom sektionsfällning (klättring), med bomlift eller med annan ändamålsenlig teknik, alltid enligt yrkesmässig bedömning. Vi erbjuder även bortforsling av stammar och ris. Riset flisas ofta för att underlätta transport. Vi kan också flisa ris på beställning.', NULL, '2016-12-31 00:00:00'),
(13, 3, 'se', 'Sågning', 'Genom att såga upp dina stockar kan du få sågvirke med speciella dimensioner, tex speciellt breda och tjocka plankor och balkar. Då en stor stock ligger på en olämplig plats kan klyvsågning med motorsåg vara ett bra sätt att göra stocken transporterbar, dessutom blir det möjligt att utnyttja stocken som material för tex trädgårdsbygge. Om du bara behöver vanligt sågvirke är det förmånligare att köpa det från en brädgård.', NULL, '2016-12-31 00:00:00'),
(14, 4, 'se', 'Stubbfräsning', 'Vi kan avlägsna dina stubbar och ytliga rötter genom att fräsa dem. Fliset som blir kvar passar utmärkt som marktäckning runt träd och buskar. Ofta bortforslar vi dock fliset, lägger mull och sår gräs där trädet stod. En stubbe orsakar problem vid såväl gräsklippning som snöröjning. Stubben kan avlägsnas med grävmaskin eller stubbfräs. En stubbe förmultnar under 10-30 år beroende på storlek och träslag.', NULL, '2016-12-31 00:00:00'),
(15, 1, 'fi', 'Sahauspalvelut', '', NULL, '2016-12-31 00:00:00');

INSERT INTO `lupa_slide` (`id`, `language`, `html`, `content_target`, `is_published`, `time_created`, `time_edited`) VALUES
(1, 'fi', '<img src="/data/img/slides/skog5B.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-28 18:08:17'),
(2, 'fi', '<img src="/data/img/slides/skog6B.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-28 18:08:23'),
(3, 'fi', '<img src="/data/img/slides/skog3B.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-28 18:08:28'),
(4, 'fi', '<img src="/data/img/slides/skog1leikattu.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-28 18:08:34'),
(5, 'en', '<img src="/data/img/slides/skog5B.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-28 18:08:17'),
(6, 'en', '<img src="/data/img/slides/skog6B.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-28 18:08:23'),
(7, 'en', '<img src="/data/img/slides/skog3B.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-28 18:08:28'),
(8, 'en', '<img src="/data/img/slides/skog1leikattu.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-28 18:08:34'),
(9, 'se', '<img src="/data/img/slides/skog5B.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-28 18:08:17'),
(10, 'se', '<img src="/data/img/slides/skog6B.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-28 18:08:23'),
(11, 'se', '<img src="/data/img/slides/skog3B.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-28 18:08:28'),
(12, 'se', '<img src="/data/img/slides/skog1leikattu.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2016-12-28 18:08:34');

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
(75, 'se', 'CONTACT_INFO', 'Kontakt information', '2016-12-19 17:41:09', '2016-12-19 18:00:00'),
(76, 'fi', 'FRONT_PAGE_SH_CAPTION_TEXT', 'Me Länsiuudenmaan Puuapussa suoritamme puutyöt vastuulla ja huolenpidolla. Tavoitteemme ovat tyytyväiset asiakkaat sekä kaunis ja toimiva ympäristö.', '2016-12-31 12:11:53', '2016-12-27 18:00:00'),
(77, 'en', 'FRONT_PAGE_SH_CAPTION_TEXT', 'We at Länsiuudenmaan Puuapu take great care and responsibility of woodworking. We have reached our goal when you are happy and have a beautiful and well functioning environment.', '2016-12-31 12:11:58', '2016-12-27 18:00:00'),
(78, 'se', 'FRONT_PAGE_SH_CAPTION_TEXT', 'Länsiuudenmaan Puuapu sköter träd och fällning med ansvar och omsorg. Vi eftersträvar nöjda kunder samt en vacker och fungerande miljö.', '2016-12-31 12:12:12', '2016-12-27 18:00:00'),
(79, 'se', 'FRONT_PAGE_SH_CAPTION_TITLE', 'Trätrubbel?', '2016-12-31 12:11:15', '2016-12-27 20:00:00'),
(80, 'en', 'FRONT_PAGE_SH_CAPTION_TITLE', 'Tree trouble?', NULL, '2016-12-27 20:00:00'),
(81, 'fi', 'FRONT_PAGE_SH_CAPTION_TITLE', 'Puupulmia?', NULL, '2016-12-27 20:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
