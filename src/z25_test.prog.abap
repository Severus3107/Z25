*&---------------------------------------------------------------------*
*& Report z25_test
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z25_test.

DATA a TYPE p LENGTH 8 DECIMALS 8.
DATA e TYPE p LENGTH 1 DECIMALS 1.
e = 1 / 2.
a = ipow( base = 2 exp = e ).
WRITE a.