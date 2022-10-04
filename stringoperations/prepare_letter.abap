*&---------------------------------------------------------------------*
*& Report Z_FS_STRINGOPERATIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fs_stringoperations.



DATA: firstname    TYPE c LENGTH 20, "string --> Zeichenfeld variabler Länge
      lastname(20), "--> deprecated
      geschlecht    TYPE c LENGTH 1 VALUE 'M', "c --> Zeichenfeld fixer Länge
      telefon       TYPE string, "n --> numerisches Zeichenfeld beliebiger Länge
      nationalitaet TYPE c LENGTH 2.

DATA: id TYPE n. "numeric text field character like, by default length is 1
id = 4712. "id receives initialization of last character digit --> 2

firstname = 'Max'.
lastname = 'Mustermann'.
telefon = '01751201141'.
nationalitaet = 'de'.

IF geschlecht = 'M'.
  WRITE 'Sehr geehrter Herr'.
ELSEIF geschlecht = 'W'.
  WRITE 'Sehr geehrte Frau'.
ELSE.
  WRITE 'Sehr geehrte(r) Herr/Frau'.
ENDIF.

WRITE:|{ firstname } { lastname } (#{ id }),| ,/, /.

WRITE: 'Bitte bestätigen Sie die Richtigkeit Ihrer Telefonnummer: ', telefon, /.

DATA international_vorwahl TYPE c LENGTH 6.
DATA: lokal_vorwahl TYPE string VALUE '(0)'.

CASE nationalitaet.
  WHEN 'de'.
    international_vorwahl = '+49'.
  WHEN 'tz'.
    international_vorwahl = '+225'.
  WHEN OTHERS.
    WRITE 'ERROR: Unbekannte Nationalität, gebe Fehler aus'.
    "ASSERT.
ENDCASE.



"international_vorwahl=lokal_vorwahl & international_vorwahl.
CONCATENATE international_vorwahl lokal_vorwahl INTO international_vorwahl.

"WRITE: 'INFO: Replace first digit if 0 by ', international_vorwahl,'.',/.

"REPLACE replaces the matching first instance of a string
REPLACE '0' IN telefon WITH international_vorwahl.

WRITE telefon.

"DATA : w_len TYPE i.
"w_len = strlen( telefon ).
"WRITE w_len.
WRITE: /, |Die Telefonnummer besteht nun aus { strlen( telefon ) } Zeichen.|.

WRITE: /, /, 'Viele Grüße,', / ,'ihre Bank'.
