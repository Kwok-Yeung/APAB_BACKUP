*&---------------------------------------------------------------------*
*& Report ZKCG_NTTPOKEMON
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZKCG_NTTPOKEMON.

Data gv_s_Pokemon TYPE ZEW_RF_PRINTER.

gv_s_Pokemon-PRINTER = 'Test'.
gv_s_Pokemon-LNAME = 'PICHLO'.

DATA gt_Pokeball TYPE Z_NTTDATA_POKEMON.

APPEND gv_s_Pokemon TO gt_Pokeball.
APPEND gv_s_Pokemon TO gt_Pokeball.
APPEND gv_s_Pokemon TO gt_Pokeball.
APPEND gv_s_Pokemon TO gt_Pokeball.

LOOP AT gt_Pokeball INTO gv_s_Pokemon.

  WRITE: /'PRINTER ID:   ', gv_s_Pokemon-PRINTER,
       /'POKEMON Name:   ', gv_s_Pokemon-LNAME,
        /, /, /.
ENDLOOP.
