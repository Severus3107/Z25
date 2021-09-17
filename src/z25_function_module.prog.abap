*&---------------------------------------------------------------------*
*& Report z25_calc
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z25_function_module.

PARAMETERS a TYPE i.
PARAMETERS operator TYPE c LENGTH 1.
PARAMETERS b TYPE i.
DATA c TYPE p LENGTH 16 DECIMALS 2.
DATA(ok) = 1.

CASE operator.
  WHEN '+'.
    c = a + b.
  WHEN '-'.
    c = a - b.
  WHEN '/'.
    IF b = 0.
      WRITE 'Division by 0 impossible.'. ok = 0.
    ELSE.
      c = a / b.
    ENDIF.
  WHEN '*'.
    c = a * b.
  WHEN '%'.
 " cp type s4d400_percentage.
    call function 'S4D400_CALCULATE_PERCENTAGE'
      EXPORTING
        iv_int1          = a
        iv_int2          = b
      IMPORTING
        ev_result        = c
      EXCEPTIONS
        division_by_zero = 1.
    IF SY-SUBRC <> 0.
        WRITE 'Division by 0 impossible.'. ok = 0.
    ENDIF.
  WHEN OTHERS.
    WRITE 'Please use valid operation.'. ok = 0.
ENDCASE.

IF ok = 1.
  WRITE | { a } { operator } { b } = { c }|.
ENDIF.
