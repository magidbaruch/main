*&---------------------------------------------------------------------*
*& Report ZBM_MAIN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbm_main.


PARAMETERS: p_edit AS CHECKBOX USER-COMMAND dummy. " Global Edit Mode Checkbox


" Block 1: Calculatoin programs
SELECTION-SCREEN BEGIN OF BLOCK blk_calc WITH FRAME TITLE TEXT-001.
SELECTION-SCREEN: PUSHBUTTON /2(25) btn_fibo  USER-COMMAND fibo,
                  PUSHBUTTON /2(25) btn_calc USER-COMMAND calc.
SELECTION-SCREEN END OF BLOCK blk_calc.

" Block 2: Solving Programs
SELECTION-SCREEN BEGIN OF BLOCK blk_solve WITH FRAME TITLE TEXT-002.
SELECTION-SCREEN: PUSHBUTTON /2(25) btn_quen  USER-COMMAND quen,
                  PUSHBUTTON /2(25) btn_ches USER-COMMAND CH_ALV.
SELECTION-SCREEN END OF BLOCK blk_solve.

" Block 3: Enterprise Programs
SELECTION-SCREEN BEGIN OF BLOCK blk_enterprise WITH FRAME TITLE TEXT-003.
SELECTION-SCREEN: PUSHBUTTON /2(25) btn_book  USER-COMMAND book,
                  PUSHBUTTON /2(25) btn_wine USER-COMMAND wine.
SELECTION-SCREEN END OF BLOCK blk_enterprise.




"Set button labels

INITIALIZATION.
*  text-001   = 'Calculating Programs'.
*  text-002   = 'Solving Programs'.

  btn_fibo   = 'Fibonacci'.
  btn_calc   = 'Calculator'.
  btn_quen   = 'Queen Attack'.
  btn_ches   = 'Queen ALV mode'.
  btn_book   = 'Book Store'.
  btn_wine   = 'Winery'.



  " Handle button actions

AT SELECTION-SCREEN.
  CASE  sy-ucomm.
    WHEN 'FIBO'.
      IF p_edit = abap_true.
        CALL FUNCTION 'RS_TOOL_ACCESS'
          EXPORTING
            operation   = 'EDIT'
            object_name = 'zbm_exercise_fibonacci_numbers'
            object_type = 'PROG'.
      ELSE.
        SUBMIT zbm_exercise_fibonacci_numbers VIA SELECTION-SCREEN AND RETURN.
      ENDIF.

    WHEN 'CALC'.
      IF p_edit = abap_true.
        CALL FUNCTION 'RS_TOOL_ACCESS'
          EXPORTING
            operation   = 'EDIT'
            object_name = 'zbm_m1_calc_global_class'
            object_type = 'PROG'.
      ELSE.
        SUBMIT zbm_m1_calc_global_class VIA SELECTION-SCREEN AND RETURN.
      ENDIF.

    WHEN 'QUEN'.
      IF p_edit = abap_true.
        CALL FUNCTION 'RS_TOOL_ACCESS'
          EXPORTING
            operation   = 'EDIT'
            object_name = 'zbm_m2_queen_attack'
            object_type = 'PROG'.
      ELSE.
        SUBMIT zbm_m2_queen_attack VIA SELECTION-SCREEN  AND RETURN.
      ENDIF.

    WHEN 'CH_ALV'.
      IF p_edit = abap_true.
        CALL FUNCTION 'RS_TOOL_ACCESS'
          EXPORTING
            operation   = 'EDIT'
            object_name = 'ZBM_M2_QUEEN_ATTACK_V2'
            object_type = 'PROG'.
      ELSE.
        SUBMIT ZBM_M2_QUEEN_ATTACK_V2 VIA SELECTION-SCREEN  AND RETURN.
      ENDIF.

    WHEN 'BOOK'.
      IF p_edit = abap_true.
        CALL FUNCTION 'RS_TOOL_ACCESS'
          EXPORTING
            operation   = 'EDIT'
            object_name = 'zbm_m3_book_store'
            object_type = 'PROG'.
      ELSE.
        SUBMIT zbm_m3_book_store VIA SELECTION-SCREEN  AND RETURN.
      ENDIF.

    WHEN 'WINE'.
      IF p_edit = abap_true.
        CALL FUNCTION 'RS_TOOL_ACCESS'
          EXPORTING
            operation   = 'EDIT'
            object_name = 'zbm_m3_book_store'
            object_type = 'PROG'.
      ELSE.
        SUBMIT zbm_m3_book_store VIA SELECTION-SCREEN  AND RETURN.
      ENDIF.

    WHEN 'RUN_PROG'.
      IF p_edit = abap_true.
        CALL FUNCTION 'RS_TOOL_ACCESS'
          EXPORTING
            operation   = 'EDIT'
            object_name = 'zbm_alv_v3'
            object_type = 'PROG'.
      ELSE.
        SUBMIT zbm_alv_v3 VIA SELECTION-SCREEN AND RETURN.
      ENDIF.
  ENDCASE.

*Text elements
*----------------------------------------------------------
* 001 Calculation Programs
* 002 Solving Programs
* 003 Enterprise Programs
* 004 Run - Edit
* T01 First stage


*Selection texts
*----------------------------------------------------------
* P_EDIT         Edit Mode

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2025. Sap Release 750
