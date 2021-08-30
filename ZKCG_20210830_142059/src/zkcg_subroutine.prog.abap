*&---------------------------------------------------------------------*
*& Report ZKCG_COMPUTE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkcg_subroutine.

DATA ref1 TYPE REF TO ZKG_Power.

PARAMETERS: pa_int1 TYPE i,
            pa_op   TYPE c LENGTH 1,
            pa_int2 TYPE i.

DATA gv_result TYPE p LENGTH 16 DECIMALS 2.

IF ( pa_op = '+' OR
     pa_op = '-' OR
     pa_op = '*' OR
     pa_op = '%' OR
     pa_op = 'P' OR
     pa_op = '/' AND pa_int2 <> 0 ).

  CASE pa_op.
    WHEN '+'.
      gv_result = pa_int1 + pa_int2.

    WHEN '-'.
      gv_result = pa_int1 - pa_int2.

    WHEN '*'.
      gv_result = pa_int1 * pa_int2.

    WHEN '%'.

     CALL METHOD zkcg_prozent=>get_prozentsatz
        EXPORTING
          gpr_grund = pa_int2
          gpr_pwert = pa_int1
        IMPORTING
         gpr_result   = gv_result
        EXCEPTIONS
         devidebyzero = 1
         others    = 2
        .
      CASE sy-subrc.
*       Implement suitable error handling here
        WHEN 0.
          WRITE:  'gpr ---------',
                  / gv_result,
                  / 'gpr------------' .
        WHEN 1.
          WRITE 'first Variable can not be 0'.
        WHEN 2.
          Write 'UNKNWON ERROR'.
      ENDCASE.

      PERFORM calc_percentage
        USING pa_int1 pa_int2
              CHANGING gv_result.

    WHEN 'P'.
      WRITE 'Funktionsbaustein genutzt'.
      CALL FUNCTION 'Z_KCG_POWER'
        EXPORTING
          iv_base = pa_int1
          iv_power = pa_int2
        IMPORTING
          ev_result = gv_result.
      Write /'Ende Funktionsbaustein '.

    CREATE OBJECT ref1.
    CALL METHOD ref1->get_power
      EXPORTING
        gp_base  = pa_int1
        gp_power = pa_int2
      IMPORTING
       gp_result = gv_result
      .



    WHEN '/'.
      gv_result = pa_int1 / pa_int2.

  ENDCASE.


  WRITE : / '-----------------',
          gv_result,
          / '-----------------'.

ELSEIF pa_op = '/' AND pa_int2 = 0.

  WRITE 'Es kann nicht durch 0 geteilt werden'.

ELSE.

  WRITE 'Das war keine valide Eingabe. Bitte geben Sie einen der folgenden mathematischen Operatoren an: "+", "-", "*", "/".'.

ENDIF.

WRITE: / TEXT-010,
       / TEXT-aaa,
       / TEXT-020,
       / 'Default Text 030 df'(030),
       / 'Default Text 040'(040).


CALL METHOD zkcg_klasse=>zkcg_klasse
  EXPORTING
    eingabe = pa_int1
  IMPORTING
   ausgabe = pa_int2
  .



FORM calc_Percentage
  USING
        value(pv_act) TYPE i
        value(pv_max) TYPE i
  CHANGING
    cv_result.

  IF pv_max = 0.
    cv_result = 0.
    WRITE 'Fehlerhafte Angabe. Grundweert darf nicht 0 sein'.
  ELSE.
    cv_result = pv_act / pv_max.
  ENDIF.
ENDFORM.
