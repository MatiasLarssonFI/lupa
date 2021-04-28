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
(17, 4, 'en', 'Stump grinding', 'Stump grinding/removing stumps', 'We can remove your tree stumps and roots well under ground to give place for your lawn or other plants. The chips produced by the stump grinders carbide teeth are suitable for covering the ground around trees and bushes. On request we also transport the chips to the city dump, and seed lawn where the tree stood. Tree stumps make lawn mowing and snow shoveling difficult. It takes 10-30 years for a tree stump to decompose naturally, and it can only be removed with a large excavator or a stump grinder. Our stump grinders do not damage your lawn and they come in three different sizes, depending on your needs.', '2018-03-14 18:55:09', '2017-01-28 00:00:00'),
(18, 3, 'en', 'Tree felling, removal, splitting and chipping', 'Tree felling/professionally', 'We plan and carry out tree removal to suit your trees as well as your yard. We fell your trees by climbing, using a skylift or by other means fit for purpose, always based on a professional analysis. We also offer removal of brushwood and trunks. We usually chip the brushwood for ease of transport, and tree chips are well suited as ground cover in gardens around bushes and trees. We can split the tree blocks into firewood using an efficient wood splitter which you also can rent and use yourself.', '2018-03-14 18:53:35', '2017-01-28 00:00:00'),
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
(19, 'en', 'NAV_CONTACT', 'Contact us', NULL, '2016-03-11 22:00:00'),
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
(48, 'en', 'CONTACT_SUBMIT_TEXT', 'Thank you. We''ll be in touch with you soon.', '2016-04-03 16:28:03', '2016-04-02 21:00:00'),
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
(62, 'en', 'CONTACT_FIELD_ERROR___CSRF_TOKEN', 'We''re sorry but the form has expired. Please try again.', '2016-04-15 19:58:48', '2016-04-13 21:00:00'),
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
(123, 'en', 'NAV_FAQ', 'FAQ', '2018-03-08 19:33:54', '2016-03-11 20:00:00'),
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


-- 1903

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
  ('fi', 'GENRAL_ERROR_MESSAGE', 'Pahoittelemme, jokin meni vikaan. Voit ottaa meihin yhteyttä sähköpostilla: myynti@lu-pa.fi', NULL, '2019-03-30 19:00:00')
, ('en', 'GENRAL_ERROR_MESSAGE', 'We''re sorry, something went wrong. If you wish, you can contact us by email: myynti@lu-pa.fi', NULL, '2019-03-30 19:00:00')
, ('sv', 'GENRAL_ERROR_MESSAGE', 'Vi ber om ursäkt, något gick fel. Du kan kontakta oss via e-post: myynti@lu-pa.fi', NULL, '2019-03-30 19:00:00')
;

-- 1905

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
(1, 'puunkaato/', 1, 0, 'fi', 'Puunkaato', '', NULL, '', '', '2019-05-31 13:57:18', '2019-03-31 00:00:00'),
(2, 'puunkaato/', 3, 0, 'fi', 'Milloin puu tarvitsee kaataa?', 'Puu kannattaa kaataa, jos siinä esiintyy lahoamisen merkkejä tai jos esimerkiksi puun neulaset, lehdet ja oksat kerääntyvät talon katolle vaurioittaen sitä. Rungosta irtoava kuori, latvuston harsuuntuminen, tiettyjen kääpien esiintyminen ja muutokset puun asennossa ovat aina merkkejä vakavista ongelmista. Puut ovat yksilöitä, joten jokainen puu on arvioitava erikseen, ja puun kasvupaikka on myös otettava huomioon arviossa. Vallitsevat riskit riippuvat puulajista, puun rakenteesta ja sijainnista. Puunkaato voi olla ajankohtaista myös silloin, jos puu varjostaa tonttia ja kaipaat lisää valoa pihallesi.', NULL, '', '', '2019-06-15 20:04:05', '2019-03-31 00:00:00'),
(3, 'puunkaato/', 4, 0, 'fi', '', 'Tulemme mielellämme tekemään maksuttoman arvion ja tarjouksen tarvittavista toimenpiteistä. Teemme myös laajempia, kirjallisia kuntoarviointeja esimerkiksi maisematöiden päätösten pohjaksi.', NULL, '', '', '2019-05-31 13:59:32', '2019-03-31 00:00:00'),
(4, 'puunkaato/', 5, 0, 'fi', 'Puu kallistuu, kaatuuko se?', 'On hälyttävää, jos puun asento muuttuu, varsinkin jos juuret nousevat kallistumaan ”selkäpuolella”. Heikosti ankkuroidun puun juuret saattavat tuulisella säällä liikkua. Ota heti yhteyttä koulutettuun arboristiin, jos huomaat vaarallisen puun oleskelualueen tai rakennusten lähellä. Toisaalta kallellaan oleva puu voi olla tasapainossa siinä missä pystysuorakin puu.', NULL, '', '', '2019-06-15 09:36:58', '2019-03-31 00:00:00'),
(5, 'puunkaato/espoo', 1, 0, 'fi', 'Puunkaato Espoo', '', NULL, '', '', '2019-05-31 13:44:39', '2019-03-31 00:00:00'),
(6, 'puunkaato/espoo', 4, 0, 'fi', '', 'Yhdenkin puun kaataminen voi edellyttää maisematyölupaa, mikäli sillä on vaikutuksia kaupunki- tai maisemakuvaan. Toisaalta usean puun kaataminen piha-alueelta voidaan tulkita vähäiseksi, jos pihaan jää paljon puustoa.', NULL, '', '', '2019-05-31 13:37:50', '2019-03-31 00:00:00'),
(7, 'puunkaato/espoo', 5, 1, 'fi', '', '<p>Lisätietoja saa <a target=\"_blank\" href=\"https://www.espoo.fi/fi-FI/Asuminen_ja_ymparisto/Rakentaminen/Rakennusvalvonta/Luvan_hakeminen/Puunkaato_ja_maisematyot\" title=\"Maisematyölupa\">rakennusvalvontakeskuksesta</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-03-31 00:00:00'),
(8, 'puunkaato/', 2, 0, 'fi', '', 'Suoritamme puunkaadot 10 vuoden kokemuksella. Meiltä onnistuvat kiipeilykaadot ja suorat kaadot sekä kori- ja nosturikaadot. Erityisalaamme kuuluu puiden kaataminen ja siirtäminen myös erityisen vaikeista paikoista, kuten jyrkistä rinteistä ja vaikeakulkuisesta maastosta.', NULL, '', '', '2019-06-15 12:19:13', '2019-03-31 00:00:00'),
(9, 'puunkaato/espoo', 3, 0, 'fi', 'Puunkaatoluvat Espoossa', 'Espoossa lupa pihan tai tontin puuston kaatamiseen ratkaistaan rakennusvalvontakeskuksessa.', NULL, '/data/img/felling/AIMG_3035.jpeg:landscape', 'Puunkaato Espoossa', '2019-06-15 11:06:45', '2019-03-31 00:00:00'),
(10, 'puunkaato/', 6, 0, 'fi', 'Miksi tilata koulutettu puunkaadon ammattilainen paikalle?', 'Koulutettu arboristi hoitaa puiden kaadon turvallisesti kaikissa olosuhteissa vuoden ympäri. Ammattitaidolla kaadettu puu säästää ympäristöä ja pienentää vahinkoriskiä. Esimerkiksi kuusen kaataminen saattaa näyttää helpolta hommalta, mutta usein se ei ole. Kuusi on usein arvaamaton, koska oksien painon ja tuulipinta-alan yhteisvaikutusta on vaikea arvioida, jolloin puu saattaa kaatua muuhun kuin haluttuun suuntaan. Erityisosaamisella ja pitkällä kokemuksella varmistamme, että jokainen puunkaato on turvallinen. Meillä on myös kattava vakuutus vahinkojen varalle.', 1, '', '', '2019-06-15 09:37:38', '2019-03-31 00:00:00'),
(11, 'puunkaato/', 7, 1, 'fi', 'Erikoispuunkaato', '<p>Suoritamme myös ns. erikoispuunkaadot, ja meillä on niistä paljon kokemusta. Nosturikaadoissa käytämme apunamme yhteistyökumppaniamme <a href=\"https://nostolavapalvelu.fi/nostolava-auton-vuokraus\" target=\"_blank\">Nostolavapalvelua</a>. Nostolavakalustolla pääsemme tarvittaessa jopa 40 metrin korkeuteen, joten suurtenkin puiden kaato onnistuu.</p>', NULL, '/data/img/felling/_DSC0011.JPG', 'Nostolavapalvelu', '2019-06-19 18:19:57', '2019-03-31 00:00:00'),
(12, 'puunkaato/', 8, 0, 'fi', 'Mitä puunkaato maksaa?', 'Merkittyjen puiden kaatohinnan arvioimme maksutta. Samalla keskustelemme myös puunkaadon tavoitteista ja ehdotamme erilaisia ratkaisuja. Kirjallinen tarjous on aina maksuton.', NULL, '', '', '2019-06-15 09:41:23', '2019-03-31 00:00:00'),
(13, 'puunkaato/', 9, 1, 'fi', 'Ennen töihin ryhtymistä', '<p>Ennen puun kaatamista tarvitaan usein puunkaatolupa kunnalta. Tässä ohjeet puunkaatolupien pyytämiseen kunnittain: <a href=\"https://lu-pa.fi/puunkaato/espoo\">Espoo</a>, <a href=\"https://lu-pa.fi/puunkaato/hanko\">Hanko</a>, <a href=\"https://lu-pa.fi/puunkaato/inkoo\">Inkoo</a>, <a href=\"https://lu-pa.fi/puunkaato/karkkila\">Karkkila</a>, <a href=\"https://lu-pa.fi/puunkaato/kauniainen\">Kauniainen</a>, <a href=\"https://lu-pa.fi/puunkaato/lohja\">Lohja</a>, <a href=\"https://lu-pa.fi/puunkaato/raasepori\">Raasepori</a>, <a href=\"https://lu-pa.fi/puunkaato/siuntio\">Siuntio</a>, <a href=\"https://lu-pa.fi/puunkaato/vihti\">Vihti</a>.</p>', NULL, '', '', '2019-06-15 09:47:09', '2019-03-31 00:00:00'),
(14, 'puunkaato/', 10, 0, 'fi', 'Muut palvelut', 'Puu on nyt kaadettu, mitä seuraavaksi? Hoidamme myös risujen ja runkojen poiskuljetuksen. Haketamme usein risut kuljetuksen helpottamiseksi. Hake soveltuu kuorikatteeksi esimerkiksi pensaiden juurille. Tukkien pätkimisen ja karsimisen lisäksi voimme pilkkoa pölkyt polttopuiksi tehokkaalla klapikoneella, jota vuokraamme myös omaan käyttöön.', NULL, '/data/img/felling/20181004_163902.jpg', 'Muut palvelut; puunkaadon jälkeen', '2019-06-19 18:29:14', '2019-03-31 00:00:00'),
(15, 'puunkaato/', 11, 1, 'fi', '', '<br><strong>Kantojyrsintä</strong>', NULL, '', '', '2019-05-31 14:00:00', '2019-03-31 00:00:00'),
(16, 'puunkaato/', 12, 0, 'fi', '', 'Puulajista ja kannon koosta riippuen kannolla kestää lahota noin 10-30 vuotta. Mikäli kanto hankaloittaa pihasi käyttöä ja haluat siitä heti eroon, voimme poistaa kannon jyrsimällä. Kantojyrsin yltää syvällekin, mutta yleisin jyrsintäsyvyys on 10-15cm. Useimmiten poistamme kannot, levitämme multaa ja kylvämme paikalle nurmikon.', NULL, '', '', '2019-06-15 09:51:12', '2019-03-31 00:00:00'),
(17, 'puunkaato/', 13, 0, 'fi', '', 'Palveluihimme kuuluvat myös puiden hoitoleikkaaminen ja puiden istutus.', NULL, '', '', '2019-06-15 09:51:22', '2019-03-31 00:00:00'),
(18, 'puunkaato/', 14, 0, 'fi', 'Voiko vanhan puun paikalle istuttaa uuden?', 'Voi, kunhan vanha kanto saadaan kokonaan jyrsittyä pois. Jos vanhan puun paksut juuret vaikeuttavat istutuskuopan tekoa, voidaan uusi puu istuttaa vajan metrin verran vanhaa puuta sivummalle. Myös istutuskumpu on mahdollinen, varsinkin savimaalla.', NULL, '', '', '2019-06-15 09:51:35', '2019-03-31 00:00:00'),
(19, 'puunkaato/', 15, 1, 'fi', 'Puunkaadot Länsi-Uudellamaalla', '<p>Toimialueemme kattaa koko Länsi-Uudenmaan alueen:\r\n<a href=\"https://lu-pa.fi/puunkaato/espoo\">Espoo</a> , <a href=\"https://lu-pa.fi/puunkaato/hanko\">Hanko</a> , <a href=\"https://lu-pa.fi/puunkaato/inkoo\">Inkoo</a> , <a href=\"https://lu-pa.fi/puunkaato/karkkila\">Karkkila</a> , <a href=\"https://lu-pa.fi/puunkaato/kauniainen\">Kauniainen</a> , <a href=\"https://lu-pa.fi/puunkaato/lohja\">Lohja</a> , <a href=\"https://lu-pa.fi/puunkaato/raasepori\">Raasepori</a> , <a href=\"https://lu-pa.fi/puunkaato/siuntio\">Siuntio</a> , <a href=\"https://lu-pa.fi/puunkaato/vihti\">Vihti</a> , Karjaa, Karjalohja, Nummela, Pohja, Sammatti, Tammisaari.</p>', NULL, '', '', '2019-05-31 14:00:09', '2019-03-31 00:00:00'),
(20, 'puunkaato/hanko', 1, 0, 'fi', 'Puunkaato Hanko', '', NULL, '', '', '2019-05-31 13:44:43', '2019-05-15 00:00:00'),
(21, 'puunkaato/hanko', 4, 0, 'fi', '', 'Puiden kaatamiseen tonteilta asemakaava-alueella on yleensä haettava maisematyölupa. Alueella, jolla on voimassa MRL 38 § ja 53 § mukainen rakennuskielto, ovat maisemaa muuttavat toimenpiteet luvanvaraisia ja puun/puiden kaatamiseen on haettava maisematyölupa. Lupa on haettava myös, mikäli yleiskaavassa niin määrätään.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-15 00:00:00'),
(22, 'puunkaato/hanko', 3, 0, 'fi', 'Puunkaatoluvat Hangossa', 'Asemakaavoitetulla aluella puita ei suositella kaadettavaksi ilman aitoa tarvetta. Hangossa erityisen tärkeitä puita ovat jalopuut, iäkkäät männyt, puistokujanteet sekä puut ja puuryhmät, joilla on suojavaikutus tuulilta tai melulta.', NULL, '/data/img/felling/_DSC0056.JPG', '', '2019-06-15 10:48:53', '2019-05-15 00:00:00'),
(23, 'puunkaato/hanko', 5, 0, 'fi', '', 'Lupaa ei tarvita silloin, jos toimenpide on hyväksytty jonkin muun luvan yhteydessä (rakennuslupa, maa-ainesten ottolupa) tai muulla suunnitelmalla (esim. kunnallistekniset suunnitelmat asemakaavan toteuttamiseksi). Vaikutuksiltaan vähäiseen toimenpiteeseen ei lupaa tarvita, mutta yhdenkin puun kaataminen voi kuitenkin edellyttää lupaa. Toimenpiteen vähäisyyden arvioi ensi kädessä kaupungingeodeetti, joka käsittelee puunkaadot ja maisematyöluvat sekä tonteilla että puistoalueilla. Vähäisenä toimenpiteenä pidetään yleensä esimerkiksi nuoren lepikon siistimistä tai matalan puun kaatamista omalta pihalta.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-15 00:00:00'),
(24, 'puunkaato/hanko', 6, 0, 'fi', '', 'Puut tulee kaataa lintujen pesimäajan ulkopuolella. Suurten puiden kaatamiseen suositellaan ammattilaisen käyttämistä henkilö- ja omaisuusvahinkojen välttämiseksi.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-15 00:00:00'),
(25, 'puunkaato/hanko', 7, 0, 'fi', '', 'Toimenpidettä ei voida pitää vähäisenä ja lupa on aina haettava seuraavissa puiden kaatamiseen liittyvissä tapauksissa:', NULL, '', '', '2019-05-31 13:37:50', '2019-05-15 00:00:00'),
(26, 'puunkaato/hanko', 8, 1, 'fi', '', '<ul>\r\n    <li>Puulla tai puustolla on erityistä maisemallista tai kaupunkikuvallista arvoa tai luonnonsuojelullista merkitystä (yleensä suuret, vanhat puut tai pensaat)</li>\r\n    <li>Jalojen lehtipuiden (tammi, saarni, lehmus, vaahtera, jalava&hellip;), ulkomaisten havupuiden ja puistokujanteiden kaataminen.</li>\r\n    <li>Maisemaa rajaavan puuston kaataminen (puronvarsialueet, vesistöä tai peltoaukeaa rajaava puusto). Yksittäisten puiden koko voi tällöin olla pieni.</li>\r\n    <li>Erityisellä määräyksellä suojellun puuston kaataminen (esim. asema- tai yleiskaavassa suojeltu puu).</li>\r\n\r\n</ul>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-15 00:00:00'),
(27, 'puunkaato/hanko', 9, 0, 'fi', 'Puiden kaataminen asemakaava-alueen ulkopuolella', 'Kun kiinteistö sijaitsee asemakaava-alueen ulkopuolella tai sellaisella yleiskaava-alueella, jossa ei ole määrätty maisematyöluvasta, tarvitsee puun kaatoon luvan kaupungin vuokratontilla. Omistustontilla erillistä lupaa ei tarvita, mutta puiden kaatamista ei saa tehdä vastoin yleiskaavamääräyksiä. Yleiskaavassa voi olla esimerkiksi määräys istutettavasta puurivistä, olemassa olevien puiden säilyttämisestä tai suojeltavasta puustosta.', NULL, '/data/img/felling/20181004_122424.jpg:landscape', 'Puunkaato', '2019-06-15 10:50:45', '2019-05-15 00:00:00'),
(28, 'puunkaato/hanko', 10, 1, 'fi', '', '<p>Jos asut haja-asutusalueella, ole yhteydessä <a href=\"https://www.hanko.fi/palvelut/kuntatekniikka/puun_kaadot\" title=\"Puun kaadot - Hanko\" target=\"_blank\">puisto-osastoon</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-15 00:00:00'),
(29, 'puunkaato/hanko', 11, 0, 'fi', 'Puiden hoitoleikkaukset', 'Puiden leikkauksella ei saa vahingoittaa puuta eikä muuttaa maisemaa merkittävästi. Jalot lehtipuut lehmusta lukuun ottamatta, havupuut sekä iäkkäät koivut kestävät huonosti suurten oksien leikkaamista. Väärään vuodenaikaan tai väärin tehdystä leikkauksesta saattaa seurata puun sairastuminen. Kookkaiden tai vanhojen puiden siistimisessä suositellaan ammattilaisen käyttöä. Puiden hoitoleikkauksiin ei tarvita maisematyölupaa, mikäli leikkauksilla ei muuteta maisemaa merkittävästi.', NULL, '/data/img/services/puunhoito.jpg:landscape', 'Puunhoito', '2019-06-06 17:12:14', '2019-05-15 00:00:00'),
(30, 'puunkaato/hanko', 12, 1, 'fi', 'Yhteystiedot, Maankäyttöosasto', 'Paikkatietoinsinööri<br>\r\nDaniela Hellgren<br>\r\nPuh. <a href=\"tel:+358401359284\">040 1359 284</a><br>\r\nsähköpostiosoite: etunimi.sukunimi@hanko.fi<br>\r\nKäyntiosoite Santalantie 2, 10960 HANKO<br>\r\n<a href=\"https://www.hanko.fi/palvelut/kaavoitus_ja_maankaytto/puun_kaadot\" title=\"Puun kaadot - Hanko\" target=\"_blank\">Lue lisää tästä</a>\r\n', NULL, '', '', '2019-06-06 17:16:58', '2019-05-15 00:00:00'),
(31, 'puunkaato/inkoo', 1, 0, 'fi', 'Puunkaato Inkoo', '', NULL, '', '', '2019-05-31 13:44:55', '2019-05-19 00:00:00'),
(32, 'puunkaato/inkoo', 3, 1, 'fi', 'Puunkaatoluvat Inkoossa', '<p>Inkoossa on käytössä asiointipalvelu <a href=\"https://www.lupapiste.fi/\" target=\"_blank\" title=\"Lupapiste\">Lupapiste.fi</a>, jossa voit hakea lupia ja hoitaa niihin liittyvän viranomaisasioinnin sähköisesti. Inkoon rakennustarkastus sijaitsee kunnantalon yläkerrassa, osoitteessa Rantatie 2.</p>', NULL, '/data/img/felling/20181004_122418.jpg', 'Puunkaato Inkoossa', '2019-06-15 11:12:07', '2019-05-19 00:00:00'),
(33, 'puunkaato/inkoo', 4, 1, 'fi', 'Yhteystiedot', 'Rakennusvalvontapäällikkö<br>\r\nMikael Wikström<br>\r\n<a href=\"tel:+358505113815\">+358 50 511 3815</a><br>\r\npuhelinaika klo 08.00-09.00<br>\r\nvierailuaika tiistaisin ja perjantaisin klo 09:30-11:30 (ei puheluita tällöin)', NULL, '', '', '2019-05-31 13:37:50', '2019-05-19 00:00:00'),
(34, 'puunkaato/inkoo', 5, 1, 'fi', '', '<br>Rakennustarkastaja<br>\r\nHåkan Wide<br>\r\n<a href=\"tel:+358505941691\">+358 50 594 1691</a><br>\r\npuhelinaika klo 08.00-09.00\r\n', NULL, '', '', '2019-05-31 13:37:50', '2019-05-19 00:00:00'),
(35, 'puunkaato/inkoo', 6, 1, 'fi', '', '<br>etunimi.sukunimi(at)inkoo.fi\r\n<br>byggmiljo(at)inga.fi', NULL, '', '', '2019-05-31 13:37:50', '2019-05-19 00:00:00'),
(36, 'puunkaato/', 16, 0, 'fi', 'Puunkaatoluvista yleisesti', 'Omakotiasujan ei tarvitse hakea puunkaatolupaa, jos puita kaadetaan enintään viisi ja tontille jää kaatotoimenpiteen jälkeen kaavamääräyksen edellyttämä määrä puita. Helpoin tapa selvittää, mitä kaava määrää, on olla yhteydessä rakennusvalvontaan (ks. aukioloajat ja yhteystiedot paikkakuntakohtaisesti). Mikäli kaavassa ei ole muuta määrätty, tulee puita olla tontin tai rakennuspaikan rakentamatonta aluetta kohden vähintään 1 kpl / 200 m². On myös selvitettävä, ettei asemakaavassa ole puita koskevia suojelumääräyksiä, eivätkä puut kasva sellaisella tontin tai rakennuspaikan osalla, jolla asemakaavan mukaan tulee olla puita. Kaadettavat puut eivät saa myöskään olla maisemakuvallisesti merkittäviä, esimerkiksi komeita vanhoja yksittäispuita, puuryhmiä tai vastaavia, joiden häviämisellä olisi ympäristöä olennaisesti köyhdyttävä vaikutus. Rajalla kasvavien puiden kaatamiselle on saatava naapurin suostumus.', NULL, '/data/img/felling/20190508_130710.jpg:landscape', 'Haketus ja poiskuljetus', '2019-06-15 11:18:29', '2019-05-19 00:00:00'),
(37, 'puunkaato/', 17, 1, 'fi', '', '<p><a href=\"https://www.lupapiste.fi/\" target=\"_blank\" title=\"Lupapiste\">Lupapiste.fi</a> on asiointipalvelu, jossa voit hakea rakentamisen lupia ja hoitaa niihin liittyvän viranomaisasioinnin sähköisesti.</p>', NULL, '', '', '2019-06-15 11:18:28', '2019-05-19 00:00:00'),
(38, 'puunkaato/', 18, 0, 'fi', '', 'Ympäristölleen vaarallisen puun voi kaataa ilman lupaa.', NULL, '', '', '2019-05-31 14:00:15', '2019-05-19 00:00:00'),
(39, 'puunkaato/', 19, 0, 'fi', '', 'Kun taloyhtiöissä suunnitellaan puiden kaatoa, pitää kunnan rakennusvalvontaan ottaa yhteyttä ja hakea lupaa.', NULL, '', '', '2019-05-31 14:00:18', '2019-05-19 00:00:00'),
(40, 'puunkaato/karkkila', 1, 0, 'fi', 'Puunkaato Karkkila', '', NULL, '', '', '2019-05-31 13:45:17', '2019-05-19 00:00:00'),
(41, 'puunkaato/karkkila', 3, 1, 'fi', 'Puunkaatoluvat Karkkilassa', 'Karkkilassa puita ei saa kaataa ilman maisematyölupaa:\r\n<ol>\r\n<li>asemakaava-alueella;</li>\r\n<li>yleiskaava-alueella, jos yleiskaavassa niin määrätään;</li>\r\n<li>alueella, jolla on voimassa rakennuskielto asemakaavan laatimiseksi tai jolle yleiskaavan laatimista tai muuttamista varten on niin määrätty.</li>\r\n</ol>', NULL, '/data/img/felling/20181005_131313.jpg', 'Puunkaato Karkkilassa', '2019-06-15 11:13:51', '2019-05-19 00:00:00'),
(42, 'puunkaato/karkkila', 4, 0, 'fi', '', 'Lupaa ei tarvita yleis- tai asemakaavan toteuttamiseksi tarpeellisten taikka myönnetyn rakennus- tai toimenpideluvan mukaisten töiden suorittamiseen eikä vaikutuksiltaan vähäisiin toimenpiteisiin. Lupa ei ole myöskään tarpeen, jos toimenpide perustuu yleisistä teistä annetun lain mukaiseen hyväksyttyyn tiesuunnitelmaan. \r\nMaisematyölupa-asia ratkaistaan rakennusvalvonnassa:', NULL, '', '', '2019-05-31 13:37:50', '2019-05-19 00:00:00'),
(43, 'puunkaato/karkkila', 5, 1, 'fi', '', '<p><a href=\"http://www.karkkila.fi/sivut/FI/Rakennusvalvonta\" target=\"_blank\" title=\"Rakennusvalvonta - Karkkila\">Rakennusvalvonta - Karkkila</a></p>', NULL, '', '', '2019-06-06 17:18:40', '2019-05-19 00:00:00'),
(44, 'puunkaato/karkkila', 6, 1, 'fi', 'Yhteystiedot', 'Vastaava rakennustarkastaja\r\n<br>Petri Iivari\r\n<br><a href=\"tel:+358504052816\">050 4052 816</a>\r\n<br>Asiakaspalvelua keskiviikkoisin klo 9.00-12.00, katselmukset sopimuksen mukaan.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-19 00:00:00'),
(45, 'puunkaato/karkkila', 7, 1, 'fi', '', '<br><strong>Rakennusvalvonta</strong>\r\n<br>Lupasihteeri\r\n<br>Hilkka Kivimäki\r\n<br><a href=\"tel:+358447674646\">044 7674 646</a>\r\n<br><a href=\"mailto:rakennusvalvonta@karkkila.fi\">rakennusvalvonta@karkkila.fi</a>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-19 00:00:00'),
(46, 'puunkaato/karkkila', 8, 1, 'fi', '', '<br><p><a href=\"http://www.karkkila.fi/sivut/FI/Muut-luvat\" target=\"_blank\" title=\"Muut luvat - Karkkila\">Lue lisää maisematyöluvasta täältä</a></p>', NULL, '', '', '2019-06-06 17:19:02', '2019-05-19 00:00:00'),
(47, 'puunkaato/kauniainen', 1, 0, 'fi', 'Puunkaato Kauniainen', '', NULL, '', '', '2019-05-31 13:45:21', '2019-05-26 00:00:00'),
(48, 'puunkaato/kauniainen', 3, 0, 'fi', 'Puunkaatoluvat Kauniaisissa', 'Asemakaavoitetulla alueella puiden kaatamista säätelee maankäyttö- ja rakennuslain § 128 maisematyölupa. Lupaa ei tarvita yleis- tai asemakaavan toteuttamiseksi tarpeellisten taikka myönnetyn rakennus- tai toimenpideluvan mukaisten töiden suorittamiseen eikä vaikutuksiltaan vähäisiin toimenpiteisiin.', NULL, '/data/img/felling/_DSC0023.JPG', 'Puunkaato Kauniaisissa', '2019-06-15 11:09:15', '2019-05-26 00:00:00'),
(49, 'puunkaato/kauniainen', 4, 0, 'fi', '', 'Kun tontinomistajalla on tarve kaataa puita tontillaan, tehdään tontilla maisematyöluvan tarpeen arviointikäynti (nk. puustokatselmus). Arviointikäynti tilataan kunnossapitopuutarhurilta tai kaupunginpuutarhurilta ja se on ilmainen. Siinä arvioidaan, tarvitaanko tontille suunnitelluille kaadoille maisematyölupaa vai ei.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(50, 'puunkaato/kauniainen', 5, 0, 'fi', '', 'Puiden kuntotutkimuksia tai hoitosuunnitelmia ei käynnillä tehdä. Kuntotutkimuksia ja puiden hoitosuunnitelmia voi tilata puunhoitoalan yrityksiltä. Vaarallisten puiden kaatoon ei tarvita arviokäyntiä eikä maisematyölupaa. Vaarallisuus on pystyttävä jälkikäteen todentamaan esim. valokuvin.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(51, 'puunkaato/kauniainen', 6, 0, 'fi', '', 'Huomioithan, että kesä – heinäkuussa tehdään vain kiireelliset arviokäynnit.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(52, 'puunkaato/kauniainen', 7, 0, 'fi', '', 'Maisematyölupa tarvitaan, mikäli puiden kaato vaikuttaa maisemaan, eikä ole vähäinen toimenpide. Maisematyöluvan tarpeen arvioi kunnossapitopuutarhuri tai kaupunginpuutarhuri. Maisematyölupaa haetaan ympäristöpäälliköltä.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(53, 'puunkaato/kauniainen', 8, 0, 'fi', '', 'Puunkaatoon on selvät perusteet, eikä maisematyölupaa tarvita, jos arviointikäynnin yhteydessä on todettu, että puu on silmämääräisesti arvioituna huonokuntoinen, pahasti lahovikainen tai harsuuntunut sekä jos se aiheuttaa merkittävää vahinkoa viemäreille, salaojille, rakennuksille tai muulle omaisuudelle.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(54, 'puunkaato/kauniainen', 9, 0, 'fi', '', 'Vastuu puiden kunnosta kuuluu kiinteistön omistajalle tai haltijalle, joka vastaa puiden kunnon seurannasta, ja jonka on ryhdyttävä tarvittaviin toimenpiteisiin puiden poistamiseksi tai säilyttämiseksi. Kiinteistön omistaja/haltija vastaa myös kaatuneen puun aiheuttamista vahingoista.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(55, 'puunkaato/kauniainen', 10, 1, 'fi', 'Lisätietoja', '<p><a href=\"https://www.kauniainen.fi/files/10634/Kasvillisuuden_ja_luontoalueiden_suojaaminen_seka_arviointi_maisematyoluvan_tarpeesta_puun_kaatoon_2016.pdf\" title=\"Kasvillisuuden ja luontoalueiden suojaaminen sekä arviointi maisematyöluvan tarpeesta puun kaatoon Kauniaisissa\" target=\"_blank\">Kasvillisuuden ja luontoalueiden suojaaminen sekä arviointi maisematyöluvan tarpeesta puun kaatoon.</a></p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(56, 'puunkaato/kauniainen', 11, 0, 'fi', 'Yhteydenotot', 'Yhteydenotot puustokatselmuksista ja kaupungin alueella olevista huonokuntoisista puista:', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(57, 'puunkaato/kauniainen', 12, 1, 'fi', '', '<p>Kunnossapitopuutarhuri Minna Aavalehto puh. <a href=\"tel:+358504118656\">050 4118656</a>, sähköposti: <a href=\"mailto:minna.aavalehto@kauniainen.fi\">minna.aavalehto@kauniainen.fi</a>\r\n- huonokuntoiset puut, tonttipuiden harvennukset ym.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(58, 'puunkaato/kauniainen', 13, 1, 'fi', '', '<p>Kaupunginpuutarhuri Emmi Silvennoinen puh. <a href=\"tel:+358505004128\">050 5004128</a>, sähköposti: <a href=\"mailto:emmi.silvennoinen@kauniainen.fi\">emmi.silvennoinen@kauniainen.fi</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(59, 'puunkaato/kauniainen', 14, 1, 'fi', '', '<p><a href=\"https://www.kauniainen.fi/asuminen_ja_ymparisto/kadut_ja_viheralueet_liikenne_joukkoliikenne/puiden_kaataminen_kauniaisissa\" title=\"Puiden kaataminen Kauniaisissa\" target=\"_blank\">Puiden kaataminen Kauniaisissa</a></p>', NULL, '', '', '2019-06-06 17:19:52', '2019-05-26 00:00:00'),
(60, 'puunkaato/lohja', 1, 0, 'fi', 'Puunkaato Lohja (myös Sammatti, Nummi-Pusula ja Karjalohja)', '', NULL, '', '', '2019-05-31 13:46:14', '2019-05-26 00:00:00'),
(61, 'puunkaato/lohja', 3, 1, 'fi', 'Puunkaatoluvat Lohjalla (myös Sammatti, Nummi-Pusula ja Karjalohja)', '<p>Lohjalla omalla tontilla olevien puiden kaatamisesta tulee ottaa yhteyttä rakennusvalvontaan rakennustarkastaja Juhani Järviseen, p. <a href=\"tel:+358500475158\">0500 475 158</a>.</p>', NULL, '/data/img/felling/AIMG_3025.jpeg:landscape', 'Puunkaato ammattitaidolla', '2019-06-15 10:52:59', '2019-05-26 00:00:00'),
(62, 'puunkaato/lohja', 4, 1, 'fi', '', '<p>Tontteihin rajoittuvista puistometsistä tai puistoista kaadettavista puista tulee ottaa yhteyttä kaupungin puisto-osastoon johtavaan kaupunginpuutarhuri Kirsti Puustiseen, p. <a href=\"tel:+358500472630\">0500 472 630</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(63, 'puunkaato/lohja', 5, 1, 'fi', '', '<p><a href=\"https://www.lohja.fi/asuminen-ja-ymparisto/asuminen/asuinymparisto/puiden-kaataminen/\" title=\"Puiden kaataminen - Lohja\" target=\"_blank\">Puiden kaataminen - Lohja</a></p>', NULL, '', '', '2019-06-06 17:20:35', '2019-05-26 00:00:00'),
(64, 'puunkaato/raasepori', 1, 0, 'fi', 'Puunkaato Raasepori (Karjaa, Tammisaari ja Pohja)', '', NULL, '', '', '2019-05-31 13:48:59', '2019-05-26 00:00:00'),
(65, 'puunkaato/raasepori', 3, 0, 'fi', 'Puunkaatoluvat Raaseporissa (Karjaa, Tammisaari ja Pohja)', 'Raaseporissa tarvitaan maisematyölupa puiden kaatamista varten. Alla on linkki sivulle, josta löytyy pdf-muodossa ohjeet puunkaatoluvan hakemiseen, hakulomake sekä lomake naapurin kuulemiseen:', NULL, '/data/img/felling/AIMG_3000.jpeg', 'Puunkaato Raaseporissa', '2019-06-15 11:15:20', '2019-05-26 00:00:00'),
(66, 'puunkaato/raasepori', 4, 1, 'fi', '', '<p><a href=\"https://www.raasepori.fi/asuminen-ja-ymparisto/ymparisto/ymparistonsuojelu/puunkaato/\" title=\"Puunkaato - Raasepori\" target=\"_blank\">Puunkaato - Raasepori</a></p>', NULL, '', '', '2019-06-06 17:21:03', '2019-05-26 00:00:00'),
(67, 'puunkaato/raasepori', 5, 1, 'fi', 'Yhteystiedot', 'Yhteyshenkilöt <a href=\"mailto:ymparisto@raasepori.fi\">ymparisto@raasepori.fi</a>:\r\n<br><br>kaupunkisuunnitteluarkkitehti Simon Store, puh. <a href=\"tel:+358192893843\">019 289 3843</a>\r\n<br><a href=\"mailto:simon.store@raasepori.fi\">simon.store@raasepori.fi</a>\r\n<br><br>vastaava puistopäällikkö Joakim Mäkelä, puh. <a href=\"tel:+358192893850\">019 289 3850</a>\r\n<br><a href=\"mailto:joakim.makela@raasepori.fi\">joakim.makela@raasepori.fi</a>\r\n<br><br>viheraluesuunnittelija Maria Eriksson, puh. <a href=\"tel:+358192893866\">019 289 3866</a>\r\n<br><a href=\"mailto:maria.eriksson@raasepori.fi\">maria.eriksson@raasepori.fi</a>\r\n<br><br>metsätalousinsinööri Carl-Johan Jansson, puh. <a href=\"tel:´+358192893835\">019 289 3835</a>\r\n<br><a href=\"mailto:carl-johan.jansson@raasepori.fi\">carl-johan.jansson@raasepori.fi</a>\r\n', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(68, 'puunkaato/raasepori', 6, 1, 'fi', '', '<br>Raaseporin ympäristötoimisto \r\n<br>Raaseporintie 37 \r\n<br>10650 Tammisaari', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(69, 'puunkaato/siuntio', 1, 0, 'fi', 'Puunkaato Siuntio', '', NULL, '', '', '2019-05-31 13:49:20', '2019-05-26 00:00:00'),
(70, 'puunkaato/siuntio', 3, 0, 'fi', 'Puunkaatoluvat Siuntiossa', 'Siuntiossa on oltava yhteydessä rakennusvalvontaan, mikäli kyseessä on useamman puun kaataminen tai maisemallisesti merkittävä puu. Puita ei myöskään saa kaataa lintujen pesimäaikana (1.4. - 31.7.) muusta kuin pakottavasta syystä. Mikäli kaataminen on pakollista suorittaa kyseisellä aikavälillä, tulee ennen toimiin ryhtymistä ottaa yhteyttä rakennusvalvontaan.', NULL, '/data/img/felling/AIMG_3025.jpeg:landscape', 'Puunkaato Siuntiossa', '2019-06-15 11:21:17', '2019-05-26 00:00:00'),
(71, 'puunkaato/siuntio', 4, 0, 'fi', '', 'Siuntion rakennusvalvonnan rakennustarkastaja on tavattavissa teknisessä toimistossa osoitteessa Siuntiontie 504 seuraavasti:', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(72, 'puunkaato/siuntio', 5, 0, 'fi', '', 'maanantai - perjantai klo 9:00-11:15 ja 11:45-13:00. Puhelimitse tavoittaa parhaiten maanantai - perjantai klo 9:00-15:00.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(73, 'puunkaato/siuntio', 6, 0, 'fi', '', 'Lupatiedustelut sekä piirustusten ja lupien tilaukset sähköpostitse: rakennusvalvonta(at)siuntio.fi', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(74, 'puunkaato/siuntio', 7, 1, 'fi', '', '<p><a href=\"https://www.siuntio.fi/puiden-istutus-ja-kaataminen\" title=\"Puiden istutus ja kaataminen - Siuntio\" target=\"_blank\">Puiden istutus ja kaataminen - Siuntio</a></p>', NULL, '', '', '2019-06-06 17:21:49', '2019-05-26 00:00:00'),
(75, 'puunkaato/vihti', 1, 0, 'fi', 'Puunkaato Vihti', '', NULL, '', '', '2019-05-31 13:49:44', '2019-05-26 00:00:00'),
(76, 'puunkaato/vihti', 3, 0, 'fi', 'Puunkaatoluvat Vihdissä', 'Vihdissä tarvitaan maisematyölupa silloin, kun suunnitellaan maisemaa muuttavaa puiden kaatamista tai muuta tähän verrattavaa toimenpidettä (MRL 128 §).', NULL, '/data/img/felling/20190508_130656.jpg', 'Puunkaato Vihdissä ammattitaidolla', '2019-06-15 11:02:45', '2019-05-26 00:00:00'),
(77, 'puunkaato/vihti', 4, 1, 'fi', '', '<strong>Maisematyölupa tarvitaan:</strong>\r\n<ul>\r\n	<li>asemakaava-alueella,</li>\r\n	<li>alueella, jolla on rakennuskielto yleiskaavan (MRL 38 §) tai asemakaavan (MRL 53 §) laatimiseksi sekä</li>\r\n	<li>yleiskaava-alueella, jos yleiskaavassa niin määrätään.</li>\r\n</ul>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(78, 'puunkaato/vihti', 5, 0, 'fi', '', 'Asemakaava-alueella ja yleiskaava-alueella lupa on myönnettävä, jos toimenpide ei vaikeuta alueen käyttämistä kaavassa varattuun tarkoitukseen taikka turmele kaupunki- tai maisemakuvaa. Rakennuskieltoalueilla lupa voidaan myöntää, jollei toimenpide tuota huomattavaa haittaa kaavan laatimiselle taikka turmele kaupunki- tai maisemakuvaa.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(79, 'puunkaato/vihti', 6, 1, 'fi', '', '<p><strong>Maisematyölupaa ei tarvita</strong> vaikutuksiltaan vähäisiin toimenpiteisiin eikä yleensä silloin, jos toimenpide on hyväksytty jollakin muulla luvalla (rak.lupa, maa-ainesten ottolupa) tai suunnitelmalla (maantien suunnitelma, kunnallistekniset suunnitelmat asemakaavan toteuttamiseksi, ei kuitenkaan esim. puistosuunnitelma, jonka alueella tarvitaan mahdollisen puistosuunnitelman lisäksi maisematyölupa).</p>', NULL, '', '', '2019-06-15 11:02:34', '2019-05-26 00:00:00'),
(80, 'puunkaato/vihti', 7, 0, 'fi', '', 'Joskus yhdenkin puun kaataminen esim. asemakaava-alueella saattaa olla luvanvarainen toimenpide ja toisaalta kymmenienkin puiden kaataminen metsäalueella tai metsän harvennus voi olla vähäinen toimenpide. Näistä tulkinnoista voi kysyä lisätietoa kunnan kaavoitustoimesta, mutta on syytä huomioida, että suullisia maisematyölupia ei ole mahdollista saada.', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 00:00:00'),
(81, 'puunkaato/vihti', 8, 0, 'fi', '', 'Maisematyölupahakemukset toimitetaan kaavoituksen asiakaspalvelupisteeseen kunnanviraston 2. kerrokseen osoitteessa:', NULL, '', '', '2019-06-15 11:03:08', '2019-05-26 00:00:00'),
(82, 'puunkaato/vihti', 9, 1, 'fi', '', '<br>Vihdin kunta/kaavoitus\r\n<br>Asemantie 30\r\n<br>03100 Nummela\r\n<br>\r\n<br>tai postitse osoitteeseen:\r\n<br>\r\n<br>Vihdin kunta/kaavoitus\r\n<br>PL 13\r\n<br>03101 Nummela\r\n<br>\r\n<br><strong>Tiedustelut maisematyöluvan hakemisesta</strong>\r\n<br>toimistosihteeri\r\n<br>Anne Riikonen\r\n<br>p. <a href=\"tel:+358444675583\">044 467 5583</a>\r\n', NULL, '', '', '2019-06-15 11:03:32', '2019-05-26 00:00:00'),
(84, 'puunkaato/espoo', 1001, 1, 'fi', '', '<br><p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 18:24:53'),
(85, 'puunkaato/hanko', 1001, 1, 'fi', '', '<br><p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 18:24:53'),
(86, 'puunkaato/inkoo', 1001, 1, 'fi', '', '<br><p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 18:24:53'),
(87, 'puunkaato/karkkila', 1001, 1, 'fi', '', '<p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 18:24:53'),
(88, 'puunkaato/kauniainen', 1001, 1, 'fi', '', '<p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 18:24:53'),
(89, 'puunkaato/lohja', 1001, 1, 'fi', '', '<p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 18:24:53'),
(90, 'puunkaato/raasepori', 1001, 1, 'fi', '', '<br><p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 18:24:53'),
(91, 'puunkaato/siuntio', 1001, 1, 'fi', '', '<p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 18:24:53'),
(92, 'puunkaato/vihti', 1001, 1, 'fi', '', '<br><p>Lue myös <a href=\"https://lu-pa.fi/puunkaato/#puunkaatoluvista-yleisesti\" title=\"Puunkaatoluvista yleisesti\">puunkaatoluvista yleisesti</a>.</p>', NULL, '', '', '2019-05-31 13:37:50', '2019-05-26 18:24:53'),
(93, 'puunkaato/espoo', 6, 1, 'fi', 'Yhteystiedot', '<strong>Puhelin</strong>\r\n<br>Teknisen ja ympäristötoimen asiakaspalvelu\r\n<br><a href=\"tel:+358981625000\">09 816 25000</a>\r\n<br><br><strong>Aukioloajat</strong>\r\n<br>Asiakaspalvelun puhelinpalvelu on avoinna ma, ke–pe klo 8.00–15.30 ja ti klo 10.00-15.30.\r\n', NULL, '', '', '2019-05-31 13:37:50', '2019-03-31 00:00:00'),
(98, 'puunkaato/espoo', 2, 0, 'fi', '', 'Hoidamme puunkaadot Espoossa 10 vuoden kokemuksella. Meiltä onnistuu kiipeilykaadot, suorat kaadot, korikaadot ja nosturikaadot.', NULL, '', '', NULL, '2019-05-31 17:04:58'),
(99, 'puunkaato/hanko', 2, 0, 'fi', '', 'Hoidamme puunkaadot Hangossa 10 vuoden kokemuksella. Meiltä onnistuu kiipeilykaadot, suorat kaadot, korikaadot ja nosturikaadot.', NULL, '', '', '2019-05-31 14:05:29', '2019-05-31 17:04:58'),
(100, 'puunkaato/inkoo', 2, 0, 'fi', '', 'Hoidamme puunkaadot Inkoossa 10 vuoden kokemuksella. Meiltä onnistuu kiipeilykaadot, suorat kaadot, korikaadot ja nosturikaadot.', NULL, '', '', '2019-05-31 14:05:55', '2019-05-31 17:04:58'),
(101, 'puunkaato/karkkila', 2, 0, 'fi', '', 'Hoidamme puunkaadot Karkkilassa 10 vuoden kokemuksella. Meiltä onnistuu kiipeilykaadot, suorat kaadot, korikaadot ja nosturikaadot.', NULL, '', '', '2019-05-31 14:06:13', '2019-05-31 17:04:58'),
(102, 'puunkaato/kauniainen', 2, 0, 'fi', '', 'Hoidamme puunkaadot Kauniaisissa 10 vuoden kokemuksella. Meiltä onnistuu kiipeilykaadot, suorat kaadot, korikaadot ja nosturikaadot.', NULL, '', '', '2019-05-31 14:06:28', '2019-05-31 17:04:58'),
(103, 'puunkaato/lohja', 2, 0, 'fi', '', 'Hoidamme puunkaadot Lohjalla 10 vuoden kokemuksella. Meiltä onnistuu kiipeilykaadot, suorat kaadot, korikaadot ja nosturikaadot.', NULL, '', '', '2019-05-31 14:06:41', '2019-05-31 17:04:58'),
(104, 'puunkaato/raasepori', 2, 0, 'fi', '', 'Hoidamme puunkaadot Raaseporissa 10 vuoden kokemuksella. Meiltä onnistuu kiipeilykaadot, suorat kaadot, korikaadot ja nosturikaadot.', NULL, '', '', '2019-05-31 14:06:53', '2019-05-31 17:04:58'),
(105, 'puunkaato/siuntio', 2, 0, 'fi', '', 'Hoidamme puunkaadot Siuntiossa 10 vuoden kokemuksella. Meiltä onnistuu kiipeilykaadot, suorat kaadot, korikaadot ja nosturikaadot.', NULL, '', '', '2019-05-31 14:07:06', '2019-05-31 17:04:58'),
(106, 'puunkaato/vihti', 2, 0, 'fi', '', 'Hoidamme puunkaadot Vihdissä 10 vuoden kokemuksella. Meiltä onnistuu kiipeilykaadot, suorat kaadot, korikaadot ja nosturikaadot.', NULL, '', '', '2019-06-15 11:02:19', '2019-05-31 17:04:58');

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


-- 190630

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'INFO_PARTNERS_PAGE_TITLE', 'Kumppanit ja vastuullisuus', NULL, '2019-06-30 12:00:00')
, ('en', 'INFO_PARTNERS_PAGE_TITLE', '', NULL, '2019-06-30 12:00:00')
, ('sv', 'INFO_PARTNERS_PAGE_TITLE', '', NULL, '2019-06-30 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'NAV_PARTNERS', 'Kumppanit', NULL, '2019-06-30 12:00:00')
, ('en', 'NAV_PARTNERS', '', NULL, '2019-06-30 12:00:00')
, ('sv', 'NAV_PARTNERS', '', NULL, '2019-06-30 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'NAV_PUUNKAATO', 'Puunkaato', NULL, '2019-06-30 12:00:00')
, ('en', 'NAV_PUUNKAATO', '', NULL, '2019-06-30 12:00:00')
, ('sv', 'NAV_PUUNKAATO', '', NULL, '2019-06-30 12:00:00')
;

INSERT INTO `lupa_info_page` (`id`, `uri`, `time_edited`, `time_created`) VALUES
(11, 'partners/', NULL, '2019-06-30 00:00:00');

INSERT INTO `lupa_info_page_meta` (`id`, `uri`, `language`, `html_title`, `time_edited`, `time_created`) VALUES
(11, 'partners/', 'fi', 'Kumppanit ja vastuullisuus', NULL, '2019-06-30 00:00:00');

INSERT INTO `lupa_info_page_content` (`id`, `uri`, `position`, `is_html`, `language`, `title`, `content`, `video_id`, `image_uri`, `image_description`, `time_edited`, `time_created`) VALUES
(111, 'partners/', 2, 0, 'fi', 'Kumppanit', 'Länsi-Uudenmaan PuuApu Oy on vastuullisesti verkostoitunut alan ammattilaisten kanssa. Työmaallamme on aina vähintään yksi koulutettu arboristi vastaamassa laadusta ja turvallisuudesta.', NULL, '', '', '2019-07-06 16:13:00', '2019-06-30 00:00:00'),
(110, 'partners/', 5, 0, 'fi', '', 'Voit tarkistaa tietomme Zeckit-palvelussa klikkaamalla alla olevaa kuvaa. Yritysasiakkaana voit myös tarkistaa tietomme Tilaajavastuun Luotettava Kumppani -palvelussa.', NULL, '', '', '2019-07-06 16:10:45', '2019-06-30 00:00:00'),
(109, 'partners/', 4, 0, 'fi', 'Vastuullisuus', 'Vastuuvakuutuksemme kattaa vahingot 500.000 euroon asti.', NULL, '', '', '2019-07-06 16:10:50', '2019-06-30 00:00:00'),
(108, 'partners/', 3, 1, 'fi', '', 'Uudenmaan Puu ja Piha Oy <a href=\"http://www.puujapiha.fi\" target=\"_blank\">http://www.puujapiha.fi</a>\r\n<br>PihaPuuPalvelut Oy <a href=\"https://pihapuupalvelut.fi\" target=\"_blank\">https://pihapuupalvelut.fi</a>\r\n<br>Meriläinen Yhtiöt Oy <a href=\"https://nostolavapalvelu.fi\" target=\"_blank\">https://nostolavapalvelu.fi</a>\r\n<br>Tmi Matti Tapio Karhu <a href=\"http://bjornbacka.net/BJORNBACKA/Puu-_ja_vihertyot.html\" target=\"_blank\">http://bjornbacka.net/BJORNBACKA/Puu-_ja_vihertyot.html</a>\r\n<br>TS Tree Service <a href=\"https://www.sahamies.fi\" target=\"_blank\">https://www.sahamies.fi</a>\r\n<br>Tmi Jouni Kvist <a href=\"http://risuveljet.com/tmi-jouni-kvist/\" target=\"_blank\">http://risuveljet.com/tmi-jouni-kvist/</a><br>Raivausyhtymä Kelloniemi & kni <a href="https://www.ryk.fi" target="_blank">https://www.ryk.fi/</a><br><br>', NULL, '', '', '2019-08-11 18:36:33', '2019-06-30 00:00:00'),
(107, 'partners/', 1, 0, 'fi', 'Kumppanit ja vastuullisuus', '', NULL, '', '', NULL, '2019-06-30 00:00:00');

-- 191229

UPDATE `lupa_service_image` SET `image_uri` = '/data/img/services/puunkaato_191230.jpg' WHERE `lupa_service_image`.`id` = 8;

-- 200523

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'PH_CONTACT_MESSAGE', 'Jos mahdollista, ilmoita kohteen kuvaus ja osoite sekä aikataulu ja puhelinnumero.', NULL, '2020-05-23 12:00:00')
, ('en', 'PH_CONTACT_MESSAGE', 'If possible, please give a location description and address as well as the schedule and phone number.', NULL, '2020-05-23 12:00:00')
, ('sv', 'PH_CONTACT_MESSAGE', 'Om möjligt, ge en platsbeskrivning och adress samt tidtabell och telefonnummer.', NULL, '2020-05-23 12:00:00')
;

 -- 200630

set @old_messages = "2020-06-01 00:00:00";

insert into `lupa_work_item` (contact_inbox_id, s_reference, state, time_created, time_state_changed)
    select
        c.id,
        concat(date_format(c.time_created, '%Y%m%d'), "20", c.id),
        'STATE_NEW',
        c.time_created,
        now()
    from lupa_contact_inbox c
    where c.time_created >= @old_messages;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_TITLE_STATE_NEW', 'Työlista - uudet', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_TITLE_STATE_NEW', 'Work list - new', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_TITLE_STATE_NEW', 'Uppgifter - nya', NULL, '2020-06-30 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_TITLE_STATE_IN_PROGRESS', 'Työlista - tarjouspyynnöt', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_TITLE_STATE_IN_PROGRESS', 'Work list - requests for quote', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_TITLE_STATE_IN_PROGRESS', 'Uppgifter - anbudsbegäranden', NULL, '2020-06-30 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_TITLE_STATE_FINISHED', 'Työlista - tarjottu', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_TITLE_STATE_FINISHED', 'Work list - quoted', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_TITLE_STATE_FINISHED', 'Uppgifter - bjudit', NULL, '2020-06-30 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_TITLE_STATE_HALTED', 'Työlista - ohitetut', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_TITLE_STATE_HALTED', 'Work list - skipped', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_TITLE_STATE_HALTED', 'Uppgifter - skippat', NULL, '2020-06-30 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_TITLE_ARCHIVED', 'Työlista - arkisto', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_TITLE_ARCHIVED', 'Work list - archive', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_TITLE_ARCHIVED', 'Uppgifter - arkiv', NULL, '2020-06-30 12:00:00')
;

-- 200725

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_STATE_NEW', 'Uusi', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_STATE_NEW', 'New', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_STATE_NEW', 'Ny', NULL, '2020-06-30 12:00:00')

, ('fi', 'MANAGEMENT_WORK_LIST_STATE_IN_PROGRESS', 'Tarjouspyyntö', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_STATE_IN_PROGRESS', 'Request for quote', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_STATE_IN_PROGRESS', 'Anbudsbegäranden', NULL, '2020-06-30 12:00:00')

, ('fi', 'MANAGEMENT_WORK_LIST_STATE_FINISHED', 'Tarjottu', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_STATE_FINISHED', 'Quoted', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_STATE_FINISHED', 'Bjudit', NULL, '2020-06-30 12:00:00')

, ('fi', 'MANAGEMENT_WORK_LIST_STATE_HALTED', 'Ohitettu', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_STATE_HALTED', 'Skipped', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_STATE_HALTED', 'Skippat', NULL, '2020-06-30 12:00:00')

, ('fi', 'MANAGEMENT_WORK_LIST_STATE_ARCHIVED', 'Arkistoitu', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_STATE_ARCHIVED', 'Archived', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_STATE_ARCHIVED', 'Arkiverat', NULL, '2020-06-30 12:00:00')
;


INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_ACTION_START', 'TP', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_ACTION_START', 'QR', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_ACTION_START', 'AB', NULL, '2020-06-30 12:00:00')

, ('fi', 'MANAGEMENT_WORK_LIST_ACTION_FINISH', 'Tarjottu', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_ACTION_FINISH', 'Quoted', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_ACTION_FINISH', 'Bjudit', NULL, '2020-06-30 12:00:00')

, ('fi', 'MANAGEMENT_WORK_LIST_ACTION_HALT', 'Ohita', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_ACTION_HALT', 'Skip', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_ACTION_HALT', 'Skippa', NULL, '2020-06-30 12:00:00')

, ('fi', 'MANAGEMENT_WORK_LIST_ACTION_ARCHIVE', 'Arkistoi', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_ACTION_ARCHIVE', 'Archive', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_ACTION_ARCHIVE', 'Arkivera', NULL, '2020-06-30 12:00:00')
;


INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_LOGIN_FIELD_PASSWORD', 'Salasana', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_LOGIN_FIELD_PASSWORD', 'Password', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_LOGIN_FIELD_PASSWORD', 'Lösenord', NULL, '2020-06-30 12:00:00')

, ('fi', 'MANAGEMENT_LOGIN_FIELD_ERROR_PASSWORD', 'Väärä käyttäjänimi tai salasana.', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_LOGIN_FIELD_ERROR_PASSWORD', 'Wrong password or username.', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_LOGIN_FIELD_ERROR_PASSWORD', 'Fel användarnamn eller lösenord.', NULL, '2020-06-30 12:00:00')

, ('fi', 'MANAGEMENT_LOGIN_SUCCESS', 'Tervetuloa.', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_LOGIN_SUCCESS', 'Welcome.', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_LOGIN_SUCCESS', 'Välkommen.', NULL, '2020-06-30 12:00:00')

, ('fi', 'MANAGEMENT_LOGIN_SELECT_PROMPT', 'Valitse näkymä.', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_LOGIN_SELECT_PROMPT', 'Please select a view.', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_LOGIN_SELECT_PROMPT', 'Välj vy.', NULL, '2020-06-30 12:00:00')

, ('fi', 'MANAGEMENT_LOGIN_TITLE', 'Sisäänkirjaus', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_LOGIN_TITLE', 'Login', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_LOGIN_TITLE', 'Login', NULL, '2020-06-30 12:00:00')
;


INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_LOGIN_SUBMIT', 'Kirjaudu', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_LOGIN_SUBMIT', 'Log in', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_LOGIN_SUBMIT', 'Logga in', NULL, '2020-06-30 12:00:00')
;


INSERT INTO `lupa_config` (`key`, `value`, `time_edited`, `time_created`) VALUES
('session_notifications', '0', NULL, '2020-08-01 12:00:00');


INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_LOGIN_FIELD_ERROR___CSRF_TOKEN', 'Lomake on vanhentunut. Ole hyvä ja yritä uudelleen.', NULL, '2020-08-02 12:00:00')
, ('en', 'MANAGEMENT_LOGIN_FIELD_ERROR___CSRF_TOKEN', 'The form has expired. Please try again.', NULL, '2020-08-02 12:00:00')
, ('sv', 'MANAGEMENT_LOGIN_FIELD_ERROR___CSRF_TOKEN', 'Formen har löpt ut. Var god försök igen.', NULL, '2020-08-02 12:00:00')
;


INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_LOGIN_GENERIC_ERROR', 'Järjestelmävirhe istunnon tallennuksessa.', NULL, '2020-08-02 12:00:00')
, ('en', 'MANAGEMENT_LOGIN_GENERIC_ERROR', 'System error when saving the session.', NULL, '2020-08-02 12:00:00')
, ('sv', 'MANAGEMENT_LOGIN_GENERIC_ERROR', 'Systemfel vid session lagring.', NULL, '2020-08-02 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_LOGIN_FIELD_USERNAME', 'Käyttäjä', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_LOGIN_FIELD_USERNAME', 'User', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_LOGIN_FIELD_USERNAME', 'Användare', NULL, '2020-06-30 12:00:00')

, ('fi', 'MANAGEMENT_LOGIN_FIELD_ERROR_USERNAME', 'Odota %s sekuntia ennen kuin yrität uudelleen.', NULL, '2020-06-30 12:00:00')
, ('en', 'MANAGEMENT_LOGIN_FIELD_ERROR_USERNAME', 'Please wait for %s seconds before trying again.', NULL, '2020-06-30 12:00:00')
, ('sv', 'MANAGEMENT_LOGIN_FIELD_ERROR_USERNAME', 'Vänta %s sekunder innan du försöker igen.', NULL, '2020-06-30 12:00:00')
;

update lupa_ui_text set `content` = '<span class="orange">Lähetä</span> tarjouspyyntö'
    where `code` = 'CONTACT_INFO_FP_TITLE' and `language` = 'fi';
update lupa_ui_text set `content` = '<span class="orange">Begär</span> offert'
    where `code` = 'CONTACT_INFO_FP_TITLE' and `language` = 'sv';
update lupa_ui_text set `content` = '<span class="orange">Request</span> a quote'
    where `code` = 'CONTACT_INFO_FP_TITLE' and `language` = 'en';

update lupa_ui_text set `content` = 'Lähetä meille tarjouspyyntö antamalla tietosi alla olevaan lomakkeeseen.'
    where `code` = 'CONTACT_PROMPT_TEXT' and `language` = 'fi';
update lupa_ui_text set `content` = 'Ange din information nedan så tar vi kontakt.'
    where `code` = 'CONTACT_PROMPT_TEXT' and `language` = 'sv';
update lupa_ui_text set `content` = 'Send us a quote request by entering your information below.'
    where `code` = 'CONTACT_PROMPT_TEXT' and `language` = 'en';

update lupa_ui_text set `content` = 'Tarjouspyyntö'
    where `code` = 'NAV_CONTACT' and `language` = 'fi';
update lupa_ui_text set `content` = 'Anbudsbegäran'
    where `code` = 'NAV_CONTACT' and `language` = 'sv';
update lupa_ui_text set `content` = 'Request a quote'
    where `code` = 'NAV_CONTACT' and `language` = 'en';

update lupa_ui_text set `content` = 'Tarjouspyyntö'
    where `code` = 'CONTACT_TITLE' and `language` = 'fi';
update lupa_ui_text set `content` = 'Anbudsbegäran'
    where `code` = 'CONTACT_TITLE' and `language` = 'sv';
update lupa_ui_text set `content` = 'Request a quote'
    where `code` = 'CONTACT_TITLE' and `language` = 'en';

update lupa_ui_text set `content` = 'Kiitos tarjouspyynnöstäsi. Olemme sinuun yhteydessä pian.'
    where `code` = 'CONTACT_SUBMIT_TEXT' and `language` = 'fi';

update lupa_ui_text set `content` = 'Länsi-Uudenmaan PuuApu'
    where `code` = 'CONTACT_TEXT_NAME' and `language` = 'fi';
update lupa_ui_text set `content` = 'Länsi-Uudenmaan PuuApu'
    where `code` = 'CONTACT_TEXT_NAME' and `language` = 'en';
update lupa_ui_text set `content` = 'Nyländska TrädHjälpen'
    where `code` = 'CONTACT_TEXT_NAME' and `language` = 'sv';

INSERT INTO `lupa_config` (`key`, `value`, `time_edited`, `time_created`) VALUES
('contact_person', '', NULL, '2020-09-03 12:00:00');

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'CONTACT_CONFIRMATION_BODY', 'Kiitos tarjouspyynnöstäsi. Jos sinulla on lisättävää tai kysymyksiä, ole hyvä ja vastaa tähän viestiin.', NULL, '2020-09-02 12:00:00')
, ('en', 'CONTACT_CONFIRMATION_BODY', 'Thank you for your message. If you''d like to add or ask something, please reply to this message.', NULL, '2020-09-02 12:00:00')
, ('sv', 'CONTACT_CONFIRMATION_BODY', 'Tack för ditt meddelande. Vill du tillägga eller fråga någonting, var god och svara på det här meddelandet.', NULL, '2020-09-02 12:00:00')

, ('fi', 'CONTACT_CONFIRMATION_GREET', 'Hei,', NULL, '2020-09-02 12:00:00')
, ('en', 'CONTACT_CONFIRMATION_GREET', 'Hello,', NULL, '2020-09-02 12:00:00')
, ('sv', 'CONTACT_CONFIRMATION_GREET', 'Hej,', NULL, '2020-09-02 12:00:00')

, ('fi', 'CONTACT_CONFIRMATION_BR', 'Terveisin,', NULL, '2020-09-02 12:00:00')
, ('en', 'CONTACT_CONFIRMATION_BR', 'Best regards,', NULL, '2020-09-02 12:00:00')
, ('sv', 'CONTACT_CONFIRMATION_BR', 'Med vänlig hälsning,', NULL, '2020-09-02 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'CONTACT_CONFIRMATION_SUBJECT_REFERENCE_TMPL', 'Tarjouspyyntönumerosi on %s.', NULL, '2020-09-02 12:00:00')
, ('en', 'CONTACT_CONFIRMATION_SUBJECT_REFERENCE_TMPL', 'Your quote request number is %s.', NULL, '2020-09-02 12:00:00')
, ('sv', 'CONTACT_CONFIRMATION_SUBJECT_REFERENCE_TMPL', 'Ditt anbudsbegärannummer är %s.', NULL, '2020-09-02 12:00:00')
;


INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_SUBJECT_REFERENCE_LABEL_SHORT', 'TP-numero', NULL, '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_SUBJECT_REFERENCE_LABEL_SHORT', 'QR-number', NULL, '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_SUBJECT_REFERENCE_LABEL_SHORT', 'AB-nummer', NULL, '2020-09-04 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_MASS_ACTION_LABEL', 'Toiminto', NULL, '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_MASS_ACTION_LABEL', 'Action', NULL, '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_MASS_ACTION_LABEL', 'Funktion', NULL, '2020-09-04 12:00:00')

, ('fi', 'MANAGEMENT_WORK_LIST_MASS_ACTION_SUBMIT', 'Suorita', NULL, '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_MASS_ACTION_SUBMIT', 'Execute', NULL, '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_MASS_ACTION_SUBMIT', 'Utför', NULL, '2020-09-04 12:00:00')

, ('fi', 'MANAGEMENT_WORK_LIST_STATE_LINKS_LABEL', 'Näytä tilan mukaan', NULL, '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_STATE_LINKS_LABEL', 'View by state', NULL, '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_STATE_LINKS_LABEL', 'Visa efter status', NULL, '2020-09-04 12:00:00')

, ('fi', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_NAME'     , 'Nimi'           , NULL , '2020-09-04 12:00:00')
, ('fi', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_EMAIL'    , 'Email'          , NULL , '2020-09-04 12:00:00')
, ('fi', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_SUBJECT'  , 'Aihe'           , NULL , '2020-09-04 12:00:00')
, ('fi', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_MESSAGE'  , 'Viesti'         , NULL , '2020-09-04 12:00:00')
, ('fi', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_NOTES'    , 'Muistiinpanot'  , NULL , '2020-09-04 12:00:00')
, ('fi', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_CREATED'  , 'Luotu'          , NULL , '2020-09-04 12:00:00')
, ('fi', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_CHANGED'  , 'Muokattu'       , NULL , '2020-09-04 12:00:00')

, ('en', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_NAME'     , 'Name'           , NULL , '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_EMAIL'    , 'Email'          , NULL , '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_SUBJECT'  , 'Subject'        , NULL , '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_MESSAGE'  , 'Message'        , NULL , '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_NOTES'    , 'Notes'          , NULL , '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_CREATED'  , 'Created'        , NULL , '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_CHANGED'  , 'Changed'        , NULL , '2020-09-04 12:00:00')

, ('sv', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_NAME'     , 'Namn'           , NULL , '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_EMAIL'    , 'Email'          , NULL , '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_SUBJECT'  , 'Ämne'           , NULL , '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_MESSAGE'  , 'Meddelande'     , NULL , '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_NOTES'    , 'Anteckning'     , NULL , '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_CREATED'  , 'Skapat'         , NULL , '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_ITEM_LABEL_CHANGED'  , 'Ändrat'         , NULL , '2020-09-04 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_TABLE_VIEW', 'Taulukkonäkymä', NULL, '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_TABLE_VIEW', 'Table view', NULL, '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_TABLE_VIEW', 'Visa tabell', NULL, '2020-09-04 12:00:00')

, ('fi', 'MANAGEMENT_WORK_LIST_LIST_VIEW', 'Listanäkymä', NULL, '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_LIST_VIEW', 'List view', NULL, '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_LIST_VIEW', 'Visa lista', NULL, '2020-09-04 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_PAGE_NUMBER', 'Sivu', NULL, '2020-09-04 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_PAGE_NUMBER', 'Page', NULL, '2020-09-04 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_PAGE_NUMBER', 'Sida', NULL, '2020-09-04 12:00:00')
;

-- 201121 ->

UPDATE lupa_ui_text set `content` = 'Kiitos tarjouspyynnöstäsi. Jos sinulla on lisättävää tai kysymyksiä, vastaa tähän viestiin. Vastatessasi tähän viestiin, pidä ystävällisesti viestin aihekenttä samana.' where `code` = 'CONTACT_CONFIRMATION_BODY' and `language` = "fi";

UPDATE lupa_ui_text set `content` = 'Tack för ditt meddelande. Vill du tillägga eller fråga någonting, var god och svara på det här meddelandet. När du skriver till oss, vänligen använd samma ämnesrad som i detta meddelande.' where `code` = 'CONTACT_CONFIRMATION_BODY' and `language` = "sv";

UPDATE lupa_ui_text set `content` = 'Thank you for your message. If you''d like to add or ask something, please reply to this message. When replying to this message, please keep the original subject line.' where `code` = 'CONTACT_CONFIRMATION_BODY' and `language` = "en";

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'CONTACT_CONFIRMATION_CONTACT_MESSAGE_LABEL', 'Alla näet tiedot, jotka lähetit meille.', NULL, '2020-11-21 12:00:00')
, ('en', 'CONTACT_CONFIRMATION_CONTACT_MESSAGE_LABEL', 'See the information we received below.', NULL, '2020-11-21 12:00:00')
, ('sv', 'CONTACT_CONFIRMATION_CONTACT_MESSAGE_LABEL', 'Se uppgifterna du skickade oss nedan.', NULL, '2020-11-21 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'HK_WORK_ITEMS_ARCHIVED', 'Arkistoitu %u vanhaa tarjousta: %s', NULL, '2020-12-30 12:00:00')
, ('en', 'HK_WORK_ITEMS_ARCHIVED', 'Archived %u old offers: %s', NULL, '2020-12-30 12:00:00')
, ('sv', 'HK_WORK_ITEMS_ARCHIVED', 'Arkiverade %u gamla offerter: %s', NULL, '2020-12-30 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'HK_WORK_ITEMS_DELETED', 'Poistettu %u vanhaa arkistoitua tarjousta: %s', NULL, '2020-12-30 12:00:00')
, ('en', 'HK_WORK_ITEMS_DELETED', 'Deleted %u old archived offers: %s', NULL, '2020-12-30 12:00:00')
, ('sv', 'HK_WORK_ITEMS_DELETED', 'Raderade %u gamla arkiverade offerter: %s', NULL, '2020-12-30 12:00:00')
;

UPDATE lupa_work_item_history
    SET change_mask = (change_mask | (1 << 4))
    where old_state != '(none)' and old_state != 'STATE_FINISHED' and new_state = 'STATE_FINISHED';

-- 210131

INSERT INTO `lupa_info_page` (`id`, `uri`, `time_edited`, `time_created`) VALUES (NULL, 'about_cookies/', NULL, '2021-01-31 16:23:22'); 

INSERT INTO `lupa_info_page_content` (`id`, `uri`, `position`, `is_html`, `language`, `title`, `content`, `video_id`, `image_uri`, `image_description`, `time_edited`, `time_created`) VALUES
      (NULL, 'about_cookies/', '1', '0', 'fi', 'Tietoa evästeistä', '', NULL, '', '', NULL, '2021-01-31 16:25:37')
    , (NULL, 'about_cookies/', '1', '0', 'sv', 'Om kakor', '', NULL, '', '', NULL, '2021-01-31 16:25:37')
    , (NULL, 'about_cookies/', '1', '0', 'en', 'About cookies', '', NULL, '', '', NULL, '2021-01-31 16:25:37')
;

INSERT INTO `lupa_info_page_content` (`id`, `uri`, `position`, `is_html`, `language`, `title`, `content`, `video_id`, `image_uri`, `image_description`, `time_edited`, `time_created`) VALUES
      (NULL, 'about_cookies/', '2', '0', 'fi', 'Evästeiden käyttötarkoitus', 'Nämä verkkosivut käyttävät evästeitä. Eväste on tietoa, joka tallentuu selaimeesi ja se muun muassa tunnistaa, jos palaat sivuille uudelleen. Käytämme tällaista tietoa kun tutkimme kävijätilastoja: mitkä sivut ovat kiinnostavimpia ja miten kävijät löytävät sivustollemme, esimerkiksi Google-hausta tai suoraan URL-osoitteella.', NULL, '', '', NULL, '2021-01-31 16:43:02')
    , (NULL, 'about_cookies/', '2', '0', 'sv', 'Syftet med kakor', 'Denna webbplats använder cookies. Cookies är information som sparas i din webbläsare som bland annat upptäcker om du återvänder till webbplatsen. Vi använder denna typ av information när vi analyserar vår besökarstatistik: vilka sidor som är mest intressanta och hur besökare hittar vår webbplats, till exempel med Googles sökning eller direkt med en URL-adress.', NULL, '', '', NULL, '2021-01-31 16:43:02')
    , (NULL, 'about_cookies/', '2', '0', 'en', 'Purpose of cookies', 'This website uses cookies. Cookies are information saved in your browser that, among other things, detects if you return to the website. We use this kind of information when we analyze our visitor statistics: which pages are the most interesting and how visitors find our website, for example by Google search or directly with a URL address.', NULL, '', '', NULL, '2021-01-31 16:43:02')
;

INSERT INTO `lupa_info_page_content` (`id`, `uri`, `position`, `is_html`, `language`, `title`, `content`, `video_id`, `image_uri`, `image_description`, `time_edited`, `time_created`) VALUES
      (NULL, 'about_cookies/', '3', '0', 'fi', '', 'Tilastot, joita varten käytämme evästeitä ovat anonyymejä, yksittäistä käyttäjää ei niistä voi erottaa.', NULL, '', '', NULL, '2021-01-31 16:44:57')
    , (NULL, 'about_cookies/', '3', '0', 'sv', '', 'Statistiken för vilken vi använder kakorna är anonym, vi kan inte identifiera eller särskilja en enskild besökare från denna statistik.', NULL, '', '', NULL, '2021-01-31 16:44:57')
    , (NULL, 'about_cookies/', '3', '0', 'en', '', 'The statistics for which we use the cookies are anonymous, we can''t identify nor distinguish an individual visitor from these statistics.', NULL, '', '', NULL, '2021-01-31 16:44:57')
;

INSERT INTO `lupa_info_page_content` (`id`, `uri`, `position`, `is_html`, `language`, `title`, `content`, `video_id`, `image_uri`, `image_description`, `time_edited`, `time_created`) VALUES
      (NULL, 'about_cookies/', '4', '0', 'fi', 'Analytiikka', 'Käytämme Google Analytics -palvelua kävijätilastointiin. Anonymisoitu tieto käyttäjistä välitetään Googlelle ja tiedon avulla parannamme toimintaamme sekä sivuston toimivuutta. Yksittäistä käyttäjää ei ole mahdollista tunnistaa näiden evästeiden avulla. Analysoimme, mitkä sisältömme ovat suosittuja ja mitä voisimme parantaa.', NULL, '', '', NULL, '2021-01-31 16:46:02')
    , (NULL, 'about_cookies/', '4', '0', 'sv', 'Analys', 'Vi använder tjänsten Google Analytics för besökarstatistik. Anonymiserad besökarinformation vidarebefordras till Google och vi använder informationen för att förbättra vår verksamhet och webbplats. Enskilda besökare kan inte identifieras från denna information. Vi analyserar vilket innehåll som är populärt och vad vi kan förbättra.', NULL, '', '', NULL, '2021-01-31 16:46:02')
    , (NULL, 'about_cookies/', '4', '0', 'en', 'Analytics', 'We use the Google Analytics service for visitor statistics. Anonymized visitor information is relayed to Google and we use the information to improve our operation and website. Individual visitors can''t be identified from this information. We analyze what content is popular and what we can improve.', NULL, '', '', NULL, '2021-01-31 16:46:02')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'INFO_COOKIES_PAGE_TITLE', 'Tietoa evästeistä', NULL, '2021-02-06 12:00:00')
, ('en', 'INFO_COOKIES_PAGE_TITLE', 'About cookies', NULL, '2021-02-06 12:00:00')
, ('sv', 'INFO_COOKIES_PAGE_TITLE', 'Om kakor', NULL, '2021-02-06 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'COOKIE_CONSENT_OPEN_LABEL', 'Muuta evästevalintaasi', NULL, '2021-02-06 12:00:00')
, ('en', 'COOKIE_CONSENT_OPEN_LABEL', 'Change your cookie options', NULL, '2021-02-06 12:00:00')
, ('sv', 'COOKIE_CONSENT_OPEN_LABEL', 'Ändra på dina val', NULL, '2021-02-06 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'COOKIE_CONSENT_PROMPT_BODY_1', '<p>Käytämme evästeitä, jotta voimme seurata tilastoista, mitkä asiat sivuillamme kiinnostavat ja tietojen avulla kehittää toimintaamme. Tilastot ovat anonyymejä, sinun käyntiäsi emme sieltä voi erottaa. Onhan tämä sinulle ok?</p>', NULL, '2021-02-28 12:00:00')
, ('en', 'COOKIE_CONSENT_PROMPT_BODY_1', '<p>We use cookies to statistically analyze what content on our website interests visitors and what we can improve. The statistics are anonymous, we can''t distinguish your visit from others. Is this OK for you?</p>', NULL, '2021-02-28 12:00:00')
, ('sv', 'COOKIE_CONSENT_PROMPT_BODY_1', '<p>Vi använder cookies för att statistiskt analysera vilket innehåll på vår webbplats som intresserar besökare och vad vi kan förbättra. Statistiken är anonym, vi kan inte skilja ditt besök från andra. Är det OK för dig?</p>', NULL, '2021-02-28 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'COOKIE_CONSENT_PROMPT_BODY_2', '<p>Jos haluat nähdä, mitä evästeitä käytämme tai laittaa ne pois päältä, tarkista ne <a href="https://lu-pa.fi/fi/about_cookies">asetuksista</a>.</p>', NULL, '2021-02-28 12:00:00')
, ('en', 'COOKIE_CONSENT_PROMPT_BODY_2', '<p>If you''d like to see what cookies we use or disable them, see the <a href="https://lu-pa.fi/en/about_cookies">settings</a>.</p>', NULL, '2021-02-28 12:00:00')
, ('sv', 'COOKIE_CONSENT_PROMPT_BODY_2', '<p>Om du vill se vilka cookies vi använder eller inaktiverar dem, se <a href="https://lu-pa.fi/sv/about_cookies">inställningarna</a>.</p>', NULL, '2021-02-28 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'COOKIE_CONSENT_PROMPT_BODY_BTN_ALLOW', 'Kyllä', NULL, '2021-02-28 12:00:00')
, ('en', 'COOKIE_CONSENT_PROMPT_BODY_BTN_ALLOW', 'Yes', NULL, '2021-02-28 12:00:00')
, ('sv', 'COOKIE_CONSENT_PROMPT_BODY_BTN_ALLOW', 'Ja', NULL, '2021-02-28 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'COOKIE_CONSENT_PROMPT_BODY_BTN_DENY', 'Ei', NULL, '2021-02-28 12:00:00')
, ('en', 'COOKIE_CONSENT_PROMPT_BODY_BTN_DENY', 'No', NULL, '2021-02-28 12:00:00')
, ('sv', 'COOKIE_CONSENT_PROMPT_BODY_BTN_DENY', 'Nej', NULL, '2021-02-28 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'COOKIE_CONSENT_REFRESH_PROMPT', 'Valintasi on tallennettu. Muutokset tulevat voimaan, kun lataat sivun uudelleen.', NULL, '2021-04-03 12:00:00')
, ('sv', 'COOKIE_CONSENT_REFRESH_PROMPT', 'Dina val har sparats. Ändringarna träder i kraft när du laddar om sidan.', NULL, '2021-02-28 12:00:00')
, ('en', 'COOKIE_CONSENT_REFRESH_PROMPT', 'Your choices have been saved. The changes will take effect once you reload the page.', NULL, '2021-04-03 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'NAV_ABOUT_COOKIES', 'Tietoa evästeistä', NULL, '2021-02-06 12:00:00')
, ('en', 'NAV_ABOUT_COOKIES', 'About cookies', NULL, '2021-02-06 12:00:00')
, ('sv', 'NAV_ABOUT_COOKIES', 'Om kakor', NULL, '2021-02-06 12:00:00')
;


INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_CSV_EXPORT_LINK', 'Lataa CSV', NULL, '2021-04-28 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_CSV_EXPORT_LINK', 'Download CSV', NULL, '2021-04-28 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_CSV_EXPORT_LINK', 'Ladda ner CSV', NULL, '2021-04-28 12:00:00')
;

INSERT INTO `lupa_ui_text` (`language`, `code`, `content`, `time_edited`, `time_created`) VALUES
  ('fi', 'MANAGEMENT_WORK_LIST_STATE', 'Tila', NULL, '2021-04-28 12:00:00')
, ('en', 'MANAGEMENT_WORK_LIST_STATE', 'State', NULL, '2021-04-28 12:00:00')
, ('sv', 'MANAGEMENT_WORK_LIST_STATE', 'Läge', NULL, '2021-04-28 12:00:00')
;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
