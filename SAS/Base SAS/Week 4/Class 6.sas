
*%%%%%%%%%%% Proc Freq %%%%%%%%%%%%%%;
proc freq data=sashelp.class;
run;
proc freq data=sashelp.class;
table Name age;
run;
proc freq data=sashelp.class;
table sex*age;
run;

proc freq data=sashelp.class;
table Name age/out=one;
run;
*%%%%% Table option %%%%;
proc freq data=sashelp.class;
table sex*age/out=two;
run;

proc freq data=sashelp.class;
table Name age/out=three outcome;
run;

proc freq data=sashelp.class;
table sex*age/out=four outpct;
run;
proc freq data=sashelp.class;
table Name age/nocum nopercent;
run;

proc freq data=sashelp.class;
table Name age/nofreq;
run;

proc freq data=sashelp.class;
table sex*age/nofreq;
run;

proc freq data=sashelp.class;
table sex*age/norow nocol;
run;

proc freq data=sashelp.class page;
table Name age;
run;
*%%%%%% %%%%%%%%%%%%%%%%%%%%%%%;
proc freq data=sashelp.cars ;
table origin*type msrp;
run;

proc freq data=sashelp.cars compress;
table origin*type msrp;
run;
proc freq data=sashelp.cars ;
table origin type/list;
run;
proc freq data=sashelp.cars ;
table origin*type/list;
run;
proc freq data=sashelp.cars ;
table origin*type/crosslist;
run;
proc freq data=sashelp.cars ;
table origin*type/format=dollar14.;
run;
proc freq data=sashelp.cars ;
table origin*type/format=20.;
run;
proc freq data=sashelp.cars ;
table origin*type/format=8.;
run;

*%%%%%%%%%%%%%% Proc Means %%%%%%%%%%%%%%%%%%%%%%%;

proc means data=sashelp.cars;
run;

proc means data=sashelp.cars;
var msrp;
class origin;
run;

proc means data=sashelp.cars sum n; *output window=n obs,sum,n six dataset=_type_,_freq_,stat;
var msrp;
class origin type;
output out=six;
run;

proc means data=sashelp.cars noprint;  *no report in output window, seven dataset have variable count,total,_freq_,_type_...;
var msrp;
class origin type;
output out=seven sum=total n=count;
run;

proc means data=sashelp.cars decendtype noprint;*type in decending order;
var msrp;
class origin type;
output out=eight ;
run;

proc means data=sashelp.cars chartype;*type in binary;
var msrp;
class origin type;
output out=nine;
run;
proc means data=sashelp.cars nway noprint; *only show type-3(maxm type);
var msrp;
class origin type;
output out=ten;
run;

*%%%%%%%%%%%%%%%%%%%%%%% Length statement %%%%%%%%%%%%%%%%%%%%%%%%%%;
*%%%%% Change/update length of new variable %%%%%;
data four;
x='abc';    *Variable x is created with length=3;
run;
proc contents data=four;run;

data four1;
length x$ 6;    *Assign the length of Variable x =3;
x='abc';        *Variable x is created with length=6;
run;
proc contents data=four1;run;

data four2;
x='abc';      *Variable x is created with length=6;
length x$ 6;  *Length can't be changed after PDV;
run;
proc contents data=four2;run;

*%%%%% Change/update length of Existing variable %%%%%;
Data two;
set sashelp.class; *Length of variable Name  is 8 and age is 8;
run;
proc contents data=two;run;
Data two1;
set sashelp.class;
length name$ 10; * Character Length can't be changed after PDV;
run;
proc contents data=two1;run;

data three;
set sashelp.class;
length age 3;       *Numeric Variable age is updated with length=3;
run;
proc contents data=three;run;

 *%%%%%%% Exercise %%%%%%;
data six;
set sashelp.class;
if age > 15 the flag="one";
else flag="four";
run;

*%%%%%%%%%%%%%%%%%%%%%%%% By Grouping Processing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%;

data one;
infile datalines dlm=',';
input eid country$ gender$ salary;
datalines;
101,AU,M,300
102,US,F,500
103,AU,F,600
104,AU,F,
105,US,M,700
106,AU,M,800
107,US,F,900
108,AU,F,1000
109,AU,M,1100
110,US,M,1200
;
RUN;

proc sort data=one out=nine;
by country;
run;

data ten;
set nine;
by country;  *create two temprory variable for each variable listed in the by statement ;
put _all_;
run;

data ten1;
set nine;
by country;
if first.country;
run;

data ten2;
set nine;
by country;
if last.country;
run;



