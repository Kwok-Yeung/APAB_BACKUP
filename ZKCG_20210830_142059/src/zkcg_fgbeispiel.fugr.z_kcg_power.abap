FUNCTION Z_KCG_POWER .
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_BASE)
*"     REFERENCE(IV_POWER)
*"  EXPORTING
*"     REFERENCE(EV_RESULT)
*"----------------------------------------------------------------------
  ev_result = iv_base.

  IF IV_power = 0.
    EV_Result = 1.

  ELSEIF IV_Power = 1.
    ev_result = iv_base.

  ELSE.
    DO
      iV_Power - 1 TIMES.
      ev_result = ev_result * iv_base.
    ENDDO.

  ENDIF.

  Write EV_Result.



ENDFUNCTION.
