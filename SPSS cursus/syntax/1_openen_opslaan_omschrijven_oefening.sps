* Encoding: UTF-8.


*********************** SPSS CURSUS ***********************.
*** Les 1.
* Onderwerpen:
* A. Het syntaxvenster.
* B. Data openen
* C. Data opslaan.
* D. Variabele namen, labels/omschrijvingen en value labels.
******************************************************************.






************* A. HET SYNTAXVENSTER **************.

* Als je deze tekst lees dan kijk je naar het syntaxvenster van SPSS.
* Je kan het herkennen aan het oranje icoontje helemaal linksboven in het venster.
* Vanuit dit venster kan je allerlei commando's uitvoeren en daarmee data openen, 
* omschrijven, bewerken, koppelen, analyseren en opslaan.

* Omdat de commando's die je uitvoert hier allemaal bij elkaar (en in volgorde) in een script/syntax staan,
*  wordt dit meteen een soort logboek van alles wat je met je data hebt gedaan.
* Dat is heel waardevol, omdat je onderzoek daarmee reproduceerbaar blijft.
* Dat is niet alleen heel mooi om in je artikel te schrijven, maar vooral erg handig bij je dagelijkse werk met data.
* Omdat je alle stappen hebt opgeslagen, kan je namelijk altijd een stap terug zetten,
*  zonder dat je handmatig allerlei dingen opnieuw moet doen.
* Ook als je ergens een fout gemaakt blijkt te hebben, kan je deze corrigeren en 
*  alle andere stappen in slechts enkele seconden weer uitvoeren.
* Stel je eens voor dat je al die grafieken en tabellen niet meer met de hand opnieuw hoefde samen te stellen
*  wanneer je begeleider weer eens een verandering voorstelt!!.


* Je vraagt je misschien af waarom er voor iedere regel zo'n sterretje (*) staat. Het sterretje laat SPSS weten
*  dat deze regel geen commando is, maar een opmerking/comment. Daardoor negeert SPSS deze regels
*  wanneer we de syntax runnen/uitvoeren. 
* Hoewel opmerkingen door SPSS genegeerd worden, zijn ze wel nuttig voor ons. We kunnen ze gebruiken om tekst
*  en uitleg te geven bij de commando's, en ons logboek/script daarmee leesbaarder maken.


* Let er op dat je opmerkingen/comments, maar ook commando's, altijd laat eindigen met een punt.
* Anders weet SPSS niet dat de opmerking is afgelopen en er misschien een commando volgt.
* Doe dit ook wanneer je zin eindigt in een vraagteken, dubbele punt, uitroepteken of ander leesteken!. (<-- zo dus).






**************** B. DATA OPENEN *****************.
* De twee commando's hieronder (GET en DATASET NAME) zijn met de volgende vijf stappen gemaakt.
* 1. Klik linksboven op File --> Open --> Data.
* 2. Ga naar de 'data' map binnen je spss-cursus map.
* 3. Selecteer het bestand '2018-12-23_pat_tevr' (NIET dubbelklikken).
* 4. Klik op 'Paste'.
* 5. Verander in het DATASET NAME commando dat verschijnt in je syntaxvenster het woord 'DataSet0' (of 1, 2, 3...) in 'patient_tevr'.
* 6. Selecteer het hele commando (zowel GET als DATASET NAME) en druk op Control+R (of klik op de groene pijl in de menubalk: 'Run Selection').
GET
  FILE='I:\SPSS cursus\SPSS cursus\data\Brondata\2018-12-23_pat_tevr.sav'.
DATASET NAME patient_tevr WINDOW=FRONT.



* Als het goed is wordt er een nieuw venster geopend en zie je 10 regels in 7 kolommen aan data verschijnen.
* Linksonder zie je bovendien twee tabbladen: Data view en Variable view.

* Data view.
* De data view geeft je daadwerkelijke data weer, in dit geval de ingevoerde gegevens van elke respondent.
* Een rij in de data view (of record) geeft een respondent weer.
* Een kolom is in de data view een variabele (die bijvoorbeeld gelijk staat aan een vraag in je vragenlijst). 

* Variable view (ook wel dictionary of codeboek genoemd).
* De variable view geeft informatie over je variabelen (zgn. metadata). Deze view geeft dus GEEN informatie over respondenten.
* Een rij in de variable view geeft alle informatie over 1 variabele weer.
* Een kolom in de variable view staat gelijk aan een kenmerk van een variabele (zoals data type of label/omschrijving).







*********************** C. DATA OPSLAAN ************************.

* Om te voorkomen dat we per ongeluk het bronbestand overschrijven, slaan we het geopende bestand meteen op onder een nieuwe naam.
* Ook als we dan per ongeluk op Save klikken, wordt het bronbestand in ieder geval niet overschreven.

* Je kan een databestand opslaan met het volgende commando:
SAVE OUTFILE='schijfletter:\mappen\naam_waaronder_je_bestand_wil_opslaan.sav'.

* Als je de SPSS cursus map op je I-schijf hebt staan, wordt het commando:.
SAVE OUTFILE='I:\SPSS cursus\SPSS cursus\data\pat_tevr_incl_metadata.sav'.

* Als je de SPSS cursus map op je Desktop/Bureaublad hebt opgeslagen, wordt het commando:.
* SAVE OUTFILE='C:\Users\voornaam.achternaam\Desktop\pat_tevr_incl_metadata.sav'.
* Haal in vorige regel het sterretje weg als je het bestand op je Desktop wil opslaan.


* Vind je het ingewikkeld om met zo'n adres (pad) van een bestand te werken?
*  Volg dan de onderstaande stappen om het bestand op te slaan.
 * 1. Ga naar het data venster (data view of variable view maakt niet uit).
 * 2. Klik op File --> Save AS (gebruik altijd Save AS, niet save).
 * 3. Ga naar de 'data' map binnen de spss-cursus map.
 * 4. Klik op Paste.
 * 5. Het onderstaande commando verschijnt dan in je syntax. Als je dat commando runt, wordt je databestand opgeslagen.
SAVE OUTFILE='I:\SPSS cursus\SPSS cursus\data\pat_tevr_incl_metadata.sav'
  /COMPRESSED.



**************** D. DATA OMSCHRIJVEN **********************.

* Om data begrijpelijk te maken en houden voor jezelf en voor anderen, is het belangrijk om aandacht te besteden aan de variable view.
* Probeer de variable view altijd zo compleet mogelijk in te vullen. Let hiervoor in ieder geval op de volgende velden:




*** 1. Label (omschrijving van de variabele).
* Geef alle variabelen een omschrijving, dit kan je doen met het VARIABLE LABELS commando.
* Het commando is als volgt opgebouwd:
VARIABLE LABELS naam_van_variabele "Omschrijving die je wil geven tussen aanhalingstekens". (sluit af met een punt).
VARIABLE LABELS respondentnummer "Uniek respondentnummer".
VARIABLE LABELS geslacht "Geslacht van respondent".
VARIABLE LABELS chronisch_ziek "Patient heeft een chronische aandoening".

*                 ###OPDRACHT###
* Label de overige drie variabelen als volgt:
* gebdatum: "Geboortedatum van patient".
* zorgverlener: "Zorgverlener die patient gezien heeft".
* rapportcijfer: "Rapportcijfer door patient aan zorgverlener gegeven (schaal van 0-10)".
*  opleidingsniveau: "Opleidingsniveau van patient".





*** 2. Values (omschrijving van de verschillende mogelijke waarden die een variabele kan aannemen).
* Vaak worden de mogelijke waarden van een variabele opgeschreven als cijfers. Dit zie je in de voorbeelddata bijvoorbeeld terug bij 
*  geslacht. Een 0 staat voor vrouw en een 1 staat voor man. Deze labels ('vrouw' en 'man') nemen we op in de variable view,
*  zodat we niet steeds hoeven te onthouden waar de 0 en waar de 1 voor staat.
* Dit gaat via het commando ADD VALUE LABELS, dat als volgt is opgebouwd:
ADD VALUE LABELS naam_van_variabele cijfer_0 "Omschrijving van cijfer 0, bijv vrouw" cijfer_1 "Omschrijving van cijfer 1, bijv man".
ADD VALUE LABELS geslacht
0 "vrouw"
1 "man".


*                             ###OPDRACHT###.
* Geef de variabele chronisch_ziek ook value labels. 0 staat voor "Nee" en 1 staat voor "Ja".

* Geef opleidingsniveau de volgende labels: 1=laag, 2=midden, 3=hoog.




*** 3. Missing values (missende waarden).
* Vaak wordt een bepaalde code (of meerdere codes) gebruikt om missende waarden aan te geven, bijvoorbeeld als een respondent een vraag niet heeft ingevuld.
* In de voorbeelddata is -99 ingevoerd (bij geslacht en chronisch_ziek) wanneer een waarde ontbreekt.
* We hebben SPSS echter nog niet laten weten dat -99 staat voor een missende waarde
* (je kan dit zien in de variable view bij 'Missing', daar is niks ingevuld).

* Je kunt SPSS laten weten dat je -99 als missing wilt beschouwen met het volgende commando:
MISSING VALUES naam_van_variabele (-99).
MISSING VALUES geslacht (-99).

*                             ###OPDRACHT###.
* Stel ook voor de variabele chronisch_ziek in dat -99 als missing beschouwd moet worden.





* 4. Data type.
* Er zijn verschillende soorten data types:
* Numeric voor numeriek. Voorbeelden hiervan zijn de variabelen rapportcijfer en geslacht.
* String staat voor tekst. Een voorbeeld hiervan is de zorgverlener variabele.
* Date staat voor datum. Een datum is eigenlijk gewoon een nummer, maar het is goed als SPSS weet dat het om een datum gaat, 
*  als je met de datums wil rekenen (bijv. leeftijd afleiden van geboortedatum).
* Het instellen en veranderen van het data type via syntax komen we nog op terug.




* 5a. Width en Decimals (breedte en decimalen) voor numerieke variabelen. 
* Voor numerieke variabelen geeft width het totaal aantal cijfers (incl decimalen) aan dat SPSS in de data view laat ZIEN. Het beinvloedt niet de daadwerkelijke
*  waarde die is ingevuld. Decimals geeft het aantal cijfers achter de komma aan dat SPSS laat ZIEN.

* Width en decimals instellen voor numerieke variabelen kan met het FORMATS commando.
* Wil je bijvoorbeeld voor rapportcijfer 2 cijfers voor de komma en 1 decimaal, dan wordt het format F3.1.
* Dat staat voor 3 cijfers in totaal (2 voor en 1 achter de komma) en 1 decimaal. Het commando ziet er dan zo uit:.
FORMATS rapportcijfer(F3.1).
* Of om respondentnummer een totale lengte van 8 cijfers te geven zonder decimalen.
FORMATS respondentnummer(F8.0).

*                             ###OPDRACHT###.
* Stel width en decimals van de volgende variabelen als volgt in:.
* geslacht: 1 cijfer voor de komma en 0 decimalen.
* chronisch_ziek: 1 cijfer voor de komma en 0 decimalen.
* opleidingsniveau: 2 cijfers voor de komma en 0 decimalen.
* rapportcijfer: 2 cijfers voor de komma en 2 decimalen.




* 5b. Width voor tekstvariabelen.
* Voor string/tekst variabelen is width het maximale aantal tekens dat een waarde kan hebben.
* Voor tekstvariabelen is het dus belangrijk om te zorgen dat de width
*  groot genoeg is om de langste waarde in de data niet af te kappen.
* De width van tekst variabelen is te veranderen met het ALTER TYPE commando.

* Als je bijvoorbeeld de width van variabele zorgverlener wil inkorten naar 17 tekens, kan dat zo:.
* Kijk voordat je het commando uitvoert eerst even naar rij 10 in je data,
*  en merk op dat bij zorgverlener 'praktijkondersteuner' is ingevuld.
ALTER TYPE zorgverlener(A17).
* Kijk nu nogmaals naar rij 10. Hoe ziet 'praktijkondersteuner' er nu uit?.

*                             ###OPDRACHT###.
* Verander de width van de zorgverlener variabele weer terug naar 20 tekens.

* Kijk nu nogmaals naar rij 10. Hoe ziet 'praktijkondersteuner' er nu uit? Is ie weer de oude?.

* Je hoeft de verandering in 'praktijkondersteuner' nu nog niet te corrigeren, dat doen we in een volgende les.







* 6. Columns (kolommen).
* Columns is de breedte van de kolom zoals die in de data view getoond wordt.




* 7. Align (uitlijnen).
* Geeft aan of een variabele rechts- of links uitgelijnd wordt.
* Standaard wordt rechts uitlijnen gebruikt voor cijfers, en links uitlijnen voor tekst.






* 8. Measure/Meetniveau.
* Er kunnen drie verschillende meetniveaus ingesteld worden: NOMINAL, ORDINAL EN SCALE.
* Achtergrondinformatie over meetniveau kan je hier vinden:
*   https://wetenschap.infonu.nl/wiskunde/116687-statistiek-meetniveaus-en-statistiek.html.

* Het meetniveau instellen kan met het volgende commando: 
VARIABLE LEVEL naam_van_variabele (MEETNIVEAU).
VARIABLE LEVEL respondentnummer (NOMINAL).
VARIABLE LEVEL gebdatum (SCALE).

*                             ###OPDRACHT###.
* Stel de volgende meetniveaus in voor de overige variabelen:
* geslacht: NOMINAL.
 * chronisch_ziek: NOMINAL.
 * zorgverlener: NOMINAL.
 * rapportcijfer: SCALE.
 * opleidingsniveau: ORDINAL.






* Name.
* Als je niet blij wordt van de naam van een variabele, kan je deze veranderen met RENAME VARIABLES, dat werkt zo:
RENAME VARIABLES naam_van_variabele = nieuwe_naam_van_variabele.
* Bijvoorbeeld om gebdatum te veranderen in geboortedatum:.
RENAME VARIABLES gebdatum = geboortedatum.







*********************** DATA OPSLAAN ************************.

* Na alle gemaakte veranderingen slaan we het bestand weer op.
SAVE OUTFILE='I:\SPSS cursus\SPSS cursus\data\pat_tevr_incl_metadata.sav'.







********************** SYNTAX OPSLAAN ***********************.

* Ga in het syntaxvenster naar File --> Save. Als het bestand al een naam heeft, is dit genoeg, anders volg je ook de volgende stappen.
* Dubbelklik op de map 'syntax' in de spss-cursus map.
* Geef het bestand zo nodig een naam.
* Klik op Save.

