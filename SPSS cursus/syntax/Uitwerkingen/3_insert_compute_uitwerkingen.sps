

* Encoding: UTF-8.

*********************** SPSS CURSUS ***********************.
*** Les 3.
* Onderwerpen:
* A. Het CD commando ('Change Directory')
* B. INSERT commando.
* C. Variabelen maken, opschonen of transformeren met COMPUTE.
* D. COMPUTE in combinatie met DO IF, (ELSE IF, ELSE,) END IF.
* E. AUTORECODE.
******************************************************************.





*************** Terugblik op de vorige lessen ********************.

* 1. Welk commando gebruik je voor beschrijvende statistiek bij nominale of ordinale variabelen?
* 2. Welk(e) commando('s) gebruik je voor beschrijvende statistiek bij scale (continue) variabelen?
* 3. Weet je nog hoe het RECODE commando werkte?.
* 4. En ook hoe je het RECODE commando kan gebruiken om een nieuwe variabele te maken?.


* Antwoorden:
* 1. FREQUENCIES
* 2. MEANS, DESCRIPTIVES, EXAMINE, soms FREQUENCIES.
* 3. RECODE naam_van_variabele (oude_foute_waarde=nieuwe_correcte_waarde).
* 4. RECODE naam_van_variabele (oude_foute_waarde=nieuwe_correcte_waarde) INTO naam_van_nieuwe_variabele.

**************************************************************************************.








************** Het CD commando *****************.


CD 'I:\SPSS cursus\SPSS cursus'.


* CD staat voor 'Change Directory'. Hiermee kun je een map als basislocatie aangeven.
* Als je dan vervolgens een bestand wil openen, zet SPSS deze locatie vooraan het pad dat je invult bij 'FILE='.

* Waar je dus eerst.
* GET FILE='I:\SPSS cursus\SPSS cursus\data\pat_tevr_incl_metadata.sav'.
* zou invullen (dat heet het absolute pad), gebruik je nu.
* GET FILE='data\pat_tevr_incl_metadata.sav'. (dat heet het relatieve pad).
* omdat het eerste deel van dat pad de basislocatie is. Dat stuk 'I:\SPSS cursus\SPSS cursus\' kan je nu weglaten.

* LET OP: In het CD commando zet je geen slash (/) aan het einde, maar in je GET FILE commando haal je wel een extra
*  slash weg.

* Klinkt ingewikkeld, waarom zou je dit doen?

* Het mooie hiervan is dat je nu maar 1 keer je schijf en projectmap hoeft aan te geven. Mensen die vanaf de E-schijf
* willen werken kunnen nu het CD commando veranderen naar...
* CD 'E:\SPSS cursus\SPSS cursus'.
* ...en dan werkt de rest van de syntax voor hun gewoon.

* Je kan nu ook je hele project verplaatsen als dat nodig mocht zijn, en je hoeft vervolgens in je syntax weer alleen het
* CD commando aan te passen. Dat is efficienter dan overal waar 'FILE=' staat de tekst te moeten veranderen.


* Nog een laatste LET OP...
* Als je syntax via het menu maakt, met Paste, dan plakt SPSS wel weer het absolute pad in de syntax.
* Je moet dit dan zelf aanpassen naar het relatieve pad.
* Een voorbeeld hiervan zal je zien als je de 'Extra opdrachten: Hacker edition' maakt onderaan dit bestand.



********************** INSERT (en verder werken waar we gebleven waren) ***********.

* Er zijn verschillende manieren om verder te werken waar we gebleven waren.

* 1. Opslaan en weer openen.
* Toen we met les 1 stopten hebben we het databestand opgeslagen, om dit aan het begin van les 2 weer te
*  openen. Dat werkte, maar als we dat voor iedere les zouden doen, zouden we ofwel het databestand 
*  steeds moeten overschrijven, of steeds een nieuwe bestandsnaam ('pat_tevr_na_les_2.sav' bijv) moeten
*  bedenken. In dat laatste geval krijgen we heel veel tussentijdse databestanden. Dat is niet zo efficient 
*  voor het gebruik van schijfruimte.
* Eigenlijk heb je deze methode alleen nodig als het runnen van de syntax heel lang duurt,
*  bijvoorbeeld bij echt grote databestanden of ingewikkelde analyses.

* 2. Alle voorgaande syntax runnen en dan verder werken aan de nieuwe syntax.
* Als het runnen van de syntax vrij snel gaat, kan je net zo goed alleen de voorgaande syntaxen/scripts
*  runnen en verder werken waar je gebleven bent. Dan hoef je eigenlijk helemaal geen databestanden
*  op te slaan behalve het bronbestand.
* In dit geval betekent deze methode dat we de syntaxen van les 1 en les 2 nogmaals runnen, en dan klaar
*  zijn om met les 3 te beginnen.

* Een truc om snel een hele syntax te runnen is het INSERT commando. Dat opent een syntaxbestand en
*  runt alle commando's die daarin staan. Zo kunnen we met onderstaande twee regels alle syntax uit 
*  les 1 en les 2 runnen, en zijn we klaar om met les 3 te beginnen.



INSERT FILE='syntax\uitwerkingen\locatie_onafhankelijke_versie_les_1_en_2.sps'.



* Deze INSERT commando's geven ons wel meteen een erg vol outputscherm. Nadat we hebben gechecked
*  of er geen errors zijn opgetreden bij het runnen van de INSERT commando's, kunnen we het outputscherm
*  (of meerdere outputschermen) sluiten met het volgende commando.
OUTPUT CLOSE ALL.

* Als je een nieuw outputscherm wil openen maar het oude nog niet wil sluiten, kan je OUTPUT NEW gebruiken.
OUTPUT NEW.







******************* Extra voorbeelddata maken ***************.

* In onze voorbeelddata zitten helaas geen lengte en gewicht, maar deze zijn wel uitermate geschikt als voorbeeld in
*  deze les. Daarom maak ik deze hier aan. Run onderstaande syntax tot aan 'Einde voorbeelddata maken'
*  en je hebt ineens een variabele lengte en een variabele gewicht in je data!.

* Het is niet de bedoeling dat je hier al precies begrijpt wat er allemaal gebeurt, maar aan het einde van deze les
*  kun je dit soort syntax waarschijnlijk wel beter begrijpen.

* set seed zorgt voor reproduceerbare willekeurige nummers (ja dat klinkt raar, maar klopt toch :) ).
set seed 1.

* Aanmaken lengte variabele. Mannen gemiddeld 180 cm, vrouwen gemiddeld 167.
DO IF geslacht = 0.
COMPUTE lengte=RND(RV.NORMAL(180, 10)).
ELSE IF geslacht = 1.
COMPUTE lengte=RND(RV.NORMAL(167, 8)).
END IF.

VARIABLE LABELS lengte "Lengte respondent in cm".
FORMATS lengte (F3.0).
MEANS lengte BY geslacht.

* Aanmaken gewicht variabele. Mannen gemiddeld 84 kg, vrouwen gemiddeld 70.
DO IF MISSING(opleidingsniveau).
COMPUTE gewicht = -99.
ELSE IF geslacht = 0.
COMPUTE gewicht=RND(RV.NORMAL(84, 20)).
ELSE IF geslacht = 1.
COMPUTE gewicht=RND(RV.NORMAL(70, 20)).
END IF.

VARIABLE LABELS gewicht "Gewicht respondent in kg".
FORMATS gewicht (F3.0).
MISSING VALUES gewicht (-99).
MEANS gewicht BY geslacht.

************************ Einde voorbeelddata maken **********************************.











******************** COMPUTE commando ******************************.

* Met het COMPUTE commando kan je rekenen in SPSS. Dat 'rekenen' kan je heel breed opvatten, want je kan ook
*  'rekenen' met tekstvariabelen bijvoorbeeld.

* Het COMPUTE commando werkt als volgt:
COMPUTE naam_van_variabele = berekening.
* Waarbij je in de plaats van berekening vanalles kan invullen: een combinatie van andere variabelen, cijfers, plus, min,
*  maal, gedeeld door, maar bijvoorbeeld ook dingen als  'is gelijk aan', 'groter dan', 'kleiner of gelijk aan',
*  'willekeurig nummer uit een normaalverdeling met bepaald gemiddelde en standaarddeviatie' (zoals hierboven
*  bij het maken van voorbeelddata) etc...
 
* Laten we eens wat voorbeelden bekijken.

* 1. Body Mass Index (BMI).
* Laten we eens proberen het BMI te berekenen voor de respondenten in onze data.
* De formule voor BMI is: Gewicht / (lengte in m * lengte in m).

* Hmm, we hebben wel lengte in centimeters, maar niet lengte in meters. Laten we eens een variabele 
* proberen te maken die de lengte in meters weergeeft.
COMPUTE lengte_in_m = lengte / 100.
EXECUTE.

* Kijk eens in je data of dat gelukt is.

* En lijkt ook alles goed als we de gemiddelden van de twee variabelen naast elkaar zetten?.
MEANS lengte lengte_in_m. 




* 2. Goed, en nu echt het BMI...
COMPUTE bmi = gewicht / (lengte_in_m * lengte_in_m).
EXECUTE.

* Kijk weer in je data of dit gelukt is.

* En bekijk ook eens de beschrijvende statistiek.
MEANS bmi
  /CELLS COUNT MIN MAX MEAN STDDEV.

* Dat lijkt in orde. Er zijn wat extreme minimale waarden, maar dat komt omdat we onze lengte en gewicht gegevens
*  zelf willekeurig aangemaakt hebben.


* Kijk eens in je data wat er gebeurt met BMI als gewicht of lengte missing is?.








*************** MEER VOORBEELDDATA *********************************.

* Ook zorgkosten wil ik graag als voorbeeld gebruiken.
* Run daarom onderstaande syntax tot aan 'Einde voorbeelddata maken' om wat zorgkosten data te creeren.

DO IF ~(MISSING(geslacht)).
COMPUTE medicijnkosten = RV.LNORMAL(10, 2).
END IF.
DO IF medicijnkosten < 3.
COMPUTE medicijnkosten = 0.
END IF.

DO IF ~(MISSING(rapportcijfer)).
COMPUTE huisartskosten = RV.POISSON(50).
END IF.

DO IF CHAR.INDEX(LOWER(zorgverlener), "ecialist") > 0.
COMPUTE specialistkosten = RV.NORMAL(200, 100).
END IF.
DO IF specialistkosten < 100.
COMPUTE specialistkosten = 0.
END IF.
EXECUTE.

DO IF specialistkosten >= 300.
COMPUTE huisartskosten = 70.
COMPUTE medicijnkosten = 150.
END IF.

************************ Einde voorbeelddata maken **********************************.




* 3. Je wil ook zorgkosten analyseren van je respondenten. Je weet dat elke respondent naast medicijnkosten,
*      huisartskosten en specialistkosten ook een vast bedrag aan huisarts_inschrijftariefkosten betaalt. Dit bedrag is
*      36 euro per jaar. Je wil dit graag aan je data toevoegen.

* Dat is zo makkelijk als...
COMPUTE huisarts_inschrijftariefkosten = 36.
EXECUTE.
* Je hoeft namelijk niet altijd te rekenen. Je kan met COMPUTE ook gewoon 1 waarde toewijzen aan een variabele,
*  deze wordt dan voor elke rij hetzelfde ingevuld.




*                            ###OPDRACHT###.

* Gebruik het COMPUTE commando om een variabele 'totale_zorgkosten' te maken.
* Totale zorgkosten is de optelsom van medicijnkosten, huisartskosten, specialistkosten en huisarts_inschrijftariefkosten.


* Een oplossing.
COMPUTE totale_zorgkosten = medicijnkosten + huisartskosten + specialistkosten + huisarts_inschrijftariefkosten.
* Bekijk het resultaat.
MEANS totale_zorgkosten
  /CELLS COUNT MIN MAX MEAN STDDEV.

* Alternatieve oplossingen.
COMPUTE totale_zorgkosten = SUM(medicijnkosten, huisartskosten, specialistkosten, huisarts_inschrijftariefkosten).
* Bekijk het resultaat.
MEANS totale_zorgkosten
  /CELLS COUNT MIN MAX MEAN STDDEV.

COMPUTE totale_zorgkosten = SUM(medicijnkosten TO huisarts_inschrijftariefkosten).
* Een serie kolommen die naast elkaar liggen kan je aanduiden via 'eerste_kolom TO laatste_kolom'.
* Bekijk het resultaat.
MEANS totale_zorgkosten
  /CELLS COUNT MIN MAX MEAN STDDEV.

* Bekijk het verschil tussen de drie oplossingen. Hoe komt dat?.





* Kijk ook hier eens in je data wat er gebeurt met totale_zorgkosten als een of meer van de kosten variabelen
*  missende waarden hebben.

* Wat doet SPSS hier met de missende waarden?.
* Is dit anders dan bij BMI?.







*                    ###OPDRACHT###.

* In de vorige les eindigden we met het inspecteren van de zorgverlener variabele.
* Dit is een nominale variabele.
* Inspecteer de zorgverlener variabele nogmaals en kijk wat je opvalt.

FREQUENCIES zorgverlener
  /BARCHART.


* Hoe zou je het probleem van de verschillende schrijfwijzen kunnen oplossen?.
* Je hoeft niet alles in 1 stap te doen. Tussenstappen bedenken is ook prima.

















* Je zou dit kunnen oplossen met RECODE, maar dan moet je wel voor elke afzonderlijke foute schrijfwijze een nieuwe
*  correcte waarde toewijzen. Dat is hier nog wel te doen, maar dit is een mooie gelegenheid om te zoeken naar
*  efficientere mogelijkheden.





* Stel dat je bijvoorbeeld alle waarden in de variabele 'lowercase' (dus alleen kleine letters en geen hoofdletters) zou
*  kunnen maken. Dan heb je in een klap 4 foute schrijfwijzen oplost (Fysiotherapeut, Huisarts, HUisarts en Specialist).

* Met COMPUTE kan dat.

* Voor de zekerheid gaan we een kopie maken van de zorgverlener variabele. Dan kunnen we altijd de foute waarde en
*  de gecorrigeerde waarde naast elkaar zien.
* Daarvoor maken we eerst een nieuwe, lege tekstvariabele aan van dezelfde lengte.
STRING zorgverlener_kopie (A20).

* Dan vullen we die zorgverlener_kopie met precies dezelfde waarden als de zorgverlener variabele.
COMPUTE zorgverlener_kopie = zorgverlener.
EXECUTE.

* Kijk maar eens naar het resultaat in je data.

* Variabelen kopieren kan dus ook met COMPUTE!.



* NB: Waarom moeten we nu ineens eerst die nieuwe tekstvariabele aanmaken?
*  Bij de eerdere COMPUTE voorbeelden hoefden we niet eerst een variabele te maken, maar konden we meteen
*  beginnen met COMPUTE. De nieuwe variabele verscheen toch vanzelf?.
* Dit komt omdat het hier om een tekstvariabele gaat. Numerieke variabelen maakt SPSS gewoon aan wanneer het
*  een COMPUTE commando ziet. Voor tekstvariabelen vindt SPSS het echter zo belangrijk om te weten hoeveel
*  tekens die nieuwe variabele moet zijn, dat hij dat niet zomaar zelf durft in te stellen. Daarom moet je bij het maken
*  van een nieuwe tekstvariabele deze altijd eerst aanmaken met het STRING commando. Dit geldt ook als je een
*  nieuwe tekstvariabele probeert te maken met RECODE INTO.





* Ok, laten we die kopie nu eens proberen op te schonen. Hoe maken we alle waarden lowercase?.
COMPUTE zorgverlener_kopie = LOWER(zorgverlener_kopie).

* Vergelijk meteen maar eens de frequencies.
FREQUENCIES zorgverlener zorgverlener_kopie.



* Vanaf hier zou je prima verder kunnen werken met RECODE, maar om meer te kunnen oefenen blijven we
*  nog even proberen met COMPUTE.

* Er zijn allerlei soorten functies om tekst te bewerken in SPSS. Je kan een overzicht vinden wanneer je naar
*  Transform --> Compute Variable --> Function group --> String --> Functions and Special Variables gaat.
* Je kan via Function group overigens ook alle andere (ook niet op tekst gebaseerde) functies vinden die je in je
*  COMPUTE commando's kan gebruiken, plus een beschrijving van hoe je die functie moet gebruiken.

* REPLACE is ook een handige functie om tekst te bewerken, en werkt als volgt:
REPLACE(stuk_tekst_dat_je_wil_bewerken, tekst_om_te_vervangen, tekst_waarmee_je_vervangt).
* Dus binnen stuk_tekst_dat_je_wil_bewerken worden alle stukken die overeenkomen met tekst_om_te_vervangen, vervangen
*  door tekst_waarmee_je_vervangt.

* Stel dat we bijvoorbeeld 'specialiste' willen vervangen door 'specialist', kunnen we dat als volgt doen.
COMPUTE zorgverlener_kopie = REPLACE(zorgverlener_kopie, 'specialiste', 'specialist').
* COMPUTE checkt nu alle waarden in de variabele zorgverlener_kopie, en als het ergens 'specialiste' tegenkomt,
*  wordt dat vervangen door specialist.

* Je kan REPLACE ook gebruiken om stukjes tekst weg te halen.
* Vervang dan simpelweg met lege tekst (wel tussen aanhalingstekens).
COMPUTE zorgverlener_kopie = REPLACE(zorgverlener_kopie, ' azm', '').
COMPUTE zorgverlener_kopie = REPLACE(zorgverlener_kopie, ' ggz', '').

* En bekijk weer de frequencies.
FREQUENCIES zorgverlener zorgverlener_kopie.



*                    ###OPDRACHT###.

* Kan je REPLACE ook gebruiken om 'fysio' te veranderen in 'fysiotherapeut'?.
* Zo ja, probeer het eens en bekijk het resultaat met behulp van een frequentietabel.
* Zo nee, waarom niet?.






* Dat gaat niet, zie het resultaat.
 * COMPUTE zorgverlener_kopie = REPLACE(zorgverlener_kopie, 'fysio', 'fysiotherapeut').
 * FREQUENCIES zorgverlener_kopie.















******************* DO IF, ELSE IF, END IF ******************************************.

* Hoe kunnen we dan wel 'fysio' veranderen in 'fysiotherapeut' met COMPUTE?.
* Dit kunnen we doen door COMPUTE te combineren met DO IF, ELSE IF, END IF.
* Deze series commando's werken als volgt.

 * DO IF bepaalde_voorwaarde.
 * Commando dat uitgevoerd voor rijen die aan die bepaalde_voorwaarde voldoen. Bijv. een COMPUTE commando.
 * ELSE IF andere_voorwaarde.
 * Commando dat uitgevoerd wordt voor rijen die aan andere_voorwaarde voldoen.
 * ELSE.
 * Commando dat wordt uitgevoerd voor alle rijen die niet aan eerdere voorwaarden voldoen.
 * END IF.
* Gevolgd door een EXECUTE of een ander commando dat de data moet lezen (FREQUENCIES o.i.d.)

* Bij zo'n voorwaarde kan je denken aan alles wat het resultaat waar of niet-waar heeft (True/False). Veelgebruikte
*  termen bij dit soort voorwaarden zijn
* =  is gelijk aan
* ~= is niet gelijk aan
* >  groter dan
* >= groter of gelijk aan
* <  kleiner dan
* <= kleiner of gelijk aan

* Deze voorwaarden gebruiken meestal variabelen. We schrijven bijvoorbeeld:
zorgverlener_kopie = 'fysiotherapeut' (in woorden: de waarde van variabele zorgverlener_kopie is gelijk aan 'fysiotherapeut')
* Het COMPUTE commando wordt dan uitgevoerd voor alle rijen in de data waar zorgverlener_kopie de waarde 'fysiotherapeut heeft.
* of
rapportcijfer >= 6     (in woorden: de waarde van variabele rapportcijfer is groter of gelijk aan 6).
* Het COMPUTE commando wordt dan uitgevoerd voor alle rijen waar rapportcijfer een waarde groter of gelijk aan 6 heeft.



* Laten we 'fysiotherapeut' veranderen in 'fysio' met behulp van DO IF.
DO IF zorgverlener_kopie = 'fysiotherapeut'.
COMPUTE zorgverlener_kopie = 'fysio'.
END IF.

FREQUENCIES zorgverlener_kopie.

* Zoals je ziet hoef je niet altijd ook ELSE IF en ELSE te gebruiken. Wanneer je maar 1 voorwaarde hebt, kan je ook
*  DO IF plus END IF gebruiken.


*                    ###OPDRACHT###.

* Kopieer het vorige commando en pas het aan zodat in de zorgverlener_kopie variabele elke waarde 'praktijkondersteu'
*  vervangen wordt door 'poh'.


* Oplossing.
DO IF zorgverlener_kopie = 'praktijkondersteu'.
COMPUTE zorgverlener_kopie = 'poh'.
END IF.

FREQUENCIES zorgverlener_kopie.













*                    ###OPDRACHT###.

* Bij nader inzien vind je 'poh' en 'fysio' er toch niet zo mooi uitzien, naast het voluit geschreven 'specialist', 'huisarts' etc.
* Verander daarom 'poh' naar 'praktijkondersteuner' en
*  'fysio' naar 'fysiotherapeut'
* Als je nogmaals kijkt naar onderstaand voorbeeld van hoe DO IF, ELSE IF werkt, kan je deze twee veranderingen dan
*  samen uitvoeren?.

 * DO IF bepaalde_voorwaarde.
 * Commando dat uitgevoerd voor rijen die aan die bepaalde_voorwaarde voldoen. Bijv. een COMPUTE commando.
 * ELSE IF andere_voorwaarde.
 * Commando dat uitgevoerd wordt voor rijen die aan andere_voorwaarde voldoen.
 * END IF.
* Gevolgd door een EXECUTE of een ander commando dat de data moet lezen (FREQUENCIES o.i.d.)





* Oplossing:.
DO IF zorgverlener_kopie = 'fysio'.
COMPUTE zorgverlener_kopie = 'fysiotherapeut'.
ELSE IF zorgverlener_kopie = 'poh'.
COMPUTE zorgverlener_kopie = 'praktijkondersteuner'.
END IF.

FREQUENCIES zorgverlener_kopie.




* Nu is de zorgverlener_kopie variabele mooi opgeschoond. Kijk nog eens naar de originele variabele om te zien hoeveel
*  schoner de variabele is geworden.
FREQUENCIES zorgverlener.





*************************  AUTORECODE ********************************.

* In les 1 hoorden we dat we tekst/string-variabelen zoveel mogelijk moeten vermijden, en eigenlijk alleen moeten
*  gebruiken voor dingen als voornamen, achternamen, emailadressen.
* Een variabele zoals zorgverlener, met slechts enkele waarden die steeds terugkomen, kunnen we beter als
*  numeriek weergeven, met voor elke waarde een nummer, bijvoorbeeld 1 voor fysiotherapeut, 2 voor huisarts, etc.

* Een eenvoudige manier om een tekst-variabele om te zetten naar zo'n numerieke variabele is het AUTORECODE 
*  commando. Hieronder zie je hoe het een nieuwe variabele aanmaakt (zorgverlener_schoon), waarin het de waarden
*  van zorgverlener_kopie als nummers weergeeft.
* De optionele toevoeging /PRINT zorgt ervoor dat de value labels van de nieuwe variabele in het outputvenster
*  worden weergegeven.

AUTORECODE zorgverlener_kopie 
  /INTO zorgverlener_schoon
  /PRINT.

**************************************************************************************************************.





*                    ###OPDRACHT###.

* In les 2 maakten we een variabele aan die rapportcijfer als categorie weergaf, met de opties
*  onvoldoende (rapportcijfer 0 tot 6), voldoende (6 tot 7.5) en goed (7.5 t/m 10). 
* Toen we dat aanpakten met RECODE, moesten we goed opletten dat rapportcijfer 7.45 ook werd
*  omgezet naar voldoende, omdat we de grenzen van elke categorie als cijfer weergaven
*  (6 THRU 7.4) vs. (6 THRU 7.49).

* Omdat we met het DO IF commando ook zogenaamde 'comparison operatiors'  (zoals groter dan, kleiner
*  dan, etc.) kunnen gebruiken, kunnen we de categorieen nu exact afbakenen.

* Hier zijn nogmaals de verschillende symbolen die je hiervoor kan gebruiken:
*     >          groter dan
*     >=        groter of gelijk aan
*     <          kleiner dan
*     <=        kleiner of gelijk aan

* Een voorbeeld van een 'enkele grens' aangeven is:
rapportcijfer < 6
* Twee grenzen kan je aangeven met behulp van AND, dat gaat bijvoorbeeld zo
rapportcijfer >= 0 AND rapportcijfer < 6
* Als je het prettig vindt kan je haakjes gebruiken om het leesbaarder te maken, 
*  maar in dit voorbeeld zijn ze niet noodzakelijk
(rapportcijfer >= 0) AND (rapportcijfer < 6).

* LET OP: rapportcijfer >= 0 AND < 6   DIT WERKT NIET! Je moet weer opnieuw 'rapportcijfer' schrijven achter AND.


* Maak het onderstaande commando af, merk op dat we niet de oude rapportcijfer_categorie variabele overschrijven,
*  maar een nieuwe aanmaken. Deze heet rapportcijfer_categorie_2:.
DO IF rapportcijfer >= 0 AND rapportcijfer < 6.
COMPUTE rapportcijfer_categorie_2 = 1.
ELSE IF rapportcijfer >= 6 AND rapportcijfer < 7.5.
COMPUTE rapportcijfer_categorie_2 = 2.
ELSE IF rapportcijfer >= 7.5 AND rapportcijfer <= 10.
COMPUTE rapportcijfer_categorie_2 = 3.
ELSE.
COMPUTE rapportcijfer_categorie_2 = -99.
END IF.

* Alternatief. Let op dat als je met DO IF missende waarden in je voorwaarde gebruikt, je dit
*  het beste als eerste kan doen (dus bij DO IF, en niet bij ELSE IF).
DO IF MISSING(rapportcijfer).
COMPUTE rapportcijfer_categorie_2 = -99.
ELSE IF rapportcijfer < 6.
COMPUTE rapportcijfer_categorie_2 = 1.
ELSE IF rapportcijfer < 7.5.
COMPUTE rapportcijfer_categorie_2 = 2.
ELSE IF rapportcijfer >= 7.5 AND rapportcijfer <= 10.
COMPUTE rapportcijfer_categorie_2 = 3.
END IF.

MISSING VALUES rapportcijfer_categorie_2 (-99).

FREQUENCIES  rapportcijfer_categorie rapportcijfer_categorie_2.





*                    ###OPDRACHT###.

* Creeer kostencategorieen van de drie zorgkosten variabelen. Gebruik de volgende grenzen:.

* Noem de nieuwe variabele voor specialistkosten  specialistkosten_cat
* Kostencategorieen:.
* 0 = Geen.
* groter dan 0 en kleiner dan 200 = Laag.
* 200 en kleiner dan 300 = Midden.
* 300 en hoger = Hoog.

* Maak ook value labels aan voor deze categorieen.


DO IF specialistkosten = 0.
COMPUTE specialistkosten_cat = 0.
ELSE IF specialistkosten > 0 AND specialistkosten < 200.
COMPUTE specialistkosten_cat = 1.
ELSE IF specialistkosten >= 200 AND specialistkosten < 300.
COMPUTE specialistkosten_cat = 2.
ELSE IF specialistkosten >= 300.
COMPUTE specialistkosten_cat = 3.
END IF.

ADD VALUE LABELS specialistkosten_cat
0 "Geen kosten"
1 "Laag"
2 "Midden"
3 "Hoog".

FREQUENCIES specialistkosten_cat.

* Noem de nieuwe variabele voor medicijnkosten medicijnkosten_cat.
* Kosten categorieen:.
* 0 tot 30: Laag.
* 30 tot 100: Midden.
* 100 en hoger: Hoog.

DO IF medicijnkosten >= 0 AND medicijnkosten < 30.
COMPUTE medicijnkosten_cat = 1.
ELSE IF medicijnkosten >= 30 AND medicijnkosten < 100.
COMPUTE medicijnkosten_cat = 2.
ELSE IF medicijnkosten >= 100.
COMPUTE medicijnkosten_cat = 3.
END IF.

ADD VALUE LABELS medicijnkosten_cat
1 "Laag"
2 "Midden"
3 "Hoog".

FREQUENCIES medicijnkosten_cat.


* Noem de nieuwe variabele voor huisartskosten huisartskosten_cat.
* Kosten categorieen:. 
* Beneden gemiddelde huisartskosten = "Beneden gemiddeld".
* Gelijk aan of hoger dan gemiddelde huisartskosten =  "Gelijk aan of hoger dan gemiddeld".

MEANS huisartskosten.

* Mean is 49.539.
DO IF huisartskosten < 49.539.
COMPUTE huisartskosten_cat = 1.
ELSE IF huisartskosten >= 49.539.
COMPUTE huisartskosten_cat = 2.
END IF.

ADD VALUE LABELS huisartskosten_cat
1 "Beneden gemiddeld"
2 "Gelijk aan of hoger dan gemiddeld".

FREQUENCIES huisartskosten_cat.





* NB: Helaas werkt het volgende niet:.
DO IF huisartskosten < MEAN(huisartskosten).
COMPUTE ha_kosten_cat = 1.
ELSE IF huisartskosten >= MEAN(huisartskosten).
COMPUTE ha_kosten_cat = 2.
END IF.

FREQUENCIES ha_kosten_cat.

* Waarom niet?.
* COMPUTE werkt altijd op rij-niveau. Kijk maar eens wat dit oplevert in je data...
COMPUTE ha_mean = MEAN(huisartskosten).
EXECUTE.

* Omdat COMPUTE op rij-niveau werkt, neemt het gewoon het gemiddelde van 1 waarde, namelijk huisartskosten
*  per rij. Wat wij wilden hierboven is het gemiddelde van de hele kolom(!) huisartskosten.




FREQUENCIES specialistkosten_cat huisartskosten_cat medicijnkosten_cat.








************** COMPUTE MET VOORWAARDE/CONDITIONAL *****************************.

* Handig om te weten, als je een binaire (True vs False of 1 vs 0) variabele wil maken, kan je in het compute
*  commando ook direct een bepaalde 'voorwaarde' schrijven. Een voorbeeld:.

* Het idee achter het COMPUTE commando is dan
* COMPUTE variabele = voorwaarde_die_True_of_False_oplevert.
COMPUTE huisartskosten_bovengemiddeld = huisartskosten > 49.539.
* Of:.
COMPUTE rapportcijfer_minimaal_voldoende = rapportcijfer >= 6.
FREQUENCIES huisartskosten_bovengemiddeld rapportcijfer_minimaal_voldoende.

* Kijk maar eens in je data en output wat dit heeft opgeleverd.

*                    ###OPDRACHT###.

* Kan je zelf 2 of 3 van dit soort COMPUTE commando's bedenken met de variabelen in de dataset?.






**********************************************************************************************************************.





*                     ### OEFENOPDRACHTEN ###.


* 1.
* zorgverleners krijgen de totale zorgkosten vergoed van de zorgverzekeraar. De zorgverzekeraar geeft 
* zorgverleners daarnaast nog een toeslag voor innovatie. Deze toeslag is 2% op de zorgkosten van 
* niet-chronisch zieke patienten, en 10% op de zorgkosten van chronisch zieke patienten.
* Maak een variabele zorgkostenvergoeding die de vergoeding per patient weergeeft.










* Kom je er moeilijk uit? Lees het probleem dan eens als volgt:
ALS iemand chronisch ziek is
dan BEREKEN je zorgkostenvergoeding keer 110%
ALS iemand niet chronisch ziek is
dan BEREKEN je zorgkostenvergoeding keer 102%.

MEANS totale_zorgkosten BY chronisch_ziek.

DO IF chronisch_ziek = 1.
COMPUTE zorgkostenvergoeding = totale_zorgkosten * 1.1.
ELSE IF chronisch_ziek = 0.
COMPUTE zorgkostenvergoeding = totale_zorgkosten * 1.02.
END IF.
EXECUTE.

* Check je resultaat. Is er bij de juiste groepen het juiste percentage bijgekomen?.
MEANS zorgkostenvergoeding BY chronisch_ziek.





* 2. 
* Maak een nieuwe variabele die aangeeft hoeveel patienten in elk van de drie soorten kosten
*  (huisartskosten_cat, specialistkosten_cat EN medicijnkosten_cat) in de laagste categorie vallen.
* Noem de variabele altijd_laag.

* Hoeveel patienten vallen in de laagste categorie voor elk van de drie soorten kosten?.

* Kan je meer dan 1 manier bedenken om de oplossing te vinden?.

DO IF huisartskosten_cat = 1 AND specialistkosten_cat = 1 AND medicijnkosten_cat = 1.
COMPUTE altijd_laag = 1.
END IF.

FREQUENCIES altijd_laag.


* Of, als je de COMPUTE met voorwaarde manier gebruikt.
COMPUTE altijd_laag = huisartskosten_cat = 1 AND specialistkosten_cat = 1 AND medicijnkosten_cat = 1.
FREQUENCIES altijd_laag.

* Kijk eens naar het verschil tussen bovenstaande twee oplossingen. Hoe zou dit kunnen komen?. Wat kan je
*  daaruit concluderen?.



* 3. 
* Doe hetzelfde voor patienten die in elk van de drie soorten kosten hoge kosten maken.
* Noem de variabele altijd_hoog.
*  Probeer minimaal twee oplossingen te bedenken.

DO IF huisartskosten_cat = 2 AND specialistkosten_cat = 3 AND medicijnkosten_cat = 3.
COMPUTE altijd_hoog = 1.
END IF.
FREQUENCIES altijd_hoog.

COMPUTE altijd_hoog = SUM(huisartskosten_cat, specialistkosten_cat, medicijnkosten_cat) = 8.
FREQUENCIES altijd_hoog.





*                        *** EXTRA OEFENOPDRACHTEN OVER LES 1, 2 en 3 ***.

*** Herhaling les 1.
* Gebruik je kennis en kopieer-en-plak skills om de variable view compleet te maken
*  voor nieuw aangemaakte variabelen. Je hoeft dit niet per se voor ALLE nieuwe variabelen
*  te doen. Als je het gevoel hebt dat je het onder de knie hebt, is dat prima.


* Herhaling les 2 en 3.

* 1.
* Maak een frequentietabel van specialistkosten_cat.
* Een van de specialisten vindt patienten met weinig problemen maar oninteressant. Hij vraagt je om een
*  nieuwe variabele aan te maken (interessant_voor_specialist) en het percentage interessante patienten op te vragen.
* Een interessante patient is volgens hem iemand die minimaal in de 'Midden'-categorie valt in specialistkosten_cat.

* Als je het antwoord hebt gevonden, verifieer het dan door de frequentietabellen van specialistkosten_cat en 
*  interessant_voor_specialist te vergelijken.


FREQUENCIES specialistkosten_cat.

* Mogelijke oplossing, maar hierbij verlies je het aandeel missende waarden.
RECODE specialistkosten_cat (2, 3=1) (ELSE=0) INTO interessant_voor_specialist.
ADD VALUE LABELS interessant_voor_specialist
1 "Interessant!".
FREQUENCIES interessant_voor_specialist.

* Alternatieve oplossing, waarbij je het aandeel missende waarden behoud.
RECODE specialistkosten_cat (3=2) (ELSE=COPY) INTO interessant_voor_specialist.
ADD VALUE LABELS interessant_voor_specialist
2 "Interessant!".
FREQUENCIES interessant_voor_specialist.


* Of met COMPUTE (dit is slechts 1 manier).
COMPUTE interessant_voor_specialist = specialistkosten_cat = 2 or specialistkosten_cat = 3.
FREQUENCIES interessant_voor_specialist.


* 2.
* Analyseer de variabele gewicht met behulp van beschrijvende statistiek.

* Mocht je respondenten vinden met een gewicht lager dan 35 kg, verander hun gewicht dan in -99.

* Doe dit:
* A. 1 keer met RECODE en 
* B. 1 keer met DO IF in combinatie met COMPUTE.

* Zorg ook dat SPSS -99 herkent als missende waarde.

* Check het resultaat van zowel A als B niet alleen in je data, maar ook met beschrijvende statistiek.


MEANS gewicht
  /CELLS COUNT MIN MAX MEAN STDDEV.

* Oplossing A.
RECODE gewicht (LOWEST THRU 34.9=-99).
MISSING VALUES gewicht (-99).
MEANS gewicht
  /CELLS COUNT MIN MAX MEAN STDDEV.

* Oplossing B.
DO IF gewicht < 35.
COMPUTE gewicht = -99.
END IF.
MISSING VALUES gewicht (-99).
MEANS gewicht
  /CELLS COUNT MIN MAX MEAN STDDEV.



* 3.
* De verzekeraar vindt een respondent met een zorgkostenvergoeding boven de 1000 euro duur.
* Maak een variabele dure_respondent, die respondenten indeelt in twee categorieen, goedkoop en duur.

* Hoeveel respondenten zijn duur?.

* Kan je 3 verschillende manieren bedenken om dit te doen?.

RECODE zorgkostenvergoeding (MISSING=-99) (LOWEST THRU 1000=0) (1000.1 THRU HIGHEST=1) INTO dure_respondent.
MISSING VALUES dure_respondent (-99).
FREQUENCIES dure_respondent.

COMPUTE dure_respondent = zorgkostenvergoeding > 1000.
FREQUENCIES dure_respondent.

DO IF zorgkostenvergoeding > 1000.
COMPUTE dure_respondent = 1.
END IF.
FREQUENCIES dure_respondent.






* 4. 
* Maak de bmi variabele zonder dat je eerst de lengte_in_m variabele maakt. Je kan deze bmi_direct noemen.
* Let op het gebruik van haakjes.

* Controleer in ieder geval of het minimum BMI 5.28 is en het maximum 48.39. Hoewel me een BMI van 5 niet 
* mogelijk lijkt 'in het echt', is dat wel het correcte antwoord met onze voorbeelddata.


* Oplossing:.
COMPUTE bmi_direct = gewicht / ((lengte / 100) * (lengte / 100)).

MEANS bmi bmi_direct.





*                        ### Extra opdrachten: Hacker edition :) ###.

* Hier staan meer uitdagende opdrachten voor wie daar interesse in heeft. In deze opdrachten krijg je alleen
*  hints, maar geen stap voor stap beschrijvingen. Ga er vanuit dat je zo af en toe wat moet opzoeken in SPSS zelf of
*  via google.



* 1.
* Maak een variabele waarmee je kan checken of altijd_laag en altijd_hoog nooit tegelijkertijd 1 zijn.

* Als ze voor een respondent wel tegelijkertijd 1 zijn, dan is er iets fout gegaan bij het aanmaken van deze variabelen.
* Wat we hier doen is dus eigenlijk een soort test, om te kijken of je ook ziet wat je verwacht.


COMPUTE check = altijd_laag = 1 AND altijd_hoog = 1.
ADD VALUE LABELS check
0 "In orde"
1 "PROBLEEM!".
FREQUENCIES check.


* 2.
* Zie onderstaande variabele lang_en_zwaar.
COMPUTE  lang_en_zwaar = lengte > 185 AND gewicht > 90.
FREQUENCIES lang_en_zwaar.

* Pas de syntax hieronder aan zodat je precies de mensen telt die niet lang en zwaar zijn.
* LET OP: Je mag alleen dingen toevoegen hieronder, maar geen letters of tekens veranderen of weghalen!!.
COMPUTE niet_lang_en_zwaar = lengte > 185 AND gewicht > 90.
FREQUENCIES niet_lang_en_zwaar.




* Oplossing:.
COMPUTE niet_lang_en_zwaar = ~(lengte > 185 AND gewicht > 90).
FREQUENCIES niet_lang_en_zwaar.

* 3.
* Maak een variabele, ha_rapportcijfer, die...
* ...waarde 1 heeft voor: niet chronisch zieke respondenten die hun huisarts beoordeeld hebben met een 6 of hoger, OF
    voor chronisch zieke respondenten die hun huisarts beoordeeld hebben met een 5.5 of hoger...
* ...en waarde 0 heeft  voor: ALLE overige respondenten. De aangemaakte variabele mag dus geen
*  missende waarden hebben.

* Maak deze variabele twee keer aan. De eerste keer gebruik je de zorgverlener_schoon variabele.
* De tweede keer gebruik je de (opgeschoonde) variabele zorgverlener_kopie.


COMPUTE ha_rapportcijfer = 0.
DO IF (zorgverlener_schoon = 2 AND chronisch_ziek = 1 AND rapportcijfer >= 6) OR
         (zorgverlener_schoon = 2 AND chronisch_ziek = 0 AND rapportcijfer >= 5.5).
COMPUTE ha_rapportcijfer = 1.
END IF.
FREQUENCIES ha_rapportcijfer.


COMPUTE ha_rapportcijfer2 = 0.
DO IF (zorgverlener_kopie = "huisarts" AND chronisch_ziek = 1 AND rapportcijfer >= 6) OR
         (zorgverlener_kopie = "huisarts" AND chronisch_ziek = 0 AND rapportcijfer >= 5.5).
COMPUTE ha_rapportcijfer2 = 1.
END IF.
FREQUENCIES ha_rapportcijfer2.

* Check of je voor allebei de aangemaakte variabelen dezelfde aantallen hebt.
FREQUENCIES ha_rapportcijfer ha_rapportcijfer2.







*4. Maak een variabele, tel_missende_waarden, die 1 is als geslacht of opleidingsniveau een missende waarde heeft.
COMPUTE tel_missende_waarden = MISSING(geslacht) OR MISSING(opleidingsniveau).
FREQUENCIES tel_missende_waarden.

* Maak ook een variabele, tel_missende_waarden_2 , 
die 1 is als geslacht en chronisch_ziek allebei tegelijkertijd een missende waarde hebben.
COMPUTE tel_missende_waarden_2 = MISSING(geslacht) AND MISSING(opleidingsniveau).
FREQUENCIES tel_missende_waarden_2.





* 5.
* Maak een nieuwe kopie van de zorgverlener variabele en maak deze UPPERCASE.
* zoek een manier om het volgende te doen:
* Als 'FYSIO' voorkomt in je kopie
* verander de waarde dan in 'FYSIOTHERAPEUT'
* Als 'SPECIALIST' voorkomt in je kopie
* verander de waarde dan in 'SPECIALIST'.

* Wat je met de rest van de variabele doet maakt niet uit. Waar het om gaat is dat je alle schrijfwijzen van
* fysiotherapeut in 1 stap verandert. Idem voor alle schrijfwijzen van specialist.

* HINT: Ga naar Transform --> Compute Variable --> Function Groups --> String en zoek daar naar een 
* functie die je kan helpen. Een dergelijk probleem wordt door programmeurs wel eens beschreven als
*  een naald in een hooiberg zoeken.

STRING zvl (A20).
COMPUTE zvl = UPCASE(zorgverlener).
DO IF CHAR.INDEX(zvl, "FYSIO") > 0.
COMPUTE zvl = "FYSIOTHERAPEUT".
ELSE IF CHAR.INDEX(zvl, "SPECIALIST") > 0.
COMPUTE zvl = "SPECIALIST".
END IF.
FREQUENCIES zvl.





*6. 
* 6a. Open het bestand '2019-01-02_pat_tevr.sav' uit Brondata.
GET FILE='data\Brondata\2019-01-02_pat_tevr.sav'.
DATASET NAME brondata WINDOW=FRONT.

* 6b. Sla vervolgens het bestand op als .csv bestand in plaats van een .sav.
* Je kan hiervoor het menu gebruiken, maar zorg wel dat je het commando Paste en dan vanuit syntax runt.
SAVE TRANSLATE OUTFILE='data\Brondata\2019-01-02_pat_tevr.csv'
  /TYPE=CSV
  /ENCODING='UTF8'
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES.

* 6c. Zoek op wat het commando /CELLS=VALUES betekent en wat je hier eventueel anders zou kunnen invullen.

* 6d.
* Open nu het .csv bestand via File --> Open --> Data --> Paste.
* Doorloop alle stappen in het menu, let even op bij de vraag: "Which delimiters appear between variables."
* Bekijk de geproduceerde syntax.

PRESERVE.
SET DECIMAL DOT.

GET DATA  /TYPE=TXT
  /FILE="data\Brondata\2019-01-02_pat_tevr.csv"
  /ENCODING='UTF8'
  /DELCASE=LINE
  /DELIMITERS=","
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /DATATYPEMIN PERCENTAGE=95.0
  /VARIABLES=
  respondentnummer AUTO
  geslacht AUTO
  chronisch_ziek AUTO
  gebdatum AUTO
  zorgverlener A17
  rapportcijfer AUTO
  opleidingsniveau AUTO
  /MAP.
RESTORE.

CACHE.
EXECUTE.
DATASET NAME brondata WINDOW=FRONT.



* De syntax is nogal 'verbose', zoals dat in het Engels heet. Kijk of je de dingen waar je op geklikt hebt
  kan terugzien in de syntax.

* Als je niet meteen een data type hebt ingevuld voor elke variabele, dan zie je achter elke variabele
 in de syntax waarschijnlijk AUTO staan. In plaats van AUTO kan je hier het data type invullen, net zoals bij
 het FORMATS commando wat je in les 1 geleerd hebt. Dus voor rapportcijfer bijvoorbeeld F3.1 en voor
 zorgverlener A20.

* Kijk eens wat er gebeurt als je bij zorgverlener A17 invult.
* Je krijgt als het goed is een (niet erg duidelijk aangekondigde) waarschuwing in de output.
* Let daarbij op wat er in de output achter 'Variable: zorgverlener...' staat.






