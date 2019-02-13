* Encoding: UTF-8.

CD "I:\SPSS cursus\SPSS cursus".


*** Eerst de hacker editie ***.
PRESERVE.
SET DECIMAL DOT.

GET DATA  /TYPE=TXT
  /FILE="..\Voorbereiding\emailzooitje.csv"
  /DELIMITERS=";"
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /LEADINGSPACES IGNORE=YES
  /DATATYPEMIN PERCENTAGE=95.0
  /VARIABLES=
  emailzooitje A100
  V2 AUTO
  /MAP.
RESTORE.
CACHE.
EXECUTE.
DATASET NAME emails WINDOW=FRONT.

DELETE VARIABLES V2.

STRING email_adres (A75).
STRING email_domein (A75).
STRING achternaam (A75).
STRING voornaam (A75).
STRING tussenvoegsels (A75).
STRING volledige_naam (A75).
STRING afdeling (A75).

VARIABLE LABELS email_adres "Het hele emailadres".
VARIABLE LABELS email_domein "Het domein van het emailadres, dus alles achter apestaartje".
VARIABLE LABELS achternaam "De achternaam zonder tussenvoegsels (zoals van/de/der etc)".
VARIABLE LABELS voornaam "De voornaam zonder tussenvoegsels".
VARIABLE LABELS tussenvoegsels "De tussenvoegsels!".
VARIABLE LABELS volledige_naam "De naam netjes geschreven, dus voornaam tussenvoegsels achternaam".
VARIABLE LABELS afdeling "De afdeling. Staat meestal tussen haakjes (HSR of SOCMED)".

SAVE OUTFILE="data\Brondata\emails_hacker_edition.sav".






*** En dan de normale editie ***.

PRESERVE.
SET DECIMAL DOT.

GET DATA  /TYPE=TXT
  /FILE="..\Voorbereiding\emailzooitje.csv"
  /DELIMITERS=";"
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /LEADINGSPACES IGNORE=YES
  /DATATYPEMIN PERCENTAGE=95.0
  /VARIABLES=
  emailzooitje A100
  V2 AUTO
  /MAP.
RESTORE.
CACHE.
EXECUTE.
DATASET NAME emails WINDOW=FRONT.

DELETE VARIABLES V2.

SAVE OUTFILE="data\Brondata\emails_normale_versie.sav".




