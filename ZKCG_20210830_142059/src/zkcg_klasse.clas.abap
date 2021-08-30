class ZKCG_KLASSE definition
  public
  final
  create public .

public section.

  class-methods ZKCG_KLASSE
    importing
      !EINGABE type INT4
    exporting
      !AUSGABE type INT4 .
protected section.
private section.
ENDCLASS.



CLASS ZKCG_KLASSE IMPLEMENTATION.


  method ZKCG_KLASSE.

    WRITE / 'testing Class'.
    WRITE: 'Eingabe ist',
            EINGABE.
  endmethod.
ENDCLASS.
