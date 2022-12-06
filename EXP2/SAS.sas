data first;
set SASHELP.BASEBALL;
run;
proc means data= SASHELP.BASEBALL mean median mode std var min max;
run;

proc means data= SASHELP.BASEBALL nmiss;
run;

proc print =SASHELP.BASEBALL;
where Div = "NW";
run;

proc sql;
select count(distinct Div) as Div,
       count(distinct Team) as Team,
       count(distinct CrHits) as CrHits
  from SASHELP.BASEBALL;
quit;

proc freq data=SASHELP.BASEBALL;
   tables Team;    /* _ALL_ is the defaul */
run;

data nHits;
set SASHELP.BASEBALL(keep=_NUMERIC_            /* all numeric variables */
                  ); /* two character variables */
run;

proc print data= nHits(obs=5);
run;

proc means data=nHits nmiss;
run;

ods graphics / reset width=6.4in height=4.8in imagemap;
proc sgplot data=SASHELP.BASEBALL;
vbox  nAtBat / category=nHome;
yaxis grid;
run;
ods graphics / reset;
