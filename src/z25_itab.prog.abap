*&---------------------------------------------------------------------*
*& Report z25_itab
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z25_itab.

DATA gt_connections TYPE z25_t_connections1.

gt_connections = VALUE #(  BASE gt_connections (  carrid = 'LH' connid = '400' )
                           ( carrid = 'LH' connid = '402' )  ).

DATA gt_flights TYPE d400_t_flights.

*cl_s4d400_flight_model=>get_flights_for_connections( "dafuer methode schreiben
*  EXPORTING
*    it_connections = gt_connections
*  IMPORTING
*    et_flights     = gt_flights
*).

call function 'Z25_CONNECTIONFLIGHT'
  EXPORTING
    gt_connections = gt_connections
  IMPORTING
    et_flights     = gt_flights
  .

DATA gt_percentage TYPE d400_t_percentage.

gt_percentage = CORRESPONDING #( gt_flights ).

LOOP AT gt_percentage REFERENCE INTO DATA(g_percentage_ref).
    g_percentage_ref->percentage = g_percentage_ref->seatsocc / g_percentage_ref->seatsmax * 100.
ENDLOOP.

cl_s4d_output=>display_table( gt_percentage ).
