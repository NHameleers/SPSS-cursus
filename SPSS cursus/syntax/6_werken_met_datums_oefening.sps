* Encoding: UTF-8.

**** LES 6: WERKEN MET DATUMS ***.



* Stel de juiste werkdirectory in met het CD commando.
CD 'I:\SPSS cursus\SPSS cursus'.

* Run de scripts van les 1 en 2 nogmaals via onderstaande regel.
INSERT FILE='syntax\uitwerkingen\locatie_onafhankelijke_versie_les_1_en_2.sps'.

* Zie je geen (belangrijke) errors? Sluit dan het outputscherm.
OUTPUT CLOSE ALL.



************************* WAT IS EEN DATUM (IN SPSS) EIGENLIJK? *****************************.
* Voordat we echt aan datums gaan sleutelen, is het goed om even na te denken wat een datum precies is.
* Datums zijn achter de schermen ingewikkelder dan ze lijken. Denk aan dingen als: Heeft een jaar altijd 365 dagen?.
* Wanneer begint een datumtelling?.

* In SPSS zijn datums eigenlijk gewoon nummers, en wel het aantal seconden sinds 14 oktober 1582. 
* Waarom 14 oktober 1582? Dat is het begin van onze Gregoriaanse kalender, en is door IBM, de makers van SPSS
* gekozen als ijkpunt om met datums te werken (https://nl.wikipedia.org/wiki/Gregoriaanse_kalender).
* Dit ijkpunt is dus zelf gekozen, en is specifiek voor SPSS. Excel bijvoorbeeld gebruikt (in windows) 1 januari 1900
 als ijkpunt (zie https://support.office.com/en-us/article/date-systems-in-excel-e7fe7167-48a9-4b96-bb53-5612a800b487).

* Een datum is dus altijd dat aantal seconden, maar deze kan je weergeven als datum. Het enige wat dus verandert
*  is het format, maar niet de achterliggende waarde. Net zoals je in Word een woord cursief of vet zou drukken, of in
*  Excel de kleur van een cel aanpast bijvoorbeeld.

* Kijk maar eens naar de variabele geboortedatum in je data. Nu ziet deze eruit als datum.
* Je kan deze met onderstaand commando als nummer weergeven.
FORMATS geboortedatum(F1).

* Kijk nog maar eens in de data.
* Met onderstaand commando kan je ze weer als datum weergeven. Merk op dat je verschillende weergaven kan kiezen.

* Bijvoorbeeld zo.
FORMATS geboortedatum(DATE11).
* Of zo ('European date').
FORMATS geboortedatum(EDATE10).
* Amerikaans format kan natuurlijk ook (maand-dag-jaar).
FORMATS geboortedatum(Adate10).
* Of een format wat ook als tekst sorteerbaar kan zijn.
FORMATS geboortedatum(SDATE10).

* Ok, laten we voor nu maar even met de Europese weergave verderwerken.
FORMATS geboortedatum(EDATE10).


* Omdat datum achter de schermen eigenlijk gewoon een nummer (aantal seconden) is, kan je er dus ook mee rekenen.
* Wil je bijvoorbeeld iedereen een dag ouder maken? Voeg dan 86400 seconden (1 dag) toe aan geboortedatum.
COMPUTE geboortedatum = geboortedatum + 86400.
EXECUTE.


******************************** DATUM FUNCTIES ************************************.
* Rekenen met datums kan echter wat makkelijker met een aantal speciaal daarvoor gemaakte functies.
* Deze zullen we stuk voor stuk nalopen.


****************** NU: $TIME ***************************
* De eenvoudigste manier om een nieuwe datumvariabele te maken is om de huidige datum in te vullen.
* Dit kan met $TIME.
COMPUTE vandaag = $time.
EXECUTE.
* Als je in je data kijkt, zie je dat dit nog niet wordt weergegeven als datum. Dat veranderen we weer met FORMATS.
FORMATS vandaag (EDATE10).


**************** EEN SPECIFIEKE DATUM: DATE.DMY() *************.
* Vaak wil je natuurlijk een andere datum invullen dan de huidige datum. Dit kan met de DATE.DMY() functie.
* Stel dat onze dataverzameling startte op 1 maart 2017. Dat is dan onze 'T0'.
COMPUTE T0_datum = DATE.DMY(1, 3, 2017).
EXECUTE.
FORMATS T0_datum (EDATE10).


************** EEN PERIODE (VERSCHIL TUSSEN DATUMS): DATEDIFF() *********************.
* Een van de meest voorkomende berekeningen met datums is het uitrekenen van leeftijd op een bepaalde dag.
* We willen graag de leeftijd in jaren op T0 uitrekenen. Dat kan met de DATEDIFF() functie, deze werkt als volgt:.
COMPUTE leeftijd_T0 = DATEDIFF(T0_datum, geboortedatum, 'years').
EXECUTE.
* Leeftijd hoeven we niet in decimalen weer te geven, dus...
FORMATS leeftijd_T0 (F3.0).


* Merk even op dat je DATEDIFF moet vertellen in welke eenheden het verschil moet worden weergegeven.
* Wij kozen voor 'years' omdat we leeftijd in jaren wilden, maar je kan het verschil tussen de datums ook weergeven
*  in kwartalen, maanden, weken, dagen, uren, minuten of seconden.



************* EEN PERIODE BIJ DATUM OPTELLEN OF AFTREKKEN: DATESUM() **********.
* Met de DATESUM() functie kan je een periode bij een datum optellen. Wil je een periode ervan aftrekken, vul dan
*  een negatief getal in.

* Bijvoorbeeld: T1 is 6 maanden na T0. We berekenen T1_datum door 6 maanden op te tellen bij T0_datum.
COMPUTE T1_datum = DATESUM(T0_datum, 6, 'months').
EXECUTE.
FORMATS T1_datum (EDATE10).


* Of stel dat we die ene dag die we hadden opgeteld bij geboortedatum weer eraf willen halen.
COMPUTE geboortedatum = DATESUM(geboortedatum, -1, 'days').
EXECUTE.






************ EEN BEPAALD STUK UIT DATUM HALEN:  XDATE.STUK() *****************.
* Met XDATE kan je een stuk/component uit een datum halen. Dit kan bijvoorbeeld de maand zijn, het jaar, of een
* van vele andere opties. Kijk maar eens bij Transform --> Compute variable --> Function groups --> Date Extraction.

* Voor elk stuk van een datum dat je wil extraheren is er een eigen functie.
* Voor jaar is dat XDATE.YEAR(datumvariabele).
* Voor maand XDATE.MONTH(datumvariabele).
* Voor kwartaal XDATE.QUARTER(datumvariabele). etc etc....

* Stel dat we het jaar willen extraheren waarin mensen geboren zijn.
COMPUTE geboortejaar = XDATE.YEAR(geboortedatum).
EXECUTE.
FORMATS geboortejaar (F4.0).

* of de maand.
COMPUTE geboortemaand = XDATE.MONTH(geboortedatum).
EXECUTE. 
FORMATS geboortemaand (F2.0).


COMPUTE geboortedag = XDATE.MDAY(geboortedatum).
EXECUTE. 
FORMATS geboortedag (F2.0).



* TODO: verder uitwerken.
* Hoeveel mensen zijn op de 20e geboren in maart of april?
* Hoeveel mensen zijn op 20 maart geboren of in april?. 
COMPUTE jarig_op_20_maart = geboortedag = 20 AND (geboortemaand = 3 OR geboortemaand = 4).
FREQUENCIES jarig_op_20_maart.




*************** VAN TEKST NAAR DATUM ******************.
* Soms heb je datum ingeladen in je data als tekstvariabele en moet je deze nog omzetten 
* naar een 'echt' numeriek datumformat.

* Omdat we zo'n tekstvariabele niet hebben in onze dataset, maken we deze hier eerst aan.
STRING datum_als_tekst (A11).
COMPUTE datum_als_tekst = "20-8-2018".
EXECUTE.

* Ok, nu hebben we dus een variabele datum_als_tekst in onze dataset. Dit is een tekst (STRING) variabele, maar
*  we willen het liefst dat SPSS weet dat dit een datum is. Het datumtype moeten we dus veranderen naar numeriek met
*  een van de datum formats.

* Dit zouden we zelf kunnen doen met functies die we eerder geleerd hebben, maar in dit geval is het ook wel handig
* om het menu te gebruiken. Onderstaande syntax is gemaakt door de volgende stappen in het menu te volgen.
* Klik op Transform --> Date and time wizard.
* Kies 'Create a date/time variable from a string containing a date or time'
* Klik Next
* Variables: Kies datum_als_tekst
* Kijk naar de sample values en kies bij Patterns het juiste formaat. In dit geval is dat dd-mm-yyyy. 
* Het maakt bij het patroon niet uit of je in je tekst streepjes, slashes, punten hebt. 
* Het gaat meer om de volgorde van dag-maand-jaar en of deze worden weergegeven met twee, drie of vier cijfers/letters. 
* Klik Next
* Vul bij Result variable de naam van de nieuwe variabele in, ik koos voor datum_als_datum.
* En kies het output format, ik koos EDATE10 omdat we dat ook voor de andere datums hadden gebruikt.
* Je kan als je wil ook meteen een omschrijving van de variabele invullen bij Variable Label.
* LET OP!! Kies bij Execution voor “Paste the syntax into the syntax window”, anders wordt je datum 
* wel aangemaakt maar krijg je niet de bijbehorende commando’s in je script.
* Klik Finish.

* Onderstaande syntax verschijnt dan.
* Eigenlijk is de eerste regel de enige waar de echt belangrijke verandering plaatsvindt. De rest is invullen van 
*  meta data (in de variable view). Kijk maar eens welke commando's je herkent uit les 1.
COMPUTE datum_als_datum=number(datum_als_tekst, DATE10).
VARIABLE LABELS datum_als_datum ''.
VARIABLE LEVEL  datum_als_datum (SCALE).
FORMATS datum_als_datum (EDATE10).
VARIABLE WIDTH  datum_als_datum(10).
EXECUTE.









******************* EEN DATUM INSTELLEN ALS MISSENDE WAARDE ********************.
* Bij numerieke variabelen kunnen we een nummer kiezen dat als missing gezien wordt (bijv. -99, 999, 888 etc).
* Hoe gaat dat bij datums? In onze dataset lijkt een aantal keren 1 jan 1800 voor te komen.
* Dat kan je zien als je de data op geboortedatum sorteert.
SORT CASES BY geboortedatum (A).
* Kijk maar eens in de bovenste rijen in de dataset.

* Het zou mooi zijn als we zo'n datum kunnen instellen als missende waarde.
* Een logische manier om dit te proberen zou kunnen zijn.
MISSING VALUES geboortedatum (DATE.DMY(1,1,1800)).
* Maar dat werkt niet. SPSS begint meteen flink te klagen met allerlei errors.

* Hoe dan wel? We zagen eerder al dat datums eigenlijk gewoon nummers zijn.
* Welk nummer heeft 1 januari 1800?. Zorg dat de data gesorteerd zijn, zodat 1 jan 1800 in de eerste rij staat.
SORT CASES BY geboortedatum (A).
FORMATS geboortedatum (F1.0).
* Blijkbaar is dat 6854716800 seconden na 14 october 1582.
* Dat nummer kunnen we wel gebruiken in het MISSING VALUES commando.
MISSING VALUES geboortedatum (6854716800).
* Het format kunnen we weer terugveranderen, dat was alleen nodig om het nummer te vinden.
FORMATS geboortedatum (EDATE10).

* Als we nu een frequentietabel van geboortedatum opvragen, zien we (helemaal onderaan de tabel) dat
* 1 januari 1800 nu door SPSS als missende waarde wordt gezien!.
FREQUENCIES geboortedatum.







* ###################### OPDRACHTEN #########################.

* 1. Maak een variabele aan genaamd 'nu', die de tijd op dit moment weergeeft.


* 2. Hoeveel seconden zijn verstreken tussen 14 oktober 1582 en nu?



* 3. Reken uit hoeveel maanden zijn verstreken tussen T0_datum en vandaag.


* 4. Maak een variabele aan genaamd T2_datum. T2 is anderhalf jaar na T0. Gebruik hiervoor de DATESUM functie.



* 5. Hoe oud is de oudste persoon in de dataset. Kan je een manier bedenken om uit te vinden hoe oud deze persoon
*     vandaag is, uitgedrukt in maanden?.





