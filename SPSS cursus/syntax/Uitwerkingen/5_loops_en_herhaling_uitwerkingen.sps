* Encoding: UTF-8.

**** LES 5: LOOPS (DO REPEAT) EN HERHALING VORIGE LESSEN ***.

* Stel de juiste werkdirectory in.
CD "I:\SPSS cursus\SPSS cursus".




******************************* DATA INLADEN *********************************.

* Deze keer laden we een csv-bestand in. Die syntax is wat langer en heb ik gemaakt met behulp van
*  File --> Open --> Data --> Files of type 'CSV' --> Paste --> en dan door de wizard.
PRESERVE.
SET DECIMAL DOT.

GET DATA  /TYPE=TXT
  /FILE="data\Brondata\zorgstandaarden.csv"
  /ENCODING='UTF8'
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /DATATYPEMIN PERCENTAGE=95.0
  /VARIABLES=
  VA_Zorgstandaard1 A35
  VA_Zorgstandaard2 A35
  VA_Zorgstandaard3 A35
  VA_Zorgstandaard4 A35
  VA_Zorgstandaard5 A35
  VA_Zorgstandaard6 A35
  VA_Zorgstandaard7 A35
  VA_Zorgstandaard8 A35
  VA_Zorgstandaard9 A35
  VA_Zorgstandaard10 A35
  VB_Zorgstandaard1 A35
  VB_Zorgstandaard2 A35
  VB_Zorgstandaard3 A35
  VB_Zorgstandaard4 A35
  VB_Zorgstandaard5 A35
  VB_Zorgstandaard6 A35
  VB_Zorgstandaard7 A35
  VB_Zorgstandaard8 A35
  VB_Zorgstandaard9 A35
  VB_Zorgstandaard10 A35
  /MAP.
RESTORE.

CACHE.
EXECUTE.
DATASET NAME zorgstandaarden WINDOW=FRONT.


*******************************************************************************.


* We werken vandaag met een dataset die een van de deelnemers in haar werk heeft gebruikt.

* In dit onderzoek werden zorgstandaarden (ontwikkeld voor een specifieke patiëntengroep)
* geëvalueerd in de EU middels een internationale Qualtrics vragenlijst.
* De lijsten zijn ingevuld en de data gedownload, overgenomen, en gemerged in SPSS/STATA.
* Voor iedere zorgstandaard (totaal 10 onderdelen bijvoorbeeld: diagnose binnen 6 weken, info over medicatie,
* info over vaccinatie, info over patiënt organisaties, info over gezonde leefstijl)
* werden 2 vragen gesteld op een schaal van 0 t/m 10.
* A)	Heeft deze zorg plaats gevonden?
* B)	Hoe belangrijk is deze zorg?

* Voor vraag A waren naast de score 0 t/m 10 extra antwoord mogelijkheden “niet van toepassing” (gecodeerd 96),
*  of “weet ik niet” (gecodeerd 97).
* Voor vraag 2 was er naast de score 0 t/m 10 de extra antwoord mogelijkheid “geen mening” (gecodeerd 98).
* De scores 1 t/m 9 waren letterlijk overgenomen door Qualtrics maar bij 0, 10, “niet van toepassing”, “weet ik niet”,
*  en “geen mening” was ook de tekst overgenomen.


* Doel voor vandaag is om alle 20 variabelen op te schonen.
* Voor vraag A moet dit numerieke variabelen opleveren (VA1 t/m VA10) met waarden
     0 t/m 10,
     96 ("niet van toepassing")en
     97 ("weet ik niet").
* Voor vraag B moet dit numerieke variabelen opleveren (VB1 t/m VB10) met waarden
    0 t/m 10 en
    98 ("geen mening").



************* Van VA_Zorgstandaard1 naar VA1 ****************.

* We pakken dit weer stap voor stap aan, en beginnen met het omzetten van VA_Zorgstandaard1 naar VA1.
* We zoeken ook weer een manier om zoveel mogelijk werk per commando te verrichten.

* Laten we eerst eens even kijken welke waarden allemaal voorkomen in VA_Zorgstandaard1.
FREQUENCIES VA_Zorgstandaard1.

* Stap 1 is het omzetten van alle waarden die eigenlijk al een nummer zijn (1 t/m 9).
* Hoewel 1 t/m 9 al een correct geschreven nummer zijn, staan ze wel nog in een variabele met type tekst (string),
*  namelijk VA_Zorgstandaard1.
* We maken een numerieke versie aan van de variabele VA_Zorgstandaard1 en noemen deze VA1.
COMPUTE VA1 = NUMBER(VA_Zorgstandaard1, F2.0).
EXECUTE.
* En met onderstaande truc komt deze variabele naast VA_Zorgstandaard1 te staan, waardoor we ze gemakkelijk
* kunnen vergelijken.
ADD FILES FILE *
 /KEEP VA_Zorgstandaard1 VA1 all.
EXECUTE.

* Waarschijnlijk zie je een heleboel warnings onderin je syntaxvenster en in je output venster verschijnen.
* Maak je geen zorgen, het is niet zo erg als het lijkt! SPSS wil alleen maar zeggen dat het van sommige waarden
* geen nummer kon maken, en in die rijen dus maar een missende waarde heeft ingevuld bij VA1.
* Kijk maar eens in je data, daar kan je dat ook zien.
* Voor welke waarden van VA_Zorgstandaard1 zie je in VA1 missende waarden?.
* En voor welke waarden is VA1 nu correct ingevuld?.















* Ok, 1 t/m 9 lijken al in orde.
* Blijft over: 10, 0, 96 en 97.

* Voor 10 en 0 zouden we het liefst het volgende willen doen:
* "ALS 10 voorkomt in VA_Zorgstandaard1.
* Vul dan bij VA1 een 10 in.
* ALS 0 voorkomt (en 10 niet, want daar zit ook een 0 in!) in VA_Zorgstandaard1.
* Vul dan bij VA1 een 0 in."

* Als, dan... dat klinkt als een DO IF constructie. Maar hoe zeggen we tegen SPSS:
"Als 10 voorkomt in VA_Zorgstandaard1"?.

* Het is niet precies hetzelfde, maar vorige week hebben we aan SPSS het volgende leren vragen:
"Wat is de positie van de eerste komma?", en andere gelijksoortige vragen. In dit geval wordt dat:
"WAAR komt 10 voor in VA_Zorgstandaard1?". Dat kunnen we zo vragen.
COMPUTE VA1_waarbegint_10 = CHAR.INDEX(VA_Zorgstandaard1, "10").
* En waar begint 0?.
COMPUTE VA1_waarbegint_0 = CHAR.INDEX(VA_Zorgstandaard1, " 0").
EXECUTE.
* Ook deze kolommen zetten we weer even naast elkaar.
ADD FILES FILE *
 /KEEP VA_Zorgstandaard1 VA1 VA1_waarbegint_10 VA1_waarbegint_0 all.
EXECUTE.


* Kijk eens goed naar de nieuwe variabele VA1_waarbegint_10.
* Hou de vraag in je achterhoofd: "Als 10 voorkomt in VA_Zorgstandaard1"?.
* Hoe kan je aan VA1_waarbegint_10 zien of 10 voorkomt in VA_Zorgstandaard1?.
* Kan je een patroon ontdekken?.


















* Als 10 voorkomt in VA_Zorgstandaard1, dan is VA1_waarbegint_10 groter dan 0!.
* Als 10 NIET voorkomt in VA_Zorgstandaard1, dan is VA1_waarbegint_10 precies 0!.
* Deze informatie kan je gebruiken om tegen SPSS te zeggen: "Als 10 voorkomt in VA_Zorgstandaard1".
* Tegen SPSS zeg je dan eigenlijk: "Als CHAR.INDEX(VA_Zorgstandaard1, "10") groter is dan 0".

* In DO IF vorm wordt dat het volgende.
DO IF CHAR.INDEX(VA_Zorgstandaard1, "10") > 0.
* en als die 10 inderdaad voorkomt, vul dan m.b.v. COMPUTE bij VA1 een 10 in.
COMPUTE VA1 = 10.
END IF.
EXECUTE.

* Dat is hetzelfde als:.
DO IF VA1_waarbegint_10 > 0.
* en als die 10 inderdaad voorkomt, vul dan m.b.v. COMPUTE bij VA1 een 10 in.
COMPUTE VA1 = 10.
END IF.
EXECUTE.
* Alleen maakt de eerste versie (DO IF CHAR.INDEX etc) geen aanvullende variabele (VA1_waarbegint_10) aan.



* Als 10 niet voorkomt, kunnen we eigenlijk meteen op dezelfde manier gaan kijken of 0 voorkomt.

* als 10 voorkomt.
DO IF CHAR.INDEX(VA_Zorgstandaard1, "10") > 0.
* en als die 10 inderdaad voorkomt, vul dan m.b.v. COMPUTE bij VA1 het cijfer 10 in.
COMPUTE VA1 = 10.
* mocht 10 niet voorkomen, check dan of 0 voorkomt bij ELSE IF.
ELSE IF CHAR.INDEX(VA_Zorgstandaard1, "0") > 0.
* en als die 0 inderdaad voorkomt, vul dan m.b.v. COMPUTE bij VA1 het cijfer 0 in.
COMPUTE VA1 = 0.
END IF.
EXECUTE.

* Voor de resterende waarden zit er niet veel anders op dan alle mogelijkheden uit te schrijven in een RECODE
*  commando.
RECODE VA_Zorgstandaard1 ("Niet van toepassing", "Nicht zutreffend", "Not applicable", "Non applicable", "No aplicable" = 96) INTO VA1.
RECODE VA_Zorgstandaard1 ("Weet ik niet", "Verstehe ich nicht", "I do not understand", "Je ne comprends pas", "No entiendo" = 97) INTO VA1.
* Geef 96 en 96 een value label zodat we niet vergeten waar ze voor staan.
VALUE LABELS VA1
96 "Niet van toepassing"
97 "Weet ik niet".
FREQUENCIES VA1.






* Ruim de twee aanvullende variabelen even op.
DELETE VARIABLES VA1_waarbegint_10 VA1_waarbegint_0.





* Ontdaan van alle opmerkingen/comments en 'overbodige' commando's waren dat eigenlijk de volgende stappen.
COMPUTE VA1 = NUMBER(VA_Zorgstandaard1, F2.0).

DO IF CHAR.INDEX(VA_Zorgstandaard1, "10") > 0.
COMPUTE VA1 = 10.
ELSE IF CHAR.INDEX(VA_Zorgstandaard1, "0") > 0.
COMPUTE VA1 = 0.
END IF.

RECODE VA_Zorgstandaard1 ("Niet van toepassing", "Nicht zutreffend", "Not applicable", "Non applicable", "No aplicable" = 96) INTO VA1.
RECODE VA_Zorgstandaard1 ("Weet ik niet", "Verstehe ich nicht", "I do not understand", "Je ne comprends pas", "No entiendo" = 97) INTO VA1.

VALUE LABELS VA1
96 "Niet van toepassing"
97 "Weet ik niet".

FREQUENCIES VA1.


* Voor de overige 9 VA_Zorgstandaard variabelen moeten we precies dezelfde stappen volgen.
* Eigenlijk zijn er per variabele maar twee namen die steeds veranderen.
* Voor de tweede variabele verandert:
*    VA_Zorgstandaard1 in VA_Zorgstandaard2 en
*    VA1 in VA2.
* Voor de rest is de syntax exact gelijk.
* Idem voor VA_Zorgstandaard3 t/m VA_Zorgstandaard10.

* We zouden natuurlijk bovenstaand stukje syntax kunnen kopieren en 9 keer plakken, en dan
* heel zorgvuldig de nummers kunnen veranderen. Dit werkt wel, maar levert een hele lap tekst
* aan commando's op. Hier zitten de volgende nadelen aan:
* 1. We moeten 10 keer kopieren en plakken en een heleboel waarden veranderen,
 dat is veel repetitief (!!) werk en lijkt niet efficient.
* 2. Bovendien, als we ooit een detail willen veranderen, moeten we die verandering
* ook weer heel zorgvuldig 10 keer doorvoeren!. Ook dat is niet efficient, maar belangrijker nog, het is foutgevoelig.

* Gelukkig heeft SPSS voor dit scenario een oplossing. Kijk eens naar onderstaande syntax en
*  run deze t/m FREQUENCIES VA1 TO VA10.

* We halen de al aangemaakte variabele VA1 even weg, zodat we echt met een schone lei
* beginnen.
DELETE VARIABLES VA1.


DO REPEAT tekstvar = VA_Zorgstandaard1 TO VA_Zorgstandaard10 /
                   numvar = VA1 TO VA10.

    COMPUTE numvar = NUMBER(tekstvar, F2.0).

    DO IF CHAR.INDEX(tekstvar, "10") > 0.
    COMPUTE numvar = 10.
    ELSE IF CHAR.INDEX(tekstvar, "0") > 0.
    COMPUTE numvar = 0.
    END IF.

    RECODE tekstvar ("Niet van toepassing", "Nicht zutreffend", "Not applicable", "Non applicable", "No aplicable" = 96) INTO numvar.
    RECODE tekstvar ("Weet ik niet", "Verstehe ich nicht", "I do not understand", "Je ne comprends pas", "No entiendo" = 97) INTO numvar.

END REPEAT PRINT.

VALUE LABELS VA1 TO VA10
96 "Niet van toepassing"
97 "Weet ik niet".

FREQUENCIES VA1 TO VA10.

* Kijk nu eens in je data wat daar gebeurd is.







* Wow! 10 nieuwe opgeschoonde variabelen! Hoe werkte dat?!.

* DO REPEAT zegt: "run het stuk syntax tussen DO REPEAT en END REPEAT voor elke variabele
* van VA_Zorgstandaard1 t/m VA_Zorgstandaard10 (en parallel daaraan, voor VA1 t/m VA10).
* Het runt dat stuk syntax dus 10 keer!.
* De eerste keer runt hij de syntax voor VA_Zorgstandaard1 en VA1. De tweede keer voor
* VA_Zorgstandaard2 en VA2, dan voor VA_Zorgstandaard3 en VA3 enz...

* In het stuk syntax tussen DO REPEAT en END REPEAT geven we een speciale naam
* aan de VA_Zorgstandaard-variabelen, omdat deze eigenlijk steeds anders is (op een ander nummer eindigt).
* De VA_Zorgstandaard-variabelen heten dan tekstvar.
* Hetzelfde doen we met de VA variabelen, en deze noemen we numvar.








************ OK, NU DE DATA OVER VRAAG B (VB_Z...) ***********.



*                ### OPDRACHT 1 ###.

* Hieronder staat de syntax die we gebruikten om VA_Zorgstandaard1 om te zetten in VA1.
* Pas deze syntax dusdanig aan zodat je hem kan gebruiken om VB_Zorgstandaard1 om te
*  zetten in VB1.

* Hou in gedachten dat de VB1 variabele de volgende waarden moet hebben:
    0 t/m 10 en 
    98 ("geen mening").

COMPUTE VB1 = NUMBER(VB_Zorgstandaard1, F2.0).

DO IF CHAR.INDEX(VB_Zorgstandaard1, "10") > 0.
COMPUTE VB1 = 10.
ELSE IF CHAR.INDEX(VB_Zorgstandaard1, "0") > 0.
COMPUTE VB1 = 0.
END IF.

RECODE VB_Zorgstandaard1 ("Geen mening",
    "Keine Meinung",
    "No opinion",
    "Pas d’opinion",
    "sin opinion",
    "Ingen Ã¥sikt" = 98) INTO VB1.


VALUE LABELS VB1
98 "Geen mening".

FREQUENCIES VB1.








***                    ### OPDRACHT 2 ###.

* Hieronder staat de syntax die we gebruikten om VA_Zorgstandaard1 t/m VA_Zorgstandaard10
* om te zetten in VA1 t/m VA10.
* Pas deze syntax dusdanig aan zodat je hem kan gebruiken om VB_Zorgstandaard1 t/m VB_Zorgstandaard10
* om te zetten in VB1 t/m VB10.

* Wees lui, gebruik zoveel mogelijk je antwoord van opdracht 1.
* Let er wel even op dat het VALUE LABELS en het FREQUENCIES commando pas na END REPEAT komen.

DELETE VARIABLES VB1.

DO REPEAT tekstvar = VB_Zorgstandaard1 TO VB_Zorgstandaard10 / 
                   numvar = VB1 TO VB10.
    
    COMPUTE numvar = NUMBER(tekstvar, F2.0).

    DO IF CHAR.INDEX(tekstvar, "10") > 0.
    COMPUTE numvar = 10.
    ELSE IF CHAR.INDEX(tekstvar, "0") > 0.
    COMPUTE numvar = 0.
    END IF.
    
    RECODE tekstvar ("Geen mening",
        "Keine Meinung",
        "No opinion",
        "Pas d’opinion",
        "sin opinion",
        "Ingen Ã¥sikt" = 98) INTO numvar.

END REPEAT PRINT.

VALUE LABELS VB1 TO VB10
98 "Geen mening".

FREQUENCIES VB1 TO VB10.




***                ### OPDRACHT 3 ###.

* Ga naar https://www.spss-tutorials.com/spss-do-repeat-command/ 
*  en lees de uitleg daar. Open een nieuw syntax venster en run de voorbeelden.

* Waarom werkt het laatste voorbeeld niet (het verwijderen van dubbele spaties)?
* Kan je het voorbeeld aanpassen zodat het wel werkt?.


***            ### OPDRACHT 4 ###.

* Heb je echt de smaak te pakken en wordt je super enthousiast van DO REPEAT?
* Kijk dan ook eens naar het LOOP commando, daar kan nog meer mee.

* Een mooie uitleg met voorbeelden staat hier: https://www.spss-tutorials.com/spss-loop-command/

* Let wel even op, ook deze pagina heeft issues met dubbele spaties.
* Kan je alle voorbeelden zo aanpassen dat ze werken?.

