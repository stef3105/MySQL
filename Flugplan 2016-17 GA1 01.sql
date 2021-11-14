
DROP DATABASE IF EXISTS FlugIHK01;
CREATE DATABASE FlugIHK01;
USE FlugIHK01;

CREATE TABLE Flugzeug (
  Flugzeug_ID INT PRIMARY KEY,
  Typ VARCHAR(30),
  Kapazitaet VARCHAR(20)
);

CREATE TABLE Flugzeug_Sitzplan (
  Sitz_ID INT PRIMARY KEY,
  Flugzeug_ID INT,
  FOREIGN KEY(Flugzeug_ID) REFERENCES Flugzeug(Flugzeug_ID),
  Platz VARCHAR(10)
);

CREATE TABLE Flug (
  Flug_ID INT PRIMARY KEY,
  von VARCHAR(30),
  nach VARCHAR(30),
  Abflug TIME,
  Ankunft TIME,
  Preis DECIMAL(4, 2)
);

CREATE TABLE Flug_Datum (
  Flug_Datum_ID INT PRIMARY KEY,
  Flug_ID INT,
  Datum DATE,
  Flugzeug_ID INT,
  FOREIGN KEY (Flug_ID) REFERENCES Flug (Flug_ID),
  FOREIGN KEY (Flugzeug_ID) REFERENCES Flugzeug (Flugzeug_ID)
);

CREATE TABLE Passagier (
  Passagier_ID INT PRIMARY KEY,
  Anrede VARCHAR(10),
  Name VARCHAR(20),
  Vorname VARCHAR(20)
);

CREATE TABLE Buchung (
  Buchung_ID INT PRIMARY KEY,
  Flug_Datum_ID INT,
  Passagier_ID INT,
  Platz VARCHAR(10),
  FOREIGN KEY (Flug_Datum_ID) REFERENCES Flug_Datum (Flug_Datum_ID),
  FOREIGN KEY (Passagier_ID) REFERENCES Passagier (Passagier_ID)
);
  
INSERT INTO Flugzeug
  (Flugzeug_ID, Typ, Kapazitaet)
VALUES
  (1, "Boing747", "400"),
  (2, "Boing737", "150"),
  (3, "Airbus128", "375"),
  (4, "Airbus773", "550"),
  (5, "Sukhoi 311", "220");
  
INSERT INTO Flugzeug_Sitzplan
  (Sitz_ID, Flugzeug_ID, Platz)
VALUES
  (1, 1, "1A"),
  (2, 1, "1B"),
  (3, 1, "2A"),
  (4, 1, "2B"),
  (5, 1, "3A"),
  (6, 1, "3B"),
  (7, 2, "1A");
  
INSERT INTO Flug
  (Flug_ID, von, nach, Abflug, Ankunft, Preis)
VALUES
  (1, "Norddeich", "Langeoog", "09:00", "09:20", "60,00"),
  (2, "Langeoog", "Norddeich", "10:00", "10:20", "40,00"),
  (3, "Norddeich", "Langeoog", "11:00", "11:20", "50,00"),
  (4, "Langeoog", "Norddeich", "12:00", "12:20", "40,00"),
  (5, "Norddeich", "Langeoog", "15:00", "15:20", "50,00"),
  (6, "Langeoog", "Norddeich", "16:00", "16:20", "40,00"),
  (7, "Norddeich", "Langeoog", "17:00", "16:20", "50,00"),
  (8, "Langeoog", "Norddeich", "18:00", "18:20", "50,00");

INSERT INTO Flug_Datum
  (Flug_Datum_ID, Flug_ID, Datum, Flugzeug_ID)
VALUES
  (521, 1, "2016-12-02", 1),
  (522, 2, "2016-12-02", 1),
  (528, 8, "2016-12-02", 1),
  (693, 2, "2016-12-15", 2);

INSERT INTO Passagier
  (Passagier_ID, Anrede, Name, Vorname)
VALUES
  (877, "Frau", "Mueller", "Lisa"),
  (878, "Herr", "Mueller", "Karl"),
  (1324, "Frau", "Ruge", "Paula"),
  (1500, "Herr", "Zoeller", "Martin");

INSERT INTO Buchung
  (Buchung_ID, Flug_Datum_ID, Passagier_ID, Platz)
VALUES
  (1265, 521, 877, "1B"),
  (1266, 521, 878, "1A"),
  (1267, 693, 877, "2A"),
  (1268, 693, 878, "2B"),
  (1269, 521, 1324, "3B"),
  (1270, 528, 1324, "1A");
  
INSERT INTO Buchung
  (Buchung_ID, Flug_Datum_ID, Passagier_ID)
VALUES
  (1271, 521, 1500);
  
-- Abfragen: 5a)

SELECT
  Buchung.Platz,
  Passagier.Name,
  Passagier.Vorname
FROM
 (Flug_Datum INNER JOIN Buchung ON Flug_Datum.Flug_Datum_ID = Buchung.Flug_Datum_ID)
   INNER JOIN Passagier ON Buchung.Passagier_ID = Passagier.Passagier_ID
   WHERE Flug_Datum.Datum ='2016-12-02' AND Flug_Datum.Flug_ID= 1
   ORDER BY Buchung.Platz ASC;
   
SELECT
  Buchung.Platz,
  Passagier.Name,
  Passagier.Vorname
FROM
 (Flug_Datum 
   LEFT JOIN Buchung ON Flug_Datum.Flug_Datum_ID = Buchung.Flug_Datum_ID)
   LEFT JOIN Passagier ON Buchung.Passagier_ID = Passagier.Passagier_ID
   WHERE Flug_Datum.Datum ='2016-12-02' AND Flug_Datum.Flug_ID= 1
   ORDER BY Buchung.Platz ASC;

---

SELECT
  Buchung.Platz,
  Passagier.Name,
  Passagier.Vorname
FROM
  Passagier
LEFT JOIN Buchung ON Passagier.Passagier_ID = Buchung.Passagier_ID
LEFT JOIN Flug_Datum ON Flug_Datum.Flug_Datum_ID = Buchung.Flug_Datum_ID
WHERE Flug_Datum.Datum = "2016-12-02" AND Flug_Datum.Flug_ID = 1;



 Buchung ON Flug_Datum.Flug_Datum_ID = Buchung.Flug_Datum_ID)
     LEFT JOIN Passagier ON Buchung.Passagier_ID = Passagier.Passagier_ID
   WHERE Flug_Datum.Datum ='2016-12-02' AND Flug_Datum.Flug_ID= 1
   ORDER BY Buchung.Platz ASC;

  
--

SELECT
  Buchung.Platz,
  Passagier.Name,
  Passagier.Vorname
FROM
  Passagier, Buchung, Flug_Datum
WHERE
  Passagier.Passagier_ID = Buchung.Passagier_ID AND 
  Flug_Datum.Flug_Datum_ID = Buchung.Flug_Datum_ID AND 
  Flug_Datum.Datum ="2016-12-02" AND
  Flug_Datum.Flug_ID = 1;

 