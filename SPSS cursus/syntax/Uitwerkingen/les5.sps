* Encoding: UTF-8.



* Stel de juiste werkdirectory in.
CD "I:\SPSS cursus\SPSS cursus\".




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



* CHAR.INDEX in combinatie met 'groter dan' gebruiken om tegen SPSS te zeggen:
" Komt '10' voor in deze tekst?".


* DO REPEAT.



