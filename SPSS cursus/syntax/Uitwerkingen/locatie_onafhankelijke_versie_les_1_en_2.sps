* Encoding: UTF-8.

* Locatie-onafhankelijke versie. Alleen te gebruiken met INSERT, voorafgegaan door een CD command.




***************************** COMMANDO'S UIT LES 1 ************************************************.
  
GET
  FILE='data\Brondata\2019-01-02_pat_tevr.sav'.
DATASET NAME patient_tevr WINDOW=FRONT.

SAVE OUTFILE='data\pat_tevr_incl_metadata.sav'.

VARIABLE LABELS respondentnummer "Uniek respondentnummer".
VARIABLE LABELS geslacht "Geslacht van respondent".
VARIABLE LABELS chronisch_ziek "Patient heeft een chronische aandoening".
VARIABLE LABELS gebdatum "Geboortedatum van patient".
VARIABLE LABELS zorgverlener "Zorgverlener die patient gezien heeft".
VARIABLE LABELS rapportcijfer "Rapportcijfer door patient aan zorgverlener gegeven (schaal van 0-10)".
VARIABLE LABELS opleidingsniveau "Opleidingsniveau van patient".

ADD VALUE LABELS geslacht
0 "vrouw"
1 "man".

ADD VALUE LABELS chronisch_ziek
0 "Nee"
1 "Ja".

ADD VALUE LABELS opleidingsniveau
1 "Laag"
2 "Midden"
3 "Hoog".

MISSING VALUES geslacht (-99).

MISSING VALUES chronisch_ziek (-99).

FORMATS rapportcijfer(F3.1).
FORMATS respondentnummer(F8.0).
FORMATS geslacht(F1.0).
FORMATS chronisch_ziek(F1.0).
FORMATS opleidingsniveau(F2.0).
FORMATS rapportcijfer(F4.2).
ALTER TYPE zorgverlener(A17).
ALTER TYPE zorgverlener(A20).

VARIABLE LEVEL respondentnummer (NOMINAL).
VARIABLE LEVEL gebdatum (SCALE).
VARIABLE LEVEL geslacht(NOMINAL).
VARIABLE LEVEL chronisch_ziek(NOMINAL).
VARIABLE LEVEL zorgverlener(NOMINAL).
VARIABLE LEVEL rapportcijfer(SCALE).
VARIABLE LEVEL opleidingsniveau(ORDINAL).

RENAME VARIABLES gebdatum = geboortedatum.

SAVE OUTFILE='data\pat_tevr_incl_metadata.sav'.

**********************************************************************************.




***************************** COMMANDO'S UIT LES 2 ************************************************.


FREQUENCIES geslacht
  /BARCHART.

RECODE geslacht (11=1).

FREQUENCIES geslacht
  /BARCHART.

FREQUENCIES chronisch_ziek 
 /BARCHART.

RECODE chronisch_ziek (10, 11=1).

FREQUENCIES chronisch_ziek 
 /BARCHART.

FREQUENCIES opleidingsniveau 
 /BARCHART.

RECODE opleidingsniveau (13=1) (4=3).

FREQUENCIES opleidingsniveau 
 /BARCHART.

FREQUENCIES chronisch_ziek opleidingsniveau 
 /BARCHART.

MISSING VALUES opleidingsniveau (-99).

MEANS rapportcijfer
  /CELLS COUNT MIN MAX MEAN STDDEV.

FREQUENCIES rapportcijfer.

FREQUENCIES rapportcijfer
  /FORMAT NOTABLE
  /HISTOGRAM.

RECODE rapportcijfer (75=7.5) (80=8).
EXECUTE.
MISSING VALUES rapportcijfer (-99).

EXAMINE rapportcijfer
  /PLOT BOXPLOT HISTOGRAM.

RECODE rapportcijfer (0 THRU 5.9 = 1) (6 THRU 7.49 = 2) (7.5 THRU HIGHEST = 3) (ELSE = COPY) INTO rapportcijfer_categorie.
EXECUTE.

FREQUENCIES rapportcijfer_categorie.

MISSING VALUES rapportcijfer_categorie (-99).

MEANS geboortedatum
 /CELLS COUNT MIN MAX MEAN STDDEV.

EXAMINE geboortedatum
 /PLOT BOXPLOT HISTOGRAM.

  FREQUENCIES zorgverlener
  /BARCHART.

DESCRIPTIVES rapportcijfer.

SAVE OUTFILE='data\pat_tevr_incl_metadata.sav'.

**********************************************************************************.




