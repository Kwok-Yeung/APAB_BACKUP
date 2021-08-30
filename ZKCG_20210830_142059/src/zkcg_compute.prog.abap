*&---------------------------------------------------------------------*
*& Report ZKCG_COMPUTE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkcg_compute.

PARAMETERS: pa_int1 TYPE i,
            pa_op   TYPE c LENGTH 1,
            pa_int2 TYPE i.

DATA gv_result TYPE p LENGTH 16 DECIMALS 2.

IF ( pa_op = '+' OR
     pa_op = '-' OR
     pa_op = '*' OR
     pa_op = '/' AND pa_int2 <> 0 ).

  CASE pa_op.
    WHEN '+'.
      gv_result = pa_int1 + pa_int2.

    WHEN '-'.
      gv_result = pa_int1 - pa_int2.

    WHEN '*'.
      gv_result = pa_int1 * pa_int2.

    WHEN '/'.
      gv_result = pa_int1 / pa_int2.

  ENDCASE.

  gv_result = gv_result - 3.

  WRITE gv_result.

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
