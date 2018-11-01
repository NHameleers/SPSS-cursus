* Encoding: UTF-8.

* Save simulated data made with python into SPSS format.

* Small file: 10 rows of data.
PRESERVE.
SET DECIMAL DOT.

GET DATA  /TYPE=TXT
  /FILE="I:\SPSS cursus\Voorbereiding\2018-12-23_pat_tevr.csv"
  /ENCODING='UTF8'
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /LEADINGSPACES IGNORE=YES
  /DATATYPEMIN PERCENTAGE=95.0
  /VARIABLES=
  respondentnummer F8.2
  geslacht F8.2
  chronisch_ziek F8.2
  gebdatum SDATE10
  zorgverlener A20
  rapportcijfer F8.2
  opleidingsniveau F8.2
  /MAP.
RESTORE.

CACHE.
EXECUTE.
DATASET NAME pattev10 WINDOW=FRONT.

ALTER TYPE gebdatum (date11).


SAVE OUTFILE='I:\SPSS cursus\SPSS cursus\data\Brondata\2018-12-23_pat_tevr.sav'.




* Larger file: 500 rows of data.
PRESERVE.
SET DECIMAL DOT.

GET DATA  /TYPE=TXT
  /FILE="I:\SPSS cursus\Voorbereiding\2019-01-02_pat_tevr.csv"
  /ENCODING='UTF8'
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /LEADINGSPACES IGNORE=YES
  /DATATYPEMIN PERCENTAGE=95.0
  /VARIABLES=
  respondentnummer F8.2
  geslacht F8.2
  chronisch_ziek F8.2
  gebdatum SDATE10
  zorgverlener A20
  rapportcijfer F8.2
  opleidingsniveau F8.2
  /MAP.
RESTORE.

CACHE.
EXECUTE.

EXECUTE.
DATASET NAME pattev500 WINDOW=FRONT.

ALTER TYPE gebdatum (date11).


SAVE OUTFILE='I:\SPSS cursus\SPSS cursus\data\Brondata\2019-01-02_pat_tevr.sav'.


DATASET CLOSE pattev10.
DATASET CLOSE pattev500.
