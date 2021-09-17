*&---------------------------------------------------------------------*
*& Report z25_structure
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z25_structure.

DATA gs_conn TYPE z25_connection.
data gs_flight type d400_s_flight.

types: begin of ty_complete,
      carrid type s_carr_id,
      connid type s_conn_id,
      cityfrom type s_from_cit,
      cityto type s_to_city,
      fldate type s_date,
      planettype type s_planetye,
      seatsmax type s_seatsmax,
      seatsocc type s_seatsocc,
      end of ty_complete.

data gs_complete type ty_complete.

gs_conn = VALUE #( carrid = 'LH'
                          connid = '0400'
                          cityfrom = 'FRANKFURT'
                          cityto = 'NEW YORK' ).


cl_s4d400_flight_model=>get_next_flight(
    Exporting
        iv_carrid = gs_conn-carrid
        iv_connid = gs_conn-connid
    Importing
        es_flight = gs_flight ).


gs_complete = corresponding #( gs_conn ).
gs_complete = corresponding #( base ( gs_complete ) gs_conn ).

write: AT 10 'carrid', AT 20 'connid', AT 30 'cityfrom', AT 40 'cityto'.
write: AT 10 gs_complete-carrid, AT 20 gs_complete-connid, AT 30 gs_complete-cityfrom, AT 40 gs_complete-cityto.
cl_s4d_output=>display_structure( iv_structure = gs_complete ).
