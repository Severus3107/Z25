*&---------------------------------------------------------------------*
*& Report z25_sql1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z25_sql1.

data gs_flight type d400_s_flight.

data airline type c length 3.
data flightnr type n length 4.
data flightdate type dats.

cl_s4d_input=>get_flight(
  IMPORTING
    ev_airline   = airline
    ev_flight_no = flightnr
    ev_date      = flightdate
).

select single from sflight
fields carrid, connid, fldate, planetype, seatsmax, seatsocc
where connid = @flightnr and carrid = @airline and fldate = @flightdate
into @gs_flight.

cl_s4d_output=>display_structure( gs_flight ).
*CATCH cx_s4d_no_structure.
*CATCH cx_s4d_no_structure.
