* Encoding: UTF-8.

* SPSS Syntax Cheat Sheet.




*********************** DATA OPENEN EN OPSLAAN *****************************.


* Databestand openen.
GET FILE='I:\SPSS cursus\SPSS cursus\data\pat_tevr_incl_metadata.sav'.
DATASET NAME pat_tevr WINDOW=FRONT.


* Databestand opslaan.
SAVE OUTFILE='I:\SPSS cursus\SPSS cursus\data\pat_tevr_incl_metadata.sav'.



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


*** RECODE (INTO) ***.

* Aanpassen van een variabele.
RECODE geslacht (11=1).
EXECUTE.

* Meerdere waarden tegelijk veranderen.
RECODE chronisch_ziek (10=1) (11=1).
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

* Je kan ook alleen iets doen met system-missing values. Dus de missende waarden waar je NIET -99
*  had ingevuld. Dan gebruik je SYSMIS.
RECODE geslacht (-88=SYSMIS).
EXECUTE.



*** COMPUTE ***.








*** DO IF, (ELSE IF, ELSE), END IF ***.









******************************************************************************************.





******************************************************************************************.
******************************************************************************************.
******************************************************************************************.
******************************************************************************************.
******************************************************************************************.
******************************************************************************************.
