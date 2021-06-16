insert into customer(date_of_birth, document_authority, document_number, document_type, first_name, last_name, nfc_id)
values
("1970-01-01", "Α.Τ. Αθηνών", "ΑΑ000000", "ID", "Δημήτρης", "Παπαδόπουλος", 1),
("1972-03-01", "Α.Τ. Αθηνών", "ΑΑ000001", "ID", "Χρήστος", "Νικοπολίδης", 2),
("2001-06-28", "Α.Τ. Καβάλας", "ΑΑ000002", "ID", "Επαμεινώνδας", "Μαρούλης", 3),
("1999-03-20", "Α.Τ. Καβάλας", "ΑΑ000003", "ID", "Μενέλαος", "Μαρούλης", 4),
("1997-06-25", "Α.Τ. Καβάλας", "ΑΑ000004", "ID", "Ιφιγένεια", "Μαρούλη", 5),
("2001-06-30", "Α.Τ. Αγίου Νικολάου", "ΑΑ000005", "ID", "Κυπιανός", "Φούντας", 6),
("1980-03-08", "Α.Τ. Λεωνιδίου", "ΑΑ000006", "ID", "Κωνσταντίνος", "Σταύρου", 7),
("1997-07-07", "Α.Τ. Χανίων", "ΑΑ000007", "ID", "Ελευθερία", "Κούλοβα", 8),
("2005-09-04", "Α.Τ. Φωκίδας", "ΑΑ000008", "ID", "Μαρία", "Πενταγιώτισσα", 9),
("1980-03-08", "Α.Τ. Κορίνθου", "ΑΑ000009", "ID", "Παντελής", "Ζεβεδαίος", 10),
("1983-07-09", "Α.Τ. Κορίνθου", "ΑΑ000010", "ID", "Σαλώμη", "Αντύπα", 11),
("2002-07-21", "Α.Τ. Κορίνθου", "ΑΑ000011", "ID", "Ιάκωβος", "Ζεβεδαίος-Αντύπας", 12),
("1954-08-17", "Α.Τ. Αθηνών", "ΑΑ000012", "ID", "Χαράλαμπος", "Κλαψινός", 13),
("1957-09-09", "Α.Τ. Αθηνών", "ΑΑ000013", "ID", "Πηνελόπη", "Παπαοδυσσέα", 14),
("1988-07-08", "Α.Τ. Διαφανίου", "ΑΑ000014", "ID", "Ελένη", "Σταμίρη", 15),
("1958-03-21", "Α.Τ. Διαφανίου", "ΑΑ000015", "ID", "Γιώργης", "Σταμίρης", 16),
("1990-04-14", "Α.Τ. Διαφανίου", "ΑΑ000017", "ID", "Κωνσταντής", "Σεβαστός", 17),
("1988-02-29", "Α.Τ. Τρούμπας", "ΑΑ000018", "ID", "Τάκης", "Δοξαράς", 18),
("1950-03-20", "Α.Τ. Εξαρχείων", "ΑΑ013120", "ID", "Προκόπης", "Μπάκουλας", 19),
("1947-09-28", "Α.Τ. Νέας Φιλαδέλφειας", "ΑΑ000020", "ID", "Μάρκος", "Bajevic", 20),
("1992-01-04", "P.D. Madrid", "AAA000001", "Passport", "Sara", "Hernandez", 21),
("1987-07-29", "Α.Τ. Νέου Ηρακλείου", "ΑΑ000021", "ID", "Ευανθία", "Τσετσέγκου", 22),
("1999-09-08", "Α.Τ. Δράμας", "AA000022", "ID", "Μαρίνος", "Κοντοσούβλης", 23),
("1998-04-19", "Α.Τ. Δράμας", "ΑΑ000023", "ID", "Τηλέμαχος", "Κοκορέτσης", 24),
("1969-11-04", "P.D. New Jersey", "AAA000002", "Passport", "Mary", "Poppins", 25),
("1987-09-20", "Α.Τ. Λευκωσίας", "ΑΑ000024", "ID", "Χαράλαμπος", "Χαραλάμπους", 26),
("1972-12-08", "Α.Τ. Νέας Σμύρνης", "AA000025", "ID", "Γιωρίκας", "Κώστικας", 27),
("1975-06-04", "P.D. Hollywood", "ΑΑA000003", "Passport", "Angelina", "Jolie", 28),
("1984-03-18", "P.D. Rio de Janeiro", "ΑΑA000004", "Passport", "Ronaldinho", "Moreira", 29),
("1981-08-08", "P.D. Basel", "AAA000005", "Passport", "Roger", "Federer", 30),
("1940-03-11", "P.D. Gabon", "ΑΑA000006", "Passport", "Didier", "Drogba", 31),
("1997-12-25", "Α.Τ. Τήνου", "AAA000006", "Passport", "Κατερίνα", "Παπαρδέλα", 32),
("1998-04-19", "Α.Τ. Δράμας", "ΑΑ000026", "ID", "Ορέστης", "Κοκορέτσης", 33);


/* customer_email */

insert into customer_email(customer_id, email)
values
(1, "mitsi.papad@gmail.com"),
(2, "xrnikol@gmail.com"),
(2, "xrnikopol01@gmail.com"),
(3, "maroulep4@gmail.com"),
(4, "maroulmen14@gmail.com"),
(5, "maroulif1@gmail.com"),
(6, "foynt6k@gmail.com"),
(7, "kons342@gmail.com"),
(8, "koulovel23@gmail.com"),
(8, "elkoloylov90@gmail.com"),
(9, "mariiiiia@gmail.com"),
(10, "panzeb1@gmail.com"),
(11, "salant7@gmail.com"),
(12, "iakzeb41@gmail.com"),
(13, "xarisklaps2@gmail.com"),
(13, "klautaxarh@gmail.com"),
(14, "pennyody@gmail.com"),
(15, "stamirena1@gmail.com"),
(16, "stamiris7@gmail.com"),
(17, "konseb9@gmail.com"),
(18, "takaros07@gmail.com"),
(18, "mrTakito07@gmail.com"),
(19, "mpakoylas54@gmail.com"),
(19, "baxalos53@gmail.com"),
(20, "baje21@gmail.com"),
(20, "dusan21@gmail.com"),
(21, "SaraHern123@gmail.com"),
(21, "SaraCarbo3@gmail.com"),
(22, "tsetsegoueui3@gmail.com"),
(23, "kontosoublis32@gmail.com"),
(24, "kokoretsistil@gmail.com"),
(24, "tilkokok9@gmail.com"),
(25, "maryPop8@gmail.com"),
(26, "charischarou00@gmail.com"),
(27, "Jorikos89@gmail.com"),
(28, "JolieAngie@gmail.com"),
(29, "Ronnie10@gmail.com"),
(30, "RogerFed20@gmail.com"),
(30, "FedererRog1@gmail.com"),
(31, "drogbagoal9@gmail.com"),
(31, "Didier09@gmail.com"),
(32, "papardela1234@gmail.com"),
(33, "kokorestis11@gmail.com"),
(33, "kokoloko021@gmail.com");

/* customer_phone */

insert into customer_phone(customer_id, phone_number)
values
(1, "6978834241"),
(2, "6978834091"),
(3, "6978839781"),
(4, "6910793424"),
(4, "6922035647"),
(4, "6910576410"),
(5, "6935603904"),
(6, "6970974324"),
(7, "6979088400"),
(8, "6912334567"),
(9, "6978904987"),
(10, "6978354564"),
(10, "6919084376"),
(10, "6908971640"),
(11, "6967775786"),
(11, "6967774786"),
(12, "6978678548"),
(13, "6978799058"),
(14, "6989087690"),
(14, "6989000690"),
(15, "6975657557"),
(16, "6901597899"),
(16, "6910789514"),
(16, "6975784857"),
(17, "6978097978"),
(18, "6970700839"),
(18, "6971700839"),
(19, "6992456743"),
(20, "6975464370"),
(21, "6992892050"),
(22, "6908912500"),
(23, "6901578430"),
(23, "6911578430"),
(23, "6921578430"),
(24, "6909198510"),
(25, "6920175987"),
(26, "6910978980"),
(27, "6914526655"),
(27, "6914527655"),
(27, "6914525655"),
(28, "6972652645"),
(29, "6972656356"),
(29, "6972656056"),
(30, "6926534141"),
(31, "6974663627"),
(31, "6974663620"),
(32, "6910925784"),
(33, "6908087867")
