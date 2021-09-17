*&---------------------------------------------------------------------*
*& Report z25_objects
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z25_objects.
CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.

    TYPES: BEGIN OF ts_attribute,
             attribute TYPE string, value TYPE string,
           END OF ts_attribute,
           tt_attribute TYPE STANDARD TABLE OF ts_attribute WITH NON-UNIQUE KEY attribute.

    METHODS set_attributes IMPORTING
                             iv_name      TYPE string
                             iv_planetype TYPE saplane-planetype.

    METHODS get_attributes EXPORTING
                             et_attributes TYPE tt_attribute.

    CLASS-METHODS get_n_o_airplanes EXPORTING
                                      ev_number TYPE i.




  PRIVATE SECTION.
    DATA: mv_name      TYPE string, mv_planetype TYPE saplane-planetype.
    CLASS-DATA: gv_n_o_airplanes TYPE i.

ENDCLASS.
CLASS lcl_airplane IMPLEMENTATION.

  METHOD get_attributes.
    et_attributes = VALUE #( ( attribute = 'Name' value = mv_name )
                             ( attribute = 'Planetype' value = mv_planetype ) ).
  ENDMETHOD.

  METHOD get_n_o_airplanes.
    ev_number = gv_n_o_airplanes.
  ENDMETHOD.

  METHOD set_attributes.
    mv_name = iv_name.
    mv_planetype = iv_planetype.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
  ENDMETHOD.
ENDCLASS.

DATA: go_airplane TYPE REF TO lcl_airplane,
      gt_airplane TYPE TABLE OF REF TO lcl_airplane.

start-of-selection.

go_airplane = NEW #(  ).
gt_airplane = value #( base gt_airplane ( go_airplane ) ).

go_airplane = NEW #(  ).
gt_airplane = value #( base gt_airplane ( go_airplane ) ).

go_airplane = NEW #(  ).
gt_airplane = value #( base gt_airplane ( go_airplane ) ).
