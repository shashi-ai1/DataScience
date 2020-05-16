/* %%%%%%%%%%%%%%%%%%%%%%%% change temprory to permament library %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
data shashi;
set sashelp.cars;
run;
libname sh "C:\Users\SHASHI\Documents\My SAS Files\9.3";
data sh.shashi;
set sashelp.cars;
run;

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%  proc content %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
proc contents data=sashelp.cars;
run;
proc contents data=sashelp.cars varnum;
run;
proc contents data=sashelp._all_;
run;
proc contents data=sashelp._all_ nods;
run;
proc contents data=sashelp._all_  out=trial;
run;

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%% proc print %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
proc print data=sashelp.cars;
run;
proc print data=sashelp.cars noobs;
run;
proc print data=sashelp.cars;
var make origin;
run;
proc print data=sashelp.cars;
id make origin type;
run;
proc print data=sashelp.cars double;
run;
proc print data=sashelp.cars double;
run;

proc print data=sashelp.class;
run;

proc print data=sashelp.class double;
run;
proc print data=sashelp.class (obs=13);
run;







