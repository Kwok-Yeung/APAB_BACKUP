*&---------------------------------------------------------------------*
*& Report ZKCG_STRUCTURE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkcg_structure.

PARAMETERS: pa_car  TYPE s_carr_id,
            pa_name TYPE s_carrname,
            pa_con  TYPE s_conn_id,
            pa_date TYPE s_date,
            pa_perc TYPE p LENGTH 3 DECIMALS 2.

TYPES: BEGIN OF gty_s_flightinfo,
         carrid  TYPE s_carr_id,
         carname TYPE s_carrname,
         connid  TYPE s_conn_id,
         fldate  TYPE s_date,
         percentage  TYPE p LENGTH 3 Decimals 2,
       END OF gty_s_flightinfo.

TYPES: BEGIN OF gty_s_costumerflightinfo,
         carrid  TYPE s_carr_id,
         carname TYPE s_carrname,
         fldate  TYPE s_date,
       END OF gty_s_costumerflightinfo.

DATA gs_flightinfo TYPE gty_s_flightinfo.
DATA gs_costumerinfo TYPE gty_s_costumerflightinfo.

gs_flightinfo-carrid = pa_car.
gs_flightinfo-carname = pa_name.
gs_flightinfo-connid = pa_con.
gs_flightinfo-fldate = pa_date.
gs_flightinfo-percentage = pa_perc.

WRITE: /'Carrier ID:   ', gs_flightinfo-carrid,
       /'Carrier Name:   ', gs_flightinfo-carname,
       /'Connection ID:   ', gs_flightinfo-connid,
       /'Flightdate:   ', gs_flightinfo-fldate,
       /'percentage:   ', gs_flightinfo-percentage.

WRITE: / '-------------------------------------------------', /, /, /.

MOVE-CORRESPONDING gs_flightinfo TO gs_costumerinfo.

WRITE / gs_costumerinfo.
