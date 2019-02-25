* Encoding: UTF-8.



 * why use syntax if SPSS has such a nice menu?
The basic point is that syntax can be saved, corrected, 
rerun and shared between projects or users. 
 * Your syntax makes your SPSS work replicable.
 *  If anybody raises any doubts regarding your outcomes, 
 you can show exactly what you did and -if needed- correct and rerun it in seconds.



 * Opening data files, either in SPSS’ own file format or many others;
editing data such as computing sums and means over columns or rows of data. SPSS has outstanding options for more complex operations as well.
 * creating tables and charts containing frequency counts or summary statistics over (groups of) cases and variables.
 * running inferential statistics such as ANOVA, regression and factor analysis.
 * saving data and output in a wide variety of file formats.


* Data invoeren.


* Openen
*    - SPSS bestand
*    - Excel bestanden (csv, xls, xlsx)
*    - Overige bestanden...



* Editing:
*    - Variable names, labels, and value labels.
*    - Data type (format), level (meetniveau).

*    - RECODE.

*    - Wat kan allemaal met tekst? Wanneer gebruik je tekst?.
* "only nominal variables with many categories should be string variables in SPSS."
* "Examples are names of people, email addresses, passport numbers and so on."
* https://www.spss-tutorials.com/spss-variable-types-and-formats/
*    - Autorecode.
* https://www.spss-tutorials.com/spss-autorecode-command/

*    - COMPUTE.

*    - IF. DO IF.
*             Waarden corrigeren voor specifieke respondenten.
*             Bijv. een 11 corrigeren voor geslacht, voor alle patienten naar 1, behalve voor patient x...



* Analyse:
*    - tabellen
*        - FREQUENCIES
*        - DESCRIPTIVES
*        - CROSSTABS
*        - CUSTOM TABLES
*    - grafieken
*        - BARCHART
*        - HISTOGRAM

*    - SELECT CASES.
*    - FILTER BY.
*    - SPLIT FILE.


* Statistiek.


* Opslaan van syntax, data en output.

* Output exporteren naar EXCEL.


 * 1.       SPSS vensters (Syntax, Data, Output), werken met syntax, openen en opslaan van bestanden, metadata (variable view) via syntax bewerken.
 * 2.       Categorale en numerieke variabelen, beschrijvende statistiek opvragen, variabelen opschonen via recode (en recode into)
3.       Variabelen opschonen, transformeren of maken met compute.
 * 4.       Opschonen op basis van condities: IF statements
5.       Werken met text-functies (meestal i.c.m. compute)
6.       Werken met datums

* Denk ook eens na over cross-variable checks, evt. in combinatie met compute.
* vb: zijn twee datums hetzelfde.
* zijn alle waarden in mijn nieuwe categorie-variabele correct?.

* Ook: SPLIT FILE, SELECT IF/FILTER.

* Iets meer aandacht voor het maken van tabellen? MEANS BY? CROSSTABS? CUSTOM TABLES?.

 * 7.       Unit of analysis, aggregeren (, custom tables?)
8.       Bestanden koppelen (merge, join, match)
9.       Datum nog niet geprikt: Masterscript en organisatie daarvan. Hele opschoning, analyse en output met 1 druk op de knop, maar wel verdeeld over verschillende syntaxbestanden per onderwerp.
 
 * Voorbeelden van meer uitdagende opdrachten/onderwerpen:
1.       In plaats van .sav bestanden ook .csv en .xlsx bestanden openen via syntax.
 * 2.       Overige mogelijkheden van recode (else=copy, thru, werken met missing())
3.       Logical operators (AND, OR, NOT), comparison operators (>, >=, <, <=, =, ~=), combinaties daarvan en operator precedence (ofwel: waar moet ik wel/geen haakjes zetten)
4.       IF condities voor meerdere variabelen tegelijk.
 * 5.       Testen of bepaalde tekst voorkomt in variabele. Regular expressions (patronen in tekst herkennen).
