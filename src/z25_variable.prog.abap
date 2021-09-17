*&---------------------------------------------------------------------*
*& Report z25_variable
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z25_variable.

DATA: gv_text TYPE string.

cl_s4d_input=>get_text( IMPORTING ev_text = gv_text ).

cl_s4d_output=>display_string( iv_text = gv_text ).

PARAMETERS a TYPE c LENGTH 3 LOWER CASE.

WRITE: a.
