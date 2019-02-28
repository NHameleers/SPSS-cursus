* Encoding: UTF-8.

* Stel de juiste werkdirectory in.
CD "I:\SPSS cursus\SPSS cursus".



***** DE TITANIC DATASET *******.

* Vandaag werken we met een deel van de Titanic dataset.
* Deze dataset bevat informatie over een deel van de passagiers die aanwezig waren
*  op de Titanic.


* Run alle syntax t/m het derde VALUE LABELS commando (regel 100) om verder te gaan.


* Nieuwsgierig over de dataset? Kijk dan eens hier:
https://www.kaggle.com/c/titanic/data
en hier:
https://www.kaggle.com/c/titanic.
* De data waar je hier mee werkt zitten op de website in het bestand 'train.csv'.

* Opmerkingen bij de variabelen:.

 * pclass: A proxy for socio-economic status (SES)
1st = Upper
2nd = Middle
3rd = Lower

 * age: Age is fractional if less than 1. If the age is estimated, is it in the form of xx.5

 * sibsp: The dataset defines family relations in this way...
 * Sibling = brother, sister, stepbrother, stepsister
Spouse = husband, wife (mistresses and fiancés were ignored)

 * parch: The dataset defines family relations in this way...
 * Parent = mother, father
Child = daughter, son, stepdaughter, stepson
Some children travelled only with a nanny, therefore parch=0 for them.

PRESERVE.
SET DECIMAL DOT.

GET DATA  /TYPE=TXT
  /FILE="data\Brondata\titanic.csv"
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /DATATYPEMIN PERCENTAGE=95.0
  /VARIABLES=
  PassengerId AUTO
  Survived AUTO
  Pclass AUTO
  Name AUTO
  Sex AUTO
  Age AUTO
  SibSp AUTO
  Parch AUTO
  Ticket AUTO
  Fare AUTO
  Cabin AUTO
  Embarked AUTO
  /MAP.
RESTORE.

CACHE.
EXECUTE.
DATASET NAME titanic WINDOW=FRONT.

VARIABLE LABELS PassengerId "PassengerId".
VARIABLE LABELS Survived "Survival".
VARIABLE LABELS pclasS "Ticket class".
VARIABLE LABELS Name "Passenger's name".
VARIABLE LABELS sex "Sex".
VARIABLE LABELS Age "Age in years".
VARIABLE LABELS sibsp "# of siblings / spouses aboard the Titanic".
VARIABLE LABELS parch "# of parents / children aboard the Titanic".
VARIABLE LABELS ticket "Ticket number".
VARIABLE LABELS fare "Passenger fare".
VARIABLE LABELS cabin "Cabin number".
VARIABLE LABELS embarked "Port of Embarkation".

VALUE LABELS Survived
0 "No"
1 "Yes".

VALUE LABELS Pclass
1 "1st"
2 "2nd"
3 "3rd".

VALUE LABELS Embarked
"C" "Cherbourg"
"Q" "Queenstown"
"S" "Southampton".


************* RUN TOT HIER DUS ***************.





* Bekijk je data. Bekijk de variabelen en hun eventuele labels. 
* Draai een paar frequentietabellen uit om een eerste idee te krijgen.





* Beantwoord dan de onderstaande vragen. Maak alleen gebruik van syntax, iemand anders
* moet met jouw syntax ook de antwoorden in de output kunnen vinden.

* Mochten er nieuwe vragen in je opkomen tijdens het beantwoorden, schrijf deze dan hier op,
* deel ze met de groep en probeer ze ook (evt. samen) te beantwoorden.




*** Gebruik FREQUENCES of MEANS voor de volgende vragen ***.
* Voeg evt. Barcharts of histogrammen toe.

* Hoeveel passagiers (in deze dataset) overleefden de ramp?.
* Hoeveel procent is dat?.

* Hoeveel mensen zaten in de 1e klasse (Pclass)? Hoeveel in de 3e?.

* Hoeveel mannen en hoeveel vrouwen waren aan boord?.
* Hoeveel is dat in procenten?.

* Wat was de gemiddelde leeftijd van de passagiers?.

* Wat was de minimum en maximum leeftijd van de passagiers?.

* Van hoeveel mensen weten we de leeftijd niet?.
* Hoeveel is dat in procenten?.

* Wat was het gemiddelde aantal broers/zussen/partners (SibSp)?.
* En het minimale en maximale aantal broers/zussen/partners?.

* Wat was het gemiddelde aantal ouders/kinderen (Parch)?.
* En het minimale en maximale aantal ouders/kinderen?.

* Maak een histogram van leeftijd.

* Maak een histogram van ticket prijs (Fare).

* Hoeveel kostte het duurste ticket?.





*** Gebruik MEANS BY om de volgende vragen te beantwoorden ***.
* Dat werkte zo: MEANS scale_variabele1 BY scale_variabele2.

* Wat was de gemiddelde leeftijd voor mensen die overleefden en
*  wat was de gemiddelde leeftijd voor mensen die NIET overleefden?.

* Verschilde de gemiddelde ticketprijs (Fare) voor overlevers vs. niet-overlevers?.

* Moet je gemiddeld meer of minder betalen (Fare) afhankelijk van waar je opstapt (Embarked)?.




*** Probeer ook eens CROSSTABS ***.
* Dat werkt zo: .
CROSSTABS Survived BY Sex.

* En met een kleine toevoeging zie je ook de kolom percentages.
CROSSTABS Survived BY Sex
  /CELLS=COUNT COLUMN.

* Zoek in de kruistabel op hoeveel procent van de mannen de ramp overleefde?.
* En hoeveel procent van de vrouwen overleefde?.

* Maak nu zelf zo'n CROSSTABS commando en zoek uit hoeveel procent 
* per ticket klasse (Pclass) overleefde. Is er een groot verschil tussen 1e en 3e klasse?.






*** Voor de volgende vragen moet je misschien meer dan 1 stap doorlopen ***.
* Gebruik zo nodig RECODE of COMPUTE voordat je
*  FREQUENCIES, MEANS, of CROSSTABS opvraagt.


* Hoeveel passagiers zijn jonger dan 18?.
* Hoeveel procent van alle passagiers is dat?.


* Hoeveel mensen waren ouder dan gemiddeld?.
* Is dat meer of minder dan de helft van alle passagiers?.


* Maak een nieuwe variabele die 1 is als iemand in 1e klasse reisde, 
* en 0 als hij niet in 1e klasse reisde.
* Hoeveel mensen reisden NIET 1e klasse?. Hoeveel procent is dat?.


* Wat is het percentage overlevenden voor de volgende groepen passagiers?.
*    A. 0-18 jarigen.
*    B. 18-45 jarigen.
*    C. 45-plussers.




*** Gebruik DO REPEAT om dummy-variabelen aan te maken voor Pclass.
* Voor meer uitleg zie https://www.spss-tutorials.com/spss-do-repeat-command/.

