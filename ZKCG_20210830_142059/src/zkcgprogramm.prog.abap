*&---------------------------------------------------------------------*
*& Report ZKCGPROGRAMM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkcgprogramm.

PARAMETERS pa_name TYPE string.

WRITE: 'Hello World',
        'Testing SAP',
        /15 text-002,
        35 sy-datum,
        /15 'Manager'(003),
        35 sy-uname.


NEW-LINE.

WRITE: 'Hallo ',
      pa_name.

WRITE: 'Kwoky trollt'.

WRITE:/ 'Michelle trollt wieder.'.

MESSAGE i001(DEMO_MESSAGE).
