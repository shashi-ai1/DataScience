
* %%%%%%% PDV %%%%%%%%%;

Data test;
infile datalines dlm="";
input Name$ Age Gender$;
Datalines;
Ram 21 M
Sita 20 F
Radha 19 F
;
run;

Data one;
put _all_;
set test;
put _all_;
run;

*%%%%%%% IF/Where/Keep/Drop Statement %%%%%%%%;
Data one;
set sashelp.class;
run;
*%%% Keep Statement %%%;
Data two;
set sashelp.class;
Keep Name age ;
run;
Data three;
set sashelp.class(keep=Name age);
run;
Data four(keep=Name age);
set sashelp.class;
run;
*%%% Drop Statement %%%;
Data four1(drop=sex);
set sashelp.class(Drop=Height Weight);
Salary= age*1000;
drop age;
run;
*%%% if and Where Statement %%%;
Data five;
set sashelp.class;
if age >14;
run;
Data six;
Set sashelp.class;
where age > 14;
run;

*%%% IF -THEN / IF -THEN –Else Statement%%%;
Data six1;
Set sashelp.class;
if age=15 then salary=age*1000;
run;
Data six1;
Set sashelp.class;
if age < 15 then salary=age*1000;
else if age=15 then salary=age*2000;
else salary=age*3000;
run;

*%%%%%% IF -THEN-DO Statement %%%%%;
Data six11; 
Set sashelp.class;
if age=15 then do;
Salary=age*1000;
Bonus= age *10;
End;
run;

