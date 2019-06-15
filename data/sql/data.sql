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
(11, 'facebook_page_url', 'https://www.facebook.com/lansiuudenmaanpuuapu/', '2017-01-14 12:59:06', '2017-01-13 22:00:00'),
(12, 'css_src_mode', 'debug', NULL, '2016-07-15 18:00:00');


INSERT INTO `lupa_service` (`id`, `icon_uri`, `sort`, `time_edited`, `time_created`) VALUES
(1, '/data/img/ui-symbols/plant.png', 2, '2018-03-15 18:50:42', '2016-12-31 14:41:27'),
(2, '/data/img/ui-symbols/pruning.png', 3, '2018-03-15 18:50:43', '2016-12-31 14:41:27'),
(3, '/data/img/ui-symbols/tree.png', 0, '2017-05-24 17:16:37', '2016-12-31 14:41:27'),
(4, '/data/img/ui-symbols/stump.png', 1, '2018-03-15 18:48:56', '2016-12-31 14:41:27');

INSERT INTO `lupa_service_image` (`id`, `service_id`, `image_uri`, `time_edited`, `time_created`) VALUES
(8, 3, '/data/img/services/puunkaato.jpg', '2018-03-04 14:21:26', '2016-12-31 00:00:00'),
(9, 2, '/data/img/services/puunhoito.jpg', '2018-03-15 18:38:26', '2016-12-31 00:00:00'),
(10, 4, '/data/img/services/kantojyrsinta.jpg', '2018-03-04 14:21:50', '2016-12-31 00:00:00'),
(11, 1, '/data/img/services/istutus.jpg', '2018-03-15 18:38:30', '2016-12-31 00:00:00');

INSERT INTO `lupa_service_text` (`id`, `service_id`, `language`, `title`, `subtitle`, `text`, `time_edited`, `time_created`) VALUES
(8, 3, 'fi', 'Puunkaato, poiskuljetus, pilkkominen ja hakettaminen', 'Puunkaatoa/ammattitaidolla', 'Suunnittelemme puillesi ja pihallesi sopivan puunkaadon. Kaadamme puusi kiipeilykaatona, nostokorikaatona, suorana kaatona tai muulla tavoin, aina ammatilliseen arviointiin perustuen. Tarjoamme (järjestämme?) myös risujen ja runkojen poiskuljetuksen. Haketamme usein risut kuljetuksen helpottamiseksi. Hake soveltuu kuorikatteeksi esimerkiksi pensaiden juurille. Tukkien pätkimisen ja karsimisen lisäksi voimme pilkkoa pölkyt klapeiksi tehokkaalla klapikoneella, jota vuokraamme myös omaan käyttöön.', '2018-03-14 17:57:08', '2016-12-31 00:00:00'),
(9, 2, 'fi', 'Puiden hoitoleikkaaminen', 'Hoitoleikkaus/ajatuksella', 'Hoitoleikkaamme niin omenapuut, tuija- ja kuusiaidat kuin korkeat jalopuutkin. Leikkaamme maasta käsin, kiipeilemällä tai nostokorista. Leikkaamalla puusi riittävän usein suojelet puutasi ihmisiltä ja ihmiset puultasi.', '2018-03-14 17:59:45', '2016-12-31 00:00:00'),
(10, 4, 'fi', 'Kantojyrsintä', 'Kantojyrsintä/kannot pois', 'Kantojyrsinnällä pääset eroon kannoista ja juurakoista. Kantojyrsinnästä syntyvä hake soveltuu hyvin puutarhakatteeksi pensaiden alle. Kanto hankaloittaa pihasi käyttöä, muun muassa nurmikon leikkaamista ja lumitöitä. Kannon lahoaminen kestää 10-30 vuotta puulajista ja kannon koosta riippuen.', '2018-03-14 17:58:11', '2016-12-31 00:00:00'),
(11, 1, 'sv', 'Plantering, vård och besiktning', 'Plantering/besiktning', 'När du planterar rätt träd på rätt sätt och rätt plats försäkrar du att ditt träd får en god start. Träd behöver skydd och vård, särskilt i byggd miljö. Vi planterar nya träd, besiktigar gamla, samt rekommenderar åtgärder vid behov.', '2018-03-14 18:39:31', '2016-12-31 00:00:00'),
(12, 3, 'sv', 'Trädfällning, bortforsling, klyvning och flisning', 'Trädfällning/yrkesmässigt', 'Vi planerar och genomför trädfällning anpassad för dina träd och din gård. Dina träd fälls med traditionell teknik, genom sektionsfällning (klättring), med bomlift eller med annan ändamålsenlig teknik, alltid enligt yrkesmässig bedömning. Vi erbjuder även bortforsling av stammar och ris. Riset flisas ofta för att underlätta transport. Flisen passar bl.a. som marktäckning runt träd och buskar. Vi kan också flisa ditt ris på beställning. Vi kan också kapa upp och klyva stockarna till vedklabbar med en effektiv vedklyv, som även kan hyras för eget bruk.', '2018-03-14 18:19:32', '2016-12-31 00:00:00'),
(13, 2, 'sv', 'Beskärning av träd och buskar', 'Beskärning/underhåll', 'Vi beskär såväl äppelträd, cypress- och granhäckar som stora ädellövträd. Vi beskär bl.a. från marken, med bomlift eller med klätterteknik. När du beskär dina träd tillräckligt ofta skyddar du både dem från omgivningen samt vice versa.', '2018-03-14 18:23:44', '2016-12-31 00:00:00'),
(14, 4, 'sv', 'Stubbfräsning', 'Stubbfräsning/ta bort stubben', 'Vi kan avlägsna dina stubbar och ytliga rötter genom att fräsa dem. Flisen som blir kvar passar utmärkt som marktäckning runt träd och buskar. Ofta bortforslar vi dock flisen, lägger mull och sår gräs där trädet stod. En stubbe orsakar problem vid såväl gräsklippning som snöröjning. Stubben kan avlägsnas med grävmaskin eller stubbfräs. En stubbe förmultnar under 10–30 år beroende på storlek och träslag. Våra stubbfräsar skadar inte gräsmattan och är av tre olika storlekar, för att passa dina behov.', '2018-03-14 18:21:33', '2016-12-31 00:00:00'),
(15, 1, 'fi', 'Puiden istuttaminen, hoitaminen ja arvioiminen', 'Istuttaminen/arviointi', 'Kun istutat oikean puun oikealla tavalla oikeaan paikkaan, varmistat puullesi pitkän iän. Puusi tarvitsee myös suojelua ja hoitoa, varsinkin rakennetussa ympäristössä, pihoilla ja puistoissa. Miten puusi voi? Arvioimme ja tarjoamme sinulle puusi tarvitsemat palvelut!', '2018-03-15 18:41:13', '2016-12-31 00:00:00'),
(16, 2, 'en', 'Pruning', 'Pruning/tree maintenance', 'We prune apple trees, fir hedges as well as large broadleaved trees from the ground, by climbing the tree or using a skylift. By pruning your trees regularly you protect them from the surroundings and vice versa.', '2018-03-14 18:56:33', '2017-01-02 00:00:00'),
(17, 4, 'en', 'Stump grinding', 'Stump grinding/removing stumps', 'We can remove your tree stumps and roots well under ground to give place for your lawn or otherplants. The chips produced by the stump grinders carbide teeth are suitable for covering the ground around trees and bushes. On request we also transport the chips to the city dump, and seed lawn where the tree stood. Tree stumps make lawn mowing and snow shoveling difficult. It takes 10-30 years for a tree stump to decompose naturally, and it can only be removed with a large excavator or a stump grinder. Our stump grinders do not damage your lawn and they come in three different sizes, depending on your needs.', '2018-03-14 18:55:09', '2017-01-28 00:00:00'),
(18, 3, 'en', 'Tree felling, removal, splitting and chipping', 'Tree felling/professionally', 'We plan and carry out tree removal to suit your trees as well as your yard. We fell your trees byclimbing, using a skylift or by other means fit for purpose, always based on a professional analysis. We also offer removal of brushwood and trunks. We usually chip the brushwood for ease of transport, and tree chips are well suited as ground cover in gardens around bushes and trees. We can split the tree blocks into firewood using an efficient wood splitter which you also can rent and use yourself.', '2018-03-14 18:53:35', '2017-01-28 00:00:00'),
(19, 1, 'en', 'Tree care, planting and inspection', 'Planting/inspection', 'Having the right tree planted the right way in the right spot with skill and care provides it with the good start it needs to thrive and survive. Your tree needs protection and care taking, especially in a built environment. How are your trees doing? Do they need attention? We inspect and offer the services your trees need!', '2018-03-14 18:58:45', '2017-01-28 00:00:00');


INSERT INTO `lupa_slide` (`id`, `html`, `content_target`, `is_published`, `time_created`, `time_edited`) VALUES
(1, '<img src="/data/img/slides/skog5B_be.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2017-01-06 16:01:17'),
(2, '<img src="/data/img/slides/skog6B_be.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2017-01-06 16:01:25'),
(3, '<img src="/data/img/slides/skog3B_be.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2017-01-06 16:01:33'),
(4, '<img src="/data/img/slides/skog1leikattu_be.jpg" alt="" class="lupa-slide-image">', 'front_page', 1, '2016-12-21 00:00:00', '2017-01-06 16:01:43');


INSERT INTO `lupa_faq_answer` (`id`, `image_uri`, `time_created`, `time_edited`) VALUES
(1, '', '2017-11-28 00:00:00', NULL),
(2, '', '2017-11-28 00:00:00', NULL),
(3, '/data/img/faq/martin_01.jpg', '2017-11-28 00:00:00', '2018-03-06 20:08:08'),
(4, '', '2018-03-14 00:00:00', NULL),
(5, '', '2018-03-14 00:00:00', NULL),
(6, '', '2018-03-14 00:00:00', NULL),
(7, '', '2018-03-14 00:00:00', NULL),
(8, '', '2018-03-14 00:00:00', NULL),
(9, '', '2018-03-14 00:00:00', NULL),
(10, '', '2018-03-14 00:00:00', NULL),
(11, '', '2018-03-14 00:00:00', NULL);

INSERT INTO `lupa_faq_answer_text` (`id`, `faq_answer_id`, `language`, `question`, `answer`, `time_created`, `time_edited`) VALUES
(1, 1, 'fi', 'Syntyykö kantojyrsinnästä paljon haketta?', 'Pienen, alle 20cm kannon hakkeet voi tasoittaa kannon paikalle, mutta isommasta yli 60cm kannosta voi syntyä kuutiometrin eli 10 jätesäkin verran haketta. Maksusta viemme jyrsintäjätteet mennessämme.', '2017-11-28 00:00:00', '2018-03-14 21:27:58'),
(8, 2, 'fi', 'Kuinka paljon puun kaataminen maksaa?', 'Merkittyjen puiden kaatohinnan arvioimme maksutta. Usein myös keskustelemme tavoitteista ja ehdotamme erilaisia ratkaisuja. Kirjallinen tarjous on tietysti maksuton.', '2017-11-28 00:00:00', '2018-03-14 21:31:06'),
(11, 3, 'fi', 'Puussa on halkeama tai kääpä/kuori irtoaa, onko puu pakko kaataa?', 'Kyseiset oireet ovat usein merkkejä vakavasta ongelmasta, mutta jokainen puu on arvioitava erikseen. Tilanne riippuu paljolti puulajista, puun rakenteesta ja sijainnista ym. Tulemme mielellämme tekemään arvion ja tarjouksen tarvittavista toimenpiteistä.', '2017-11-28 00:00:00', '2018-03-14 21:31:56'),
(12, 4, 'fi', 'Meille on tulossa pihatöitä, kuinka suojaan säilytettävät puut?', 'Suojaus riippuu puulajista ja puun koosta. On mm. tärkeää suojata puun pintajuuria, mikäli puun vierestä on tarkoitus ajaa maansiirtokoneilla. Ihan puun vierestä ei myöskään voi suorittaa kaivuutöitä vahingoittamatta puuta peruuttamattomasti. Tulemme mielellämme arvioimaan tilanteen ja laatimaan puullesi suojaussuunnitelman.', '2018-03-14 00:00:00', '2018-03-14 21:38:12'),
(13, 5, 'fi', 'Paljonko kantojyrsintä maksaa?', 'Teemme mielellämme tarjouksen kantojyrsinnästä. Hinta per kanto on pienempi, mikäli kantoja on paljon (yli 10 kpl). Kannon koko ja sijainti vaikuttavat myös hintaan.', '2018-03-14 00:00:00', '2018-03-14 21:38:12'),
(14, 6, 'fi', 'Kuinka leveän kulkuväylän kantojyrsin vaatii?', 'Iso kone mahtuu 90 cm leveästä portista. Pienempi kone mahtuu alle 70 cm portista. Pikkukantoja varten meiltä löytyy myös kannettava jyrsin.', '2018-03-14 00:00:00', '2018-03-14 21:44:29'),
(15, 7, 'fi', 'Voiko jyrsityn kannon tilalle kylvää nurmikon?', 'Kyllä voi!', '2018-03-14 00:00:00', NULL),
(16, 8, 'fi', 'Puu kallistuu, kaatuuko se?', 'On hälyttävää, jos puun asento muuttuu, varsinkin jos juuret nousevat kallistumaan ”selkäpuolella”. Toisaalta kallellaan oleva puu voi olla tasapainossa siinä missä pystysuorakin puu.', '2018-03-14 00:00:00', NULL),
(17, 9, 'fi', 'Omenapuun sato on heikko, onko mitään tehtävissä? ', 'Omenat ja lehdet tarvitsevat valoa ja liikkuvaa ilmaa kehittyäkseen suotuisasti, siksi kannattaa puut kannattaa hoitoleikata kerran vuodessa helmi-maaliskuussa.', '2018-03-14 00:00:00', NULL),
(18, 10, 'fi', 'Voiko vanhan puun paikalle istuttaa uuden?', 'Voi, kunhan vanha kanto saadaan kokonaan jyrsittyä pois.', '2018-03-14 00:00:00', NULL),
(19, 11, 'fi', 'Kuinka syvälle kantojyrsin yltää?', 'Normaali jyrsintäsyvyys on 15 cm, mutta tarvittaessa päästään n. 30 cm asti.', '2018-03-14 00:00:00', NULL);


INSERT INTO `lupa_ui_text` (`id`, `language`, `code`, `content`, `time_edited`, `time_created`) VALUES
(1, 'fi', 'FRONT_PAGE_PROMO', 'Kehitämme ja valmistamme prototyypejä ja sisustusosia puusta. Hyödynnämme mm. cnc-tekniikkaa ja puun muotopuristusta.', '2016-05-15 18:35:20', '2016-03-05 22:00:00'),
(2, 'sv', 'FRONT_PAGE_PROMO', 'Vi utvecklar och tillverkar prototyper och inredningsdetaljer av trä. Cnc-fräsning och vakumlaminering ar några av de tekniker vi tillämpar.', '2017-04-02 13:20:03', '2016-03-05 22:00:00'),
(3, 'en', 'FRONT_PAGE_PROMO', 'We develop and manufacture prototypes and furniture parts from various wood materials. Cnc-routing and vacuum veneering are some of the technics at our disposal.', '2016-03-06 16:17:35', '2016-03-05 22:00:00'),
(4, 'fi', 'FRONT_PAGE_TITLE', 'Puunkaadot ammattitaidolla', '2017-01-21 15:29:37', '2016-03-05 22:00:00'),
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
(49, 'fi', 'CONTACT_FIELD_ERROR_NAME', 'Nimi ei voi olla tyhjä eikä yli 255 merkkiä pitkä.', NULL, '2016-04-02 18:00:00'),
(50, 'fi', 'CONTACT_FIELD_ERROR_EMAIL', 'Sähköpostiosoite on oltava oikea.', NULL, '2016-04-02 18:00:00'),
(51, 'fi', 'CONTACT_FIELD_ERROR_SUBJECT', 'Aihe ei voi olla tyhjä eikä yli 255 merkkiä pitkä.', NULL, '2016-04-02 18:00:00'),
(52, 'fi', 'CONTACT_FIELD_ERROR_MESSAGE', 'Viestin on oltava vähintään neljä merkkiä ja enintään 4000 merkkiä pitkä.', NULL, '0000-00-00 00:00:00'),
(53, 'en', 'CONTACT_FIELD_ERROR_NAME', 'Your name can´t be empty or over 255 characters long.', NULL, '2016-04-02 15:00:00'),
(54, 'en', 'CONTACT_FIELD_ERROR_EMAIL', 'Your e-mail address must be a real address.', NULL, '2016-04-02 15:00:00'),
(55, 'en', 'CONTACT_FIELD_ERROR_SUBJECT', 'The subject can´t be empty or over 255 characters long.', NULL, '2016-04-02 15:00:00'),
(56, 'en', 'CONTACT_FIELD_ERROR_MESSAGE', 'The message must be longer than four characters and shorter than 4000 characters.', NULL, '0000-00-00 00:00:00'),
(57, 'sv', 'CONTACT_FIELD_ERROR_NAME', 'Ditt namn kan inte vara tom eller längre än 255 tecken.', '2017-04-02 13:20:03', '2016-04-02 15:00:00'),
(58, 'sv', 'CONTACT_FIELD_ERROR_EMAIL', 'Din e-postadresss måste vara en riktig e-postaddress.', '2017-04-02 13:20:03', '2016-04-02 15:00:00'),
(59, 'sv', 'CONTACT_FIELD_ERROR_SUBJECT', 'Ämnet kan inte vara tom eller längre än 255 tecken.', '2017-04-02 13:20:03', '2016-04-02 15:00:00'),
(60, 'sv', 'CONTACT_FIELD_ERROR_MESSAGE', 'Meddelandet måste vara längre än fyra tecken och kortare än 4000 tecken.', '2017-04-02 13:20:03', '0000-00-00 00:00:00'),
(61, 'fi', 'CONTACT_FIELD_ERROR___CSRF_TOKEN', 'Pahoittelumme, mutta lomake on vanhentunut. Ole hyvä ja yritä uudelleen.', '2016-04-15 19:59:42', '2016-04-13 21:00:00'),
(62, 'en', 'CONTACT_FIELD_ERROR___CSRF_TOKEN', 'We\'re sorry but the form has expired. Please try again.', '2016-04-15 19:58:48', '2016-04-13 21:00:00'),
(63, 'sv', 'CONTACT_FIELD_ERROR___CSRF_TOKEN', 'Vi ber om ursäkt men formen har löpt ut. Var god försök igen.', '2017-04-02 13:20:03', '2016-04-13 21:00:00'),
(64, 'fi', 'VIDEOS_PAGE_TITLE', 'Videoita', '2016-03-06 14:15:39', '2016-03-05 20:00:00'),
(65, 'sv', 'VIDEOS_PAGE_TITLE', 'Videor', '2017-04-02 13:20:03', '2016-03-05 20:00:00'),
(66, 'en', 'VIDEOS_PAGE_TITLE', 'Videos', NULL, '2016-03-05 20:00:00'),
(67, 'fi', 'NAV_VIDEOS', 'Videoita', '2016-05-02 18:07:48', '2016-03-11 20:00:00'),
(68, 'en', 'NAV_VIDEOS', 'Videos', '2016-05-02 18:07:29', '2016-03-11 20:00:00'),
(69, 'sv', 'NAV_VIDEOS', 'Videor', '2017-04-02 13:20:03', '2016-03-11 20:00:00'),
(70, 'fi', 'VIDEOS_LIST_CAPTION', 'Valitse video', '2016-05-02 21:00:00', '0000-00-00 00:00:00'),
(71, 'sv', 'VIDEOS_LIST_CAPTION', 'Välj video', '2017-04-02 13:20:03', '0000-00-00 00:00:00'),
(72, 'en', 'VIDEOS_LIST_CAPTION', 'Select video', '2016-05-02 21:00:00', '0000-00-00 00:00:00'),
(73, 'en', 'CONTACT_INFO', 'Contact Information', NULL, '2016-12-19 18:00:00'),
(74, 'fi', 'CONTACT_INFO', 'Yhteystiedot', NULL, '2016-12-19 18:00:00'),
(75, 'sv', 'CONTACT_INFO', 'Kontakt information', '2017-04-02 13:20:03', '2016-12-19 18:00:00'),
(76, 'fi', 'FRONT_PAGE_SH_CAPTION_TEXT', '<p>Länsi-Uudenmaan PuuApu on Länsi-Uudellamaalla toimiva lohjalainen yritys.</p> <p>Vastuullisella\nhuolenpidolla varmistamme asiakkaillemme kauniin ja toimivan ympäristön.</p>', '2018-03-14 18:11:31', '2016-12-27 18:00:00'),
(77, 'en', 'FRONT_PAGE_SH_CAPTION_TEXT', '<p>Länsi-Uudenmaan PuuApu takes care of trees with responsibility and attention.</p> <p>Our ambition is to\nprovide satisfied customers with a functional and beautiful environment.</p>', '2018-03-14 18:51:05', '2016-12-27 18:00:00'),
(78, 'sv', 'FRONT_PAGE_SH_CAPTION_TEXT', '<p>Nyländska TrädHjälpen sköter träd och fällning med ansvar och omsorg.</p> <p>Vi eftersträvar nöjda\nkunder samt en vacker och fungerande miljö.</p>', '2018-03-14 18:16:23', '2016-12-27 18:00:00'),
(79, 'sv', 'FRONT_PAGE_SH_CAPTION_TITLE', 'Trädtrubbel?', '2018-02-01 18:33:00', '2016-12-27 20:00:00'),
(80, 'en', 'FRONT_PAGE_SH_CAPTION_TITLE', 'Tree trouble?', '2018-02-01 18:32:43', '2016-12-27 20:00:00'),
(81, 'fi', 'FRONT_PAGE_SH_CAPTION_TITLE', 'Puupulmia?', '2018-02-04 12:06:09', '2016-12-27 20:00:00'),
(82, 'fi', 'CONTACT_TEXT_NAME', 'Länsi-Uudenmaan PuuApu', '2017-01-14 13:52:31', '2017-01-13 22:00:00'),
(83, 'fi', 'CONTACT_TEXT_STREET_ADDRESS', 'Malminkatu 16', '2017-05-20 13:06:29', '2017-01-13 22:00:00'),
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
(94, 'fi', 'CONTACT_TEXT_BUSINESS_ID', '2899706-8', '2017-01-16 17:45:25', '2017-01-15 22:00:00'),
(95, 'sv', 'CONTACT_TEXT_BUSINESS_ID', '2899706-8', '2017-04-02 13:20:03', '2017-01-15 22:00:00'),
(96, 'en', 'CONTACT_TEXT_BUSINESS_ID', '2899706-8', NULL, '2017-01-15 22:00:00'),
(97, 'fi', 'FRONT_PAGE_SERVICES_TITLE', 'Palvelut', '2018-02-11 15:19:52', '2017-01-23 20:00:00'),
(98, 'sv', 'FRONT_PAGE_SERVICES_TITLE', 'Tjänster', '2017-04-02 13:20:03', '2017-01-23 20:00:00'),
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
(118, 'sv', 'FRONT_PAGE_CONTACT_TITLE', 'Kontakt', '2017-05-06 16:45:51', '2017-05-05 21:00:00'),
(119, 'fi', 'CONTACT_PROMPT_TEXT', 'Lähetä meille yhteydenottopyyntö antamalla tietosi alla olevaan lomakkeeseen.', '2018-03-08 18:59:37', '2017-05-20 12:00:00'),
(120, 'en', 'CONTACT_PROMPT_TEXT', 'Send us a contact request by entering your information below.', '2018-03-08 18:59:52', '2017-05-20 12:00:00'),
(121, 'sv', 'CONTACT_PROMPT_TEXT', 'Ange din information nedan så tar vi kontakt.', '2018-03-08 19:00:01', '2017-05-20 12:00:00'),
(122, 'fi', 'NAV_FAQ', 'Usein kysyttyä', '2018-03-08 19:33:52', '2016-03-11 20:00:00'),
(123, 'en', 'NAV_FAQ', 'Frequently asked', '2018-03-08 19:33:54', '2016-03-11 20:00:00'),
(124, 'sv', 'NAV_FAQ', 'Vanliga frågor', '2018-03-08 19:33:50', '2016-03-11 20:00:00'),
(125, 'fi', 'FAQ_TITLE', 'Usein kysyttyä', NULL, '2016-03-11 20:00:00'),
(126, 'en', 'FAQ_TITLE', 'Frequently asked', NULL, '2016-03-11 20:00:00'),
(127, 'sv', 'FAQ_TITLE', 'Vanliga frågor', '2017-04-02 10:20:03', '2016-03-11 20:00:00'),
(131, 'fi', 'FRONT_PAGE_VIDEOS_TITLE', 'Videot', NULL, '2017-01-23 18:00:00'),
(132, 'sv', 'FRONT_PAGE_VIDEOS_TITLE', 'Video', '2017-04-02 10:20:03', '2017-01-23 18:00:00'),
(133, 'en', 'FRONT_PAGE_VIDEOS_TITLE', 'Videos', NULL, '2017-01-23 18:00:00'),
(134, 'fi', 'FRONT_PAGE_VIDEOS_SUBTITLE', 'Näin se tapahtuu', NULL, '2017-01-23 18:00:00'),
(135, 'sv', 'FRONT_PAGE_VIDEOS_SUBTITLE', 'Hur vi gör det', '2017-04-02 10:20:03', '2017-01-23 18:00:00'),
(136, 'en', 'FRONT_PAGE_VIDEOS_SUBTITLE', 'How we do it', NULL, '2017-01-23 18:00:00'),
(137, 'fi', 'FRONT_PAGE_SERVICES_SUBTITLE', 'Neljä osa-aluetta', NULL, '2017-01-23 18:00:00'),
(138, 'sv', 'FRONT_PAGE_SERVICES_SUBTITLE', 'Fyra delområder', '2017-04-02 10:20:03', '2017-01-23 18:00:00'),
(139, 'en', 'FRONT_PAGE_SERVICES_SUBTITLE', 'Four sectors', NULL, '2017-01-23 18:00:00'),
(140, 'fi', 'NEWS_TITLE', 'Ajankohtaista', NULL, '2016-03-11 20:00:00'),
(141, 'en', 'NEWS_TITLE', 'News', NULL, '2016-03-11 20:00:00'),
(142, 'sv', 'NEWS_TITLE', 'News', '2017-04-02 10:20:03', '2016-03-11 20:00:00'),
(143, 'fi', 'NEWS_CONTENT', 'Loma-ajat 2018: 22.6. - 11.7.', '2018-03-12 20:11:32', '2016-03-11 20:00:00'),
(144, 'en', 'NEWS_CONTENT', 'Vacation 2018: 22.6. - 11.7.', NULL, '2016-03-11 20:00:00'),
(145, 'sv', 'NEWS_CONTENT', 'Semestertider 2018: 22.6. - 11.7.', '2017-04-02 10:20:03', '2016-03-11 20:00:00'),
(150, 'fi', 'NAV_NEWS', 'Ajankohtaista', NULL, '2016-03-11 20:00:00'),
(151, 'en', 'NAV_NEWS', 'News', NULL, '2016-03-11 20:00:00'),
(152, 'sv', 'NAV_NEWS', 'News', '2017-04-02 10:20:03', '2016-03-11 20:00:00');

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
('fi', 'CONTACT_TEXT_PHONE_NUMBER', '050 301 7661', NULL, '2018-05-27 19:00:00'),
('sv', 'CONTACT_TEXT_PHONE_NUMBER', '050 301 7661', NULL, '2018-05-27 19:00:00'),
('en', 'CONTACT_TEXT_PHONE_NUMBER', '050 301 7661', NULL, '2018-05-27 19:00:00');


INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
('fi', 'CONTACT_POLICY', 'Käytämme yhteystietojasi vain yhteydenpitoon. Säilytämme tietosi lakisääteisten vaatimusten mukaisesti.', NULL, '2018-05-27 19:00:00'),
('sv', 'CONTACT_POLICY', 'Vi använder bara dina kontaktuppgifter till att kontakta dig. Vi lagrar din information i enlighet med lagstadgade krav.', NULL, '2018-05-27 19:00:00'),
('en', 'CONTACT_POLICY', 'We only use your contact information to contact you. We store your information in compliance with statutory requirements.', NULL, '2018-05-27 19:00:00');


-- 1903 -

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'META_DESCRIPTION_FRONT_PAGE', 'Puunkaato ammattitaidolla Länsi-Uudenmaan alueella mm: Lohja ja Vihti.\nTeemme myös kantojyrsinnät, puiden istuttamiset ja hoitoleikkaamiset. Katso lisää!', NULL, '2019-03-30 19:00:00')
, ('en', 'META_DESCRIPTION_FRONT_PAGE', '', NULL, '2019-03-30 19:00:00')
, ('sv', 'META_DESCRIPTION_FRONT_PAGE', '', NULL, '2019-03-30 19:00:00')
;


INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'INFO_FELLING_PAGE_TITLE', 'Puunkaadot ammattitaidolla', NULL, '2019-03-30 19:00:00')
, ('en', 'INFO_FELLING_PAGE_TITLE', '', NULL, '2019-03-30 19:00:00')
, ('sv', 'INFO_FELLING_PAGE_TITLE', '', NULL, '2019-03-30 19:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'GENRAL_ERROR_MESSAGE', 'Pahoittelemme, jotain meni vikaan. Voit ottaa meihin yhteyttä sähköpostilla: myynti@lu-pa.fi', NULL, '2019-03-30 19:00:00')
, ('en', 'GENRAL_ERROR_MESSAGE', 'We\'re sorry, something went wrong. If you wish, you can contact us by email: myynti@lu-pa.fi', NULL, '2019-03-30 19:00:00')
, ('sv', 'GENRAL_ERROR_MESSAGE', 'Vi ber om ursäkt, något gick fel. Du kan kontakta oss via e-post: myynti@lu-pa.fi', NULL, '2019-03-30 19:00:00')
;

// 1905 -

INSERT INTO `lupa_info_page` (`id`, `uri`, `time_edited`, `time_created`) VALUES
(1, 'puunkaato/', '2019-03-31 15:17:53', '2019-03-31 00:00:00'),
(2, 'puunkaato/espoo', NULL, '2019-03-31 00:00:00'),
(3, 'puunkaato/hanko', NULL, '2019-05-15 00:00:00'),
(4, 'puunkaato/inkoo', NULL, '2019-05-19 00:00:00'),
(5, 'puunkaato/karkkila', NULL, '2019-05-19 00:00:00'),
(6, 'puunkaato/kauniainen', NULL, '2019-05-26 00:00:00'),
(7, 'puunkaato/lohja', NULL, '2019-05-26 00:00:00'),
(8, 'puunkaato/raasepori', NULL, '2019-05-26 00:00:00'),
(9, 'puunkaato/siuntio', NULL, '2019-05-26 00:00:00'),
(10, 'puunkaato/vihti', NULL, '2019-05-26 00:00:00');

INSERT INTO `lupa_info_page_content` (`id`, `uri`, `position`, `is_html`, `language`, `title`, `content`, `video_id`, `image_uri`, `image_description`, `time_edited`, `time_created`) VALUES
(1, 'puunkaato/', 1, 0, 'fi', 'Puunkaato', '', NULL, '', '', '2019-04-13 12:49:57', '2019-03-31 00:00:00'),
(2, 'puunkaato/', 3, 0, 'fi', 'Milloin puu tarvitsee kaataa?', 'Puu kannattaa kaataa jos siinä esiintyy lahoamisen merkkejä, tai jos esimerkiksi puun neulaset, lehdet\r\nja oksat kerääntyvät talon katolle vaurioittaen sitä.\r\nRungosta irtoava kuori, latvuston harsuuntuminen, tiettyjen kääpien esiintyminen ja muutokset puun asennossa ovat aina merkkejä vakavista ongelmista. Puut ovat yksilöitä, joten jokainen puu on arvioitava erikseen, puun kasvupaikka on myös otettava huomioon arviossa. Vallitsevat riskit riippuvat puulajista, puun rakenteesta ja sijainnista.\r\nPuunkaato voi myös olla ajankohtaista jos se varjostaa tonttia ja kaipaat lisää valoa pihalle.', NULL, '', '', '2019-04-13 12:49:57', '2019-03-31 00:00:00'),
(3, 'puunkaato/', 4, 0, 'fi', '', 'Tulemme mielellämme tekemään maksuttoman arvion ja tarjouksen tarvittavista toimenpiteistä. Teemme myös laajempia, kirjallisia kuntoarviointeja esimerkiksi maisematöiden päätösten pohjaksi.', NULL, '', '', '2019-04-13 12:49:57', '2019-03-31 00:00:00'),
(4, 'puunkaato/', 5, 0, 'fi', 'Puu kallistuu, kaatuuko se?', 'On hälyttävää, jos puun asento muuttuu, varsinkin jos juuret nousevat kallistumaan ”selkäpuolella”. Heikosti ankkuroidun puun juuret saattavat tuulisella säällä liikkua. Ota heti yhteyttä koulutettuun arboristiin jos huomaat vaarallisen puun oleskelualueen tai rakennusten lähellä. Toisaalta kallellaan oleva puu voi olla tasapainossa siinä missä pystysuorakin puu.', NULL, '', '', '2019-04-13 12:49:57', '2019-03-31 00:00:00'),
(5, 'puunkaato/espoo', 1, 0, 'fi', 'Puunkaatoluvat Espoossa', '', NULL, '', '', '2019-04-13 12:49:57', '2019-03-31 00:00:00'),
(6, 'puunkaato/espoo', 3, 0, 'fi', '', 'Yhdenkin puun kaataminen voi edellyttää maisematyölupaa, mikäli sillä on vaikutuksia kaupunki- tai maisemakuvaan. Toisaalta usean puun kaataminen piha-alueelta voidaan tulkita vähäiseksi, jos pihaan jää paljon puustoa.', NULL, '', '', '2019-04-13 12:49:57', '2019-03-31 00:00:00'),
(7, 'puunkaato/espoo', 4, 1, 'fi', '', '<p>Lisätietoja saa <a target=\"_blank\" href=\"https://www.espoo.fi/fi-FI/Asuminen_ja_ymparisto/Rakentaminen/Rakennusvalvonta/Luvan_hakeminen/Puunkaato_ja_maisematyot\" title=\"Maisematyölupa\">rakennusvalvontakeskuksesta</a>.</p>', NULL, '', '', '2019-04-23 17:44:27', '2019-03-31 00:00:00'),
(8, 'puunkaato/', 2, 0, 'fi', '', 'Suoritamme puunkaadot 10 vuoden kokemuksella.\r\nMeiltä onnistuu kiipeilykaadot, suorat kaadot, korikaadot ja nosturikaadot. Puiden kaataminen ja siirtäminen myös erityisen vaikeista paikoista, kuten jyrkät rinteet ja vaikeakulkuiset maastot ovat erityisalamme.', NULL, '', '', '2019-04-13 12:49:57', '2019-03-31 00:00:00'),
(9, 'puunkaato/espoo', 2, 0, 'fi', '', 'Espoossa lupa pihan tai tontin puuston kaatamiseen ratkaistaan rakennusvalvontakeskuksessa.', NULL, '', '', '2019-04-13 12:49:57', '2019-03-31 00:00:00'),
(10, 'puunkaato/', 6, 0, 'fi', 'Miksi tilata koulutettu puunkaadon ammattilainen paikalle?', 'Koulutettu arboristi hoitaa puiden kaadon turvallisesti kaikissa olosuhteissa vuoden ympäri. Ammattitaidolla kaadettu puu säästää ympäristöä ja pienentää vahinkoriskiä. Esimerkiksi kuusen kaataminen saattaa näyttää helpolta rastilta, mutta usein se ei ole.\r\nKuusi on usein arvaamaton, koska oksien paino ja tuulipinta-alan yhteisvaikutus on vaikea arvioida, jolloin puu saattaa kaatua muuhun kuin haluttuun suuntaan. Erityisosaamisella ja laajalla kokemuksella varmistamme, että joka puunkaato on turvallinen.\r\nMeillä on myös laaja vakuutus vahinkojen varalle.', 1, '', '', '2019-04-13 12:49:57', '2019-03-31 00:00:00'),
(11, 'puunkaato/', 7, 1, 'fi', 'Erikoispuunkaato', '<p>Suoritamme myös ns. erikoispuunkaadot ja meillä on niistä paljon kokemusta.\r\nNosturikaadoissa käytämme apunamme Nostolava-auto yhteistyökumppaniamme: <a href=\"https://nostolavapalvelu.fi/nostolava-auton-vuokraus\" target=\"_blank\">Nostolavapalvelua</a>.\r\nHeidän kalustolla pääsemme tarvittaessa jopa 40 metriin, joten suurtenkin puiden kaato onnistuu!</p>', NULL, '/data/img/faq/martin_01.jpg', 'Puunkaato', '2019-05-19 13:09:11', '2019-03-31 00:00:00'),
(12, 'puunkaato/', 8, 0, 'fi', 'Mitä puunkaato maksaa?', 'Merkittyjen puiden kaatohinnan arvioimme maksutta.\r\nUsein myös keskustelemme tavoitteista ja ehdotamme erilaisia ratkaisuja.\r\nKirjallinen tarjous on tietysti maksuton.', NULL, '', '', '2019-04-13 13:00:07', '2019-03-31 00:00:00'),
(13, 'puunkaato/', 9, 0, 'fi', 'Ennen töihin ryhtymistä', 'Ennen kuin puuta lähdetään suinpäin kaatamaan, pitää usein pyytää lupa kunnalta.\r\nTässä ohjeet puunkaato lupien pyytämiseen kunnittain: Lohja , Vihti , Kirkkonummi.', NULL, '', '', '2019-04-13 13:00:07', '2019-03-31 00:00:00'),
(14, 'puunkaato/', 10, 0, 'fi', 'Muut palvelut', 'Puu on nyt kaadettu, mitä seuraavaksi?\r\nTarjoamme myös risujen ja runkojen poiskuljetuksen. Haketamme usein risut kuljetuksen helpottamiseksi. Hake soveltuu kuorikatteeksi esimerkiksi pensaiden juurille. Tukkien pätkimisen ja karsimisen lisäksi voimme\r\npilkkoa pölkyt klapeiksi tehokkaalla klapikoneella, jota vuokraamme myös omaan käyttöön.', NULL, '/data/img/felling/puiden_kaataminen-web.jpg', 'Palvelut', '2019-05-17 17:37:53', '2019-03-31 00:00:00'),
(15, 'puunkaato/', 11, 1, 'fi', '', '<br><strong>Kantojyrsintä</strong>', NULL, '', '', '2019-04-22 18:06:41', '2019-03-31 00:00:00'),
(16, 'puunkaato/', 12, 0, 'fi', '', 'Puulajista ja kannon koosta riippuen kannolla kestää lahota noin 10-30 vuotta. Mikäli kanto hankaloittaa pihasi käyttöä ja haluat siitä heti eroon, voimme poistaa kannon jyrsimällä. Kantojyrsin yltää syvällekin, mutta yleisin jyrsintäsyvyys on 10-15cm. Usein poistamme kannot, levitämme multaa ja kylvämme paikalle nurmikon.', NULL, '', '', '2019-04-13 13:00:07', '2019-03-31 00:00:00'),
(17, 'puunkaato/', 13, 0, 'fi', '', 'Palveluihimme kuuluu myös puiden hoitoleikkaaminen ja puiden istutus.', NULL, '', '', '2019-04-13 13:00:07', '2019-03-31 00:00:00'),
(18, 'puunkaato/', 14, 0, 'fi', 'Voiko vanhan puun paikalle istuttaa uuden?', 'Voi, kunhan vanha kanto saadaan kokonaan jyrsittyä pois. Jos vanhan puun paksut juuret vaikeuttavat istutuskuopan teko voidaan uusi puu istuta vajan metrin verran vanhasta sivummalle, tai muodosta istutuskummun, varsinkin savimaalla.', NULL, '', '', '2019-04-13 13:00:07', '2019-03-31 00:00:00'),
(19, 'puunkaato/', 15, 1, 'fi', 'Puunkaadot Länsi-Uudellamaalla', '<p>Toimialueemme kattaa koko Länsi-Uudenmaan alueen:\r\n<a href=\"https://lu-pa.fi/puunkaato/espoo\">Espoo</a> , <a href=\"https://lu-pa.fi/puunkaato/hanko\">Hanko</a> , <a href=\"https://lu-pa.fi/puunkaato/inkoo\">Inkoo</a> , <a href=\"https://lu-pa.fi/puunkaato/karkkila\">Karkkila</a> , <a href=\"https://lu-pa.fi/puunkaato/kauniainen\">Kauniainen</a> , <a href=\"https://lu-pa.fi/puunkaato/lohja\">Lohja</a> , <a href=\"https://lu-pa.fi/puunkaato/raasepori\">Raasepori</a> , <a href=\"https://lu-pa.fi/puunkaato/siuntio\">Siuntio</a> , <a href=\"https://lu-pa.fi/puunkaato/vihti\">Vihti</a> , Karjaa, Karjalohja, Nummela, Pohja, Sammatti, Tammisaari.</p>', NULL, '', '', '2019-04-13 13:00:07', '2019-03-31 00:00:00'),
(20, 'puunkaato/hanko', 1, 0, 'fi', 'Puunkaatoluvat Hangossa', '', NULL, '', '', '2019-05-15 19:50:24', '2019-05-15 00:00:00'),
(21, 'puunkaato/hanko', 3, 0, 'fi', '', 'Puiden kaatamiseen tonteilta asemakaava-alueella on yleensä haettava maisematyölupa. Alueella, jolla on voimassa MRL 38 § ja 53 § mukainen rakennuskielto, ovat maisemaa muuttavat toimenpiteet luvanvaraisia ja puun/puiden kaatamiseen on haettava maisematyölupa. Lupa on haettava myös, mikäli yleiskaavassa niin määrätään.', NULL, '', '', '2019-05-15 19:50:50', '2019-05-15 00:00:00'),
(22, 'puunkaato/hanko', 2, 0, 'fi', '', 'Asemakaavoitetulla aluella puita ei suositella kaadettavaksi ilman aitoa tarvetta. Hangossa erityisen tärkeitä puita ovat jalopuut, iäkkäät männyt, puistokujanteet sekä puut ja puuryhmät, joilla on suojavaikutus tuulilta tai melulta.', NULL, '', '', '2019-05-15 19:59:14', '2019-05-15 00:00:00'),
(23, 'puunkaato/hanko', 4, 0, 'fi', '', 'Lupaa ei tarvita silloin, jos toimenpide on hyväksytty jonkin muun luvan yhteydessä (rakennuslupa, maa-ainesten ottolupa) tai muulla suunnitelmalla (esim. kunnallistekniset suunnitelmat asemakaavan toteuttamiseksi). Vaikutuksiltaan vähäiseen toimenpiteeseen ei lupaa tarvita, mutta yhdenkin puun kaataminen voi kuitenkin edellyttää lupaa. Toimenpiteen vähäisyyden arvioi ensi kädessä kaupungingeodeetti, joka käsittelee puunkaadot ja maisematyöluvat sekä tonteilla että puistoalueilla. Vähäisenä toimenpiteenä pidetään yleensä esimerkiksi nuoren lepikon siistimistä tai matalan puun kaatamista omalta pihalta.', NULL, '', '', NULL, '2019-05-15 00:00:00'),
(24, 'puunkaato/hanko', 5, 0, 'fi', '', 'Puut tulee kaataa lintujen pesimäajan ulkopuolella. Suurten puiden kaatamiseen suositellaan ammattilaisen käyttämistä henkilö- ja omaisuusvahinkojen välttämiseksi.', NULL, '', '', NULL, '2019-05-15 00:00:00'),
(25, 'puunkaato/hanko', 6, 0, 'fi', '', 'Toimenpidettä ei voida pitää vähäisenä ja lupa on aina haettava seuraavissa puiden kaatamiseen liittyvissä tapauksissa:', NULL, '', '', NULL, '2019-05-15 00:00:00'),
(26, 'puunkaato/hanko', 7, 1, 'fi', '', '<ul>\r\n    <li>Puulla tai puustolla on erityistä maisemallista tai kaupunkikuvallista arvoa tai luonnonsuojelullista merkitystä (yleensä suuret, vanhat puut tai pensaat)</li>\r\n    <li>Jalojen lehtipuiden (tammi, saarni, lehmus, vaahtera, jalava&hellip;), ulkomaisten havupuiden ja puistokujanteiden kaataminen.</li>\r\n    <li>Maisemaa rajaavan puuston kaataminen (puronvarsialueet, vesistöä tai peltoaukeaa rajaava puusto). Yksittäisten puiden koko voi tällöin olla pieni.</li>\r\n    <li>Erityisellä määräyksellä suojellun puuston kaataminen (esim. asema- tai yleiskaavassa suojeltu puu).</li>\r\n\r\n</ul>', NULL, '', '', NULL, '2019-05-15 00:00:00'),
(27, 'puunkaato/hanko', 8, 0, 'fi', 'Puiden kaataminen asemakaava-alueen ulkopuolella', 'Kun kiinteistö sijaitsee asemakaava-alueen ulkopuolella tai sellaisella yleiskaava-alueella, jossa ei ole määrätty maisematyöluvasta, tarvitsee puun kaatoon luvan kaupungin vuokratontilla. Omistustontilla erillistä lupaa ei tarvita, mutta puiden kaatamista ei saa tehdä vastoin yleiskaavamääräyksiä. Yleiskaavassa voi olla esimerkiksi määräys istutettavasta puurivistä, olemassa olevien puiden säilyttämisestä tai suojeltavasta puustosta.', NULL, '', '', NULL, '2019-05-15 00:00:00'),
(28, 'puunkaato/hanko', 9, 1, 'fi', '', '<p>Jos asut haja-asutusalueella, ole yhteydessä <a href=\"https://www.hanko.fi/palvelut/kuntatekniikka/puun_kaadot\" title=\"Puun kaadot - Hanko\" target=\"_blank\">puisto-osastoon</a>.</p>', NULL, '', '', '2019-05-19 13:10:20', '2019-05-15 00:00:00'),
(29, 'puunkaato/hanko', 10, 0, 'fi', 'Puiden hoitoleikkaukset', 'Puiden leikkauksella ei saa vahingoittaa puuta eikä muuttaa maisemaa merkittävästi. Jalot lehtipuut lehmusta lukuun ottamatta, havupuut sekä iäkkäät koivut kestävät huonosti suurten oksien leikkaamista. Väärään vuodenaikaan tai väärin tehdystä leikkauksesta saattaa seurata puun sairastuminen. Kookkaiden tai vanhojen puiden siistimisessä suositellaan ammattilaisen käyttöä. Puiden hoitoleikkauksiin ei tarvita maisematyölupaa, mikäli leikkauksilla ei muuteta maisemaa merkittävästi.', NULL, '', '', '2019-05-17 17:26:02', '2019-05-15 00:00:00'),
(30, 'puunkaato/hanko', 11, 1, 'fi', 'Yhteystiedot, Maankäyttöosasto', 'Paikkatietoinsinööri<br>\r\nDaniela Hellgren<br>\r\nPuh. <a href=\"tel:+358401359284\">040 1359 284</a><br>\r\nsähköpostiosoite: etunimi.sukunimi@hanko.fi<br>\r\nKäyntiosoite Santalantie 2, 10960 HANKO<br>\r\n<a href=\"https://www.hanko.fi/palvelut/kaavoitus_ja_maankaytto/puun_kaadot\" title=\"Puun kaadot - Hanko\" target=\"_blank\">https://www.hanko.fi/palvelut/kaavoitus_ja_maankaytto/puun_kaadot</a>\r\n', NULL, '', '', '2019-05-27 17:40:54', '2019-05-15 00:00:00'),
(31, 'puunkaato/inkoo', 1, 0, 'fi', 'Puunkaatoluvat Inkoossa', '', NULL, '', '', NULL, '2019-05-19 00:00:00'),
(32, 'puunkaato/inkoo', 2, 1, 'fi', '', '<p>Inkoossa on käytössä asiointipalvelu <a href=\"https://www.lupapiste.fi/\" target=\"_blank\" title=\"Lupapiste\">Lupapiste.fi</a>, jossa voit hakea lupia ja hoitaa niihin liittyvän viranomaisasioinnin sähköisesti. Inkoon rakennustarkastus sijaitsee kunnantalon yläkerrassa, osoitteessa Rantatie 2.</p>', NULL, '', '', '2019-05-19 13:11:25', '2019-05-19 00:00:00'),
(33, 'puunkaato/inkoo', 3, 1, 'fi', 'Yhteystiedot', 'Rakennusvalvontapäällikkö<br>\r\nMikael Wikström<br>\r\n<a href=\"tel:+358505113815\">+358 50 511 3815</a><br>\r\npuhelinaika klo 08.00-09.00<br>\r\nvierailuaika tiistaisin ja perjantaisin klo 09:30-11:30 (ei puheluita tällöin)', NULL, '', '', '2019-05-26 10:46:28', '2019-05-19 00:00:00'),
(34, 'puunkaato/inkoo', 4, 1, 'fi', '', '<br>Rakennustarkastaja<br>\r\nHåkan Wide<br>\r\n<a href=\"tel:+358505941691\">+358 50 594 1691</a><br>\r\npuhelinaika klo 08.00-09.00\r\n', NULL, '', '', '2019-05-26 10:55:52', '2019-05-19 00:00:00'),
(35, 'puunkaato/inkoo', 5, 1, 'fi', '', '<br>etunimi.sukunimi(at)inkoo.fi\r\n<br>byggmiljo(at)inga.fi', NULL, '', '', '2019-05-19 14:20:15', '2019-05-19 00:00:00'),
(36, 'puunkaato/', 16, 0, 'fi', 'Puunkaatoluvista yleisesti', 'Omakotiasujan ei tarvitse hakea puunkaatolupaa, jos puita kaadetaan enintään viisi ja tontille jää kaatotoimenpiteen jälkeen kaavamääräyksen edellyttämä määrä puita. Helpoin tapa selvittää, mitä kaava määrää, on olla yhteydessä rakennusvalvontaan (ks. aukioloajat ja yhteystiedot paikkakuntakohtaisesti). Mikäli kaavassa ei ole muuta määrätty, tulee puita olla tontin tai rakennuspaikan rakentamatonta aluetta kohden vähintään 1 kpl / 200 m². On myös selvitettävä, ettei asemakaavassa ole puita koskevia suojelumääräyksiä, eivätkä puut kasva sellaisella tontin tai rakennuspaikan osalla, jolla asemakaavan mukaan tulee olla puita. Kaadettavat puut eivät saa myöskään olla maisemakuvallisesti merkittäviä, esimerkiksi komeita vanhoja yksittäispuita, puuryhmiä tai vastaavia, joiden häviämisellä olisi ympäristöä olennaisesti köyhdyttävä vaikutus. Rajalla kasvavien puiden kaatamiselle on saatava naapurin suostumus.', NULL, '', '', NULL, '2019-05-19 00:00:00'),
(37, 'puunkaato/', 17, 1, 'fi', '', '<p><a href=\"https://www.lupapiste.fi/\" target=\"_blank\" title=\"Lupapiste\">Lupapiste.fi</a> on asiointipalvelu, jossa voit hakea rakentamisen lupia ja hoitaa niihin liittyvän viranomaisasioinnin sähköisesti.</p>', NULL, '', '', '2019-05-19 14:01:07', '2019-05-19 00:00:00'),
(38, 'puunkaato/', 18, 0, 'fi', '', 'Ympäristölleen vaarallisen puun voi kaataa ilman lupaa.', NULL, '', '', NULL, '2019-05-19 00:00:00'),
(39, 'puunkaato/', 19, 0, 'fi', '', 'Kun taloyhtiöissä suunnitellaan puiden kaatoa, pitää kunnan rakennusvalvontaan ottaa yhteyttä ja hakea lupaa.', NULL, '', '', '2019-05-26 15:50:57', '2019-05-19 00:00:00'),
(40, 'puunkaato/karkkila', 1, 0, 'fi', 'Puunkaatoluvat Karkkilassa', '', NULL, '', '', NULL, '2019-05-19 00:00:00'),
(41, 'puunkaato/karkkila', 2, 1, 'fi', '', 'Karkkilassa puita ei saa kaataa ilman maisematyölupaa:\r\n<ol>\r\n<li>asemakaava-alueella;</li>\r\n<li>yleiskaava-alueella, jos yleiskaavassa niin määrätään;</li>\r\n<li>alueella, jolla on voimassa rakennuskielto asemakaavan laatimiseksi tai jolle yleiskaavan laatimista tai muuttamista varten on niin määrätty.</li>\r\n</ol>', NULL, '', '', '2019-05-19 14:12:50', '2019-05-19 00:00:00'),
(42, 'puunkaato/karkkila', 3, 0, 'fi', '', 'Lupaa ei tarvita yleis- tai asemakaavan toteuttamiseksi tarpeellisten taikka myönnetyn rakennus- tai toimenpideluvan mukaisten töiden suorittamiseen eikä vaikutuksiltaan vähäisiin toimenpiteisiin. Lupa ei ole myöskään tarpeen, jos toimenpide perustuu yleisistä teistä annetun lain mukaiseen hyväksyttyyn tiesuunnitelmaan. \r\nMaisematyölupa-asia ratkaistaan rakennusvalvonnassa:', NULL, '', '', NULL, '2019-05-19 00:00:00'),
(43, 'puunkaato/karkkila', 4, 1, 'fi', '', '<p><a href=\"http://www.karkkila.fi/sivut/FI/Rakennusvalvonta\" target=\"_blank\" title=\"Rakennusvalvonta - Karkkila\">http://www.karkkila.fi/sivut/FI/Rakennusvalvonta</a></p>', NULL, '', '', '2019-05-26 15:27:46', '2019-05-19 00:00:00'),
(44, 'puunkaato/karkkila', 5, 1, 'fi', 'Yhteystiedot', 'Vastaava rakennustarkastaja\r\n<br>Petri Iivari\r\n<br><a href=\"tel:+358504052816\">050 4052 816</a>\r\n<br>Asiakaspalvelua keskiviikkoisin klo 9.00-12.00, katselmukset sopimuksen mukaan.', NULL, '', '', '2019-05-26 10:57:16', '2019-05-19 00:00:00'),
(45, 'puunkaato/karkkila', 6, 1, 'fi', '', '<br><strong>Rakennusvalvonta</strong>\r\n<br>Lupasihteeri\r\n<br>Hilkka Kivimäki\r\n<br><a href=\"tel:+358447674646\">044 7674 646</a>\r\n<br><a href=\"mailto:rakennusvalvonta@karkkila.fi\">rakennusvalvonta@karkkila.fi</a>', NULL, '', '', '2019-05-26 10:56:19', '2019-05-19 00:00:00'),
(46, 'puunkaato/karkkila', 7, 1, 'fi', '', '<br><p>Lue lisää maisematyöluvasta: <a href=\"http://www.karkkila.fi/sivut/FI/Muut-luvat\" target=\"_blank\" title=\"Muut luvat - Karkkila\">http://www.karkkila.fi/sivut/FI/Muut-luvat</a></p>', NULL, '', '', '2019-05-19 14:32:08', '2019-05-19 00:00:00'),
(47, 'puunkaato/kauniainen', 1, 0, 'fi', 'Puunkaatoluvat Kauniaisissa', '', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(48, 'puunkaato/kauniainen', 2, 0, 'fi', '', 'Asemakaavoitetulla alueella puiden kaatamista säätelee maankäyttö- ja rakennuslain § 128 maisematyölupa. Lupaa ei tarvita yleis- tai asemakaavan toteuttamiseksi tarpeellisten taikka myönnetyn rakennus- tai toimenpideluvan mukaisten töiden suorittamiseen eikä vaikutuksiltaan vähäisiin toimenpiteisiin.', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(49, 'puunkaato/kauniainen', 3, 0, 'fi', '', 'Kun tontinomistajalla on tarve kaataa puita tontillaan, tehdään tontilla maisematyöluvan tarpeen arviointikäynti (nk. puustokatselmus). Arviointikäynti tilataan kunnossapitopuutarhurilta tai kaupunginpuutarhurilta ja se on ilmainen. Siinä arvioidaan, tarvitaanko tontille suunnitelluille kaadoille maisematyölupaa vai ei.', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(50, 'puunkaato/kauniainen', 4, 0, 'fi', '', 'Puiden kuntotutkimuksia tai hoitosuunnitelmia ei käynnillä tehdä. Kuntotutkimuksia ja puiden hoitosuunnitelmia voi tilata puunhoitoalan yrityksiltä. Vaarallisten puiden kaatoon ei tarvita arviokäyntiä eikä maisematyölupaa. Vaarallisuus on pystyttävä jälkikäteen todentamaan esim. valokuvin.', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(51, 'puunkaato/kauniainen', 5, 0, 'fi', '', 'Huomioithan, että kesä – heinäkuussa tehdään vain kiireelliset arviokäynnit.', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(52, 'puunkaato/kauniainen', 6, 0, 'fi', '', 'Maisematyölupa tarvitaan, mikäli puiden kaato vaikuttaa maisemaan, eikä ole vähäinen toimenpide. Maisematyöluvan tarpeen arvioi kunnossapitopuutarhuri tai kaupunginpuutarhuri. Maisematyölupaa haetaan ympäristöpäälliköltä.', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(53, 'puunkaato/kauniainen', 7, 0, 'fi', '', 'Puunkaatoon on selvät perusteet, eikä maisematyölupaa tarvita, jos arviointikäynnin yhteydessä on todettu, että puu on silmämääräisesti arvioituna huonokuntoinen, pahasti lahovikainen tai harsuuntunut sekä jos se aiheuttaa merkittävää vahinkoa viemäreille, salaojille, rakennuksille tai muulle omaisuudelle.', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(54, 'puunkaato/kauniainen', 8, 0, 'fi', '', 'Vastuu puiden kunnosta kuuluu kiinteistön omistajalle tai haltijalle, joka vastaa puiden kunnon seurannasta, ja jonka on ryhdyttävä tarvittaviin toimenpiteisiin puiden poistamiseksi tai säilyttämiseksi. Kiinteistön omistaja/haltija vastaa myös kaatuneen puun aiheuttamista vahingoista.', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(55, 'puunkaato/kauniainen', 9, 1, 'fi', 'Lisätietoja', '<p><a href=\"https://www.kauniainen.fi/files/10634/Kasvillisuuden_ja_luontoalueiden_suojaaminen_seka_arviointi_maisematyoluvan_tarpeesta_puun_kaatoon_2016.pdf\" title=\"Kasvillisuuden ja luontoalueiden suojaaminen sekä arviointi maisematyöluvan tarpeesta puun kaatoon Kauniaisissa\" target=\"_blank\">Kasvillisuuden ja luontoalueiden suojaaminen sekä arviointi maisematyöluvan tarpeesta puun kaatoon.</a></p>', NULL, '', '', '2019-05-27 17:38:13', '2019-05-26 00:00:00'),
(56, 'puunkaato/kauniainen', 10, 0, 'fi', 'Yhteydenotot', 'Yhteydenotot puustokatselmuksista ja kaupungin alueella olevista huonokuntoisista puista:', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(57, 'puunkaato/kauniainen', 11, 1, 'fi', '', '<p>Kunnossapitopuutarhuri Minna Aavalehto puh. <a href=\"tel:+358504118656\">050 4118656</a>, sähköposti: <a href=\"mailto:minna.aavalehto@kauniainen.fi\">minna.aavalehto@kauniainen.fi</a>\r\n- huonokuntoiset puut, tonttipuiden harvennukset ym.</p>', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(58, 'puunkaato/kauniainen', 12, 1, 'fi', '', '<p>Kaupunginpuutarhuri Emmi Silvennoinen puh. <a href=\"tel:+358505004128\">050 5004128</a>, sähköposti: <a href=\"mailto:emmi.silvennoinen@kauniainen.fi\">emmi.silvennoinen@kauniainen.fi</a>.</p>', NULL, '', '', '2019-05-26 10:52:37', '2019-05-26 00:00:00'),
(59, 'puunkaato/kauniainen', 13, 1, 'fi', '', '<p><a href=\"https://www.kauniainen.fi/asuminen_ja_ymparisto/kadut_ja_viheralueet_liikenne_joukkoliikenne/puiden_kaataminen_kauniaisissa\" title=\"Puiden kaataminen Kauniaisissa\" target=\"_blank\">https://www.kauniainen.fi/asuminen_ja_ymparisto/kadut_ja_viheralueet_liikenne_joukkoliikenne/puiden_kaataminen_kauniaisissa</a></p>', NULL, '', '', '2019-05-27 17:37:53', '2019-05-26 00:00:00'),
(60, 'puunkaato/lohja', 1, 0, 'fi', 'Puunkaatoluvat Lohjalla (myös Sammatti, Nummi-Pusula ja Karjalohja)', '', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(61, 'puunkaato/lohja', 2, 1, 'fi', '', '<p>Lohjalla omalla tontilla olevien puiden kaatamisesta tulee ottaa yhteyttä rakennusvalvontaan rakennustarkastaja Juhani Järviseen, p. <a href=\"tel:+358500475158\">0500 475 158</a>.</p>', NULL, '', '', '2019-05-26 11:08:05', '2019-05-26 00:00:00'),
(62, 'puunkaato/lohja', 3, 1, 'fi', '', '<p>Tontteihin rajoittuvista puistometsistä tai puistoista kaadettavista puista tulee ottaa yhteyttä kaupungin puisto-osastoon johtavaan kaupunginpuutarhuri Kirsti Puustiseen, p. <a href=\"tel:+358500472630\">0500 472 630</a>.</p>', NULL, '', '', '2019-05-26 11:08:26', '2019-05-26 00:00:00'),
(63, 'puunkaato/lohja', 4, 1, 'fi', '', '<p><a href=\"https://www.lohja.fi/asuminen-ja-ymparisto/asuminen/asuinymparisto/puiden-kaataminen/\" title=\"Puiden kaataminen - Lohja\" target=\"_blank\">https://www.lohja.fi/asuminen-ja-ymparisto/asuminen/asuinymparisto/puiden-kaataminen/</a></p>', NULL, '', '', '2019-05-27 17:37:29', '2019-05-26 00:00:00'),
(64, 'puunkaato/raasepori', 1, 0, 'fi', 'Puunkaatoluvat Raaseporissa (Karjaa, Tammisaari ja Pohja)', '', NULL, '', '', '2019-05-26 11:29:29', '2019-05-26 00:00:00'),
(65, 'puunkaato/raasepori', 2, 0, 'fi', '', 'Raaseporissa tarvitaan maisematyölupa puiden kaatamista varten. Alla on linkki sivulle, josta löytyy pdf-muodossa ohjeet puunkaatoluvan hakemiseen, hakulomake sekä lomake naapurin kuulemiseen:', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(66, 'puunkaato/raasepori', 3, 1, 'fi', '', '<p><a href=\"https://www.raasepori.fi/asuminen-ja-ymparisto/ymparisto/ymparistonsuojelu/puunkaato/\" title=\"Puunkaato - Raasepori\" target=\"_blank\">https://www.raasepori.fi/asuminen-ja-ymparisto/ymparisto/ymparistonsuojelu/puunkaato/</a></p>', NULL, '', '', '2019-05-27 17:37:03', '2019-05-26 00:00:00'),
(67, 'puunkaato/raasepori', 4, 1, 'fi', 'Yhteystiedot', 'Yhteyshenkilöt <a href=\"mailto:ymparisto@raasepori.fi\">ymparisto@raasepori.fi</a>:\r\n<br><br>kaupunkisuunnitteluarkkitehti Simon Store, puh. <a href=\"tel:+358192893843\">019 289 3843</a>\r\n<br><a href=\"mailto:simon.store@raasepori.fi\">simon.store@raasepori.fi</a>\r\n<br><br>vastaava puistopäällikkö Joakim Mäkelä, puh. <a href=\"tel:+358192893850\">019 289 3850</a>\r\n<br><a href=\"mailto:joakim.makela@raasepori.fi\">joakim.makela@raasepori.fi</a>\r\n<br><br>viheraluesuunnittelija Maria Eriksson, puh. <a href=\"tel:+358192893866\">019 289 3866</a>\r\n<br><a href=\"mailto:maria.eriksson@raasepori.fi\">maria.eriksson@raasepori.fi</a>\r\n<br><br>metsätalousinsinööri Carl-Johan Jansson, puh. <a href=\"tel:´+358192893835\">019 289 3835</a>\r\n<br><a href=\"mailto:carl-johan.jansson@raasepori.fi\">carl-johan.jansson@raasepori.fi</a>\r\n', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(68, 'puunkaato/raasepori', 5, 1, 'fi', '', '<br>Raaseporin ympäristötoimisto \r\n<br>Raaseporintie 37 \r\n<br>10650 Tammisaari', NULL, '', '', '2019-05-26 15:30:38', '2019-05-26 00:00:00'),
(69, 'puunkaato/siuntio', 1, 0, 'fi', 'Puunkaatoluvat Siuntiossa', '', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(70, 'puunkaato/siuntio', 2, 0, 'fi', '', 'Siuntiossa on oltava yhteydessä rakennusvalvontaan, mikäli kyseessä on useamman puun kaataminen tai maisemallisesti merkittävä puu. Puita ei myöskään saa kaataa lintujen pesimäaikana (1.4. - 31.7.) muusta kuin pakottavasta syystä. Mikäli kaataminen on pakollista suorittaa kyseisellä aikavälillä, tulee ennen toimiin ryhtymistä ottaa yhteyttä rakennusvalvontaan.', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(71, 'puunkaato/siuntio', 3, 0, 'fi', '', 'Siuntion rakennusvalvonnan rakennustarkastaja on tavattavissa teknisessä toimistossa osoitteessa Siuntiontie 504 seuraavasti:', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(72, 'puunkaato/siuntio', 4, 0, 'fi', '', 'maanantai - perjantai klo 9:00-11:15 ja 11:45-13:00. Puhelimitse tavoittaa parhaiten maanantai - perjantai klo 9:00-15:00.', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(73, 'puunkaato/siuntio', 5, 0, 'fi', '', 'Lupatiedustelut sekä piirustusten ja lupien tilaukset sähköpostitse: rakennusvalvonta(at)siuntio.fi', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(74, 'puunkaato/siuntio', 6, 1, 'fi', '', '<p><a href=\"https://www.siuntio.fi/puiden-istutus-ja-kaataminen\" title=\"Puiden istutus ja kaataminen - Siuntio\" target=\"_blank\">https://www.siuntio.fi/puiden-istutus-ja-kaataminen</a></p>', NULL, '', '', '2019-05-27 17:36:45', '2019-05-26 00:00:00'),
(75, 'puunkaato/vihti', 1, 0, 'fi', 'Puunkaatoluvat Vihdissä', '', NULL, '', '', '2019-05-26 13:41:30', '2019-05-26 00:00:00'),
(76, 'puunkaato/vihti', 2, 0, 'fi', '', 'Vihdissä tarvitaan maisematyölupa silloin, kun suunnitellaan maisemaa muuttavaa puiden kaatamista tai muuta tähän verrattavaa toimenpidettä (MRL 128 §).', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(77, 'puunkaato/vihti', 3, 1, 'fi', '', '<strong>Maisematyölupa tarvitaan:</strong>\r\n<ul>\r\n	<li>semakaava-alueella,</li>\r\n	<li>alueella, jolla on rakennuskielto yleiskaavan (MRL 38 §) tai asemakaavan (MRL 53 §) laatimiseksi sekä</li>\r\n	<li>yleiskaava-alueella, jos yleiskaavassa niin määrätään.</li>\r\n</ul>', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(78, 'puunkaato/vihti', 4, 0, 'fi', '', 'Asemakaava-alueella ja yleiskaava-alueella lupa on myönnettävä, jos toimenpide ei vaikeuta alueen käyttämistä kaavassa varattuun tarkoitukseen taikka turmele kaupunki- tai maisemakuvaa. Rakennuskieltoalueilla lupa voidaan myöntää, jollei toimenpide tuota huomattavaa haittaa kaavan laatimiselle taikka turmele kaupunki- tai maisemakuvaa.', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(79, 'puunkaato/vihti', 5, 1, 'fi', '', '<strong>Maisematyölupaa ei tarvita</strong> vaikutuksiltaan vähäisiin toimenpiteisiin eikä yleensä silloin, jos toimenpide on hyväksytty jollakin muulla luvalla (rak.lupa, maa-ainesten ottolupa) tai suunnitelmalla (maantien suunnitelma, kunnallistekniset suunnitelmat asemakaavan toteuttamiseksi, ei kuitenkaan esim. puistosuunnitelma, jonka alueella tarvitaan mahdollisen puistosuunnitelman lisäksi maisematyölupa).', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(80, 'puunkaato/vihti', 6, 0, 'fi', '', 'Joskus yhdenkin puun kaataminen esim. asemakaava-alueella saattaa olla luvanvarainen toimenpide ja toisaalta kymmenienkin puiden kaataminen metsäalueella tai metsän harvennus voi olla vähäinen toimenpide. Näistä tulkinnoista voi kysyä lisätietoa kunnan kaavoitustoimesta, mutta on syytä huomioida, että suullisia maisematyölupia ei ole mahdollista saada.', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(81, 'puunkaato/vihti', 7, 0, 'fi', '', 'Maisematyölupahakemukset toimitetaan kaavoituksen asiakaspalvelupisteeseen kunnanviraston 2. kerrokseen osoitteessa:', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(82, 'puunkaato/vihti', 8, 1, 'fi', '', '<br>Vihdin kunta/kaavoitus\r\n<br>Asemantie 30\r\n<br>03100 Nummela\r\n<br>\r\n<br>tai postitse osoitteeseen:\r\n<br>\r\n<br>Vihdin kunta/kaavoitus\r\n<br>PL 13\r\n<br>03101 Nummela\r\n<br>\r\n<br><strong>Tiedustelut maisematyöluvan hakemisesta</strong>\r\n<br>toimistosihteeri\r\n<br>Anne Riikonen\r\n<br>p. <a href=\"tel:+358444675583\">044 467 5583</a>\r\n', NULL, '', '', NULL, '2019-05-26 00:00:00'),
(84, 'puunkaato/espoo', 1000, 1, 'fi', '', '<br><p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-26 15:57:23', '2019-05-26 18:24:53'),
(85, 'puunkaato/hanko', 1000, 1, 'fi', '', '<br><p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-26 15:37:00', '2019-05-26 18:24:53'),
(86, 'puunkaato/inkoo', 1000, 1, 'fi', '', '<br><p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-26 15:40:30', '2019-05-26 18:24:53'),
(87, 'puunkaato/karkkila', 1000, 1, 'fi', '', '<p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', NULL, '2019-05-26 18:24:53'),
(88, 'puunkaato/kauniainen', 1000, 1, 'fi', '', '<p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', NULL, '2019-05-26 18:24:53'),
(89, 'puunkaato/lohja', 1000, 1, 'fi', '', '<p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', NULL, '2019-05-26 18:24:53'),
(90, 'puunkaato/raasepori', 1000, 1, 'fi', '', '<br><p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-26 15:30:45', '2019-05-26 18:24:53'),
(91, 'puunkaato/siuntio', 1000, 1, 'fi', '', '<p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', NULL, '2019-05-26 18:24:53'),
(92, 'puunkaato/vihti', 1000, 1, 'fi', '', '<br><p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-26 15:37:54', '2019-05-26 18:24:53'),
(93, 'puunkaato/espoo', 5, 1, 'fi', 'Yhteystiedot', '<strong>Puhelin</strong>\r\n<br>Teknisen ja ympäristötoimen asiakaspalvelu\r\n<br><a href=\"tel:+358981625000\">09 816 25000</a>\r\n<br><br><strong>Aukioloajat</strong>\r\n<br>Asiakaspalvelun puhelinpalvelu on avoinna ma, ke–pe klo 8.00–15.30 ja ti klo 10.00-15.30.\r\n', NULL, '', '', '2019-05-26 15:58:24', '2019-03-31 00:00:00');

INSERT INTO `lupa_info_page_meta` (`id`, `uri`, `language`, `html_title`, `time_edited`, `time_created`) VALUES
(1, 'puunkaato/espoo', 'fi', 'Puunkaato Espoossa ammattitaidolla', '2019-05-31 14:48:04', '2019-05-31 16:40:55'),
(2, 'puunkaato/hanko', 'fi', 'Puunkaato Hangossa ammattitaidolla', '2019-05-31 14:48:07', '2019-05-31 16:40:55'),
(3, 'puunkaato/inkoo', 'fi', 'Puunkaato Inkoossa ammattitaidolla', '2019-05-31 14:48:10', '2019-05-31 16:40:55'),
(4, 'puunkaato/karkkila', 'fi', 'Puunkaato Karkkilassa ammattitaidolla', '2019-05-31 14:48:13', '2019-05-31 16:40:55'),
(5, 'puunkaato/kauniainen', 'fi', 'Puunkaato Kauniaisissa ammattitaidolla', '2019-05-31 14:48:18', '2019-05-31 16:40:55'),
(6, 'puunkaato/lohja', 'fi', 'Puunkaato Lohjalla ammattitaidolla', '2019-05-31 14:48:20', '2019-05-31 16:40:55'),
(7, 'puunkaato/raasepori', 'fi', 'Puunkaato Raaseporissa ammattitaidolla', '2019-05-31 14:48:24', '2019-05-31 16:40:55'),
(8, 'puunkaato/siuntio', 'fi', 'Puunkaato Siuntiossa ammattitaidolla', '2019-05-31 14:48:27', '2019-05-31 16:40:55'),
(9, 'puunkaato/vihti', 'fi', 'Puunkaato Vihdissä ammattitaidolla', '2019-05-31 14:48:30', '2019-05-31 16:40:55'),
(10, 'puunkaato/', 'fi', 'Puunkaadot ammattitaidolla', NULL, '2019-05-31 23:59:59');


-- 190615

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'INFO_FELLING_PAGE_PROMO_BOTTOM', 'Jos tarvitset ammattimaista arboristia suorittamaan puunkaadon, ota meihin yhteyttä!', NULL, '2019-06-15 12:00:00')
, ('en', 'INFO_FELLING_PAGE_PROMO_BOTTOM', '', NULL, '2019-06-15 12:00:00')
, ('sv', 'INFO_FELLING_PAGE_PROMO_BOTTOM', '', NULL, '2019-06-15 12:00:00')
;

UPDATE `lupa_service_text` SET `link_uri` = '/puunkaato/' WHERE `lupa_service_text`.`subtitle` = "Puunkaatoa/ammattitaidolla";

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
