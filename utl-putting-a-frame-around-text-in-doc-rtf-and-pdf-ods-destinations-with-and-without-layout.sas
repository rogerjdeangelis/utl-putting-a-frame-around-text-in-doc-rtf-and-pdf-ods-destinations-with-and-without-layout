Putting a frame around text in doc rtf and pdf ods destinations with and without layout

  Solutions

     1. RTF and Microsoft word DOC output
     2, PDF without layout
     3. PDF with layout


github
https://tinyurl.com/y3mx3xrq
https://github.com/rogerjdeangelis/utl-putting-a-frame-around-text-in-doc-rtf-and-pdf-ods-destinations-with-and-without-layout

PDF output
https://tinyurl.com/y25v4q3a
https://github.com/rogerjdeangelis/utl-putting-a-frame-around-text-in-doc-rtf-and-pdf-ods-destinations-with-and-without-layout/blob/master/utl-framing_pdf_with_layout.doc.pdf

SAS Forum
https://tinyurl.com/y5lmsn2c
https://communities.sas.com/t5/ODS-and-Base-Reporting/ODS-PDF-border-around-ODS-TEXT-not-solid-line/m-p/553368

*_                   _
(_)_ __  _ __  _   _| |_
| | '_ \| '_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
;

data have;
  txt= "^S={just=left}NOTE: Overall totals^{newline} Leading causes of injury^{newline}See Appendices^{newline}";
run;quit;

 WORK.HAVE total obs=1

 TXT
 ^S={just=left}NOTE: Overall totals^{newline} Leading causes of injury^{newline}morbidity. See Appendices^{newline}

*            _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| '_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
;

+-----------------------------+
|  NOTE: Overall totals       |
|  Leading causes of injury   |
|  See Appendices             |
+-----------------------------+

*
 _ __  _ __ ___   ___ ___  ___ ___
| '_ \| '__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
;

***************************************
1. RTF and Microsoft word DOC output  *
***************************************

ods escapechar="^";

ods listing close;
ods rtf file="d:/rtf/utl-framing_rtf_doc.rtf" style=utl_ymrlan100 ;

proc report data=have style(report)=[frame=box rules=all cellwidth=2.5in] noheader;
column txt;
run;quit;

ods rtf close;
ods listing;

ods escapechar="^";

* save as doc;
ods listing close;
ods rtf file="d:/rtf/utl-framing_rtf_doc.doc" style=utl_ymrlan100 ;

proc report data=have style(report)=[frame=box rules=all cellwidth=2.5in] noheader;
column txt;
run;quit;

ods rtf close;
ods listing;


*************************
2, PDF without layout   *
*************************

ods escapechar="^";

ods listing close;
ods pdf file="d:/pdf/utl-framing_pdf_no_layout.doc.pdf" ;

proc report data=have style(report)=[frame=box rules=all cellwidth=2.2in] noheader;
column txt;
run;quit;

ods pdf close;
ods listing;


*************************
2, PDF with layout      *
*************************

ods escapechar="^";

ods listing close;
ods pdf file="d:/pdf/utl-framing_pdf_with_layout.doc.pdf"  ;
ODS layout start width=2.2in height=3.2in;
proc report  data=have noheader ;
column txt ;
define txt /display style(column)={font_size=12pt};
run;quit;
ODS layout end;
ods pdf close;
ods listing;



