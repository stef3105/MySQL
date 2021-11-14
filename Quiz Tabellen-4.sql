
DROP DATABASE IF EXISTS Quiz;
CREATE DATABASE Quiz;
USE Quiz;


CREATE TABLE Kategorie (
    Id int auto_increment PRIMARY KEY,
    Name VARCHAR (200)
);

CREATE TABLE Unterkategorie (
    Id int auto_increment PRIMARY KEY,
    Name VARCHAR (200),
    KategorieId_FK int,
    FOREIGN KEY (KategorieId_FK) REFERENCES Kategorie (Id)
);

CREATE TABLE Frage (
    Id int auto_increment PRIMARY KEY,
    Hinweis VARCHAR (2000),
    Text VARCHAR (2000),
    Erklaerung VARCHAR (2000),
    Schwierigkeitsgrad int,     -- 1 leicht,  ..  3 schwer
    UnterkategorieId_FK int,
    FOREIGN KEY (UnterkategorieId_FK) REFERENCES Unterkategorie (Id)
);

CREATE TABLE Antwort (
    Id int auto_increment PRIMARY KEY,
    Text VARCHAR (2000),
    Wahr int,             -- 1: True, 0: False
    FrageId_FK int,
    FOREIGN KEY (FrageId_FK) REFERENCES Frage (Id)
);

INSERT INTO Kategorie
  (Name)
VALUES
  ("IT_Sicherheit"),
  ("Netzwerkgrundlagen"),
  ("Projektmanagement"),
  ("Python"),
  ("WiSo")
;

INSERT INTO Unterkategorie
  (Name, KategorieId_FK)
VALUES
  ("Lektion 1: Einstieg - 1.1 Warum IT-Grundschutz?", 1),
  ("Lektion 2: Sicherheitsmanagement - 2.1 Sicherheitsprozess", 1),
  ("Lektion 3: Strukturanalyse - 3.1 Das Beispielunternehmen RECPLAST", 1), 
  ("Lektion 4: Schutzbedarfsfeststellung - 4.1 Grundlegende Definitionen", 1), 
  ("Lektion 5: Modellierung - 5.1 IT Grundschutz_Bausteine", 1),
  ("Lektion 6: IT-Grundschutz-Check - 6.1 Anforderungen", 1),
  ("Lektion 7: Risikoanalyse - 7.1 Organisatorische Rahmenbedingungen", 1),
  ("Lektion 8: Umsetzungsplanung - 8.1 Massnahmen konsolidieren", 1)
;
  
INSERT INTO Frage 
  (Hinweis, Text, Erklaerung, Schwierigkeitsgrad, UnterkategorieId_FK)
VALUES
  ("Hinweis eins", "Frage 1: Welche klassischen Schutzziele werden bei der Schutzbedarfsfeststellung gemaess IT-Grundschutz empfohlen?", "Erklaerung eins", 1, 4),
  ("Hinweis zwei", "Frage 2: In welchen Faellen koennen Sie gemaess IT-Grundschutz-Methodik auf die Schutzbedarfsfeststellung fuer ein IT-System verzichten?", "Erklaerung zwei", 1, 4),
  ("Hinweis drei", "Frage 3: Welche Kriterien beruecksichtigen Sie bei der Bestimmung des Bedarfs an Verfuegbarkeit eines IT-Systems?", "Erklaerung drei", 1, 4),
  ("Hinweis vier", "Frage 4: Was beruecksichtigen Sie, wenn Sie den Schutzbedarf einer Anwendung bestimmen?", "Erklaerung vier", 1, 4),
  ("Hinweis fuenf", "Frage 5: Unter welchen Bedingungen kann der Schutzbedarf eines IT-Systems bezueglich Verfuegbarkeit geringer sein als derjenige der Anwendungen, fuer die es eingesetzt wird?", "Erklaerung fuenf", 1, 4),
  ("Hinweis sechs", "Frage 6: Wenn bei der Schutzbedarfsfeststellung fuer ein IT-System Kumulationseffekte beruecksichtigt werden, bedeutet dies, dass...", "Erklaerung sechs", 1, 4),
  ("Hinweis sieben", "Frage 7: Welche Aufgaben stellen sich Ihnen bei der Modellierung gemaess IT-Grundschutz?", "Erklaerung sieben", 1, 5),
  ("Hinweis acht", "Frage 8: Welche Informationen sind Bestandteil eines IT-Grundschutz-Bausteins?", "Erklaerung acht", 1, 5),
  ("Hinweis neun", "Frage 9: Welche Aufgaben stellen sich Ihnen, nachdem Sie bei der Modellierung festgelegt haben, welche Bausteine fuer den Informationsverbund und seine einzelnen Zielobjekte anzuwenden sind?", "Erklaerung neun", 1, 5),
  ("Hinweis 10", "Frage 10: Worauf sollten Sie bei der Auswahl und Anpassung der Sicherheitsmassnahmen auf Basis der Anforderungen achten?", "Erklaerung 10", 1, 5),
  ("Hinweis 11", "Frage 11: Welche Aussagen zur Anwendung von Bausteinen auf Server sind korrekt?", "Erklaerung 11", 1, 5),
  ("Hinweis 12", "Frage 12: Auf welche Zielobjekte ist bei der Modellierung der Baustein ISMS.1 Sicherheitsmanagement anzuwenden?", "Erklaerung 12", 1, 5),
  ("Hinweis 13", "Frage 13: Welche Aussagen zum IT-Grundschutz-Check sind zutreffend?", "Erklaerung 13", 1, 6),
  ("Hinweis 14", "Frage 14: Welche Vorarbeiten erfordert der IT-Grundschutz-Check?", "Erklaerung 14", 1, 6),
  ("Hinweis 15", "Frage 15: Welche Verfahren verwenden Sie, um in einem IT-Grundschutz-Check zu pruefen, wie gut eine Gruppe von Clients geschuetzt ist?", "Erklaerung 15", 1, 6),
  ("Hinweis 16", "Frage 16: Wann bewerten Sie beim IT-Grundschutz-Check eine Anforderung eines IT-Grundschutz-Bausteins als erfuellt?", "Erklaerung 16", 1, 6),
  ("Hinweis 17", "Frage 17: Wie verfahren Sie beim ersten IT-Grundschutz-Check, also vor der Durchfuehrung von Risikoanalysen, mit Anforderungen fuer den erhoehten Schutzbedarf?", "Erklaerung 17", 1, 6),
  ("Hinweis 18", "Frage 18: Sie stellen fest, dass eine Standard-Anforderung fuer ein IT-System nicht umgesetzt ist, das nur noch kurze Zeit in Betrieb ist. Wie behandeln Sie diese Anforderung beim IT-Grundschutz-Check?", "Erklaerung 18", 1, 6),
  ("Hinweis 19", "Frage 19: Wer traegt die Verantwortung fuer die bei einer Risikoanalyse getroffenen Entscheidungen zu einem IT-System?", "Erklaerung 19", 1, 7),
  ("Hinweis 20", "Frage 20: Welche Gefaehrdungen werden bei der Erstellung der Gefaehrdungsuebersicht im ersten Schritt betrachtet?", "Erklaerung 20", 1, 7),
  ("Hinweis 21", "Frage 21: Was bewerten Sie bei der Risikoeinschaetzung?", "Erklaerung 21", 1, 7),
  ("Hinweis 22", "Frage 22: Wodurch verlagern Sie ein Risiko?", "Erklaerung 22", 1, 7),
  ("Hinweis 23", "Frage 23: Aus welchen Gruenden kann es gerechtfertigt sein, auch ein hohes Risiko zu akzeptieren?", "Erklaerung 23", 1, 7),
  ("Hinweis 24", "Frage 24: Wann ist die Risikoakzeptanz grundsaetzlich unzulaessig?", "Erklaerung 24", 1, 7),
  ("Hinweis 25", "Frage 25: Was muessen Sie pruefen, wenn Sie die Umsetzung von Sicherheitsmassnahmen planen?", "Erklaerung 25", 1, 8),
  ("Hinweis 26", "Frage 26: Welche Informationen aus dem IT-Grundschutz-Kompendium unterstuetzen Sie bei der Festlegung einer sinnvollen Umsetzungsreihenfolge der geplanten Massnahmen?", "Erklaerung 26", 1, 8),
  ("Hinweis 27", "Frage 27: Was unternehmen Sie als Informationssicherheitsbeauftragter, wenn die Leitung Ihrer Institution nicht bereit ist, den Aufwand fuer eine bestimmte Sicherheitsmassnahme zu tragen?", "Erklaerung 27", 1, 8),
  ("Hinweis 28", "Frage 28: Wer sollte in der Regel technische Massnahmen zur Absicherung eines bestimmten IT-Systems umsetzen?", "Erklaerung 28", 1, 8),
  ("Hinweis 29", "Frage 29: Wer sollte ueblicherweise pruefen, ob eine Sicherheitsmassnahme wie geplant umgesetzt ist?", "Erklaerung 29", 1, 8),
  ("Hinweis 30", "Frage 30: Welches Hilfsmittel im IT-Grundschutz-Kompendium koennen Sie verwenden, um Ihrer Leitung zu verdeutlichen, welche Risiken die Nichterfuellung von Anforderungen mit sich bringt?", "Erklaerung 30", 1, 8)
;
  
INSERT INTO Antwort
  (Text, Wahr, FrageId_FK)
VALUES
  ("Antwort 1: Authentizitaet", 0, 1),
  ("Antwort 1: Vefuegbarkeit", 1, 1),
  ("Antwort 1: Vertraulichkeit", 1, 1),
  ("Antwort 1: Integritaet", 1, 1),
  ("Antwort 2: wenn das IT-System spaetestens innerhalb von 18 Monaten ausgesondert wird.", 0, 2),
  ("Antwort 2: wenn das IT-System nicht eingesetzt wird.", 1, 2),
  ("Antwort 2: wenn die Anwendungen, die es unterstuetzt, nur einen normalen Schutzbedarf haben.", 0, 2),
  ("Antwort 2: wenn der Schutzbedarf bereits im Rahmen einer vor einem Jahr durchgefuehrten Revision festgestellt wurde.", 0, 2),
  ("Antwort 3: die maximal tolerierbare Ausfallzeit des IT-Systems", 1, 3),
  ("Antwort 3: den Aufwand, der erforderlich ist, um das IT-System nach einer Beschaedigung wiederherzustellen", 0, 3),
  ("Antwort 3: die Anzahl der Benutzer des IT-Systems", 0, 3),
  ("Antwort 3: die Anschaffungskosten des IT-Systems", 0, 3),
  ("Antwort 4: die Informationen, die im Zusammenhang mit der Anwendung verwendet werden", 1, 4),
  ("Antwort 4: die Bedeutung der Anwendung fuer die Geschaeftsprozesse oder Fachaufgaben", 1, 4),
  ("Antwort 4: die relevanten Gefaehrdungen, denen die Anwendung ausgesetzt ist", 0, 4),
  ("Antwort 4: die raeumumliche Umgebung des IT-Systems, das die Anwendung bereitstellt", 0, 4),
  ("Antwort 5: wenn der Buchwert des IT-Systems einen zuvor definierten Schwellwert unterschreitet", 0, 5),
  ("Antwort 5: wenn das IT-System nur solche Teile der Anwendungen bedient, die einen geringeren Schutzbedarf haben", 1, 5),
  ("Antwort 5: wenn mindestens ein weiteres redundantes IT-System in Betrieb ist, das die betreffenden Anwendungen bereitstellen kann", 1, 5),
  ("Antwort 5: wenn die Anwendungen innerhalb der naechsten drei Monate so umstrukturiert werden sollen, dass das betreffende IT-System nicht mehr benoetigt wird", 0, 5),
  ("Antwort 6: … sich der Schutzbedarf des IT-Systems erhoeht, weil sich Einzelschaeden zu einem hoeheren Gesamt­schaden addieren.", 1, 6),
  ("Antwort 6: … sich der Schutzbedarf des IT-Systems verringert, weil geeignete, sich gegenseitig verstaerkende Sicherheitsmassnahmen im Einsatz sind.", 0, 6),
  ("Antwort 6: … sich der fuer das IT-System festgestellte Schutzbedarf auch auf den Schutzbedarf anderer IT-Systeme auswirkt, die mit dem betreffenden IT-System vernetzt sind.", 0, 6),
  ("Antwort 6: … der Schutzbedarf des IT-Systems erst festgestellt werden kann, wenn der Schutzbedarf der mit diesem vernetzten IT-Systeme festgestellt ist.", 0, 6),
  ("Antwort 7: Sie bilden den in der Strukturanalyse dokumentierten Informationsverbund mithilfe der IT-Grundschutz-Bausteine ab.", 1, 7),
  ("Antwort 7: Sie entwerfen die Sicherheitsarchitektur des betrachteten Informationsverbundes.", 0, 7),
  ("Antwort 7: Sie merken Zielobjekte, die nicht geeignet modelliert werden koennen, fuer eine Risikoanalyse vor.", 1, 7),
  ("Antwort 7: Sie pruefen, welche IT-Grundschutz-Bausteine fuer den betrachteten Informationsverbund relevant sind.", 1, 7),
  ("Antwort 8: Angaben zur spezifischen Gefaehrdungslage", 1, 8),
  ("Antwort 8: Beschreibungen zu Standard-Sicherheitsmassnahmen", 0, 8),
  ("Antwort 8: Verweise auf weiterfuehrende Informationen", 1, 8),
  ("Antwort 8: Sicherheitsanforderungen zu einem gegebenen Sachverhalt", 1, 8),
  ("Antwort 9: die Festlegung von Massnahmen, mit denen die Anforderungen erfuellt werden koennen", 1, 9),
  ("Antwort 9: die Pruefung, ob fuer einzelne Anforderungen, deren Umsetzung im gegebenen Anwendungskontext mit vertretbarem Aufwand nicht moeglich ist, Alternativen erforderlich sind", 1, 9),
  ("Antwort 9: die Korrektur der Schutzbedarfsfeststellung fuer Zielobjekte, bei denen die Erfuellung der Anforderungen unrealistisch erscheint", 0, 9),
  ("Antwort 9: die Dokumentation der Ergebnisse der Modellierung", 1, 9),
  ("Antwort 10: auf die Wirtschaftlichkeit der Massnahmen", 1, 10),
  ("Antwort 10: auf die Wirksamkeit der Massnahmen", 1, 10),
  ("Antwort 10: auf den Innovationsgrad der Massnahmen", 0, 10),
  ("Antwort 10: auf die Benutzerfreundlichkeit der Massnahmen", 1, 10),
  ("Antwort 11: Der Baustein SYS.1.1 Allgemeiner Server ist nur dann anzuwenden, wenn es keinen betriebssystemspezifischen Baustein fuer einen Server gibt.", 0, 11),
  ("Antwort 11: Neben dem Baustein SYS.1.1 Allgemeiner Server ist immer auch der zutreffende betriebssystemspezifische Baustein anzuwenden.", 1, 11),
  ("Antwort 11: Wenn es spezielle Bausteine fuer Server-Anwendungen (z. B. Web- oder Datenbankserver) gibt, muss der betriebssystemspezifische Baustein nicht angewendet werden.", 0, 11),
  ("Antwort 11: Fuer Virtualisierungsserver muessen neben dem Baustein sowohl der Baustein SYS.1.1 Allgemeiner Server als auch der zutreffende betriebssystemspezifische Baustein angewendet werden.", 1, 11),
  ("Antwort 12: Er MUss gesondert auf jeden groesseren Standort eines Informationsverbundes angewendet werden.", 0, 12),
  ("Antwort 12: Er MUss einmal angewendet werden, und zwar auf den gesamten Informationsverbund.", 1, 12),
  ("Antwort 12: Er ist nur relevant, wenn der Informationsverbund eine gewisse Mindestgroesse hat.", 0, 12),
  ("Antwort 12: Er MUss fuer jedes Teilnetz gesondert angewendet werden, das bei der Strukturanalyse identifiziert wurde.", 0, 12), 
  ("Antwort 13: Ein IT-Grundschutz-Check ermoeglicht, Defizite bei der Erfuellung von Sicherheitsanforderungen zu ermitteln.", 1, 13),
  ("Antwort 13: Bei einem IT-Grundschutz-Check wird lediglich die Erfuellung der Basis-Anforderungen geprueft.", 0, 13),
  ("Antwort 13: Ein IT-Grundschutz-Check dient dazu, Sicherheitsprobleme zu identifizieren, die in einer Risikoanalyse genauer untersucht werden muessen.", 0, 13),
  ("Antwort 13: Ein IT-Grundschutz-Check ist ein Soll-Ist-Vergleich zwischen Sicherheitsanforderungen und tatsaechlich umgesetzten Sicherheitsmassnahmen.", 1, 13),
  ("Antwort 14: die Festlegung eines Zeitplans", 1, 14),
  ("Antwort 14: die Auswahl von geeigneten Gespraechspartnern", 1, 14),
  ("Antwort 14: einen Penetrationstest, um Schwachstellen zu identifizieren, die mit den ausgewaehlten Gespraechspartnern eroertert werden", 0, 14),
  ("Antwort 14: die Zusammenstellung und Lektuere der vorhandenen Dokumente zur Informationssicherheit in dem betrachteten Informationsverbund", 1, 14),
  ("Antwort 15: Sie fuehren Interviews mit den zustaendigen Systembetreuern.", 1, 15),
  ("Antwort 15: Sie versuchen in einem Penetrationstest, Schwachstellen dieser IT-Systeme zu ermitteln, und beziehen dabei saemtliche zur Gruppe gehoerenden Clients ein.", 0, 15),
  ("Antwort 15: Sie untersuchen stichprobenartig vor Ort, wie die Clients konfiguriert sind.", 1, 15),
  ("Antwort 15: Sie lesen die vorhandene Dokumentation zur Konfiguration der Clients.", 1, 15),
  ("Antwort 16: wenn zu der Anforderung geeignete Massnahmen vollstaendig, wirksam und angemessen umgesetzt sind", 1, 16),
  ("Antwort 16: wenn der Gespraechspartner Ihnen glaubhaft versichert hat, dass es bislang zu keinen Sicherheitsproblemen auf dem betreffenden IT-System gekommen ist", 0, 16),
  ("Antwort 16: wenn es eine umfangreiche Dokumentation zu den Schutzvorkehrungen fuer das betreffende IT-System gibt", 0, 16),
  ("Antwort 16: wenn sowohl im Interview mit einem fuer das IT-System Zustaendigen als auch bei einer stichprobenartigen ueberpruefung keine Sicherheitsmaengel festgestellt wurden", 1, 16),
  ("Antwort 17: Sie stufen diese Anforderungen grundsaetzlich als entbehrlich ein und verzichten auch dann darauf, diese zu ueberpruefen, wenn sie in Ihrer Einrichtung umgesetzt sind.", 0, 17),
  ("Antwort 17: Sie streichen die Anforderungen aus Ihrem Sollkonzept.", 0, 17),
  ("Antwort 17: Sie betrachten Anforderungen fuer den hohen und sehr hohen Schutzbedarf erst nach Abschluss der Risikoanalyse. ", 1, 17),
  ("Antwort 17: Sie betrachten im IT-Grundschutz-Check grundsaetzlich alle in den IT-Grundschutz-Bausteinen genannten Anforderungen, folglich auch diejenigen fuer den erhoehten Schutzbedarf.", 0, 17),
  ("Antwort 18: Sie streichen die Anforderung aus dem IT-Grundschutz-Modell.", 0, 18),
  ("Antwort 18: Sie dokumentieren diese als entbehrlich, da ihre Umsetzung nicht mehr wirtschaftlich ist.", 0, 18),
  ("Antwort 18: Sie dokumentieren diese als nicht erfuellt, und merken gegebenenfalls an, dass geprueft werden muss, ob Massnahmen zur Behebung dieses Defizits angesichts der kurzen Einsatzzeit des IT-Systems noch angemessen sind.", 1, 18),
  ("Antwort 18: Sie dokumentieren diese als nicht erfuellt und merken an, dass geprueft werden muss, ob die daraus resultierenden Risiken in der Restlaufzeit des IT-Systems noch tragbar sind.", 1, 18),
  ("Antwort 19: der Administrator des IT-Systems", 0, 19),
  ("Antwort 19: die Leitung der Institution", 1, 19),
  ("Antwort 19: der Informationssicherheitsbeauftragte", 0, 19),
  ("Antwort 19: das IS-Management-Team", 0, 19),
  ("Antwort 20: die im Anhang von BSI-Standard 200-3 enthaltenen Risikokataloge", 0, 20),
  ("Antwort 20: die relevanten elementaren Gefaehrdungen aus dem IT-Grundschutz-Kompendium", 1, 20),
  ("Antwort 20: die im Anhang der Norm ISO 27005 angefuehrten Gefaehrdungen", 0, 20),
  ("Antwort 20: die in den Abschnitten zur Gefaehrdungslage eines Bausteins angefuehrten spezifischen Gefaehrdungen", 0, 20),
  ("Antwort 21: die Haeufigkeit des Eintretens einer Gefaehrdung", 1, 21),
  ("Antwort 21: das mit einer Gefaehrdung verbundene Schadensausmass", 1, 21),
  ("Antwort 21: welche Schutzziele von einer Gefaehrdung betroffen sind", 0, 21),
  ("Antwort 21: die Wirksamkeit der geplanten und umgesetzten Massnahmen gegen eine Gefaehrdung", 0, 21),
  ("Antwort 22: durch den Abschluss einer Versicherung", 1, 22),
  ("Antwort 22: durch Outsourcing des risikobehafteten Geschaeftsprozesses an einen externen Dienstleister", 1, 22),
  ("Antwort 22: durch Umstrukturierung des risikobehafteten Geschaeftsprozesses", 0, 22),
  ("Antwort 22: durch die Entscheidung, risikomindernde Massnahmen erst dann umzusetzen, wenn die hierzu erforderlichen Finanzmittel bereitstehen", 0, 22),
  ("Antwort 23: Der Aufwand fuer moegliche Schutzmassnahmen ist unangemessen hoch.", 1, 23),
  ("Antwort 23: Vergleichbare Institutionen akzeptieren das Risiko ebenfalls.", 0, 23),
  ("Antwort 23: Es gibt keine wirksamen Schutzmassnahmen gegen das Risiko.", 1, 23),
  ("Antwort 23: Es ist bislang noch zu keinem nennenswerten Sicherheitsvorfall aufgrund der dem Risiko zugrunde liegenden Gefaehrdung gekommen.", 0, 23),
  ("Antwort 24: bei der Nichterfuellung von Basis-Anforderungen", 1, 24),
  ("Antwort 24: beim Vorhandensein von elementaren Gefaehrdungen", 0, 24),
  ("Antwort 24: bei sehr hohem Schutzbedarf", 0, 24),
  ("Antwort 24: bei Nichterfuellung von Standard-Anforderungen", 0, 24),
  ("Antwort 25: welche begleitenden Massnahmen fuer eine erfolgreiche Umsetzung erforderlich sind", 1, 25),
  ("Antwort 25: ob die betreffende Massnahme bereits eingefuehrt ist", 0, 25),
  ("Antwort 25: ob die Massnahme mit anderen Massnahmen vereinbar ist", 1, 25),
  ("Antwort 25: in welcher Reihenfolge die verschiedenen Massnahmen umgesetzt werden sollen", 1, 25),
  ("Antwort 26: die fuenfstufige Kennziffer zur Angabe der Prioritaet einer Anforderung in den IT-Grundschutz-Bausteinen", 0, 26),
  ("Antwort 26: die Aufteilung der Anforderungen in Basis- und Standard-Anforderungen sowie solchen fuer den hoeheren Schutzbedarf", 1, 26),
  ("Antwort 26: der Vorschlag zur Kennzeichnung einer sinnvollen Bearbeitungsreihenfolge der Bausteine mithilfe der Kuerzel R1, R2 und R3", 1, 26),
  ("Antwort 26: die Darstellung der Gefaehrdungslage am Beginn eines Bausteins", 0, 26),
  ("Antwort 27: Sie verdeutlichen ihr, welche Risiken mit dem Fehlen der Massnahme verbunden sind.", 1, 27),
  ("Antwort 27: Sie bitten die Leitung, durch Unterschrift zu bestaetigen, dass sie die damit verbundenen Gefahren kennt und traegt.", 1, 27),
  ("Antwort 27: Sie ignorieren die Leitung und setzen die Massnahme trotzdem um.", 0, 27),
  ("Antwort 27: Sie verzichten auf eine unmittelbare Reaktion, nehmen sich aber vor, nach Ablauf einer gewissen Zeitspanne die Zustimmung der Leitung einzuholen.", 0, 27),
  ("Antwort 28: die Leitung der IT-Abteilung", 0, 28),
  ("Antwort 28: der Informationssicherheitsbeauftragte", 0, 28),
  ("Antwort 28: der zustaendige Systemadministrator", 1, 28),
  ("Antwort 28: der Benutzer des IT-Systems", 0, 28),
  ("Antwort 29: die Geschaeftsfuehrung", 0, 29),
  ("Antwort 29: der Informationssicherheitsbeauftragte", 1, 29),
  ("Antwort 29: der zustaendige IT-Administrator", 0, 29),
  ("Antwort 29: die Leitung der IT-Abteilung", 0, 29),
  ("Antwort 30: das Restrisikodeklarationsformular im Anhang des Kompendiums", 0, 30),
  ("Antwort 30: die Kreuzreferenztabellen am Ende eines Bausteins", 1, 30),
  ("Antwort 30: das Risikokalkulationsschema in der uebersicht der elementaren Gefaehrdungen", 0, 30),
  ("Antwort 30: die Beispiele fuer eine erfolgreiche Sensibilisierung im Baustein ORP.3 Sensibilisierung und Schulung", 0, 30)
;

