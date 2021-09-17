FUNCTION Z_25_DIVIDE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(I_VAL1) TYPE  I OPTIONAL
*"     VALUE(I_VAL2) TYPE  I DEFAULT 25
*"  EXPORTING
*"     REFERENCE(E_RESULT) TYPE  DECFLOAT16
*"  EXCEPTIONS
*"      DIVISION_BY_ZERO
*"----------------------------------------------------------------------
  IF i_val2 = 0.
    RAISE division_by_zero.
  ENDIF.

  e_result = i_val1 / i_val2.


ENDFUNCTION.
