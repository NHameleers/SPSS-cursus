* Encoding: UTF-8.
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


