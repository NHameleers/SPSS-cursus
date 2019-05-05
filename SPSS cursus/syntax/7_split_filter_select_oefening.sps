* Encoding: UTF-8.


*** LES 7:

* Output splitten (resultaten voor twee of meer groepen apart laten zien.
* Cases selecteren (en verwijderen).




CD 'I:\SPSS cursus\SPSS cursus'.



* Vandaag werken we weer met een deel van de Titanic dataset.
INSERT FILE='syntax\uitwerkingen\open_en_label_titanic_data.sps'.
 
* Mocht je de titanic dataset nog niet hebben gezien in extra_oefeningen_les_1_tm_5, 
kan je er via deze link meer over lezen: https://www.kaggle.com/c/titanic/data
en hier: https://www.kaggle.com/c/titanic.
* De data waar je hier mee werkt zitten op de website in het bestand 'train.csv'.






**************** OUTPUT SPLITTEN ***************.

* Soms wil je output apart laten zien voor bepaalde groepen. Stel dat je bijvoorbeeld wil exploreren hoe de
* leeftijdsverdeling van de titanic passagiers verschilt tussen mannen en vrouwen.
* Zo'n verdeling van een (SCALE) variabele bekijken doe je meestal met een histogram.

* Voor alle passagiers samen kan je een histogram maken m.b.v. FREQUENCIES:.
FREQUENCIES Age
  /FORMAT=NOTABLE
  /HISTOGRAM.


* Om hier een histogram voor mannen en een histogram voor vrouwen van te maken, laat je
* datzelfde commando voorafgaan door:.
SORT CASES  BY Sex.
SPLIT FILE LAYERED BY Sex.

* Kijk maar wat er gebeurt.
FREQUENCIES Age
  /FORMAT=NOTABLE
  /HISTOGRAM.

* Ook tabellen worden aangepast door het split file commando.
FREQUENCIES Survived.

* Voor al je commando's wordt de output dan gesplit naar geslacht, totdat je dat weer uitzet met:.
SPLIT FILE OFF.

* Je kan deze commando's in het menu vinden bij Data --> Split File. De specifieke optie hierboven
*  is 'Compare groups'. De 'Analyze all cases' optie zet de split weer uit via het menu.


* Voor figuren vind ik het SPLIT FILE commando handig. Voor tabellen zijn er vaak simpelere manieren
* om resultaten te splitten. Het is niet altijd nodig dit via split file te doen. De resultaten zijn soms nog beter leesbaar ook.
* Welke commando's zijn dat dan? In het kort:

* Wil je de resultaten van een NOMINALE/ORDINALE variabele splitten naar groepen (zoals hierboven met Survived),
* dan kan je ook het CROSSTABS (kruistabel) commando gebruiken.
CROSSTABS sex BY Survived.

CROSSTABS
  /TABLES=Survived BY Sex
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


* Wil je de resultaten van een SCALE/continue variabele splitten naar groepen, dan heb je vaak genoeg aan
* het MEANS BY commando. 
MEANS Age BY sex.







********** FILTER BY *************.

* Soms wil je niet groepen vergelijken (zoals man/vrouw), maar alleen een specifieke groep bekijken.
* Dit kan je doen met het FILTER BY commando. 

* Stel dat we alleen resultaten willen opvragen voor de vrouwen in de dataset.

* Via het menu kan je dit doen bij Data --> Select cases --> If condition is satisfied --> If... --> en daar je voorwaarde invullen,
*  bijvoorbeeld: Sex = 'female'.

* Het belangrijkste stuk van de syntax die je via het menu krijgt is eigenlijk dit:.

* Begin met alle cases aan.
USE ALL.
* maak een variabele waarop je filtert. Deze heeft waarde 1 voor vrouwen, en 0 (of missing) voor alle andere rijen.
COMPUTE filtervariabele = (Sex = 'female').
FILTER BY filtervariabele.

* Als je nu figuren of tabellen opvraagt, dan zie je alleen de resultaten voor vrouwen.
FREQUENCIES Survived
  /HISTOGRAM.

FILTER OFF.

* Merk op dat het in je output wel minder goed zichtbaar is dat je een bepaalde groep bekijkt.






********** SELECT IF *************.

* SPLIT FILE en FILTER BY zijn eigenlijk een soort TIJDELIJKE selecties die aan of uitgezet worden,
*  maar alle observaties blijven wel gewoon in je dataset staan.

* Soms wil je ook ook bepaalde rijen gewoon helemaal verwijderen.
* Dat kan met SELECT IF. Achter SELECT IF kan je een voorwaarde zetten die bepaald welke rijen je wil BEHOUDEN.
* Wil je bijvoorbeeld alle vrouwen in je data houden, maar alle mannen weggooien, dan gebruik je:.
SELECT IF (sex = 'female').
FREQUENCIES sex.

* Let even op dat SELECT IF gevolgd moet worden door een 'Procedure' commando
 (zoals FREQUENCIES, MEANS, etc) of door EXECUTE, om de selectie ook daadwerkelijk toe te passen.


* Ok, nu zijn al die mannen dus ook echt weg. Die krijg je niet meer terug, tenzij je weer opnieuw de dataset opent.
* Dit is dus een vrij rigoureuze optie. Gebruik hem alleen als het nodig is.

* Laten we de dataset dus maar even opnieuw openen zodat we weer met alle cases werken.
INSERT FILE='syntax\uitwerkingen\open_en_label_titanic_data.sps'.

* Wanneer is SELECT IF dan echt nodig?.
* Dat kan bijvoorbeeld zijn wanneer je bepaalde cases helemaal wil verwijderen. Denk bijvoorbeeld aan respondenten
*  die de eerste vraag hebben ingevuld en verder helemaal niks. Daar ga je in je analyse waarschijnlijk toch niks mee doen.

* Stel dat we bij de titanic dataset iedereen willen verwijderen die is ingestapt (Embarked) in Queenstown.
* De voorwaarde 'ingestapt in Queenstown' kunnen we schrijven als: (Embarked = 'Q').

* Je moet altijd specificeren wat je wil behouden, dus als je iets wil verwijderen moet je het 'omkeren'.
* We zeggen dan eigenlijk tegen SPSS: Selecteer iedereen die NIET in Queenstown is ingestapt.
* NIET schrijven we in SPSS met een tilde: ~ .

* Iedereen verwijderen die is ingestapt in Queenstown wordt dan:.
SELECT IF ~(Embarked = 'Q').
* Met FREQUENCIES kan je zien dat deze instapplaats ook uit de data is verdwenen.
FREQUENCIES Embarked.








******************* OPDRACHTEN **************************.

* A. Discussie: Wat is het verschil tussen DO IF en de drie commando's in deze les
*  (SPLIT FILE, FILTER BY, SELECT IF)?.
* Denk over het soort situaties waarin je ze gebruikt, en het soort commando's dat erop volgt.



* Open de dataset nogmaals opnieuw zodat alle passagiers er weer in staan.
INSERT FILE='syntax\uitwerkingen\open_en_label_titanic_data.sps'.


* B. Gebruik SPLIT FILE om voor elke Pclass de volgende output op te vragen en zet daarna de split weer uit:.
* 1. Een histogram van leeftijd.
* 2. Een frequentietabel van survived.


* C. Maak eenzelfde soort frequentietabel van survived opgedeeld naar Pclass met een ander commando, zonder
*  SPLIT FILE te gebruiken. (Tip: wat voor measurement level heeft de variabele Survived? Nominaal/Ordinaal/Scale?).




* D. Gebruik FILTER BY om alleen kinderen te bekijken (kind betekent jonger dan 18) en zoek uit:.
* 1. Hoeveel procent van de kinderen de ramp overleefde.
* 2. Hoeveel kinderen er in elke klasse zaten.
* 3. Waren er meer jongens of meer meisjes aan boord.
* 4. Bereken het gemiddelde van Survived.
* 5. Vergelijk je output van 4 met het antwoord van 1.
*     Wat geeft het gemiddelde van een binaire/dummy/dichotome variabele weer?.
*     NB: Binair/dichotoom/dummy betekent dat de variabele de waarden 0 en 1 heeft.

 * Zet de filter weer uit voordat je verdergaat.



* E. 
* 1. Gebruik SELECT IF om alle passagiers uit Pclass 3 te behouden.
* 2. Gebruik de filter van vraag D om alle kinderen uit de data te verwijderen.



