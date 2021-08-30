class ZKCG_PROZENT definition
  public
  final
  create public .

public section.

  class-methods GET_PROZENTSATZ
    importing
      !GPR_GRUND type INT4
      !GPR_PWERT type INT4
    exporting
      !GPR_RESULT type P
    exceptions
      DEVIDEBYZERO .
protected section.
private section.
ENDCLASS.



CLASS ZKCG_PROZENT IMPLEMENTATION.


  method GET_PROZENTSATZ.
    Write:  /,
            /,
            / '-----------------------------------------------------------------------------------',
            / 'get Prozent:',
            /.
    IF gpr_grund = 0.
      GPR_result = 0.
      RAISE devidebyzero.
    ELSE.
      gpr_result = gpr_pwert / gpr_grund.
    ENDIF.

  endmethod.
ENDCLASS.
