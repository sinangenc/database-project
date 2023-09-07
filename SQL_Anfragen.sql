/*
SQL Query 1:
Gib die Partneruniversitäten und verfügbare Plätze an, für die sich Bachelorstudierende von 
Instituten der Mathematisch-Naturwissenschaftliche Fakultät im Jahr 2022/2023 bewerben können
*/
SELECT
	E.Name AS Institut,
    P.Name AS Partneruni,
    V.Plaetze
FROM BZ_Vertrag V
JOIN Einrichtung E ON E.Name = V.Einrichtung
JOIN Partneruniversitaet P ON P.ErasmusCode = V.PartnerUni
WHERE E.Fakultaet="Mathematisch-Naturwissenschaftliche Fakultät" AND V.Bewerbungszeitraum="2022/2023" AND V.Bachelor=true
ORDER BY Institut;


/*
SQL Query 2:
Gib Studierende an, die sich für einen Erasmus-Austausch an einer Universität in 
dem Land beworben haben, dessen Staatsbürgerschaft sie besitzen
*/
SELECT
	S.Matrikelnummer, N.Vorname, N.Nachname,
    SA.Land AS Staatsangehoerigkeit,
    B.Bewerbungszeitraum,
    P.Name AS Zieluni,
    CONCAT(P.Stadt, ', ', P.Land) AS UniLokation
FROM Studierende S
JOIN Studierendestaatsangehoerigkeit SA ON SA.Studierende = S.Email
JOIN Bewerbung B ON B.Studierende = S.Email
JOIN Bewerbungvertrag BV ON BV.Bewerbungsnummer = B.Nummer
JOIN Partneruniversitaet P ON P.ErasmusCode = BV.Partneruni
JOIN Benutzer N ON N.Email = S.Email
WHERE B.Status != "In Vorbereitung" AND P.Land = SA.Land
ORDER BY S.Matrikelnummer;


/*
SQL Query 3:
Gib für jedes Institut an, wie viele Partneruniversitäten und wie viele verfügbare Plätzen(als Summe) aktuell es 
für Bachelor-Niveau hat. Institute ohne Partneruni sollten auch in der liste erscheinen
*/
SELECT
	E.Name AS Institut,
    COUNT(V.Plaetze) AS AnzahlPartneruni,
    SUM(IFNULL(V.Plaetze, 0)) AS SummePlaetze
FROM Einrichtung E
LEFT JOIN Vertrag V ON E.Name = V.Einrichtung
WHERE E.Einrichtungsart="Institut" AND (V.Bachelor=true OR V.Bachelor IS NULL)
GROUP BY Institut
ORDER BY AnzahlPartneruni DESC, SummePlaetze DESC;


/*
SQL Query 4:
Gib Erasmus-Bewerbungen an, die sich im Status "Eingegangen" befinden und bei denen die Anzahl der hochgeladenen 
Sprachnachweise nicht mit der Anzahl der in der Bewerbung angegebenen Sprachkenntnisse übereinstimmt
*/
SELECT
	B.Nummer AS Bewerbungsnummer,
	S.Matrikelnummer, N.Vorname, N.Nachname,
    (SELECT COUNT(*) FROM Sprachnachweis SN WHERE SN.Bewerbungsnummer=B.Nummer) AS AnzahlSprachNachweis,
	(SELECT COUNT(*) FROM Dokument D WHERE D.Bewerbungsnummer=B.Nummer AND D.Dokumentart="Sprachnachweis") AS AnzahlHochgeladeneSprachNachweis
FROM Bewerbung B
JOIN Studierende S ON S.Email = B.Studierende
JOIN Benutzer N ON N.Email = S.Email
WHERE B.Status="Eingegangen"
HAVING AnzahlSprachNachweis != AnzahlHochgeladeneSprachNachweis
;


/*
SQL Query 5:
Gib die Anzahl der abgegebenen Bewerbungen nach Bewerbungszeitraum und Land der Partneruniversität an
*/
SELECT
	 B.Bewerbungszeitraum,
     P.Land,
    COUNT(B.Nummer) AS AnzahBewerbungen
FROM Bewerbung B
JOIN Bewerbungvertrag BV ON BV.Bewerbungsnummer = B.Nummer
JOIN Partneruniversitaet P ON P.ErasmusCode = BV.Partneruni
WHERE B.Status!="In Vorbereitung"
GROUP BY B.Bewerbungszeitraum, P.Land
ORDER BY B.Bewerbungszeitraum DESC, AnzahBewerbungen DESC;
