CLASS zcl_material_information_007 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING
        matnr               TYPE I_product-Product
      RETURNING
        VALUE(material_art) TYPE I_Product-ProductType.
ENDCLASS.



CLASS zcl_material_information_007 IMPLEMENTATION.


  METHOD get_material_art.
    DATA material TYPE i_product.
    DATA production_date TYPE datn.
    DATA bool_tmp TYPE ABAP_BOOLEAN .

    PRODUCTION_DATE = cl_abap_context_info=>get_system_date( ).

    SELECT single FROM i_product fields ProductType WHERE product = @matnr INTO corresponding fields of @material.

    material_art = material-ProductType.

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_information_007.
    material_info = NEW zcl_material_information_007(  ).
    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).
  ENDMETHOD.
ENDCLASS.

