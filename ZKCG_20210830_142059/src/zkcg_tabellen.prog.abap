*&---------------------------------------------------------------------*
*& Report ZKCG_TABELLEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZKCG_TABELLEN.


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

DATA gs_flightinfo TYPE gty_s_flightinfo.

DATA gt_KwokyTable TYPE TABLE OF gty_s_flightinfo.

gs_flightinfo-carrid = pa_car.
gs_flightinfo-carname = pa_name.
gs_flightinfo-connid = pa_con.
gs_flightinfo-fldate = pa_date.
gs_flightinfo-percentage = pa_perc.

APPEND gs_flightinfo TO gt_KwokyTable.
APPEND gs_flightinfo TO gt_KwokyTable.
APPEND gs_flightinfo TO gt_KwokyTable.
APPEND gs_flightinfo TO gt_KwokyTable.

WRITE: /'Carrier ID:   ', gs_flightinfo-carrid,
       /'Carrier Name:   ', gs_flightinfo-carname,
       /'Connection ID:   ', gs_flightinfo-connid,
       /'Flightdate:   ', gs_flightinfo-fldate,
       /'percentage:   ', gs_flightinfo-percentage.

WRITE: / '-------------------------------------------------', /, /, /.

DATA gs_READ LIKE LINE OF gt_KwokyTable.

READ TABLE gt_KwokyTable INTO gs_READ INDEX 2.

gs_READ-carname = 'Michelle'.

MODIFY gt_KwokyTable FROM gs_READ INDEX 2.

LOOP AT gt_KwokyTable INTO gs_READ.

  WRITE: /'Carrier ID:   ', gs_READ-carrid,
       /'Carrier Name:   ', gs_READ-carname,
       /'Connection ID:   ', gs_READ-connid,
       /'Flightdate:   ', gs_READ-fldate,
       /'percentage:   ', gs_READ-percentage, /, /, /.
ENDLOOP.



WRITE: /'-----------READ-------------------', /, /,
        gs_READ-carrid.
