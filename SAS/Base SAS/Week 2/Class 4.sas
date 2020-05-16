data test1;
 infile datalines dlm=',';
 input eid gender$ country$;
 datalines;
 105,M,AU
 102,F,US
 101,M,AU
 ;
 run;
  data test2;
 infile datalines dlm=',';
 input eid gender$ Region$;
 datalines;
 104,M,AU
 107,F,US
 103,M,AU
 ;
 run;

 data test3;
 set test1 test2;  *data test1 and test2 combind vertically;
 run;
 proc sort data=test1 out=test4;
 by eid;                  *data test1 sort by eid and save in test4;
 run;
 proc sort data=test2 out=test5;
 by eid;
 run;
 data test6;
 set test4 test5;    *data test4 and test5 combind vertically;
 run;
 proc sort data=test6 out=test7;     *sort test6 both in country variable ;
 by eid;
 run;
 data test9;
 set test4 test5(rename=(region=country)); 
 by eid;                *data test4 and test5 combind vertically;
 run;

 *%%%%%%%% Proc append %%%%%%%%;
 *Proc append base=Masterdata data=slave data option;*run;

 data proc1;set test1;run;
 proc append base=proc1 data=test2;
 run;






