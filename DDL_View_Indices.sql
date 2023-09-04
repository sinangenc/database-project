-- Table: Länderkategorie
CREATE TABLE Laenderkategorie(
	Name VARCHAR(50),
    Foerderung DECIMAL(5,2) NOT NULL,
    PRIMARY KEY(Name)
);

-- Table: Land
CREATE TABLE Land(
	Name VARCHAR(30),
    Kategorie VARCHAR(50) NOT NULL,
    PRIMARY KEY(Name),
    FOREIGN KEY (Kategorie) REFERENCES Laenderkategorie(Name)
);

-- Table: Sprache
CREATE TABLE Sprache(
	Name VARCHAR(50),
    PRIMARY KEY(Name)
);

-- Table: Zertifikat
CREATE TABLE Zertifikat(
	Name VARCHAR(50),
    PRIMARY KEY(Name)
);

-- Table: Bewerbungszeitraum
CREATE TABLE Bewerbungszeitraum(
	Name VARCHAR(50),
    Phase ENUM('In Planung', 'Hauptbewerbungszeitraum', 'Auswahlverfahren', 'Nachrückverfahren', 'Abgelaufen') NOT NULL,
    Infotext MEDIUMTEXT,
    PRIMARY KEY(Name)
);

-- Table: Partneruniversität
CREATE TABLE Partneruniversitaet(
	ErasmusCode VARCHAR(50),
	Name VARCHAR(100) NOT NULL,
	Stadt VARCHAR(50) NOT NULL,
	Land VARCHAR(50) NOT NULL,
    PRIMARY KEY(ErasmusCode),
    FOREIGN KEY (Land) REFERENCES Land(Name)
);

-- Table: Adresse
CREATE TABLE Adresse(
	Id INT UNSIGNED AUTO_INCREMENT,
	Land VARCHAR(50) NOT NULL,
	Stadt VARCHAR(50) NOT NULL,
	Strasse VARCHAR(100) NOT NULL,
	Hausnummer VARCHAR(10) NOT NULL,
	PLZ VARCHAR(10) NOT NULL,
    PRIMARY KEY(Id),
    UNIQUE(Land, Stadt, Strasse, Hausnummer, PLZ)
);

-- Table: Benutzer
CREATE TABLE Benutzer(
	Email VARCHAR(100),
	Vorname VARCHAR(100) NOT NULL,
	Nachname VARCHAR(100) NOT NULL,
    PRIMARY KEY(Email)
);

-- Table: Mitarbeiter
CREATE TABLE Mitarbeiter(
	Email VARCHAR(100),
    istAdmin BOOLEAN NOT NULL,
    PRIMARY KEY(Email),
    FOREIGN KEY (Email) REFERENCES Benutzer(Email)
);

-- Table: Studierende
CREATE TABLE Studierende(
	Email VARCHAR(100),
	Matrikelnummer VARCHAR(10),
	Geburtsland VARCHAR(50),
	Geburtsdatum DATE,
	Telefonnummer VARCHAR(20),
	Adresse INT UNSIGNED,
    PRIMARY KEY(Email),
    FOREIGN KEY (Email) REFERENCES Benutzer(Email),
    FOREIGN KEY (Adresse) REFERENCES Adresse(Id),
    UNIQUE(Matrikelnummer)
);

-- Table: Studierende_Staatsangehoerigkeit(
CREATE TABLE StudierendeStaatsangehoerigkeit(
	Studierende  VARCHAR(100),
    Land VARCHAR(50),
    PRIMARY KEY(Studierende, Land),
    FOREIGN KEY (Studierende) REFERENCES Studierende(Email)
);

-- Table: Einrichtung
CREATE TABLE Einrichtung(
	Name VARCHAR(250),
    Einrichtungsart ENUM('Fakultaet', 'Institut') NOT NULL,
    Fakultaet VARCHAR(250),
    PRIMARY KEY(Name),
    FOREIGN KEY (Fakultaet) REFERENCES Einrichtung(Name)
);

-- Table: MitarbeiterEinrichtung
CREATE TABLE MitarbeiterEinrichtung(
	Mitarbeiter VARCHAR(100),
    Einrichtung VARCHAR(250),
    PRIMARY KEY(Mitarbeiter, Einrichtung),
    FOREIGN KEY (Mitarbeiter) REFERENCES Mitarbeiter(Email),
    FOREIGN KEY (Einrichtung) REFERENCES Einrichtung(Name)
);

-- Table: Bewerbung 
CREATE TABLE Bewerbung(
	Nummer INT UNSIGNED AUTO_INCREMENT,
	Status ENUM('In Vorbereitung', 'Eingegangen', 'Zugelassen', 'Abgelehnt') NOT NULL,
	Bewerbungsdatum DATETIME,
	Bafoeg BOOLEAN,
	ErasmusStipendium BOOLEAN,
	AnzahlKinder TINYINT UNSIGNED,
	Behinderung BOOLEAN,
	anderesProgramm VARCHAR(50),
	Bewerbungszeitraum VARCHAR(50) NOT NULL,
	Bewerbungsphase ENUM('Hauptbewerbungszeitraum', 'Nachrückverfahren'),
    Immatrikulationsdatum DATE,
	Lehramt BOOLEAN,
	Studierende  VARCHAR(100) NOT NULL,
    PRIMARY KEY(Nummer),
    FOREIGN KEY (Bewerbungszeitraum) REFERENCES Bewerbungszeitraum(Name),
    FOREIGN KEY (Studierende) REFERENCES Studierende(Email)
);

-- Table: ErasmusAustausch
CREATE TABLE ErasmusAustausch(
	Bewerbungsnummer INT UNSIGNED,
	Startdatum DATE,
	Enddatum DATE NOT NULL,
	Studienniveau ENUM('Bachelor', 'Master', 'PhD') NOT NULL,
    Aufenthaltsart ENUM('Studium', 'Praktikum') NOT NULL,
    PRIMARY KEY(Bewerbungsnummer, Startdatum),
    FOREIGN KEY (Bewerbungsnummer) REFERENCES Bewerbung(Nummer)
);

-- Table: Dokument
CREATE TABLE Dokument(
	Bewerbungsnummer INT UNSIGNED,
	Dokumentart ENUM('Ausweis', 'Studienbescheinigung', 'Lebenslauf', 'Notenübersicht', 'Sprachnachweis') NOT NULL,
    Name VARCHAR(100) NOT NULL,
    PRIMARY KEY(Bewerbungsnummer, Dokumentart, Name),
    FOREIGN KEY (Bewerbungsnummer) REFERENCES Bewerbung(Nummer)
);

-- Table: Vertrag
CREATE TABLE Vertrag(
	Partneruni VARCHAR(50),
	Einrichtung VARCHAR(250),
	Plaetze TINYINT UNSIGNED NOT NULL,
	Bachelor BOOLEAN NOT NULL,
	Master BOOLEAN NOT NULL,
	PhD BOOLEAN NOT NULL,
    Hauptunterrichtssprache VARCHAR(50) NOT NULL,  
    PRIMARY KEY(Partneruni, Einrichtung),
    FOREIGN KEY (Partneruni) REFERENCES Partneruniversitaet(ErasmusCode),
    FOREIGN KEY (Einrichtung) REFERENCES Einrichtung(Name),
    FOREIGN KEY (Hauptunterrichtssprache) REFERENCES Sprache(Name)
);

-- Table: BZ_Vertrag
CREATE TABLE BZ_Vertrag(
	Bewerbungszeitraum VARCHAR(50) NOT NULL,
	Partneruni VARCHAR(50),
	Einrichtung VARCHAR(250),
	Plaetze TINYINT UNSIGNED NOT NULL,
	Bachelor BOOLEAN NOT NULL,
	Master BOOLEAN NOT NULL,
	PhD BOOLEAN NOT NULL,
    PRIMARY KEY(Bewerbungszeitraum, Partneruni, Einrichtung),
    FOREIGN KEY (Bewerbungszeitraum) REFERENCES Bewerbungszeitraum(Name),
    FOREIGN KEY (Partneruni, Einrichtung) REFERENCES Vertrag(Partneruni, Einrichtung)
);

-- Table: Studiengang
CREATE TABLE Studiengang(
	Name VARCHAR(250),
	Abschluss ENUM('Bachelor', 'Master', 'PhD') NOT NULL,
    Einrichtung VARCHAR(250) NOT NULL,
    PRIMARY KEY(Name),
    FOREIGN KEY (Einrichtung) REFERENCES Einrichtung(Name)
);

-- Table: BewerbungStudiengang 
CREATE TABLE BewerbungStudiengang(
	Bewerbungsnummer INT UNSIGNED,
	Studiengang VARCHAR(250),
	KernZweitfach ENUM('Kernfach', 'Zweitfach') NOT NULL,
	Hochschulsemester TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY(Bewerbungsnummer, Studiengang),
    FOREIGN KEY (Bewerbungsnummer) REFERENCES Bewerbung(Nummer),
    FOREIGN KEY (Studiengang) REFERENCES Studiengang(Name),
    UNIQUE(Bewerbungsnummer, KernZweitfach)
);

-- Table: BewerbungVertrag
CREATE TABLE BewerbungVertrag(
	Bewerbungsnummer INT UNSIGNED,
    Bewerbungszeitraum VARCHAR(50) NOT NULL,
    Partneruni VARCHAR(50),
	Einrichtung VARCHAR(250),
	Reihenfolge TINYINT UNSIGNED NOT NULL,
	Wintersemester BOOLEAN NOT NULL,
	Sommersemester BOOLEAN NOT NULL,
    istZugelassen BOOLEAN,
    PRIMARY KEY(Bewerbungsnummer, Bewerbungszeitraum, Partneruni, Einrichtung),
    FOREIGN KEY (Bewerbungsnummer) REFERENCES Bewerbung(Nummer),
    FOREIGN KEY (Bewerbungszeitraum, Partneruni, Einrichtung) REFERENCES BZ_Vertrag(Bewerbungszeitraum, Partneruni, Einrichtung),
    UNIQUE(Bewerbungsnummer, Reihenfolge)
);

-- Table: Sprachnachweis
CREATE TABLE Sprachnachweis(
	Bewerbungsnummer INT UNSIGNED,
    Sprache VARCHAR(50),
	Zertifikat VARCHAR(50),
	Niveau  ENUM('Keine', 'A1', 'A2', 'B1', 'B2', 'C1', 'C2', 'Muttersprache') NOT NULL,
	Pruefungsergebnis VARCHAR(30),
    PRIMARY KEY(Bewerbungsnummer, Sprache),
    FOREIGN KEY (Bewerbungsnummer) REFERENCES Bewerbung(Nummer),
    FOREIGN KEY (Sprache) REFERENCES Sprache(Name),
    FOREIGN KEY (Zertifikat) REFERENCES Zertifikat(Name)
);

-- Trigger: Nachdem ein Bewerbungszeitraum hinzugefügt wurde, kopieren wir 
-- alle aktive Vertraege in Tabelle BZ_Vertrag mit diesem Bewerbungszeitraum
-- Grund: Änderungen bei der Tabelle Vertrag können zu Datenverluste von früheren Jahren führen.
DELIMITER //
CREATE TRIGGER Bewerbungszeitraum_AfterInsert
AFTER INSERT ON Bewerbungszeitraum FOR EACH ROW
BEGIN
    INSERT INTO BZ_Vertrag (Bewerbungszeitraum, Partneruni, Einrichtung, Plaetze, Bachelor, Master, PhD)
    SELECT NEW.Name, Partneruni, Einrichtung, Plaetze, Bachelor, Master, PhD 
    FROM Vertrag;
END;
// DELIMITER ;

-- View: Anzahl der beworbenen Universitäten nach Studierende und Jahr
CREATE VIEW StudierendeJahrAnzahlUni AS
SELECT
    S.Matrikelnummer, N.Vorname, N.Nachname,
    B.Bewerbungszeitraum AS AkademischesJahr,
    COUNT(BV.Bewerbungsnummer) AS AnzahlDerBeworbenenUniversitaeten
FROM
    Studierende S
JOIN
    Bewerbung B ON S.Email = B.Studierende
JOIN
    BewerbungVertrag BV ON BV.Bewerbungsnummer = B.Nummer
JOIN
    Benutzer N ON N.Email = S.Email
GROUP BY
	S.Email, AkademischesJahr;

 
-- Index:
CREATE INDEX PartneruniName ON Partneruniversitaet(Name);
CREATE INDEX VornameNachname ON Benutzer(Vorname, Nachname);