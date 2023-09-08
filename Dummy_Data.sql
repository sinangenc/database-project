-- Table: Länderkategorie
INSERT INTO laenderkategorie VALUES("Kategorie A", 450);
INSERT INTO laenderkategorie VALUES("Kategorie B", 350);
INSERT INTO laenderkategorie VALUES("Kategorie C", 250);

-- Table: Land
INSERT INTO land VALUES("Deutschland", "Kategorie A");
INSERT INTO land VALUES("Schweiz", "Kategorie A");
INSERT INTO land VALUES("Niederlande", "Kategorie A");
INSERT INTO land VALUES("Norwegen", "Kategorie A");
INSERT INTO land VALUES("Polen", "Kategorie B");
INSERT INTO land VALUES("Croatien", "Kategorie B");
INSERT INTO land VALUES("Lettland", "Kategorie C");

-- Table: Sprache
INSERT INTO sprache VALUES("Englisch");
INSERT INTO sprache VALUES("Deutsch");
INSERT INTO sprache VALUES("Polnisch");
INSERT INTO sprache VALUES("Niederländisch");
INSERT INTO sprache VALUES("Kroatisch");
INSERT INTO sprache VALUES("Norwegisch");
INSERT INTO sprache VALUES("Lettisch");
INSERT INTO sprache VALUES("Französisch");

-- Table: Zertifikat
INSERT INTO zertifikat VALUES("TOEFL");
INSERT INTO zertifikat VALUES("IELTS");
INSERT INTO zertifikat VALUES("Cambridge Zertifikat");
INSERT INTO zertifikat VALUES("HU Sprachzentrum");
INSERT INTO zertifikat VALUES("TELC");

-- Table: Partneruniversität
INSERT INTO partneruniversitaet VALUES("CH BASEL01", "Universität Basel", "Basel", "Schweiz");
INSERT INTO partneruniversitaet VALUES("CH BERN01", "Universität Bern", "Bern", "Schweiz");
INSERT INTO partneruniversitaet VALUES("PL POZNAN01", "Adam Mickiewicz University Poznań", "Pozen", "Polen");
INSERT INTO partneruniversitaet VALUES("PL KRAKOW01", "Uniwersytet Jagielloński W Krakowie", "Krakow", "Polen");
INSERT INTO partneruniversitaet VALUES("NL AMSTERD01", "Universiteit van Amsterdam", "Amsterdam", "Niederlande");
INSERT INTO partneruniversitaet VALUES("NL GRONING01", "Rijksuniversiteit Groningen", "Groningen", "Niederlande");

-- Table: Adresse
INSERT INTO adresse VALUES(NULL, "Deutschland", "Berlin", "Platz der Vereinten Nationen", "38", "10249");
INSERT INTO adresse VALUES(NULL, "Deutschland", "Berlin", "Oranienburger Str.", "6", "10117");
INSERT INTO adresse VALUES(NULL, "Deutschland", "Berlin", "Oranienburger Str.", "73", "13437");
INSERT INTO adresse VALUES(NULL, "Deutschland", "Berlin", "Storkower Str.", "219", "10367");

-- Table: Benutzer
INSERT INTO benutzer VALUES("gencsina@test-uni.de", "Sinan", "Genc");
INSERT INTO benutzer VALUES("jakobbaumann@test-uni.de", "Jakob", "Baumann");
INSERT INTO benutzer VALUES("sophiamueller@test-uni.de", "Sophia", "Müller");
INSERT INTO benutzer VALUES("danielafischer@test-uni.de", "Daniela", "Fischer");
INSERT INTO benutzer VALUES("maischaschmidt@test-uni.de", "Maischa", "Schmidt");
INSERT INTO benutzer VALUES("teoschneider@test-uni.de", "Teo", "Schneider");
INSERT INTO benutzer VALUES("petramann@test-uni.de", "Petra", "Mann");

-- Table: Mitarbeiter
INSERT INTO mitarbeiter VALUES("teoschneider@test-uni.de", true);
INSERT INTO mitarbeiter VALUES("petramann@test-uni.de", false);

-- Table: Studierende
INSERT INTO studierende VALUES("gencsina@test-uni.de", "618026", "Türkei", "1992-01-01", "+4911111111", 1);
INSERT INTO studierende VALUES("jakobbaumann@test-uni.de", "615834", "Deutschland", "1998-04-11", "+49176222111323", 2);
INSERT INTO studierende VALUES("sophiamueller@test-uni.de", "620446", "Deutschland", "1996-08-23", "+491763334444332", 3);
INSERT INTO studierende VALUES("danielafischer@test-uni.de", "632100", "Deutschland", "1999-12-03", "+491768888653643", 4);
INSERT INTO studierende VALUES("maischaschmidt@test-uni.de", "616421", "Deutschland", "1994-05-01", "+491638758711", 4);

-- Table: Studierende_Staatsangehoerigkeit(
INSERT INTO studierendestaatsangehoerigkeit VALUES("gencsina@test-uni.de", "Türkei");
INSERT INTO studierendestaatsangehoerigkeit VALUES("jakobbaumann@test-uni.de", "Deutsch");
INSERT INTO studierendestaatsangehoerigkeit VALUES("jakobbaumann@test-uni.de", "USA");
INSERT INTO studierendestaatsangehoerigkeit VALUES("jakobbaumann@test-uni.de", "Polen");
INSERT INTO studierendestaatsangehoerigkeit VALUES("sophiamueller@test-uni.de", "Schweiz");
INSERT INTO studierendestaatsangehoerigkeit VALUES("sophiamueller@test-uni.de", "Niederlande");
INSERT INTO studierendestaatsangehoerigkeit VALUES("danielafischer@test-uni.de", "Schweiz");
INSERT INTO studierendestaatsangehoerigkeit VALUES("maischaschmidt@test-uni.de", "Deutsch");
INSERT INTO studierendestaatsangehoerigkeit VALUES("maischaschmidt@test-uni.de", "Polen");

-- Table: Einrichtung
INSERT INTO einrichtung VALUES("Mathematisch-Naturwissenschaftliche Fakultät", "Fakultaet", NULL);
INSERT INTO einrichtung VALUES("Kultur-, Sozial- und Bildungswissenschaftliche Fakultät", "Fakultaet", NULL);
INSERT INTO einrichtung VALUES("Juristische Fakultät", "Fakultaet", NULL);
INSERT INTO einrichtung VALUES("Institut für Katholische Theologie", "Institut", NULL);
INSERT INTO einrichtung VALUES("Berliner Institut für Islamische Theologie", "Institut", NULL);
INSERT INTO einrichtung VALUES("Geographisches Institut", "Institut", "Mathematisch-Naturwissenschaftliche Fakultät");
INSERT INTO einrichtung VALUES("Institut für Chemie", "Institut", "Mathematisch-Naturwissenschaftliche Fakultät");
INSERT INTO einrichtung VALUES("Institut für Informatik", "Institut", "Mathematisch-Naturwissenschaftliche Fakultät");
INSERT INTO einrichtung VALUES("Institut für Mathematik", "Institut", "Mathematisch-Naturwissenschaftliche Fakultät");
INSERT INTO einrichtung VALUES("Institut für Archäologie", "Institut", "Kultur-, Sozial- und Bildungswissenschaftliche Fakultät");
INSERT INTO einrichtung VALUES("Institut für Erziehungswissenschaften", "Institut", "Kultur-, Sozial- und Bildungswissenschaftliche Fakultät");
INSERT INTO einrichtung VALUES("Institut für Musikwissenschaft und Medienwissenschaft", "Institut", "Kultur-, Sozial- und Bildungswissenschaftliche Fakultät");

-- Table: MitarbeiterEinrichtung
INSERT INTO mitarbeitereinrichtung VALUES("teoschneider@test-uni.de", "Mathematisch-Naturwissenschaftliche Fakultät");
INSERT INTO mitarbeitereinrichtung VALUES("teoschneider@test-uni.de", "Institut für Chemie");
INSERT INTO mitarbeitereinrichtung VALUES("teoschneider@test-uni.de", "Institut für Informatik");
INSERT INTO mitarbeitereinrichtung VALUES("teoschneider@test-uni.de", "Institut für Mathematik");
INSERT INTO mitarbeitereinrichtung VALUES("petramann@test-uni.de", "Juristische Fakultät");

-- Table: Vertrag
INSERT INTO vertrag VALUES("CH BASEL01", "Juristische Fakultät", 2, true, true, false, "Englisch");
INSERT INTO vertrag VALUES("CH BASEL01", "Institut für Informatik", 2, true, true, true, "Englisch");
INSERT INTO vertrag VALUES("CH BASEL01", "Institut für Mathematik", 1, true, true, false, "Englisch");
INSERT INTO vertrag VALUES("CH BASEL01", "Institut für Erziehungswissenschaften", 3, true, true, true, "Englisch");
INSERT INTO vertrag VALUES("PL POZNAN01", "Institut für Chemie", 2, true, true, false, "Englisch");
INSERT INTO vertrag VALUES("PL POZNAN01", "Institut für Informatik", 2, true, true, false, "Englisch");
INSERT INTO vertrag VALUES("PL POZNAN01", "Institut für Mathematik", 2, true, false, false, "Englisch");
INSERT INTO vertrag VALUES("PL POZNAN01", "Institut für Musikwissenschaft und Medienwissenschaft", 1, true, false, false, "Englisch");
INSERT INTO vertrag VALUES("NL AMSTERD01", "Institut für Katholische Theologie", 2, true, true, false, "Englisch");
INSERT INTO vertrag VALUES("NL AMSTERD01", "Institut für Informatik", 3, true, true, true, "Englisch");
INSERT INTO vertrag VALUES("NL AMSTERD01", "Geographisches Institut", 2, true, true, false, "Englisch");
INSERT INTO vertrag VALUES("NL AMSTERD01", "Institut für Chemie", 3, true, true, true, "Englisch");
INSERT INTO vertrag VALUES("NL AMSTERD01", "Juristische Fakultät", 1, true, false, false, "Englisch");

-- Table: Bewerbungszeitraum
INSERT INTO bewerbungszeitraum VALUES("2021/2022", "Abgelaufen", "Info Text comes here...");
INSERT INTO bewerbungszeitraum VALUES("2022/2023", "Abgelaufen", "Info Text comes here...");
INSERT INTO bewerbungszeitraum VALUES("2023/2024", "Nachrückverfahren", "Info Text comes here...");

-- Table: Bewerbung 
INSERT INTO bewerbung VALUES(NULL, "Eingegangen", "2023-06-15", true, true, 1, false, NULL, "2023/2024", "Hauptbewerbungszeitraum", "2020-06-15", false, "gencsina@test-uni.de");
INSERT INTO bewerbung VALUES(NULL, "Eingegangen", "2023-06-19", false, true, NULL, false, NULL, "2023/2024", "Hauptbewerbungszeitraum", "2020-06-15", false, "jakobbaumann@test-uni.de");
INSERT INTO bewerbung VALUES(NULL, "Eingegangen", "2023-06-23", false, true, NULL, true, NULL, "2023/2024", "Hauptbewerbungszeitraum", "2020-06-15", false, "sophiamueller@test-uni.de");
INSERT INTO bewerbung VALUES(NULL, "Eingegangen", "2023-06-25", true, true, NULL, false, NULL, "2023/2024", "Hauptbewerbungszeitraum", "2020-06-15", false, "danielafischer@test-uni.de");
INSERT INTO bewerbung VALUES(NULL, "Eingegangen", "2023-07-05", false, true, 2, false, NULL, "2023/2024", "Nachrückverfahren", "2020-06-15", false, "maischaschmidt@test-uni.de");
INSERT INTO bewerbung VALUES(NULL, "Abgelehnt", "2022-02-11", true, true, NULL, false, NULL, "2022/2023", "Hauptbewerbungszeitraum", "2020-06-15", false, "gencsina@test-uni.de");
INSERT INTO bewerbung VALUES(NULL, "Abgelehnt", "2022-03-10", false, true, NULL, false, "ABC", "2022/2023", "Nachrückverfahren", "2020-06-15", false, "jakobbaumann@test-uni.de");

-- Table: ErasmusAustausch
INSERT INTO erasmusaustausch VALUES(1, "2021-09-15", "2022-02-15", "Bachelor", "Studium");
INSERT INTO erasmusaustausch VALUES(1, "2020-04-01", "2020-07-15", "Bachelor", "Praktikum");

-- Table: Dokument
INSERT INTO dokument VALUES(1, "Ausweis", "Ausweis.pdf");
INSERT INTO dokument VALUES(1, "Studienbescheinigung", "Studienbescheinigung.pdf");
INSERT INTO dokument VALUES(1, "Lebenslauf", "Lebenslauf.pdf");
INSERT INTO dokument VALUES(1, "Notenübersicht", "Notenübersicht.pdf");
INSERT INTO dokument VALUES(1, "Sprachnachweis", "Englisch.pdf");
INSERT INTO dokument VALUES(1, "Sprachnachweis", "Polisch.pdf");

-- Table: Studiengang
INSERT INTO studiengang VALUES("Bsc Informatik", "Bachelor", "Institut für Informatik");
INSERT INTO studiengang VALUES("BA Mathe Physik Informatik", "Bachelor", "Institut für Informatik");
INSERT INTO studiengang VALUES("BA Jura", "Bachelor", "Juristische Fakultät");
INSERT INTO studiengang VALUES("Msc Informatik", "Master", "Institut für Informatik");

-- Table: Studium
INSERT INTO BewerbungStudiengang VALUES(1, "Informatik", "Kernfach", 6);

-- Table: BewerbungVertrag
INSERT INTO bewerbungvertrag VALUES(1, "2023/2024", "CH BASEL01", "Institut für Informatik", 1, true, false, null);
INSERT INTO bewerbungvertrag VALUES(1, "2023/2024", "PL POZNAN01", "Institut für Informatik", 2, true, false, null);
INSERT INTO bewerbungvertrag VALUES(1, "2023/2024", "NL AMSTERD01", "Institut für Informatik", 3, true, true, null);
INSERT INTO bewerbungvertrag VALUES(2, "2023/2024", "CH BASEL01", "Institut für Informatik", 1, true, false, null);
INSERT INTO bewerbungvertrag VALUES(2, "2023/2024", "PL POZNAN01", "Institut für Informatik", 3, true, false, null);
INSERT INTO bewerbungvertrag VALUES(2, "2023/2024", "NL AMSTERD01", "Institut für Informatik", 2, true, false, null);
INSERT INTO bewerbungvertrag VALUES(3, "2023/2024", "CH BASEL01", "Juristische Fakultät", 1, true, false, null);
INSERT INTO bewerbungvertrag VALUES(3, "2023/2024", "NL AMSTERD01", "Institut für Informatik", 2, false, true, null);
INSERT INTO bewerbungvertrag VALUES(6, "2022/2023", "CH BASEL01", "Institut für Informatik", 2, true, false, false);
INSERT INTO bewerbungvertrag VALUES(6, "2022/2023", "PL POZNAN01", "Institut für Informatik", 1, true, false, false);
INSERT INTO bewerbungvertrag VALUES(7, "2022/2023", "NL AMSTERD01", "Institut für Informatik", 1, true, true, false);


-- Table: Sprachnachweis
INSERT INTO sprachnachweis VALUES(1, "Englisch", "TOEFL", "B2", "TOEFL IBT 80");
INSERT INTO sprachnachweis VALUES(1, "Polnisch", "HU Sprachzentrum", "A1", NULL);
INSERT INTO sprachnachweis VALUES(1, "Französisch", "HU Sprachzentrum", "A1", NULL);
INSERT INTO sprachnachweis VALUES(2, "Englisch", "TOEFL", "B2", "TOEFL IBT 80");
