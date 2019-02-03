* Encoding: UTF-8.

*********************** SPSS CURSUS ***********************.
*** Les 2.
* Onderwerpen:
* A. Meer data.
* B. Beschrijvende statistiek en data opschonen.
******************************************************************.









********************** A. MEER DATA! **********************

* Terwijl jij nog lekker aan het genieten was van je vakantie, is je collega vol goede voornemens
*  op 2 januari vragenlijsten gaan invoeren. Niet wetende dat jij al begonnen was, heeft ze een nieuw
*  bestand aangemaakt en 500 vragenlijsten ingevoerd!!.
* Helaas heeft ze nog geen tijd genomen om het codeboek in te vullen en alle variabelen goed te omschrijven.
* Al het werk dat je in de vorige les gedaan hebt, moet je dus weer opnieuw doen!.










*                         ###OPDRACHT###.
* De nieuwe dataset is opgeslagen op 'I:\SPSS cursus\SPSS cursus\data\Brondata\2019-01-02_pat_tevr.sav'

* Bedenk een manier om het codeboek van de nieuwe dataset BINNEN 1 MINUUT weer ingevuld te krijgen.
* Als je oplossing langer dan 1 minuut duurt, dan is het niet de goede. Denk verder. :)
* NB: Je mag zo lang nadenken als je wil, maar je mag niet meer dan 1 minuut typen.









*                ###UITWERKING###.
* 1. Open de syntax van les 1 (de complete versie met gemaakte opdrachten). Heb je deze nog niet af,
*       kopieer dan de uitwerking van les 1 naar je syntax-map.
*  2. In het GET FILE commando in deze syntax, verander de bestandsnaam in:
*       'I:\SPSS cursus\SPSS cursus\data\Brondata\2019-01-02_pat_tevr.sav'.
* 3. Selecteer alle syntax (Ctrl+a) en voer deze uit (Ctrl+r).



* INSERT FILE='I:\SPSS cursus\SPSS cursus\syntax\uitwerkingen\1_openen_opslaan_omschrijven_incl_uitwerkingen_meer_data.sps'.









******** B. BESCHRIJVENDE STATISTIEK EN DATA OPSCHONEN **************.





* Waarschijnlijk staat het databestand incl metadata nog open, maar voor het geval dit niet zo is,
*  kunnen we het openen met een GET commando.
GET FILE='I:\SPSS cursus\SPSS cursus\data\pat_tevr_incl_metadata.sav'.
DATASET NAME patient_tevr WINDOW=FRONT.









* In de vorige les hadden we maar 10 rijen aan data, en was het vrij eenvoudig om in de data view een beeld te krijgen
*  van de verschillende respondenten en variabelen. Ook was het meteen duidelijk waar we zaken in de data moesten
*  opschonen/corrigeren (denk bijvoorbeeld aan de 'praktijkondersteu'). Nu hebben we ineens 500 rijen, dus een beeld krijgen
*  door naar de data view te staren werkt niet meer zo goed.

* Hoewel het altijd goed is om je data zo af en toe eens direct in de data view te bekijken, is het ook belangrijk
*  om zeker te weten dat je geen dingen over het hoofd ziet. Om alle rijen aan data verder te inspecteren kan je
*  daarom gebruik maken van beschrijvende statistiek.





* Bij beschrijvende statistiek kan je bijvoorbeeld denken aan:
*  het maken van frequentietabellen (FREQUENCIES) voor NOMINALE en ORDINALE variabelen,
*  en het uitdraaien van gemiddelde, minimum, maximum etc. voor SCALE variabelen.

* Meestal is er een voortdurende wisselwerking tussen beschrijvende statistiek en het opschonen van je data.
*  Je gebruikt eerst beschrijvende statistiek om problemen/fouten in je data op te sporen, dan schoon je deze
*  op, en ten slotte controleer je met beschrijvende statistiek weer of alles inderdaad opgeschoond is.






* De meest eenvoudige manier om dit te doen is om te kijken per variabele.
* Laten we eens kijken hoe dat in zijn werk gaat bij geslacht.

*!!!!! NOMINALE/ORDINALE variabele  ---> gebruik FREQUENCIES commando !!!!!.

* Het FREQUENCIES commando geeft je een telling van het aantal keren dat elke waarde in een variabele voorkomt.
* Het commando is heel simpel:
FREQUENCIES naam_van_variabele.
FREQUENCIES geslacht.






* Wil je indruk maken op je leidinggevende? Of gewoon zelf de resultaten graag visuaal zien?.
*  Voeg dan een barchart toe met 1 woord extra.
FREQUENCIES geslacht
  /BARCHART.

* NB: Voor nominale en ordinale variabelen is een barchart een geschikte grafiek. Voor scale variabelen is een histogram
*  meestal de eerste keus. We komen daar nog op terug bij rapportcijfer.


 
* In het outputvenster verschijnt nu een tabel (en een barchart).
* Omdat we de waarden 0 en 1 voor geslacht de value labels 'vrouw' en 'man' gegeven hebben, 
*  zie je deze labels in de tabel terug. Ook missende waarden hebben een aparte plek in de tabel.





* In de tabel zie je ook een aantal keren de waarde 11 staan. Waarschijnlijk heeft je collega in haar enthousiasme een paar
*  typfouten gemaakt. Hoewel je vermoedt dat deze waarden veranderd moeten worden in een 1, controleer je dat voor de
*  zekerheid in de vragenlijsten. Inderdaad, voor al deze respondenten is er een 11 ingevuld in plaats van een 1. Hierdoor weet
*  je dat je deze 11 voor alle patienten tegelijk kan opschonen/corrigeren.

* Er zijn verschillende manieren waarop je de 11 bij geslacht voor alle patienten in een 1 kan veranderen.
* Een manier is via het RECODE commando, dat werkt zo:
RECODE naam_van_variabele (oude_foute_waarde=nieuwe_correcte_waarde).
RECODE geslacht (11=1).



* Wanneer je dit commando hebt uitgevoerd, zijn je data echter nog niet meteen veranderd! Commando's waarmee
*  je je data verandert, zogenaamde transformations, worden door SPSS als het ware opgespaard totdat de nieuwe
* waarden echt door SPSS gelezen moeten worden (bijvoorbeeld bij het maken van een frequentietabel).
* Je kan dit ook rechtsonder in je scherm zien, daar staat 'Transformations pending'.

* Om de veranderingen door te voeren, kan je SPSS een commando geven waarvoor het de data moet lezen (bijv. FREQUENCIES geslacht),
*  of het EXECUTE commando. Het EXECUTE commando doet niets meer dan SPSS dwingen om alle transformaties direct uit te voeren.


* Laten we de frequencies van geslacht opnieuw bekijken om te zien of al onze elven veranderd zijn in mannen.
FREQUENCIES geslacht
  /BARCHART.






*                             ###OPDRACHT###.

* Voer hetzelfde FREQUENCIES --> RECODE --> FREQUENCIES proces uit voor de variabelen chronisch_ziek en opleidingsniveau.
* Bij chronisch_ziek kan je alle foute waarden veranderen naar een 1.
* Bij opleidingsniveau kan je foute waarden die beginnen met een 1, veranderen naar een 1. De waarde 4 kan je veranderen naar 3.



FREQUENCIES chronisch_ziek 
 /BARCHART.

RECODE chronisch_ziek (10=1).
RECODE chronisch_ziek (11=1).

FREQUENCIES chronisch_ziek 
 /BARCHART.






FREQUENCIES opleidingsniveau 
 /BARCHART.

RECODE opleidingsniveau (13=1).
RECODE opleidingsniveau (4=3).

FREQUENCIES opleidingsniveau 
 /BARCHART.





* Tip: Je kan via RECODE ook meerdere waarden tegelijk veranderen, dat gaat zo:
RECODE naam_van_variabele (oude_foute_waarde1=nieuwe_correcte_waarde1) (oude_foute_waarde2=nieuwe_correcte_waarde2).

*                     ###BONUSOPDRACHT###
* RECODE beide incorrecte waarden voor chronisch_ziek met 1 RECODE commando (dus tegelijkertijd op 1 regel).
* De oplossing ziet er dan zo uit.

RECODE chronisch_ziek (10=1) (11=1).
RECODE opleidingsniveau (13=1) (4=3).

* Je kan ook meerdere variabelen tegelijk invullen bij sommige commando's!. Zorg dan wel dat er een spatie tussen staat.
FREQUENCIES chronisch_ziek opleidingsniveau 
 /BARCHART.




















*                                    ###OPDRACHT###.
* Vergelijk de tabellen/grafieken van de variabelen chronisch_ziek en opleidingsniveau.
* Wat valt je op als je naar missende waarden kijkt?.




















* Laat SPSS weten dat -99 ook voor opleidingsniveau een missende waarde is.
* Weet je niet meer hoe dat ging? Spiek in les 1, kopieer het commando en pas de variabele aan.
MISSING VALUES opleidingsniveau (-99).
















*!!!!! SCALE variabele ---> gebruik MEANS, EXAMINE (en evt. FREQUENCIES) commando!!!!!.

* Om variabelen op het SCALE meetniveau te inspecteren kan je beginnen met het commando MEANS.
* MEANS is bijna net zo simpel als FREQUENCIES, je gebruikt het zo:
MEANS naam_van_variabele
 /CELLS COUNT MIN MAX MEAN STDDEV.

* Achter /CELLS kan je precies de verschillende statistieken opvragen die je wil hebben. Met /CELLS ALL
*  kan je alle beschikbare statistieken zien.


MEANS rapportcijfer
  /CELLS COUNT MIN MAX MEAN STDDEV.

* De means tabel in het output venster laat vervolgens het aantal waarden zien (N), de minimumwaarde,
*  maximumwaarde, gemiddelde (Mean) en de standaarddeviatie (Std. Deviation).








*                        ### OPDRACHT###.

* Inspecteer de tabel voor rapportcijfer eens, en hou daarbij in je achterhoofd dat respondenten gevraagd is
*  om een rapportcijfer tussen de 0 en de 10 te geven.

* Welke waarden zou je verwachten bij minimum, maximum en mean?.

* Als je andere waarden ziet dan verwacht, waar ligt dat aan?








* Wanneer een variabele op scale meetniveau relatief weinig unieke waarden heeft, kan het FREQUENCIES
*  commando soms ook goed inzicht geven. Probeer dit maar eens voor rapportcijfer. Als je wil kan je ook een
*  BARCHART of HISTOGRAM toevoegen.
FREQUENCIES rapportcijfer.

* Als je alleen het histogram wil zien zonder de tabel, kan je /FORMAT NOTABLE toevoegen aan de syntax.
FREQUENCIES rapportcijfer
  /FORMAT NOTABLE
  /HISTOGRAM.








*                            ###OPDRACHT###.

* Corrigeer alle incorrecte/onmogelijke waarden in de variabele rapportcijfer.
* Stel zo nodig ook missende waarden in.
* Controleer daarna met beschrijvende statistiek of rapportcijfer goed opgeschoond is.


* 75 veranderen naar 7.5 en 80 naar 8.0 is een keuze. Als het een typfout betreft, is het aanhouden
*  van de waarde in de vragenlijst het beste. Heeft de respondent daadwerkelijk 75 of 80 opgeschreven en
*  weet je niet zeker wat hij in gedachten had, dan moet je een beslissing/aanname maken.
* Veranderen naar -99 was dan bijvoorbeeld ook een optie geweest.
RECODE rapportcijfer (75=7.5) (80=8).
EXECUTE.
MISSING VALUES rapportcijfer (-99).






* Vond je minimum, maximum en gemiddelde wat saai? Of wil je je begeleider verrassen (of verwarren) met heel veel
* statistieken en figuren? Probeer dan eens het EXAMINE commando.
EXAMINE rapportcijfer
  /PLOT BOXPLOT HISTOGRAM.

* Behalve een heleboel statistieken, krijg je hiermee ook een histogram en een boxplot te zien.

* Een histogram laat de frequentie zien van de individuele waarden. Soms worden deze frequenties niet voor alle
*  individuele waarden gegeven, maar voor een range (bijv 7 tot 8). Dit laatste gebeurt echter niet bij rapportcijfer.

* Een boxplot geeft ook informatie over hoe de waarden in een variabele zijn verdeeld, maar doet dit aan de hand van
*  kwartielen (blokken met 25% van de data). Ook laat een boxplot de mediaan zien (de streep in het midden van de box)
*  en extreme waarden (zgn. outliers, weergegeven met sterretjes). Het nummer naast het sterretje is het casenummer van
*  de respondent die deze extreme waarde heeft. Het casenummer is het nummer dat in de data view helemaal links in de 
*  blauwe cellen staat.







******************** RECODE INTO ****************************.

* We gaan nu het RECODE commando iets uitbreiden en zien hoe we RECODE kunnen gebruiken om een
*  NIEUWE VARIABELE aan te maken. Hiervoor voegen we 'INTO' toe aan het commando.
* Dit is handig als je de originele variabele wil behouden en daarnaast een opgeschoonde of getransformeerde versie
*  wil toevoegen.

* Om dit te illustreren gaan we van de variabele 'rapportcijfer' een nieuwe variabele met drie categorieen
*  maken (onvoldoende, voldoende, goed). Als het cijfer onder de 6 is, dan is het onvoldoende, is het tussen de 6
*  en 7.5 , dan is het voldoende, en 7.5 of hoger is goed. Voor  de nieuwe variabele coderen we onvoldoende als 1,
*  voldoende als 2 en goed als 3.

RECODE rapportcijfer (0 THRU 5.9 = 1) (6 THRU 7.4 = 2) (7.5 THRU HIGHEST = 3) (ELSE = COPY) INTO rapportcijfer_categorie.
EXECUTE.


* Als je naar de data view kijkt zie je inderdaad een nieuwe variabele met waarden 1, 2 en 3... en 7.45?
* Dat is niet helemaal goed gegaan. Waarom denk je dat dit fout gaat?
* Verander bovenstaande syntax zodat dit opgelost wordt.
* Bekijk het ook eens met een frequentietabel.
FREQUENCIES rapportcijfer_categorie.

* Als je goed kijkt, zie je dat SPSS wel de waarden -99 heeft overgenomen (omdat we ELSE = COPY hebben meegegeven
*  in het RECODE commando), maar zich niet realiseert dat deze waarden als missende waarden gezien moeten worden.
* Dat moeten we dus voor deze nieuwe variabele weer opnieuw aan SPSS vertellen.
MISSING VALUES rapportcijfer_categorie (-99).











*                    ###OPDRACHT###.

* Zoals je misschien hebt gemerkt zijn we deze les ver uit de buurt gebleven van de variabele geboortedatum.
* Dit komt omdat datums soms een beetje tricky zijn, vooral bij het bewerken ervan.
* Tegelijkertijd is een datum ook maar gewoon een numerieke, scale variabele en werken de bijbehorende commando's gewoon.

* Inspecteer geboortedatum maar eens met behulp van de commando's voor scale variabelen.
* Wat valt je op?.

MEANS geboortedatum
 /CELLS COUNT MIN MAX MEAN STDDEV.

EXAMINE geboortedatum
 /PLOT BOXPLOT HISTOGRAM.







*                    ###OPDRACHT###.

* Ook de variabele zorgverlener hebben we nog niet geinspecteerd. Dit is een nominale variabele.
* Inspecteer de zorgverlener variabele en kijk wat je opvalt.

FREQUENCIES zorgverlener
  /BARCHART.

* Als je mogelijke problemen ziet met deze variabele, denk er dan eens over na hoe je deze zou kunnen
* oplossen met wat je in deze les geleerd hebt.








* Goed om te weten: Het DESCRIPTIVES commando is een snelle manier om count, min, max, mean en stddev
*  op te vragen. Helaas heeft het veel minder uitbreidingsmogelijkheden dan MEANS. Daarom gebruiken
*  we zoveel mogelijk het MEANS commando, om daarmee vertrouwd te raken.
* Descriptives werkt zo:.
DESCRIPTIVES rapportcijfer.


