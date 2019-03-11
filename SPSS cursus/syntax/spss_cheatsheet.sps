* Encoding: UTF-8.

* SPSS Syntax Cheat Sheet.





*********************** WERKDIRECTORY EN INSERT **************************.

* Werkdirectory instellen. Alle paden/adressen van bestanden gebruiken dit nu als uitgangspunt.
CD 'I:\SPSS cursus\SPSS cursus'.


* Een opgeslagen syntax-bestand 'oproepen' en helemaal runnen.
INSERT FILE="Syntax_bestand_dat_je_helemaal_wil_runnen.sps".

******************************************************************************************.




*********************** DATA OPENEN EN OPSLAAN *****************************.


* Databestand openen.
GET FILE='data\pat_tevr_incl_metadata.sav'.
DATASET NAME pat_tevr WINDOW=FRONT.


* Databestand opslaan.
SAVE OUTFILE='data\pat_tevr_incl_metadata.sav'.



******************************************************************************************.




************************  METADATA (VARIABLE VIEW)  ***************************.


* Omschrijving van variabele.
VARIABLE LABELS chronisch_ziek "Patient heeft een chronische aandoening".


* Omschrijving van de mogelijke waarden die een variabele kan aannemen.
ADD VALUE LABELS chronisch_ziek
0 "Nee"
1 "Ja".

* Dit kan je ook gebruiken om 1 extra value label toe te voegen en de andere intact te laten.
ADD VALUE LABELS chronisch_ziek
2 "Misschien".


* Bepaalde waarden als MISSING instellen, zodat SPSS ze ook ziet als missende waarden.
MISSING VALUES chronisch_ziek (-99).


* Data type. Numerieke variabelen.
* Width (de 1 na de F): het totaal aantal cijfers (incl decimalen) aan dat SPSS in de data view laat zien. 
* Decimals (de 0 na de punt) geeft het aantal cijfers achter de komma aan dat SPSS laat zien.
FORMATS chronisch_ziek(F1.0).

* Data type. Tekstvariabelen.
* Width (de 20 na de A): het maximale aantal tekens dat een waarde kan hebben.
ALTER TYPE zorgverlener(A20).


* Variable level (meetniveau) instellen.
VARIABLE LEVEL chronisch_ziek(NOMINAL).
VARIABLE LEVEL opleidingsniveau(ORDINAL).
VARIABLE LEVEL rapportcijfer(SCALE).


* Naam van variabele veranderen.
RENAME VARIABLES gebdatum = geboortedatum.

* Variabele(n) verwijderen.
DELETE VARIABLES var1 var2.

******************************************************************************************.






************************ BESCHRIJVENDE STATISTIEK ***************************.

*** Nominale/categorale/ordinale variabelen ***.

* Frequentietabel.
FREQUENCIES chronisch_ziek.

* Including barchart.
FREQUENCIES chronisch_ziek
  /BARCHART.

* Opgesplitst naar een tweede variabele.
CROSSTABS chronisch_ziek by geslacht.




*** Scale/continue variabelen ***.

* N, minimum, maximum, gemiddelde, standaardafwijking.
MEANS rapportcijfer
  /CELLS COUNT MIN MAX MEAN STDDEV.

* Alle mogelijke opties voor CELLS.
MEANS rapportcijfer
  /CELLS ALL.


* Means opgesplitst naar een tweede variabele.
MEANS rapportcijfer by chronisch_ziek
  /CELLS COUNT MIN MAX MEAN STDDEV.


* Histogram.
* FORMAT=NOTABLE kan je weglaten, maar dan krijg je bij continue variabelen meestal een hele
*  grote frequentietabel erbij.
FREQUENCIES rapportcijfer
  /FORMAT=NOTABLE
  /HISTOGRAM.

******************************************************************************************.







*************************** VARIABELEN AANPASSEN  ****************************.


*############# RECODE (INTO) ################.

* Aanpassen van een variabele.
RECODE geslacht (11=1).
EXECUTE.

* Meerdere waarden tegelijk veranderen.
RECODE chronisch_ziek (10, 11=1) (22=2).
EXECUTE.

* Recoderen naar een nieuwe variabele.
RECODE geslacht (11=1) (ELSE=COPY) INTO geslacht_recoded.
EXECUTE.

* Recoderen naar een nieuwe variabele, voorbeeld uit de lessen.
RECODE rapportcijfer (0 THRU 5.9 = 1) (6 THRU 7.9 = 2) (8 THRU HIGHEST = 3) (ELSE = COPY) INTO rapportcijfer_categorie.
EXECUTE.



* MISSING gebruiken in een RECODE commando.
RECODE geslacht (-99=MISSING).
EXECUTE.

* Of andersom als je iets speciaals wil doen met waarden die missing zijn.
RECODE geslacht (MISSING=-88).
EXECUTE.





*################ COMPUTE ################*.

* COMPUTE kan (voor nummers) zo eenvoudig zijn als:.
COMPUTE naam_van_variabele = berekening.
EXECUTE.


* Voor COMPUTE met tekstvariabelen zie onderwerp TEKST BEWERKEN.




* COMPUTE voorbeelden met nummers:.
COMPUTE bmi = gewicht / (lengte_in_m * lengte_in_m).
EXECUTE.

COMPUTE huisarts_inschrijftariefkosten = 36.
EXECUTE.

* Let op met missende waarden!. Het + teken zorgt dat elke optelling met missende waarden ook
*  een missende waarde als resultaat geeft.
COMPUTE totale_zorgkosten = medicijnkosten + huisartskosten + specialistkosten + huisarts_inschrijftariefkosten.
* De SUM functie negeert missende waarden.
COMPUTE totale_zorgkosten = SUM(medicijnkosten, huisartskosten, specialistkosten, huisarts_inschrijftariefkosten).
EXECUTE.

* Vermenigvuldigen gaat met * .
COMPUTE zorgkostenvergoeding = totale_zorgkosten * 1.1.

* Delen met / .
COMPUTE lengte_in_m = lengte / 100.
EXECUTE.

* De berekening mag ook een voorwaarde (conditional) zijn.
COMPUTE rapportcijfer_minimaal_voldoende = rapportcijfer >= 6.
EXECUTE.




*################ DO IF, (ELSE IF, ELSE), END IF ################*.

 * Met DO IF kan je transformaties (COMPUTE, RECODE) uitvoeren voor bepaalde rijen in je data.

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

* Je kan ook AND en OR gebruiken om voorwaarden te combineren.
* Met ~ kan je ook een voorwaarde omdraaien: ~(deze_voorwaarde) betekent 'NIET deze voorwaarde'.


* Voorbeelden:.
DO IF zorgverlener_kopie = 'fysiotherapeut'.
COMPUTE zorgverlener_kopie = 'fysio'.
END IF.
EXECUTE.

DO IF rapportcijfer >= 0 AND rapportcijfer < 6.
COMPUTE rapportcijfer_categorie_2 = 1.
ELSE IF rapportcijfer >= 6 AND rapportcijfer < 7.5.
COMPUTE rapportcijfer_categorie_2 = 2.
ELSE IF rapportcijfer >= 7.5 AND rapportcijfer <= 10.
COMPUTE rapportcijfer_categorie_2 = 3.
ELSE.
COMPUTE rapportcijfer_categorie_2 = -99.
END IF.
EXECUTE.






*################ AUTORECODE ################*.

* AUTORECODE verandert een tekstvariabele naar een numerieke nominale variabele met value labels.
AUTORECODE zorgverlener_kopie 
  /INTO zorgverlener_schoon
  /PRINT.





*################ TEKST BEWERKEN ################*.

* Gaat eigenlijk vrijwel altijd in combinatie met COMPUTE.

* Voor COMPUTE met tekstvariabelen is het noodzakelijk dat de variabele eerst bestaat.
* Bestaat hij nog niet, maak hem dan met het STRING commando.
STRING naam_van_tekstvariabele (A50).
EXECUTE.

* Een lowercase kopie maken van tekstvariabele.
COMPUTE zorgverlener_kopie = LOWER(zorgverlener).

* Vervangen van tekst.
COMPUTE zorgverlener_kopie = REPLACE(zorgverlener_kopie, 'specialiste', 'specialist').

* Verwijderen van tekst (is vervangen door lege tekst...alleen twee aanhalingstekens).
COMPUTE zorgverlener_kopie = REPLACE(zorgverlener_kopie, ' azm', '').
EXECUTE.


* Positie van letter/teken of stuk tekst zoeken in andere tekst..
COMPUTE positie_eerste_komma = CHAR.INDEX(emailzooitje, ",").

* Een specifiek stuk tekst selecteren uit andere tekst.
COMPUTE achternaam = CHAR.SUBSTR(emailzooitje, 1, tekens_voor_komma).

* Spaties voor ('leading') of achter ('trailing') tekst weghalen.
COMPUTE voornaam_rustig_en_precies = LTRIM(voornaam_rustig_en_precies).
COMPUTE voornaam_rustig_en_precies = RTRIM(voornaam_rustig_en_precies).


* Tekst samenvoegen.
COMPUTE volledige_naam = CONCAT(voornaam, " ", achternaam).

* Lengte van tekst uitrekenen.
COMPUTE lengte_van_emailzooitje = CHAR.LENGTH(emailzooitje).


EXECUTE.
******************************************************************************************.





******************* WERKEN MET DATUMS ************************.


******************************************************************************************.
******************************************************************************************.
******************************************************************************************.
******************************************************************************************.
******************************************************************************************.
