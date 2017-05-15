SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


INSERT INTO `lupa_config` (`id`, `key`, `value`, `time_edited`, `time_created`) VALUES
(1, 'color_css_uri', '/css/color-default.css', NULL, '2016-03-13 22:00:00'),
(2, 'footer_img_uri', '/data/img/footer.jpg', '2017-02-28 18:04:11', '2016-03-16 22:00:00'),
(3, 'header_logo_uri', '/data/img/logo22V-{lang}.png', '2017-01-31 19:38:54', '2016-03-25 22:00:00'),
(4, 'contact_email', 'matias@matias-laptop', '2016-04-02 18:37:11', '2016-04-01 21:00:00'),
(5, 'mail_server', 'localhost', '2016-04-13 19:20:29', '2016-04-12 21:00:00'),
(6, 'mail_user', '', NULL, '2016-04-12 21:00:00'),
(7, 'mail_password', '', NULL, '2016-04-12 21:00:00'),
(8, 'js_src_mode', 'debug', NULL, '2016-07-15 18:00:00'),
(9, 'js_src_version', '20170212', '2017-02-12 13:09:50', '2016-07-15 18:00:00'),
(10, 'css_src_version', '20170212', '2017-02-12 13:09:55', '2016-07-15 18:00:00'),
(11, 'facebook_page_url', 'https://www.facebook.com/lansiuudenmaanpuuapu/', '2017-01-14 12:59:06', '2017-01-13 22:00:00');

INSERT INTO `lupa_service` (`id`, `icon_uri`, `time_edited`, `time_created`) VALUES
(1, '/data/img/ui-symbols/plant.png', '2017-01-22 13:37:13', '2016-12-31 14:41:27'),
(2, '/data/img/ui-symbols/tree.png', '2017-01-22 13:37:28', '2016-12-31 14:41:27'),
(3, '/data/img/ui-symbols/saw.png', '2017-01-22 13:37:43', '2016-12-31 14:41:27'),
(4, '/data/img/ui-symbols/stump.png', '2017-01-22 13:37:52', '2016-12-31 14:41:27');

INSERT INTO `lupa_service_image` (`id`, `service_id`, `image_uri`, `time_edited`, `time_created`) VALUES
(8, 2, '/data/img/services/puiden_kaataminen.jpg', '2017-01-27 15:54:06', '2016-12-31 00:00:00'),
(9, 3, '/data/img/services/sahauspalvelu.jpg', '2017-01-27 15:54:12', '2016-12-31 00:00:00'),
(10, 4, '/data/img/services/kantojyrsinta.jpg', '2017-01-06 15:12:26', '2016-12-31 00:00:00'),
(11, 1, '/data/img/services/istutus.jpg', '2017-01-27 15:54:21', '2016-12-31 00:00:00');

INSERT INTO `lupa_service_text` (`id`, `service_id`, `language`, `title`, `text`, `time_edited`, `time_created`) VALUES
(8, 2, 'fi', '<span class="green">Puunkaato</span>, poiskuljetus, pilkkominen ja hakettaminen.', 'Suunnittelemme puillesi ja pihallesi sopivan puunkaadon. Kaadamme puusi kiipeilykaatona, nostokorikaatona, suorana kaatona tai muuten, aina ammatilliseen arviointiin perustuen. Tarjoamme myös risujen ja runkojen poiskuljetuksen. Haketamme usein risut poiskuljetuksen helpottamiseksi. Haketamme tarvittaessa teille sopivaa haketta omista risuistanne. Hake soveltuu kuorikatteeksi esimerkiksi pensaiden juurille. Tukkien pätkimisen ja karsimisen lisäksi voimme pilkkoa pölkyt klapeiksi tehokkaalla klapikoneella, jota myös voi vuokrata omaan käyttöön.', '2017-01-29 17:30:50', '2016-12-31 00:00:00'),
(9, 3, 'fi', '<span class="green">Sahaus</span>palvelut.', 'Sahauttamalla tukkejasi voit saada ainutlaatuista puutavaraa, sellaista mitä kaupasta ei saa. Sahauttamalla tukkeja käsityönä voit saada paksuja ja leveitä lankkuja ja parruja. Jos iso tukki on hankalassa paikassa voi halkaisusahaus olla hyvä tapa saada tukki pienennettyä kuljetusta varten, ja lankuista voit tehdä esimerkiksi pihapenkin. Tavanomaista puutavaraa saat kuitenkin edullisemmin ostamalla sen puutavaraliikkeestä.', '2017-01-27 17:47:12', '2016-12-31 00:00:00'),
(10, 4, 'fi', '<span class="green">Kanto</span>jyrsintä.', 'Kantojyrsinnällä pääset eroon kannoista ja juurakoista. Kantojyrsinnästä syntyvä hake soveltuu hyvin puutarhakatteeksi pensaitesi alle. Tarjoamme myös multauksen ja nurmikon kylvön, jolloin saat puun kasvupaikan täysin maisemoitua. Kanto hankaloittaa pihasi käyttöä, muun muassa nurmikkoa leikattaessa ja lumitöissä. Kannon voi poistaa kaivinkoneella tai jyrsimällä. Kanto lahoaa 10-30 vuotta riippuen puulajista ja kannon koosta.', '2017-01-29 17:32:19', '2016-12-31 00:00:00'),
(11, 1, 'sv', '<span class="green">Trädvård</span>, plantering och besiktning.', 'När du planterar ditt träd med kunskap och färdighet försäkrar du att ditt träd får en god start. Träd behöver skydd och vård, särskilt i byggd miljö. Hur mår dina träd? Vi erbjuder och rekomenderar de tjänster dina träd behöver för att frodas.', '2017-04-02 13:21:46', '2016-12-31 00:00:00'),
(12, 2, 'sv', '<span class="green">Trädfällning</span>, bortforsling, klyvning och flisning.', 'Vi planerar och genomför trädfällning anpassad för dina träd och din gård. Dina träd fälls med traditionell teknik, genom sektionsfällning (klättring), med bomlift eller med annan ändamålsenlig teknik, alltid enligt yrkesmässig bedömning. Vi erbjuder även bortforsling av stammar och ris. Riset flisas ofta för att underlätta transport. Vi kan också flisa ditt ris på beställning. Vi kan också kapa upp och klyva stockarna till vedklabbar med en effektiv vedklyv, som även kan hyras för eget bruk.', '2017-04-02 13:21:46', '2016-12-31 00:00:00'),
(13, 3, 'sv', '<span class="green">Såg</span>ning.', 'Genom att såga upp dina stockar kan du få sågvirke med speciella dimensioner, tex speciellt breda och tjocka plankor och balkar. Då en stor stock ligger på en olämplig plats kan klyvsågning med motorsåg vara ett bra sätt att göra stocken transporterbar, dessutom blir det möjligt att utnyttja stocken som material för tex trädgårdsbygge. Om du bara behöver vanligt sågvirke är det förmånligare att köpa det från en brädgård. ', '2017-04-02 13:21:46', '2016-12-31 00:00:00'),
(14, 4, 'sv', '<span class="green">Stubb</span>fräsning.', 'Vi kan avlägsna dina stubbar och ytliga rötter genom att fräsa dem. Fliset som blir kvar passar utmärkt som marktäckning runt träd och buskar. Ofta bortforslar vi dock fliset, lägger mull och sår gräs där trädet stod. En stubbe orsakar problem vid såväl gräsklippning som snöröjning. Stubben kan avlägsnas med grävmaskin eller stubbfräs. En stubbe förmultnar under 10-30 år beroende på storlek och träslag. Våra stubbfräsar skadar inte gräsmattan och är av tre olika storlekar, för att passa dina behov.', '2017-04-02 13:21:46', '2016-12-31 00:00:00'),
(15, 1, 'fi', '<span class="green">Puiden</span> istuttaminen ja hoitaminen.', 'Kun istutat puun huolella ja taidolla, varmistat puullesi pitkän iän. Puusi tarvitsee suojelua ja hoitoa, varsinkin rakennetussa ympäristössä, pihoilla ja puistoissa. Miten puusi voi? Pitäisikö sille tehdä jotain? Arvioimme ja suosittelemme/tarjoamme sinulle puusi tarvitsemat palvelut!', '2017-01-27 21:00:54', '2016-12-31 00:00:00'),
(16, 3, 'en', '<span class=\'green\'>Sawing</span> logs.', 'Having your logs cut manually can provide you with unique material such as wide rustic boards and large beams in dimensions not provided by your local hardware store. Sawing can also provide a solution if your logs are in a difficult location, it will make them easier to move, and you can benefit from the material as well. Standard dimension boards and planks tohough are cheaper to buy at the hardware store.', '2017-01-28 10:20:46', '2017-01-02 00:00:00'),
(17, 4, 'en', '<span class=\'green\'>Stump</span> grinding', 'We can remove your tree stumps and roots well under ground to give place for your lawn or other plants.The chips produced by the stump grinders carbide teeth are suitable for covering the ground around trees and bushes. on request we also transport the chips to the city dump, and seed lawn where tree stood. Tree stumps make lawn mowing and snow shoveling difficult. It takes 10-30 years for a tree stump to decompose naturally, and it can only be removed with a large excavator or a stump grinder. Our stump grinders do not damage your lawn, and come in three different sizes, depending on your needs.', NULL, '2017-01-28 00:00:00'),
(18, 2, 'en', '<span class="green">Tree</span> felling, removal, splitting and chipping.', 'We plan and carry out tree removal to suit your trees as well as your yard. We fell your trees by climbing, using a skylift or by other means fit for purpose, always based on a professional analysis. We also offer removal of brushwood and trunks. We usually chip the brushwood for ease of transport, and tree chips are well suited as ground cover in gardens around bushes and trees. We can split the tree blocks into firewood using an efficiant wood splittter wich you also can rent an use your self.', NULL, '2017-01-28 00:00:00'),
(19, 1, 'en', '<span class="green">Tree</span> care, planting and inspection.', 'Having your tree planted with skill and care provides it with the good start it needs to  thrive and survive . Your tree needs protection and care taking, especially in built environment. How are your trees? Do they need attention? We inspect and recomend/offer the services your trees need!', NULL, '2017-01-28 00:00:00');

INSERT INTO `lupa_slide` (`id`, `html`, `content_target`, `is_published`, `time_created`, `time_edited`) VALUES
(1, '<img src="/data/img/slides/rz_skog5B.png" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2017-01-06 16:01:17'),
(2, '<img src="/data/img/slides/rz_skog6B.png" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2017-01-06 16:01:25'),
(3, '<img src="/data/img/slides/rz_skog3B.png" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2017-01-06 16:01:33'),
(4, '<img src="/data/img/slides/rz_skog1leikattu.png" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2017-01-06 16:01:43');

INSERT INTO `lupa_ui_text` (`id`, `language`, `code`, `content`, `time_edited`, `time_created`) VALUES
(1, 'fi', 'FRONT_PAGE_PROMO', 'Kehitämme ja valmistamme prototyypejä ja sisustusosia puusta. Hyödynnämme mm. cnc-tekniikkaa ja puun muotopuristusta.', '2016-05-15 18:35:20', '2016-03-05 22:00:00'),
(2, 'sv', 'FRONT_PAGE_PROMO', 'Vi utvecklar och tillverkar prototyper och inredningsdetaljer av trä. Cnc-fräsning och vakumlaminering ar några av de tekniker vi tillämpar.', '2017-04-02 13:20:03', '2016-03-05 22:00:00'),
(3, 'en', 'FRONT_PAGE_PROMO', 'We develop and manufacture prototypes and furniture parts from various wood materials. Cnc-routing and vacuum veneering are some of the technics at our disposal.', '2016-03-06 16:17:35', '2016-03-05 22:00:00'),
(4, 'fi', 'FRONT_PAGE_TITLE', 'LUPA', '2017-01-21 15:29:37', '2016-03-05 22:00:00'),
(5, 'sv', 'FRONT_PAGE_TITLE', 'LUPA', '2017-04-02 13:20:03', '2016-03-05 22:00:00'),
(6, 'en', 'FRONT_PAGE_TITLE', 'LUPA', '2017-01-21 15:29:44', '2016-03-05 22:00:00'),
(7, 'fi', 'EXCEPTION_PAGE_TITLE', 'Virhe', NULL, '2016-03-05 22:00:00'),
(8, 'sv', 'EXCEPTION_PAGE_TITLE', 'Fel', '2017-04-02 13:20:03', '2016-03-05 22:00:00'),
(9, 'en', 'EXCEPTION_PAGE_TITLE', 'Error', NULL, '2016-03-05 22:00:00'),
(10, 'fi', 'NAV_SERVICES', 'Palvelut', NULL, '2016-03-11 22:00:00'),
(11, 'sv', 'NAV_SERVICES', 'Tjänster', '2017-04-02 13:20:03', '2016-03-11 22:00:00'),
(12, 'en', 'NAV_SERVICES', 'Services', '2016-03-12 16:20:54', '2016-03-11 22:00:00'),
(13, 'fi', 'NAV_GALLERY', 'Galleria', NULL, '2016-03-11 22:00:00'),
(14, 'en', 'NAV_GALLERY', 'Gallery', NULL, '2016-03-11 22:00:00'),
(15, 'sv', 'NAV_GALLERY', 'Galleri', '2017-04-02 13:20:03', '2016-03-11 22:00:00'),
(16, 'sv', 'NAV_FRONT_PAGE', 'LUPA', '2017-04-02 13:20:03', '2016-03-11 22:00:00'),
(17, 'fi', 'NAV_FRONT_PAGE', 'LUPA', '2017-01-21 15:29:07', '2016-03-11 22:00:00'),
(18, 'en', 'NAV_FRONT_PAGE', 'LUPA', '2017-01-21 15:29:43', '2016-03-11 22:00:00'),
(19, 'en', 'NAV_CONTACT', 'Contact', NULL, '2016-03-11 22:00:00'),
(20, 'sv', 'NAV_CONTACT', 'Kontakt', '2017-04-02 13:20:03', '2016-03-11 22:00:00'),
(21, 'fi', 'NAV_CONTACT', 'Yhteydenotto', NULL, '2016-03-11 22:00:00'),
(22, 'en', 'GALLERY_TITLE', 'Gallery', NULL, '2016-03-12 22:00:00'),
(23, 'fi', 'GALLERY_TITLE', 'Galleria', NULL, '2016-03-12 22:00:00'),
(24, 'sv', 'GALLERY_TITLE', 'Galleri', '2017-04-02 13:20:03', '2016-03-12 22:00:00'),
(25, 'en', 'SERVICES_TITLE', 'Services', NULL, '2016-03-12 20:00:00'),
(26, 'fi', 'SERVICES_TITLE', 'Palvelut', NULL, '2016-03-12 20:00:00'),
(27, 'sv', 'SERVICES_TITLE', 'Tjänster', '2017-04-02 13:20:03', '2016-03-12 20:00:00'),
(28, 'en', 'CONTACT_TITLE', 'Contact', NULL, '2016-03-11 20:00:00'),
(29, 'sv', 'CONTACT_TITLE', 'Kontakt', '2017-04-02 13:20:03', '2016-03-11 20:00:00'),
(30, 'fi', 'CONTACT_TITLE', 'Yhteydenotto', NULL, '2016-03-11 20:00:00'),
(31, 'fi', 'CONTACT_FIELD_NAME', 'Nimesi', NULL, '2016-04-02 21:00:00'),
(32, 'fi', 'CONTACT_FIELD_EMAIL', 'Sähköpostiosoite', '2017-03-29 16:52:14', '2016-04-02 21:00:00'),
(33, 'fi', 'CONTACT_FIELD_SUBJECT', 'Aihe', NULL, '2016-04-02 21:00:00'),
(34, 'fi', 'CONTACT_FIELD_MESSAGE', 'Viesti', NULL, '0000-00-00 00:00:00'),
(35, 'en', 'CONTACT_FIELD_NAME', 'Your name', NULL, '2016-04-02 18:00:00'),
(36, 'en', 'CONTACT_FIELD_EMAIL', 'Your e-mail', '2017-03-29 16:53:07', '2016-04-02 18:00:00'),
(37, 'en', 'CONTACT_FIELD_SUBJECT', 'Subject', NULL, '2016-04-02 18:00:00'),
(38, 'en', 'CONTACT_FIELD_MESSAGE', 'Message', NULL, '0000-00-00 00:00:00'),
(39, 'sv', 'CONTACT_FIELD_NAME', 'Ditt namn', '2017-04-02 13:20:03', '2016-04-02 18:00:00'),
(40, 'sv', 'CONTACT_FIELD_EMAIL', 'Din e-postadress', '2017-04-02 13:20:03', '2016-04-02 18:00:00'),
(41, 'sv', 'CONTACT_FIELD_SUBJECT', 'Ämne', '2017-04-02 13:20:03', '2016-04-02 18:00:00'),
(42, 'sv', 'CONTACT_FIELD_MESSAGE', 'Meddelande', '2017-04-02 13:20:03', '0000-00-00 00:00:00'),
(43, 'fi', 'CONTACT_SUBMIT', 'Lähetä viesti', NULL, '2016-04-02 21:00:00'),
(44, 'sv', 'CONTACT_SUBMIT', 'Skicka meddelande', '2017-04-02 13:20:03', '2016-04-02 21:00:00'),
(45, 'en', 'CONTACT_SUBMIT', 'Send message', NULL, '2016-04-02 21:00:00'),
(46, 'fi', 'CONTACT_SUBMIT_TEXT', 'Kiitos yhteydenotostasi. Olemme sinuun yhteydessä pian.', NULL, '2016-04-02 21:00:00'),
(47, 'sv', 'CONTACT_SUBMIT_TEXT', 'Tack. Vi kommer att vara i kontakt med dig snart.', '2017-04-02 13:20:03', '2016-04-02 21:00:00'),
(48, 'en', 'CONTACT_SUBMIT_TEXT', 'Thank you. We\'ll be in touch with you soon.', '2016-04-03 16:28:03', '2016-04-02 21:00:00'),
(49, 'fi', 'CONTACT_FIELD_ERROR_NAME', 'Nimi ei voi olla tyhjä.', NULL, '2016-04-02 18:00:00'),
(50, 'fi', 'CONTACT_FIELD_ERROR_EMAIL', 'Sähköpostiosoite on oltava oikea.', NULL, '2016-04-02 18:00:00'),
(51, 'fi', 'CONTACT_FIELD_ERROR_SUBJECT', 'Aihe ei voi olla tyhjä.', NULL, '2016-04-02 18:00:00'),
(52, 'fi', 'CONTACT_FIELD_ERROR_MESSAGE', 'Viestissä on oltava enemmän kuin kolme merkkiä.', NULL, '0000-00-00 00:00:00'),
(53, 'en', 'CONTACT_FIELD_ERROR_NAME', 'Your name can´t be empty.', NULL, '2016-04-02 15:00:00'),
(54, 'en', 'CONTACT_FIELD_ERROR_EMAIL', 'Your e-mail address must be a real address.', NULL, '2016-04-02 15:00:00'),
(55, 'en', 'CONTACT_FIELD_ERROR_SUBJECT', 'The subject can´t be empty.', NULL, '2016-04-02 15:00:00'),
(56, 'en', 'CONTACT_FIELD_ERROR_MESSAGE', 'The message must be longer than three characters.', NULL, '0000-00-00 00:00:00'),
(57, 'sv', 'CONTACT_FIELD_ERROR_NAME', 'Ditt namn kan inte vara tom.', '2017-04-02 13:20:03', '2016-04-02 15:00:00'),
(58, 'sv', 'CONTACT_FIELD_ERROR_EMAIL', 'Din e-postadresss måste vara en riktig e-postaddress.', '2017-04-02 13:20:03', '2016-04-02 15:00:00'),
(59, 'sv', 'CONTACT_FIELD_ERROR_SUBJECT', 'Ämnet kan inte vara tom', '2017-04-02 13:20:03', '2016-04-02 15:00:00'),
(60, 'sv', 'CONTACT_FIELD_ERROR_MESSAGE', 'Meddelandet måste vara längre än tre tecken.', '2017-04-02 13:20:03', '0000-00-00 00:00:00'),
(61, 'fi', 'CONTACT_FIELD_ERROR___CSRF_TOKEN', 'Pahoittelumme, mutta lomake on vanhentunut. Ole hyvä ja yritä uudelleen.', '2016-04-15 19:59:42', '2016-04-13 21:00:00'),
(62, 'en', 'CONTACT_FIELD_ERROR___CSRF_TOKEN', 'We\'re sorry but the form has expired. Please try again.', '2016-04-15 19:58:48', '2016-04-13 21:00:00'),
(63, 'sv', 'CONTACT_FIELD_ERROR___CSRF_TOKEN', 'Vi ber om ursäkt men formen har löpt ut. Var god försök igen.', '2017-04-02 13:20:03', '2016-04-13 21:00:00'),
(64, 'fi', 'VIDEOS_PAGE_TITLE', 'Videoita', '2016-03-06 14:15:39', '2016-03-05 20:00:00'),
(65, 'sv', 'VIDEOS_PAGE_TITLE', 'Video', '2017-04-02 13:20:03', '2016-03-05 20:00:00'),
(66, 'en', 'VIDEOS_PAGE_TITLE', 'Videos', NULL, '2016-03-05 20:00:00'),
(67, 'fi', 'NAV_VIDEOS', 'Videoita', '2016-05-02 18:07:48', '2016-03-11 20:00:00'),
(68, 'en', 'NAV_VIDEOS', 'Videos', '2016-05-02 18:07:29', '2016-03-11 20:00:00'),
(69, 'sv', 'NAV_VIDEOS', 'Video', '2017-04-02 13:20:03', '2016-03-11 20:00:00'),
(70, 'fi', 'VIDEOS_LIST_CAPTION', 'Valitse video', '2016-05-02 21:00:00', '0000-00-00 00:00:00'),
(71, 'sv', 'VIDEOS_LIST_CAPTION', 'Välj video', '2017-04-02 13:20:03', '0000-00-00 00:00:00'),
(72, 'en', 'VIDEOS_LIST_CAPTION', 'Select video', '2016-05-02 21:00:00', '0000-00-00 00:00:00'),
(73, 'en', 'CONTACT_INFO', 'Contact Information', NULL, '2016-12-19 18:00:00'),
(74, 'fi', 'CONTACT_INFO', 'Yhteystiedot', NULL, '2016-12-19 18:00:00'),
(75, 'sv', 'CONTACT_INFO', 'Kontakt information', '2017-04-02 13:20:03', '2016-12-19 18:00:00'),
(76, 'fi', 'FRONT_PAGE_SH_CAPTION_TEXT', 'Länsi-Uudenmaan PuuApu on lohjalainen yritys, joka toimii Länsi-Uudellamaalla ja Salon seudulla. Suorittaessamme puutyöt vastuulla ja huolenpidolla, tavoitteenamme ovat tyytyväiset asiakkaat sekä kaunis ja toimiva ympäristö.', '2017-01-29 17:39:01', '2016-12-27 18:00:00'),
(77, 'en', 'FRONT_PAGE_SH_CAPTION_TEXT', 'Länsi-uudenmaan PuuApu takes care of trees with responsibility and attention. Our ambition is to provide satisfied customers with a functional and beautiful environment.', '2017-01-18 19:48:00', '2016-12-27 18:00:00'),
(78, 'sv', 'FRONT_PAGE_SH_CAPTION_TEXT', 'Länsiuudenmaan PuuApu sköter träd och fällning med ansvar och omsorg. Vi eftersträvar nöjda kunder samt en vacker och fungerande miljö.', '2017-04-02 13:20:03', '2016-12-27 18:00:00'),
(79, 'sv', 'FRONT_PAGE_SH_CAPTION_TITLE', '<span class="green">Trä</span>trubbel?', '2017-04-02 13:20:03', '2016-12-27 20:00:00'),
(80, 'en', 'FRONT_PAGE_SH_CAPTION_TITLE', '<span class="green">Tree</span> trouble?', '2017-01-27 17:50:07', '2016-12-27 20:00:00'),
(81, 'fi', 'FRONT_PAGE_SH_CAPTION_TITLE', '<span class=\'green\'>Puu</span>pulmia?', '2017-01-27 17:44:17', '2016-12-27 20:00:00'),
(82, 'fi', 'CONTACT_TEXT_NAME', 'Länsi-Uudenmaan PuuApu', '2017-01-14 13:52:31', '2017-01-13 22:00:00'),
(83, 'fi', 'CONTACT_TEXT_STREET_ADDRESS', 'Malminkatu 16', NULL, '2017-01-13 22:00:00'),
(84, 'fi', 'CONTACT_TEXT_POSTAL_CODE', '08150', NULL, '2017-01-13 22:00:00'),
(85, 'fi', 'CONTACT_TEXT_CITY', 'Lohja', '2017-01-14 12:49:39', '2017-01-13 22:00:00'),
(86, 'sv', 'CONTACT_TEXT_CITY', 'Lojo', '2017-04-02 13:20:03', '2017-01-13 20:00:00'),
(87, 'sv', 'CONTACT_TEXT_POSTAL_CODE', '08150', '2017-04-02 13:20:03', '2017-01-13 20:00:00'),
(88, 'sv', 'CONTACT_TEXT_STREET_ADDRESS', 'Malminkatu 16', '2017-04-02 13:20:03', '2017-01-13 20:00:00'),
(89, 'en', 'CONTACT_TEXT_CITY', 'Lohja', '2017-01-14 10:49:39', '2017-01-13 20:00:00'),
(90, 'en', 'CONTACT_TEXT_POSTAL_CODE', '08150', NULL, '2017-01-13 20:00:00'),
(91, 'en', 'CONTACT_TEXT_STREET_ADDRESS', 'Malminkatu 16', NULL, '2017-01-13 20:00:00'),
(92, 'sv', 'CONTACT_TEXT_NAME', 'Länsi-Uudenmaan PuuApu', '2017-04-02 13:20:03', '2017-01-13 22:00:00'),
(93, 'en', 'CONTACT_TEXT_NAME', 'Länsi-Uudenmaan PuuApu', '2017-01-14 13:52:26', '2017-01-13 22:00:00'),
(94, 'fi', 'CONTACT_TEXT_BUSINESS_ID', '2138386-4', '2017-01-16 17:45:25', '2017-01-15 22:00:00'),
(95, 'sv', 'CONTACT_TEXT_BUSINESS_ID', '2138386-4', '2017-04-02 13:20:03', '2017-01-15 22:00:00'),
(96, 'en', 'CONTACT_TEXT_BUSINESS_ID', '2138386-4', NULL, '2017-01-15 22:00:00'),
(97, 'fi', 'FRONT_PAGE_SERVICES_TITLE', 'Palvelumme', NULL, '2017-01-23 20:00:00'),
(98, 'sv', 'FRONT_PAGE_SERVICES_TITLE', 'Services', '2017-04-02 13:20:03', '2017-01-23 20:00:00'),
(99, 'en', 'FRONT_PAGE_SERVICES_TITLE', 'Services', NULL, '2017-01-23 20:00:00'),
(100, 'fi', 'NAME_SHORT', 'LUPA', NULL, '2017-01-24 22:00:00'),
(101, 'sv', 'NAME_SHORT', 'LUPA', '2017-04-02 13:20:03', '2017-01-24 22:00:00'),
(102, 'en', 'NAME_SHORT', 'LUPA', NULL, '2017-01-24 22:00:00'),
(103, 'fi', 'FOOTER_NAVIGATION_TITLE', '<span class="orange">Navi</span>gointi', '2017-04-01 14:46:09', '2017-01-24 22:00:00'),
(104, 'en', 'FOOTER_NAVIGATION_TITLE', '<span class="orange">Navi</span>gation', '2017-04-01 14:46:21', '2017-01-24 22:00:00'),
(105, 'sv', 'FOOTER_NAVIGATION_TITLE', '<span class="orange">Navi</span>gation', '2017-04-02 13:20:03', '2017-01-24 22:00:00'),
(106, 'fi', 'CONTACT_US', 'Ota yhteyttä', NULL, '2017-01-24 22:00:00'),
(108, 'sv', 'CONTACT_US', 'Kontakta oss', '2017-04-02 13:20:03', '2017-01-24 22:00:00'),
(109, 'en', 'CONTACT_US', 'Contact us', NULL, '2017-01-24 22:00:00'),
(110, 'fi', 'CONTACT_INFO_FP_TITLE', '<span class="orange">Ota</span> yhteyttä', NULL, '2017-01-24 20:00:00'),
(111, 'sv', 'CONTACT_INFO_FP_TITLE', '<span class="orange">Kontakta</span> oss', '2017-04-02 13:20:03', '2017-01-24 20:00:00'),
(112, 'en', 'CONTACT_INFO_FP_TITLE', '<span class="orange">Contact</span> us', NULL, '2017-01-24 20:00:00'),
(113, 'fi', 'CONTACT_INFO_FP_NAME', '<span class="orange">LU</span>PA', NULL, '2017-01-24 20:00:00'),
(114, 'sv', 'CONTACT_INFO_FP_NAME', '<span class="orange">LU</span>PA', '2017-04-02 13:20:03', '2017-01-24 20:00:00'),
(115, 'en', 'CONTACT_INFO_FP_NAME', '<span class="orange">LU</span>PA', NULL, '2017-01-24 20:00:00'),
(116, 'fi', 'FRONT_PAGE_CONTACT_TITLE', 'Yhteystiedot', NULL, '2017-05-05 21:00:00'),
(117, 'en', 'FRONT_PAGE_CONTACT_TITLE', 'Contact', NULL, '2017-05-05 21:00:00'),
(118, 'sv', 'FRONT_PAGE_CONTACT_TITLE', 'Kontakt', NULL, '2017-05-05 21:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
