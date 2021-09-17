*&---------------------------------------------------------------------*
*& Report z25_str
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z25_str.

PARAMETERS ein TYPE string.

if ein+0(1) = 'A' OR ein+0(1) = 'a'.
    translate ein to upper case.
    write ein.
elseif ein+0(1) = 'Z' OR ein+0(1) = 'z'.
    ein = reverse( ein ).
    write ein.
else.
    data(ind) = 0.
    DATA: W_len type i.
    W_len = strlen( ein ).
    while ind < W_len.
        write ind.
        write ' : '.
        write ein+ind(1).
        ind = ind + 1.
        new-line no-scrolling.
    endwhile.
endif.
