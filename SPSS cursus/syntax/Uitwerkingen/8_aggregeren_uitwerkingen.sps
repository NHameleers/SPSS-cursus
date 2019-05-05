* Encoding: UTF-8.

* Les 8: Aggregeren.



* Vandaag hebben we het over aggregeren. 
* Heel letterlijk is aggreren eigenlijk het berekenen van statistieken/uitkomsten voor meerdere rijen in je data.

* In de praktijk heeft het alles te maken met het niveau van je analyse.
* Een voorbeeld, en hier gaan ook de voorbeelddata van vandaag over: 
* In een onderzoek heb je vaak te maken met meerdere niveaus. We hebben in dit geval data over:
* Meerdere consulten...
* ...voor patienten... 
* ...die zijn ingeschreven bij drie verschillende huisartsenpraktijken.
* Hierboven zie je 3 niveaus terug, van meest gedetailleerd (consulten) naar meest 'algemeen' (huisarts).

* Hoe zie je dit terug in je data?

* Open onderstaande twee datasets maar eens, dan nemen we dit verder onder de loep.



* Vul je werkdirectory in en run het CD commando.
CD 'I:\SPSS cursus\SPSS cursus'.

* Open onderstaande twee datasets.

*** 1.  PATIENTEN DATASET ***.
* In deze dataset staat in elke rij/case een patient.
* De variabelen geven dan ook kenmerken van de patient weer.
GET FILE="Data\Brondata\all_patients.sav".
DATASET NAME pat WINDOW=FRONT.

*** 2. CONSULTEN DATASET ***.
* In deze dataset staat in elke rij/case een consult.
* De variabelen geven dan ook kenmerken van het consult weer.
GET FILE="Data\Brondata\consultations.sav".
DATASET NAME cons WINDOW=FRONT.




* LET OP: Een dataset kan informatie bevatten over meerdere niveaus,
*  maar kan slechts op 1 niveau georganiseerd zijn!.

* Daarmee bedoel ik dat een rij in een dataset altijd 1 bepaald niveau heeft.
* Als je naar een dataset kijkt, is het dus belangrijk om je goed te realiseren waar een rij voor staat.
* Is het een persoon, een huisartsenpraktijk, een consult, etc...?.

* Qua terminologie wordt een rij in je data ook wel een case, record, of observation genoemd. 


* Kijk eens naar de twee geopende datasets.

* Patient:
* Op welk niveau is deze dataset georganiseerd? Wat is een rij?.
* Over welk van de drie niveaus bevat deze dataset informatie?.

* Consulten:
* Op welk niveau is deze dataset georganiseerd? Wat is een rij?.
* Over welk van de drie niveaus bevat deze dataset informatie?.








* Het lijkt misschien basic, maar het is goed om na te denken hoe je over de rijen in je data moet praten/denken.
* Daarom onderstaande oefening:.

* Kijk ook naar de informatie zelf (de variabelen) die de dataset bevat en realiseer je hoe je een rij kan lezen.
* Patient dataset, rij1: "Patient P01 heeft huisarts HA1, een leeftijd van 33 jaar en is een man."
* Consulten dataset, rij1: "Consult 1 was voor patient P01. De huisarts die het consult gaf was HA1. Het was een gewoon
consult en het onderwerp (de klacht/diagnose) was ICPC X15.

* Elke variabele kan je dus interpreteren als een kenmerk van het niveau van de case!.

* Patient dataset, rij 1: "De ID van patient in de eerste rij is P01."
* Patient dataset, rij 1: "De huisarts van patient in de eerste rij is HA1."
* Patient dataset, rij 1: "De leeftijd van patient in de eerste rij is 33 jaar."

* Consulten dataset, rij 1: "De ID van het consult in de eerste rij is 1."
* Consulten dataset, rij 1: "De patient behorend bij consult in eerste rij was P01."
* Consulten dataset, rij 1: "De huisarts die het consult in de eerste rij gaf was HA1".
* Consulten dataset, rij 1: "Het type van het consult in de eerste rij was een gewoon consult".




* Kijk een voor een naar onderstaande vragen. Met welke dataset kan je de vraag beantwoorden?.

* Hoeveel patienten zijn ingeschreven bij de drie huisartsen?

* Wat is de gemiddelde leeftijd per patient?

* Wat is het percentage vrouwen in deze patientpopulatie?

* Welke huisartsenpraktijk heeft de meeste patienten?

* Hoeveel consulten had elke patient?

* Welk percentage van de consulten was een visite?

* Wat is het gemiddeld aantal visites per patient?

* Hoeveel consulten waren voor ICPC T90.02?

* Hoeveel patienten hadden een consult voor ICPC T90.02?

* Hoeveel visites hebben er plaatsgevonden voor ICPC K86?

* Welke ziekte (icpc) is verantwoordelijk voor het hoogste aantal consulten?

* Hoeveel consulten had een patient gemiddeld voor ICPC T90.02?

* Hoeveel ziekten heeft een patient gemiddeld?




* Sluit dan de patienten data voorlopig.

DATASET CLOSE pat.
DATASET ACTIVATE cons.





*****  AGGREGEREN *****.

* Laten we eens proberen de volgende vragen te beantwoorden.

* 1. Hoeveel consulten had een patient gemiddeld? 
* 2. Hoeveel visites had een patient gemiddeld?.

* Waarom is onderstaand antwoord op vraag 2 niet correct?.
MEANS is_visit.
* Hoe zou je dat antwoord interpreteren?.


* Om deze te beantwoorden, moeten we eerst antwoord hebben op de vragen hieronder.

* Hoeveel consulten had elke patient?
* Hoeveel visites had elke patient?

* En daarvoor hebben we data nodig op patientniveau, niet op consultniveau.
* We gaan daarom de consulten data aggregeren naar patientniveau.

* In het menu vind je dit bij Data --> Aggregate.

* Eerst wordt een nieuwe dataset klaargezet met DATASET DECLARE.
DATASET DECLARE aantal_consulten_pp.
* En dan wordt de consulten dataset geaggregeerd.
* Bij BREAK vul je het niveau in waar je naartoe wil aggregeren. In ons geval is dat patient, omdat we in
*  onze geaggregeerde data een rij voor elke patient willen overhouden. Dit wordt ook wel 'break group' genoemd.
* De laatste twee regels van de syntax hieronder zijn de twee variabelen die we in die nieuwe dataset krijgen.
* aantal_visites wordt de som voor elke afzonderlijke patient (break group) van de is_visit variabele in de consultentabel.
* aantal_consulten wordt het aantal regels (N) voor elke afzonderlijke patient.
AGGREGATE
  /OUTFILE='aantal_consulten_pp'
  /BREAK=patient_id
  /aantal_visites=SUM(is_visit)
  /aantal_consulten=N.

DATASET ACTIVATE aantal_consulten_pp.
* Kijk maar eens wat er gebeurd is. Vergelijk het aantal regels in de nieuwe dataset met de consulten dataset.

* Misschien valt het je op dat onze nieuwe dataset maar 80 patienten bevat, terwijl de eerdere patienten dataset
*  99 patienten bevatte. Wat zou hier een verklaring voor kunnen zijn?.

* Met deze nieuwe dataset (aantal_consulten_pp) kan je vervolgens de twee vragen beantwoorden.
* 1. Hoeveel consulten had een patient gemiddeld? .
* 2. Hoeveel visites had een patient gemiddeld?.
MEANS aantal_consulten aantal_visites.





************ NOG EEN KEER AGGREGEREN ***********.

* Laten we dat nog eens proberen.

* Beantwoord de volgende vraag.
* hoeveel consulten heeft patient gemiddeld voor dm2?.

DATASET CLOSE aantal_consulten_pp.
DATASET ACTIVATE cons.

DATASET DECLARE aantal_dm2_pp.
AGGREGATE
  /OUTFILE='aantal_dm2_pp'
  /BREAK=patient_id
  /aantal_dm2_consulten=SUM(DM2_consult).

DATASET ACTIVATE aantal_dm2_pp.








* **************** EN NOG EEN KEER ***********.
* Hoeveel consulten voor dm2 heeft elke huisartsenpraktijk?.
* Wat is het gemiddeld aantal consulten voor dm2 per huisartsenpraktijk?.

DATASET CLOSE aantal_dm2_pp.
DATASET ACTIVATE cons.

DATASET DECLARE aantal_dm2_pprak.
AGGREGATE
  /OUTFILE='aantal_dm2_pprak'
  /BREAK=gp
  /aantal_dm2_consulten=SUM(DM2_consult).

DATASET ACTIVATE aantal_dm2_pprak.


* Kijk even naar de data voordat je verder gaat.


DATASET CLOSE aantal_dm2_pprak.
DATASET ACTIVATE cons.








********************* AGGREREN BINNEN DEZELFDE DATASET *********************.

* In alle bovenstaande voorbeelden zetten we de geaggregeerde waarden in een nieuwe dataset.
* Het is ook mogelijk om de geaggregeerde waarden toe te voegen in de bestaande dataset,
*  kijk maar eens naar onderstaand voorbeeld.

* Vraag: Selecteer alle consulten van patienten die meer dan 10 consulten hadden.

* Het doel is om CONSULTEN te selecteren, dus we moeten blijven werken in de consultentabel. Tegelijkertijd
*  moeten we het aantal consulten van elke patient weten. We zagen eerder dat we het aantal consulten van elke
*  patient in een aparte dataset (met patient als rij) konden weergeven.
* We kunnen deze informatie echter ook toevoegen aan de consulten dataset.
* De syntax is bijna hetzelfde. We hoeven echter niet dataset declare te gebruiken, en de outfile regel is een
*  beetje anders.
* Run het commando en kijk in de consulten dataset wat er gebeurd is.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=patient_id
  /aantal_consulten_pp=N.



* Je ziet dat de variabele aantal_consulten_pp nu is toegevoegd aan de consultendata. Wanneer er meerdere
*  rijen (consulten) zijn die bij eenzelfde patient horen, wordt de waarde van aantal_consulten_pp gewoon herhaald.

* Deze variabele kan je nu gebruiken om een selectie te maken van de consulten van patienten
*  die meer dan 10 consulten hadden. Bijvoorbeeld zo:.
SELECT IF aantal_consulten_pp > 10.
EXECUTE.









****************    OPDRACHTEN     ************************.

* Open de data opnieuw zodat we weer alle consulten gebruiken.
GET FILE="Data\Brondata\consultations.sav".
DATASET NAME cons WINDOW=FRONT.


* 1. Aggregeer de consulten data en beantwoord onderstaande twee vragen.
* Wat is het gemiddeld aantal gewone consulten (is_regular_cons) per patient?
* Wat is het hoogste aantal consulten (ongeacht consulttype) dat een patient heeft.
DATASET DECLARE aantal_consulten_pp.
AGGREGATE
  OUTFILE='aantal_consulten_pp'
  /BREAK=patient_id
  /aantal_gewone_consulten=SUM(is_regular_cons)
  /aantal_consulten=N.

DATASET ACTIVATE aantal_consulten_pp.

MEANS aantal_gewone_consulten aantal_consulten
  /CELLS=MEAN MAX.





* 2. Selecteer de consulten van patienten die minimaal 1 diabetes consult (dm2) hadden.
AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=patient_id
  /aantal_consulten_dm2=SUM(DM2_consult).

SELECT IF aantal_consulten_dm2 > 0.
EXECUTE.







* 3a. Open het bestand hieronder. Bekijk het en stel jezelf de volgende vragen:.
* Op welk niveau is dit bestand georganiseerd? Hint: dit is een ander niveau dan de drie die we al eerder zagen.
* Hoe zou je een rij lezen?.
GET  FILE='data\Brondata\chronic_illnesses.sav'.
DATASET NAME aandoeningen WINDOW=FRONT.

* ANTWOORD: Dit bestand is georganiseerd op aandoening. Om precies te zijn, op aandoening+patient (episode) combinatie.
* Rij 1 laat zien dat de eerste 'episode' bij patient P01 hoort, geregistreerd is door HA1 
*  en en de aandoening osteoporose betreft.



* 3b. Aggregeer de aandoeningen dataset om de volgende vraag te beantwoorden.
* Wat is het gemiddeld aantal aandoeningen per patient?.
* Hoeveel aandoeningen heeft de patient met de meeste aandoeningen?.
DATASET DECLARE aandoeningen_pp.
AGGREGATE
  OUTFILE='aandoeningen_pp'
  /BREAK=patient_id
  /aantal_aandoeningen=N.

DATASET ACTIVATE aandoeningen_pp.
MEANS aantal_aandoeningen
 /CELLS=MEAN MAX.



DATASET CLOSE aandoeningen_pp.






* 4. Kan je met een beetje voorbereiding voor het aggregeren ook achterhalen:
* Hoeveel patienten (en evt. welk percentage) osteoporose hebben?.
DATASET ACTIVATE aandoeningen.
COMPUTE is_osteo = aandoening = "Osteoporose".
EXECUTE.

DATASET DECLARE osteo_pp.
AGGREGATE
  OUTFILE=osteo_pp
  /BREAK=patient_id
  /heeft_osteo=SUM(is_osteo).

DATASET ACTIVATE osteo_pp.
ADD VALUE LABELS heeft_osteo
0 "Nee"
1 "Ja".

FREQUENCIES heeft_osteo.






* Nog 1 keer terug naar de consulten data.
GET FILE="Data\Brondata\consultations.sav".
DATASET NAME cons WINDOW=FRONT.

* Run onderstaande syntax tot vraag 5.
* Hier wordt de MEAN functie gebruikt bij het aggregeren van dm2 consulten in plaats van SUM.
DATASET DECLARE aantal_dm2_pprak.
AGGREGATE
  /OUTFILE='aantal_dm2_pprak'
  /BREAK=gp
  /dm2_consulten_mean=MEAN(DM2_consult).

DATASET ACTIVATE aantal_dm2_pprak.

* 5. Hoe interpreteer je de variabele dm2_consulten_mean in dataset aantal_dm2_pprak?.

* ANTWOORD: Als de proportie (het percentage) dm2_consulten per praktijk.

* Sluit de datasets die we niet meer nodig hebben.
DATASET CLOSE aantal_dm2_pprak.
DATASET CLOSE cons.
DATASET ACTIVATE aandoeningen.







******** HACKER EDITION: EXTRA UITDAGENDE OPDRACHTEN *********.

GET  FILE='data\Brondata\chronic_illnesses.sav'.
DATASET NAME aandoeningen WINDOW=FRONT.
* 5. Achterhaal, wederom met wat voorbereiding voorafgaand aan het aggregeren, hoeveel patienten
  zowel osteoporose als hart- en vaatziekten hebben. Gebruik de aandoeningen dataset.

COMPUTE osteo_dummy = aandoening = "Osteoporose".
COMPUTE hvz_dummy = aandoening = "HartVaatZiekten".
EXECUTE.

DATASET DECLARE aand_pp.
AGGREGATE
 OUTFILE='aand_pp'
 /BREAK=patient_id
 /aantal_osteo=SUM(osteo_dummy)
 /aantal_hvz=SUM(hvz_dummy).

DATASET ACTIVATE aand_pp.

COMPUTE osteo_en_hvz = SUM(aantal_osteo, aantal_hvz) = 2.
FREQUENCIES osteo_en_hvz.

* 7 patienten hebben osteoporose en hvz.






*************** EXTRA INFO: MEERDERE BREAK GROEPEN EN MEERDERE KEREN AGGREGEREN ********.

* Je kan ook meer dan 1 break variabele gebruiken. Wil je bijvoorbeeld voor elke patient het aantal consulten per
aandoening (icpc) tellen, dan is zowel patient als aandoening een break variabele.
* Kijk maar eens naar onderstaand voorbeeld.

GET FILE="Data\Brondata\consultations.sav".
DATASET NAME cons WINDOW=FRONT.

DATASET DECLARE aantal_cons_pp_per_icpc.
AGGREGATE
  OUTFILE='aantal_cons_pp_per_icpc'
  /BREAK=patient_id icpc
  /aantal_consulten=N.

DATASET ACTIVATE aantal_cons_pp_per_icpc.
  
* Deze dataset is dus georganiseerd op het niveau 'patient + icpc'. Elke unieke combinatie van patient en icpc
*  krijgt een eigen rij.




* Soms moet je op meerdere niveaus tegelijk aggregeren omdat het op zichzelf waarde heeft (zoals hierboven).
* Soms is het echter ook een tussenstap. Denk eens aan de volgende vraag:
* Voor hoeveel unieke icpc's heeft een patient consulten gehad?.
* Deze vraag is niet met 1 enkele aggregatie te beantwoorden. Wat je wel kan doen, is eerst het gedeelte hierboven
*  uitvoeren als tussenstap. In de daaruit voortkomende dataset (aantal_cons_pp_per_icpc) zit het antwoord namelijk.
* Het aantal rijen per patient in deze dataset is tevens het aantal unieke icpc's waarvoor een patient consulten heeft gehad.

* Als je deze dataset dus ook aggregeert, dan kan je het antwoord op de vraag vinden.
DATASET ACTIVATE aantal_cons_pp_per_icpc.
DATASET DECLARE aantal_unieke_icpcs_pp.
AGGREGATE
  OUTFILE='aantal_unieke_icpcs_pp'
  /BREAK=patient_id
  /aantal_unieke_icpcs=N.

DATASET ACTIVATE aantal_unieke_icpcs_pp.
