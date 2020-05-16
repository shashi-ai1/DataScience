*Convert Non-standard DOJ to Standard DOJ;
data one;
infile datalines dlm="";
input Name$ Doj;
informat Doj DDMMYY8.;
datalines;
Shashi 10/09/19
Ravi 21/12/19
;
run;

*Convert Non-standard DOJ to Standard DOJ 
  and standard DOJ to Non-Standard DOJ;
data two;
infile datalines dlm="";
input Name$ Doj;
informat Doj DDMMYY8.;
format Doj date9.;
datalines;
Shashi 10/09/19
Ravi 21/12/19
;
run;
*%%%%%%%%%%%%%% Date Function %%%%%%%%%%%%%%%%%;
data test_;
set sashelp.air;
A=today();
B=day(date);
C=weekday(date);
D=month(date);
E=qtr(date);
F=year(date);
G=MDY(1,1,1960);
H=MDY(D,B,F);
I=MDY(month(date),1,year('08JAN1960'd));
J=date;
format A G H date9. J weekdate24.;
run;
*%%%%%%%%% Function %%%%%%%%%%%%;
data test;
x=' Ram ';
y=' Sita ';
A=trim(x);
B=strip(x);
C=left(x);
D=right(x);
E=upcase(x);
F=lowcase(x);
g=length(x);
H=x!!y;
I=length(H);
J=char(x,2);
K=length(x);
L=length(D);
run;
*%%%%%%%%%  Int/Ceil/Floor/round %%%%%%%%%%%%;
data test2;
infile datalines;
input num;
A=int(num);
B=ceil(num);
C=Floor(num);
D=round(num);
E=round(num,5);
F=round(num,11);
G=round(num,.33);
datalines;
10
15
32.5
79
37.9
-10
-23.6
;
run;
*%%%%%%%%%%%%%%% Substr %%%%%%%%%%%;
data test3;
name='Shashi Kumar';
x=substr(name,1,2);
y=substr(name,3,2);
z=substr(name,1,7);
A=substr('Mohan',3,1);
B=substr(upcase(name),3,4);
run;

*%%%%%%%% Scan/find/Cat/Tanswrd/put/input %%%%%%%%; 
data test4;
A='Today is FRIDAY';
B=scan(A,2);
C=scan(A,1,'a');
D=scan(A,-1);
E=find(A,'a');
F=find(A,'A');
G=find(A,'a',7);
H=find(A,'a','i',7);
I=' Ram ';
J=' Sita ';
K=cat(I,J,I);
L=catt(I,J,I);
M=cats(I,J,I);
N=catx('/',I,J,I);
O=catx('0',I,J,I);
P=tranwrd(N,'/','*'); 
Q=tranwrd(N,'Ram','Sita');
R='$500';
S=0;
T=put(S,date9.);
U=input(R,dollar4.);
run;

*%%%%%%%%%%%%%%%%%%%% compress %%%%%%%%%%%%%;
data  test8; 

string='StudySAS Blog! 17752 ' ;
string1=compress(string,'') ;         *Compress spaces. This is default; 
string2=compress(string,'','ak');    *Compress alphabetic chars(1,2etc); 
string3=compress(string,'','d') ;     *Compress numerical values; 
string4=compress(string,'','l');       *Compress  lowercase characters; 
string5=compress(string,'','u');      *Compress uppercase characters; 
string6=compress(string,'S','k');    *Keeps only specified characters; 
string7=compress(string,'!.','P');    *Compress Punctuations only; 
string8=compress(string,'s','i');      *upper/lower case specified characters;
string9=compress(string,'','a');       *Compress all upper\lower case  characters ; 
string10=compress(string,'','s') ;    * Compress or delete spaces; 
string11=compress(string,'','kd') ;  *Compress alphabets (Keeps only digits); 

run ;



