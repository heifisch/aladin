# Angebots- und Rechnungsverwaltung mit Kunden- und Lieferantenstamm, OP-Buchhaltung, Nachkalkulation und Vielem mehr.

Diese Bibliothek ist freie Software.  
Sie dürfen sie unter den Bedingungen der GNU General Public License, 
wie von der Free Software Foundation veröffentlicht, weiterverteilen und/oder modifizieren.  
Diese Bibliothek wird in der Hoffnung weiterverbreitet, dass sie nützlich sein wird, 
jedoch OHNE IRGENDEINE GARANTIE, 
auch ohne die implizierte Garantie der MARKTREIFE oder der VERWENDBARKEIT FÜR EINEN BESTIMMTEN ZWECK.

## Vorausetzungen:

Apache OpenOffice oder LibreOffice,  
MariaDB oder MySQL,

## Erforderliche Kenntnisse:

Grundlegende Kenntnisse über die Installation und Administration von MariaDB/MySQL.  
Einrichtung einer Datenverbindung in OpenOffice.org/LibreOffice zu MariaDB/MySQL

## Kurzanleitung zum Einrichten:

1. Archiv in beliebiges Verzeichnis z.B. mit tar xvjf aladin.xxxx-xx-xx.tar.bz2" entpacken.  
Unter Windows kann das Archiv aladin.xxxx-xx-xx.zip verwendet werden.     
Dies kann auch für Mehrbenutzerbetrieb auf einem Netzwerk-Share erfolgen.  
Wichtig ist, dass nach Einrichtung der Software, der Speicherpfad nicht mehr geändert wird, da dies sonst eine Anpassung der Einstellungen erforderlich macht.
       

2. Basic-Bibliothek "ALADIN" in AOO/LO als Referenz importieren.  
Basic-Bibliothek "ALADIN_Global" in AOO/LO __NICHT__ als Referenz importieren.
       
Unter:

Extras ->
 Makros ->
 Makros Verwalten ->
 OpenOffice Basic... ->
 Verwalten ->
 Bibliotheken ->
 Importieren
 
folgende Datei auswählen: <Speicherpfad>/basic/ALADIN/script.xlb
       und <Speicherpfad>/basic/ALADIN_Global/script.xlb
       
![grafik](https://github.com/user-attachments/assets/374d1bce-b07c-49e9-b890-128d6d8af558) ![grafik](https://github.com/user-attachments/assets/91def1d6-c2b6-4de8-8bf2-661a2aabad1b)

So sollte das dann in etwa aussehen:

![grafik](https://github.com/user-attachments/assets/302ad90e-f639-4125-9b2e-59b3c9bcec9e)

3. In der Bibliothek "ALADIN_Global" unter "Global" noch die nötigen Variablen anpassen:

![grafik](https://github.com/user-attachments/assets/8b7bc0c8-dda7-4ea4-8ac2-9441f43b7227)  
Wichtig wären sAladinPfad, sStandardPfad, bei Mehrbenutzerbetrieb und Mehr-Mandantenbetrieb die iUserID und evtl. der Mandanten-Name unter sMandant.  

4. Datenbankenschnittstelle in AOO/LO konfigurieren
Die Extension „MySQL Driver for Apache OpenOffice“ sollte installiert sein.  
Nun sollte mit dem Assistenten eine neue Datenbank angelegt werden.  
Dazu "Verbindung zu einer bestehenden Datenbank", "MySQL", "native" auswählen und die entsprechenden Einstellungen machen.  
Als erstes wird zur Erstellung der Tabellenstruktur und zum Anlegen der Benutzer eine Verbindung zum Datenbank-Server mit root-Rechten benötigt.    

Diese Datenbank muss dann unter:
       
Extras ->
 Optionen ->
 OpenOffice.org Base ->
 Datenbanken
 
 ![grafik](https://github.com/user-attachments/assets/20524bd8-5cd8-48d2-8e60-94024040a2da)  

unter den Namen "MySQL" registriert werden. Groß-Kleinschreibung beachten!  
Danach sollte man in der Datenquellenansicht(F4) Zugriff auf die Tabellen von mysql (db, user, usw.) haben. 

__Wichtig!!__ Wenn das nicht klappt, braucht man die folgenden Schritte gar nicht probieren. 

5. "<Speicherpfad>/database/createTables.odt" mit Schreibschutz (Nur lesen) öffnen.  
Sollte in mysql noch kein Benutzer für die Benutzung der Datenbank "aladin" angelegt worden sein, kann mit der Taste "Benutzer anlegen und Zugriffsrechte setzen", dieser angelegt werden.  
__Wichtig!!__  
Nach Änderung der Zugriffsberechtigungen und Anlegen von neuen Benutzern muss der mysql-Service neu gestartet werden.

6. Knopf "Tabellen in Datenbank erzeugen" drücken und Anzahl der User für Mehrbenutzerinstallation angeben.  
Jetzt sollten die Tabellen in der Datenbank "aladin" angelegt worden sein.  
Sollte das nicht geklappt haben, nochmal die Verbindung zur Datenbank überprüfen.  

7. Nun sollte mit dem Assistenten noch eine neu Datenbank angelegt werden. 
Dazu wieder "Verbindung zu einer bestehenden Datenbank", "MySQL", "native" auswählen und die entsprechenden Einstellungen machen.
Jetzt wird die Verbindung mit dem Benutzernamen und Passwort angelegt, der bei der beim betätigen der Taste "Benutzer anlegen und Zugriffsrechte setzen" angegeben wurde.
Diese Verbindung ist für den normalen Betrieb des Programmes gedacht.

Diese Datenbank muss dann unter:
Extras ->
	Optionen ->
		OpenOffice.org Base ->
					Datenbanken

unter den Namen "ALADIN" registriert werden. Groß-Kleinschreibung beachten!  
Sollte das fehlgeschlagen sein, dann sollten nochmal die Datenbankverbindungen überprüft werden.  
Jetzt sollte man in der Datenquellenansicht(F4) Zugriff auf die Tabellen von "ALADIN" haben.  

8. Mit folgendem Befehl kann nun das Programm gestartet werden:  
AOO: ooffice macro:///ALADIN.Startmenue.neuerTask  
LO: loffice macro:///ALADIN.Startmenue.neuerTask

Wenn das geklappt hat, kann man sich mit diesem Aufruf eine Verknüpfung auf dem Desktop machen.  
Und schon sollte es losgehen können.

![grafik](https://github.com/user-attachments/assets/d859d195-6cb2-4fe9-b77d-35d0607d2d9f)  
![grafik](https://github.com/user-attachments/assets/6ef61127-32d8-42f6-bfe0-d0c7ce57e9d9)  
![grafik](https://github.com/user-attachments/assets/d92d9d8c-0da3-41de-aa9c-f7c1b489ac51)  

9. Modul "Einstellungen" starten und die entsprechenden Einstellungen vornehmen.

**Achtung!!!**

Vor einem Update einer vorhandenen Installation, sollte auf jedem Fall die Datenbank, das Kassenbuch sowie die angepassten Dokumentvorlagen gesichert werden, da diese bei der Installation überschrieben bzw. beschädigt werden und Datenverlust auftreten könnte.  

## kurze Beschreibung der einzelnen Module:

Das Programm kann unter Linux, Windows und MacOS betrieben werden.  
Getestet habe ich die Funktionen unter Linux und Windows.  
Da mir MacOS nicht zur Verfügung steht, konnte ich es da nicht testen.  

Relativ einfach lässt sich das Programm auch als Mehrplatzlösung mit zentralem MySQL-Server verwenden.  
Dazu müssen in der Bibliothek "ALADIN" unter "Global" die Konstanten "iUserID" angepasst werden und die entsprechende Einträge in den Datenbanktabellen sowie die entsprechenden Tabellen erzeugt werden.  
Dazu muß nur die User-Anzahl beim Erzeugen der Tabellen angegeben werden.  

Als Variable "iUserID" sollte für jeden Client ein unterschiedlicher numerischer Wert vergeben werden.  
Dazu müssen in der Tabelle "Users" die entsprechende Anzahl von Datensätzen vorhanden sein.  

In der Tabelle Steuerung muß die entsprechende Anzahl von Datensätzen vorhanden sein,  
also mindestens Useranzahl x 40.  
Das Anlegen der Datensätze, sowie die Erstellung der Tabellen für den Mehrbenutzerbetrieb kann mit der Angabe der Anzahl der User beim Erzeugen der Tabellen erledigt werden.  

**Personalstamm**  
Erfassung der Personaldaten.

**Kontakte- / Kunden- / Lieferantenstamm**  
Neben den erforderlichen Daten für die weitere Verarbeitung wie Stundensatz, Materialaufschlag, Faxnummer, Zahlungsziele usw., können hier pro Kontakt beliebig viele Ansprechpartner angelegt werden, die dann für die entsprechenden Dokumenten ausgewählt werden können. Weiterhin werden für die einzelnen Kontakte die Umsätze angezeigt.

**Leistungsstamm / Gruppenverwaltung**  
Im Leistungsstamm lassen sich u.a. Leistungsbezeichnung, Leistungsbeschreibung, Einkaufspreis, Bauzeit erfassen. Die Leistungen können verschieden Leistungsgruppen zugeordnet werden, was die Auswahl besonders bei großen Datenbeständen erleichtert.  
Weiterhin lassen sich Leistungen als Standard-Leistung definieren, welche dann unabhängig von den Filtereinstellungen in der Auswahlliste erscheinen.

**Projekte**  
Im Modul "Projekte" lassen sich Projekte anlegen denen Dokumente wie Angebote, Rechnungen, usw. zugeordnet werden können.  
Es werden alle dem Projekt zugeordneten Dokumente angezeigt und ein paar Zahlen zur Auswertung wie der Stand des Projektes ist bzw. wie es gelaufen ist.

**Angebot / Auftragsbestätigung / Aufmaß / Lieferschein / Rechnung / Gutschrift / Preisanfrage / Bestellung**  
Das Modul "Projekt" ist darauf ausgelegt, möglichst einfach die aufgeführten Dokumente zu erstellen.  
Dazu kann der Datenbestand des Leistungsstamm verwendet werden, aber es können auch Blanko-Datensätze erstellt werden.  
Die einzelnen Dokumente lassen sich in einen anderen Typ exportieren, d.h. es lässt sich z.B. aus einem Angebot eine Rechnung machen oder aus einer Preisanfrage eine Bestellung usw.  

Die Positionen können als Alternativposition oder Eventualposition markiert werden.  
Diese Positionen gehen in der Berechnung nicht mit in die Summen ein.  
Es lassen sich Zwischensummen und Zwischenbemerkungen ins Dokument einfügen.  
Die einzelnen Positionen können ausgeschnitten, kopiert oder verschoben werden.

Es kann auch ein benutzerdefiniertes Positionsnummernformat verwendet werden.  
Dazu ist die Tabellenspalte LV_Pos einzublenden und manuell die 1. Positionsnummer einzutragen z.B. 01.01.001. 
Die Positionsnummern werden dann automatisch hochgezählt.  
Dabei ist aber trotzdem noch etwas Handarbeit notwendig.

Zur Kalkulation können der Minutenverrechnungssatz und Materialaufschlagsatz angepasst werden, diese  werden dann mit den in den Positionen hinterlegten Bauzeiten und Einkaufspreisen multipliziert.  
Es werden Lieferung, Leistung, Einheitspreis und Gesamtpreis pro Position berechnet.  
Es kann der Einkaufspreis oder der Listenpreis aus dem Leistungsstamm übernommen werden.  

Besonderen Wert hab ich darauf gelegt, daß man aus diesem Modul heraus, Leistungen im Leistungsstamm aktualisieren und auch neu anlegen kann.  
So können die Bauzeit, der Einkaufspreis und die Leistungsbezeichnung in der Leistungstabelle verändert und dann in den Leistungsstamm zurückgespeichert werden.  
Weiterhin kann eine Leistung aus dem Leistungsstamm dupliziert, werden.  
Das ist sinnvoll, wenn man eine ähnliche Leistung wie die duplizierende anlegen möchte, bei der die Leistungsbeschreibung(Langtext) und die Gruppenzugehörigkeit gleich ist.  
Man würde nur die Leistungsbezeichnung entsprechend ändern und anschließend Bauzeit und Einkaufspreis aus der Tabelle heraus aktualisieren.  
In den Positionen können Benutzerdefinierte Langtexte verwendet werden.  

Beim Ausdruck von mehrseitigen Dokumenten wird der Übertrag eingefügt. 

**WICHTIG!!**  
Während der Dokumenterzeugung sollte keine Benutzeraktion durchgeführt werden, da eine Aktion den View-Cursor beeinflussen könnte, und dann könnte das Programm zur Dokument-Erzeugung fehlerhaft laufen und beendet sich selbst.  

**Inventur**  
Mit diesem Modul lässt sich eine Inventur anhand der im Leistungsstamm enthaltenen Leistungen erstellen.

**Offen-Posten Buchhaltung / Mahnwesen**  
Alle Ausgangsrechnungen werden hier erfasst und entsprechend Fälligkeitsdatum als fällig markiert.
Der Status "fällig" wird anhand der im Kundenstamm bzw. im Rechnungsformular festgelegten Fristen automatisch gesetzt.  
Es lassen sich einfach Zahlungserinnerungen und Mahnungen erstellen. Nach Zahlungseingang sollte der Status der Rechnungen dann auf  "bezahlt" gesetzt werden.  
Entsprechend den Filtereinstellungen können Listen mit den Ausgangsrechnungen ausgegeben werden.

Die Eingangsrechnungen können in dem Modul "OP_Eingangsrechnungen" erfasst werden.
Hier wird wieder der Status "skontofähig", "berechnet" oder "fällig" automatisch anhand der im Lieferantenstamm für den Lieferanten festgelegten Fristen gesetzt.  
Es können Zahlungslisten und Listen entsprechend den Filtereinstellungen ausgegeben werden.

**Controlling**  
Mit diesem Modul lassen sich die tatsächlich angefallenen Leistungen für die einzelnen Projekte erfassen.  
Anhand der erfassten Daten können dann Aufmaße, Rechnungen, usw. erstellt werden.  
Die erfassten Daten werden mit im Modul "Projekte" ausgewertet und zeigen da den aktuellen Stand des Projektes.  

**Korrespondenz**  
Mit diesem Modul lassen sich einfache Dokumente erstellen.  
Für direktes Faxen, kann mit der Option "Signum drucken" eine Grafik mit Unterschrift in das Dokument eingefügt werden.  
Mit der Option "Serienbrief" wird ein Serienbrief-Dokument erzeugt,  mit allen Empfängern, die im Serienbrief-Verteiler eingetragen sind.
Es können verschiedenen Serienbriefverteiler angelegt und mit Namen gespeichert werden.

**Einstellungen**  
Hier können alle Firmen-Daten eingetragen werden. Weiterhin lassen sich hier die URL zur Logo-Datei und zur Signum-Datei einstellen.  
Ich verwende ein Logo in dem Format BxH 210x 23 mm.  
Für andere Formate und Positionen der Logo-Grafik müsste man etwas experimentieren.

**Preislisten**  
Mit diesem Modul lassen sich einzelne Artikelgruppen markieren, aus denen dann eine Preisliste gedruckt werden kann.  

**Import**  
Zur Zeit lassen sich damit nur GEAB und Datanorm Dateien in den Leistungsstamm importieren.  
      
**LDAP-Anbindung der gesamten Kontaktdaten mittels back-sql an OpenLDAP**  
      
**Anbindung an Fax-Server Hylafax optional über yajhfc**  

**Mehr-Mandantenbetrieb**  
Es können mit dieser Software für mehrere Firmen Instanzen angelegt werden

Viel Spaß
