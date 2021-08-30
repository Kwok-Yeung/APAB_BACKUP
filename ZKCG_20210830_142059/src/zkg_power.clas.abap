class ZKG_POWER definition
  public
  final
  create public .

public section.

  methods GET_POWER
    importing
      !GP_BASE type INT4
      !GP_POWER type INT4
    exporting
      !GP_RESULT type P .
protected section.
private section.
ENDCLASS.



CLASS ZKG_POWER IMPLEMENTATION.


  method GET_POWER.

    Write: /'---------------------------------------------------------------------',
           /,
           /'globale Klasse genutzt',
           /.

    CALL FUNCTION 'Z_KCG_POWER'
    EXPORTING
      iv_base  = gp_base
      iv_power = gp_power
   IMPORTING
     EV_RESULT       =  gp_result
    .



  endmethod.
ENDCLASS.
