* Encoding: UTF-8.

* Les 4: Werken met tekst.



CD "I:\SPSS cursus\SPSS cursus".




* Je bent verantwoordelijk gemaakt voor het uitsturen van uitnodigingen voor een groot event.
*  Echter, de enige informatie die je over de deelnemers hebt gekregen is een lijst met
*  namen en emailadressen in het volgende formaat:.

*    "Achternaam, Voornaam (AFDELING) <voornaam.achternaam@maastrichtuniversity.nl>".

* Voor de uitnodigingen heb je voornaam, achternaam en emailadres in aparte kolommen nodig.
* Bovendien wil je baas graag ook weten hoeveel mensen van elke afdeling uitgenodigd worden.
* Ten slotte ben je nieuwsgierig naar de organisatie waar mensen in zitten. Dit kan je zien aan
*  de domeinnaam van het emailadres (bijv. "maastrichtuniversity.nl").

* In deze oefening ga je al deze losse benodigdheden (zoals voornaam, achternaam etc.) extraheren
*  uit die ene kolom waar alle informatie bij elkaar staat (emailzooitje).

* Als je de extra uitdagende versie van de oefeningen wil maken, begin dan hier bij de HACKER EDITION.
* Anders scroll je naar beneden naar de GEWONE VERSIE.



************************************** HACKER EDITION **********************************.

* Open dit databestand.
GET FILE="data\Brondata\emails_hacker_edition.sav".
DATASET NAME emails WINDOW=FRONT.

* Hint, lees de uitleg van de volgende functies (bij Transform -> Compute -> Function group -> String):
*     - CHAR.LENGTH
*     - CHAR.INDEX
*     - CHAR.SUBSTR
*     - REPLACE
*     - CONCAT
*     - LTRIM EN RTRIM.

* Waarschijnlijk niet nodig voor deze oefening, maar goed om te weten dat ze bestaan:
*     - CHAR.RINDEX
*     - CHAR.LPAD EN CHAR.RPAD



*                             ### OPDRACHT ###.

* Kijk in de variable labels welke data in elke kolom moeten komen (email_adres t/m afdeling), 
*  en extraheer deze informatie uit het emailzooitje.

* Extra uitdaging:
* Vul de bestaande variabelen in (email_adres t/m afdeling) zonder nog extra variabelen
*  in de dataset aan te maken.







************************************** GEWONE VERSIE**********************************.



* Open dit databestand.
GET FILE="data\Brondata\emails_normale_versie.sav".
DATASET NAME emails WINDOW=FRONT.


*** ACHTERNAAM.
* We gaan beginnen met achternaam uit het emailzooitje te halen.
* Dit 'probleem' kunnen we opdelen in een aantal kleinere stappen.

* Het is altijd goed om te proberen een patroon te zoeken dat voor alle rijen hetzelfde is.
* In het geval van achternaam zie je bijvoorbeeld dat het emailzooitje altijd lijkt te beginnen met de achternaam,
*  en bovendien gevolgd wordt door een komma. 

* Als we dus een manier kunnen vinden om SPSS het volgende te vertellen:
"Pak alle letters voor de eerste komma!"
dan hebben we een manier gevonden om achternaam uit het emailzooitje te halen.

* We kunnen dat tegen SPSS zeggen, maar helaas niet zo compact. Voor SPSS klinkt het meer als:
"1. Zoek de eerste komma. Op welke plek in het woord staat deze?
2.  Hoeveel tekens zitten er nog voor deze plek?
3. Selecteer precies dat aantal tekens uit emailzooitje, vanaf de eerste letter".

* En nu in commando's:
1. positie van de eerste komma vinden we met behulp van de formule CHAR.INDEX(). Die werkt zo:
CHAR.INDEX(tekst_waarin_je_wil_zoeken, tekst_of_letter_die_je_wil_zoeken).
* CHAR.INDEX geeft je vervolgens een nummer terug, de startpositie van de tekst_of_letter_die_je_wil_zoeken,
*  of 0 als het niks gevonden heeft.

COMPUTE positie_eerste_komma = CHAR.INDEX(emailzooitje, ",").
EXECUTE.
* Kijk maar eens in de data wat je hiermee gemaakt hebt.

* Realiseer je dat je met behulp van deze variabele en wat je tot nu toe geleerd hebt al allerlei vragen 
*  over deze data zou kunnen beantwoorden, zoals:
* Wie heeft de kortste en wie de langste achternaam?
* Wat is de gemiddelde lengte van de achternaam?.

* 2. Dan het aantal tekens voor de komma, dat is simpelweg de positie van de komma minus 1.
COMPUTE tekens_voor_komma = positie_eerste_komma - 1.
EXECUTE.
* Check even of dit goed gegaan is.

* 3. Dan blijft nog over: "Selecteer precies dat aantal tekens uit emailzooitje, vanaf de eerste letter".
* Dit doen we met behulp van de functie CHAR.SUBSTR, die werkt als volgt:
CHAR.SUBSTR(tekst_waaruit_je_wil_selecteren, positie_waar_je_wil_beginnen_met_selecteren, aantal_tekens_dat_je_wil_selecteren).
* CHAR.SUBSTR geeft je vervolgens het stuk tekst wat je gevraagd hebt.

* Voor achternaam werkt dat dan zo:.
* We maken eerst een nieuwe tekstvariabele aan om achternaam in te bewaren. Omdat het hier om tekst gaat,
*  doet COMPUTE dat niet voor ons.
STRING achternaam (A30).
VARIABLE LABELS achternaam "De achternaam zonder tussenvoegsels (zoals van/de/der etc)".
* NB: De langste achternaam was 17 tekens, maar ik neem wat speelruimte. Misschien worden er in de toekomst
*  nog meer mensen toegevoegd.
COMPUTE achternaam = CHAR.SUBSTR(emailzooitje, 1, tekens_voor_komma).
EXECUTE.
* Wat zie je in je data?.

* NB: De positie_waar_je_wil_beginnen_met_selecteren is hier altijd 1. Het is goed om je te realiseren
*  dat je hier ook een variabele zou kunnen invullen, als je steeds ergens anders zou willen beginnen (bijv. straks
bij het apestaartje @).



* Ook hier geldt weer dat we niet per se alle tussentijdse variabelen hoeven aan te maken. We kunnen het hele
*  gebeuren ook in één keer schrijven. Je krijgt dan:.
STRING achternaam_in_1_keer (A30).
COMPUTE achternaam_in_1_keer = CHAR.SUBSTR(emailzooitje, 1, CHAR.INDEX(emailzooitje, ",") - 1).
EXECUTE.
* In plaats van tekens_voor_komma schrijf je dan dus meteen: CHAR.INDEX(emailzooitje, ",") - 1.







*** VOORNAAM (en de tussenvoegsels).
* Laten we verder gaan met voornaam.

* Wat is het patroon hier?.













* Van de komma die we al gevonden hadden...tot aan het eerste haakje (.

* Ook voor voornaam willen we weer CHAR.SUBSTR gebruiken, 
*  laten we nog even kijken wat we daarvoor nodig hebben:
CHAR.SUBSTR(tekst_waaruit_je_wil_selecteren, positie_waar_je_wil_beginnen_met_selecteren, aantal_tekens_dat_je_wil_selecteren).
* 1. tekst_waaruit_je_wil_selecteren: dat is de variabele emailzooitje.
* 2. positie_waar_je_wil_beginnen_met_selecteren: dat is in dit geval 1 positie VERDER dan
*  de komma die we gevonden hadden. We tellen hier dus 1 bij op, dan hebben we de positie achter de komma.
COMPUTE startpositie_voornaam = positie_eerste_komma + 1.
EXECUTE.
* 3. aantal_tekens_dat_je_wil_selecteren: deze is even tricky. Als we niet goed opletten, gebruiken we hier misschien
*     gewoon de positie van het eerste haakje en denken we dat we klaar zijn.
COMPUTE positie_eerste_haakje = CHAR.INDEX(emailzooitje, "(").
EXECUTE.
* Stel dat we dat inderdaad zo even snel doen...
* We maken weer een lege tekstvariabele.
STRING voornaam_even_snel (A40).
VARIABLE LABELS voornaam_even_snel "De voornaam inclusief de tussenvoegsels".
* En gebruiken gewoon positie_eerste_haakje voor aantal_tekens_dat_je_wil_selecteren.
COMPUTE voornaam_even_snel = CHAR.SUBSTR(emailzooitje, startpositie_voornaam, positie_eerste_haakje).
EXECUTE.
* Wat levert dat op? Kijk eens in je data.














* Oeps, dat ging niet helemaal lekker. 'Even snel' werkt zelden als je met data bezig bent.
* 'Rustig en heel precies' is meestal de betere methode.
* Wat ging er fout?
* Als derde argument bij CHAR.SUBSTR hebben we positie_eerste_haakje ingevuld. Daardoor selecteren
*  we teveel tekens. 

* Hoeveel tekens willen we dan precies selecteren?.













* Eigenlijk willen we het aantal tekens tussen startpositie_voornaam en dat eerste haakje.
* In 'rekenvorm' maakt dat: positie_eerste_haakje - startpositie_voornaam.
COMPUTE aantal_tekens_voornaam = positie_eerste_haakje - startpositie_voornaam.
EXECUTE.
* Laten we nog eens voornaam aanmaken.
STRING voornaam_rustig_en_precies (A40).
VARIABLE LABELS voornaam_rustig_en_precies "De voornaam inclusief de tussenvoegsels".
COMPUTE voornaam_rustig_en_precies = CHAR.SUBSTR(emailzooitje, startpositie_voornaam, aantal_tekens_voornaam).
EXECUTE.


* Dat lijkt er meer op, maar er zit toch nog iets niet helemaal lekker. Valt je nog iets geks op?.
















* Alle voornamen beginnen met een spatie. En waarschijnlijk zitten er aan het einde van de voornaam 
*  ook nog wat spaties verstopt. Die kunnen we maar beter proberen weg te halen.
* Hiervoor heb je twee functies:
* 1. LTRIM(variabele_waarvan_je_spaties_aan_begin_wil_weghalen)
LTRIM staat voor Links trimmen/weghalen van spaties (of andere tekens, maar dan moet je dat specifiek aangeven).
*2.  RTRIM(variabele_waarvan_je_spaties_aan_einde_wil_weghalen)
RTRIM staat voor...je raadt het al.

* Hoe passen we dat nou toe?.
COMPUTE voornaam_rustig_en_precies = LTRIM(voornaam_rustig_en_precies).
COMPUTE voornaam_rustig_en_precies = RTRIM(voornaam_rustig_en_precies).
EXECUTE.

* Je kan dat ook allebei tegelijkertijd, als je niet duizelig wordt van veel haakjes.
COMPUTE voornaam_rustig_en_precies = LTRIM(RTRIM(voornaam_rustig_en_precies)).
EXECUTE.

* Kijk nog maar eens in je data hoe de namen er nu uitzien.












* Ons databestand is een beetje rommeltje geworden met heel veel variabelen, terwijl we eigenlijk alleen
*  voornaam en achternaam wilden maken.

* Laten we eerst wat overbodige variabelen verwijderen.
DELETE VARIABLES positie_eerste_komma
    tekens_voor_komma
    achternaam_in_1_keer
    startpositie_voornaam
    positie_eerste_haakje
    voornaam_even_snel
    aantal_tekens_voornaam.

* En dan voornaam_rustig_en_precies in 'voornaam' veranderen.
RENAME VARIABLES voornaam_rustig_en_precies = voornaam.



* NB: Ook voornaam zou je zonder 'tussenvariabelen' kunnen maken, maar dat wordt wel een behoorlijk lang commando.
* Dit is niet altijd aan te raden, omdat het minder leesbaar is.
* Ik weet hier twee 'oplossingen' voor. Mochten jullie andere ideeen/oplossingen hebben, hoor ik het graag.
* Die 'oplossingen' staan onderaan dit syntaxbestand. We gaan nu eerst verder met oefenen.





* Dit is een mooi moment om ook een variabele met de volledige naam aan te maken.
STRING volledige_naam (A75).
VARIABLE LABELS volledige_naam "De naam netjes geschreven, dus voornaam tussenvoegsels achternaam".
* Je kan dit doen met behulp van de functie CONCAT(). Hiermee kan je meerdere stukken tekst samenvoegen.
COMPUTE volledige_naam = CONCAT(voornaam, " ", achternaam).
EXECUTE.
* Merk op dat ik de functie niet alleen voornaam en achternaam als input geef, 
*  maar ook bewust een spatie ertussen zet.






*                ### OPDRACHTEN ###.

* Extraheer het gehele emailadres uit emailzooitje. Gebruik de volgende functies:
* CHAR.INDEX       
* CHAR.SUBSTR.
STRING email_adres (A75).
VARIABLE LABELS email_adres "Het hele emailadres".
* jouw syntax komt hieronder...








* Extraheer het email_domein (alles achter het apestaartje @) uit email_adres.
* Je mag de variabele emailzooitje voor dit onderdeel dus NIET gebruiken!.
* Gebruik de volgende functies:
* CHAR.INDEX
* CHAR.LENGTH(email_adres)        
* CHAR.INDEX.
STRING email_domein (A75).
VARIABLE LABELS email_domein "Het domein van het emailadres, dus alles achter apestaartje".
* jouw syntax komt hieronder...
 
* Extraheer de afdeling uit emailzooitje.
STRING afdeling (A10).
VARIABLE LABELS afdeling "De afdeling. Staat meestal tussen haakjes (bijv. HSR of SOCMED)".
* jouw syntax komt hieronder...


* Wil je iets meer uitdaging? Probeer dan eens om afdeling weer te geven in Titlecase.
* Titlecase (soms ook wel Propercase genoemd) wil zeggen dat de eerste letter van 
*  een woord een hoofdletter is, en de rest kleine letters. Je krijgt dan dus:
Hsr
Socmed
Vvd
Sp
etc.





* Andere uitdaging:.
* Lees het stuk hieronder over het aanmaken van variabelen zonder tussenvariabelen
*  in je data te zetten.
* Maak vervolgens alle variabelen opnieuw aan (achternaam t/m afdeling) zonder dat
* tussenvariabelen in je data zichtbaar worden.




************** VARIABELEN MAKEN ZONDER TUSSENVARIABELEN IN JE DATA *************************.

* 1. Eén oplossing om de tussenvariabelen in je data te vermijden is om alle functies direct
*     in elkaar te schuiven. Voor voornaam ziet dat er zo uit:.
STRING voornaam1 (A40).
COMPUTE voornaam1 = LTRIM(RTRIM(CHAR.SUBSTR(emailzooitje,
                                                                         CHAR.INDEX(emailzooitje, ",") + 1,
                                                                         CHAR.INDEX(emailzooitje, "(") - (CHAR.INDEX(emailzooitje, ",") + 1)))).
EXECUTE.
* Dit is moeilijk leesbaar. Een tip om het iets leesbaarder te maken is om niet alles op 1 regel te zetten, maar dan nog...

DELETE VARIABLES voornaam1.

* 2. Een tweede manier is om de tussenvariabelen te laten beginnen met een hekje (#).
* SPSS maakt ze dan 'achter de schermen' wel aan, maar ze komen niet tevoorschijn in je data.
* Het zijn eigenlijk tijdelijke variabelen.
* Voor voornaam ziet dat er zo uit:.
STRING voornaam2 (A40).
COMPUTE #positie_eerste_komma = CHAR.INDEX(emailzooitje, ",").
COMPUTE #startpositie_voornaam = #positie_eerste_komma + 1.
COMPUTE #positie_eerste_haakje = CHAR.INDEX(emailzooitje, "(").
COMPUTE #aantal_tekens_voornaam = #positie_eerste_haakje - #startpositie_voornaam.
COMPUTE voornaam2 = CHAR.SUBSTR(emailzooitje, #startpositie_voornaam, #aantal_tekens_voornaam).
EXECUTE.
* Kijk maar eens in je data, het enige wat tevoorschijn is gekomen, is voornaam.
* Trimmen blijft hetzelfde, want dat doe je op de variabele die in je data staat.
COMPUTE voornaam2 = RTRIM(LTRIM(voornaam2)).
EXECUTE.


DELETE VARIABLES voornaam2.







*********************** OVERZICHT NIEUWE FUNCTIES UIT DEZE LES *************************************.

* 1. CHAR.INDEX(tekst_waarin_je_wil_zoeken, tekst_of_letter_die_je_wil_zoeken).
* Geeft een nummer terug: de startpositie van tekst_of_letter_die_je_wil_zoeken,
* of 0 als tekst_of_letter_die_je_wil_zoeken niet voorkomt in tekst_waarin_je_wil_zoeken.

* 2. CHAR.SUBSTR(tekst_waaruit_je_wil_selecteren, positie_waar_je_wil_beginnen_met_selecteren, aantal_tekens_dat_je_wil_selecteren).
* Geeft tekst terug: het stuk tekst in tekst_waaruit_je_wil_selecteren vanaf 
                              positie_waar_je_wil_beginnen_met_selecteren en
                              aantal_tekens_dat_je_wil_selecteren lang.

* 3. LTRIM(variabele_waarvan_je_spaties_aan_begin_wil_weghalen)
LTRIM staat voor Links trimmen/weghalen van spaties (of andere tekens, maar dan moet je dat specifiek aangeven).
* 4. RTRIM(variabele_waarvan_je_spaties_aan_einde_wil_weghalen)
RTRIM staat voor...je raadt het al.

* 5. CONCAT(tekst_of_tekstvariabele1, tekst_of_tekstvariabele2, etc).
* Geeft tekst terug: alle stukken input (tekst_of_tekstvariabele1, tekst_of_tekstvariabele2 etc) aan elkaar geplakt.

* 6. LENGTH(tekst_of_tekstvariabele).
* Geeft een nummer terug: de lengte (het aantal tekens) van tekst_of_tekstvariabele.



