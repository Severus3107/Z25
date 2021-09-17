FUNCTION Z25_CONNECTIONFLIGHT.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(GT_CONNECTIONS) TYPE  Z25_T_CONNECTIONS2
*"  EXPORTING
*"     REFERENCE(ET_FLIGHTS) TYPE  D400_T_FLIGHTS
*"----------------------------------------------------------------------
    data es_flights type d400_s_flight.
    data es_conn type d400_s_connection.

    loop at gt_connections INTO es_conn.
        select from sflight
        fields carrid,connid,fldate,planetype,seatsmax,seatsocc
        where carrid = @es_conn-carrid and connid =  @es_conn-connid
        into table @et_flights.
    endloop.


ENDFUNCTION.

*  METHOD get_flights_for_connections.
*    DATA lt_where TYPE TABLE OF string.
*    IF it_connections IS INITIAL.
*      SELECT FROM sflight
*      FIELDS carrid, connid, fldate, planetype, seatsmax, seatsocc
*      INTO TABLE @et_flights.
*    ELSE.
*      LOOP AT it_connections ASSIGNING FIELD-SYMBOL(<line>).
*        IF lines(  lt_where ) > 0.
*          APPEND | or | TO lt_where.
*        ENDIF.
*        APPEND |carrid = '{ <line>-carrid }' and connid = '{ <line>-connid }'| TO lt_where.
*      ENDLOOP.
*      SELECT FROM sflight
*      FIELDS carrid, connid, fldate, planetype, seatsmax, seatsocc
*       WHERE (lt_where)
*       INTO TABLE @et_flights.
*    ENDIF.
*  ENDMETHOD.
