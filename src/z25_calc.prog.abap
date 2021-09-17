*&---------------------------------------------------------------------*
*& Report z25_calc
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z25_calc.

PARAMETERS a TYPE p LENGTH 3 DECIMALS 0.
PARAMETERS operator TYPE c LENGTH 1.
PARAMETERS b TYPE p LENGTH 3 DECIMALS 0.
DATA c TYPE p LENGTH 6 DECIMALS 3.
DATA(ok) = 1.

CASE operator.
  WHEN '+'.
    call function 'Z25_ADD'
      EXPORTING
        i_1 = a
        i_2 = b
      IMPORTING
        o_1 = c .
  WHEN '-'.
    c = a - b.
  WHEN '/'.
*    IF b = 0.
*      WRITE 'Division by 0 impossible.'. ok = 0.
*    ELSE.
    call function 'Z_25_DIVIDE'
      EXPORTING
        i_val1           = a
        i_val2           = b
      IMPORTING
        e_result         = c
      EXCEPTIONS
        division_by_zero = 1
      .
    IF SY-SUBRC <> 0.
*     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
        Message 'divison by 0' type 'e'.
    ENDIF.
*      c = a / b.
*    ENDIF.
  WHEN '*'.
    c = a * b.
  WHEN OTHERS.
    WRITE 'Please use valid operation.'. ok = 0.
ENDCASE.

IF ok = 1.
  WRITE | { a } { operator } { b } = { c }|.
ENDIF.
