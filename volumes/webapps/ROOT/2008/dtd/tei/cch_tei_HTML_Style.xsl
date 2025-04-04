<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                 xmlns:xhtml="http://www.w3.org/1999/xhtml" 
                 version="1.0">
	<xsl:template match="/">
		<HTML>
			<BODY style = "margin-top: 0; margin-left: 4; margin-bottom: 0; margin-right: 0;">
				<xsl:apply-templates/>
			</BODY>
		</HTML>
	</xsl:template>


	<xsl:template match= "teiHeader">

		<DIV STYLE = "color:#000000 ; background-color:#99CCCC ; border:thin black solid ; margin-bottom:2em ; padding-top:1em ; padding-left:1em ; padding-right:1em ; padding-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "titleStmt//author">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "authority">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "availability">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "fileDesc">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "sourceDesc">

		<DIV STYLE = "border:thin black solid ; margin-bottom:1em ; padding-top:1em ; padding-left:1em ; padding-right:1em ; padding-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "revisionDesc">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "catDesc">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "encodingDesc">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "profileDesc">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "projectDesc">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "docDate">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "docImprint/docDate">

		<SPAN STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "docEdition">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "docImprint">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "docTitle">

		<DIV STYLE = "font-weight:bold ; margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "group">

		<DIV STYLE = "margin-bottom:1em ; border:thin black solid ; background-color:#cccccc ; color:#000000 ; margin-top:20px ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "group//group">

		<DIV STYLE = "margin-bottom:1em ; background-color:#dddddd ; color:#000000 ; border:thin black solid ; margin-top:20px ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "group//group//group">

		<DIV STYLE = "margin-bottom:1em ; background-color:#ff33ff ; color:#000000 ; border:thin black solid ; margin-top:20px ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "group//text">

		<DIV STYLE = "margin-bottom:1em ; border:thin black solid ; background-color:#fffff0 ; color:#000000 ; margin-top:20px ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "text">

		<DIV STYLE = "margin-bottom:1em ; border:thin black solid ; background-color:#fffff0 ; color:#000000 ; margin-top:20px ;  ">
		<SPAN STYLE = "color:#FFFFFF ; background-color:#ff0000 ; font-size:12pt ;  "> 
			[id]:  <xsl:value-of select = "@id"/>

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//head">

		<DIV STYLE = "font-size:16pt ; font-weight:bold ; margin-top:10px ; margin-bottom:10px ; text-align:center ; background-color:#666699 ; color:#ffffff ; border:thin black solid ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body">

		<DIV STYLE = "font-size:12pt ; margin-top:5px ; margin-left:5px ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "head[@type=&quot;subordinate&quot;]">

		<DIV STYLE = "margin-bottom:1em ; font-size:12pt ; background-color:#cccccc ; color:#fffffd ; border:thin black solid ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div[@type=&quot;box&quot;]">

		<DIV STYLE = "margin-top:10px ; margin-bottom:10px ; border:thin black solid ; background-color:#ddddcc ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div">

		<DIV STYLE = "margin-top:10px ; margin-bottom:10px ; counter-increment:section1 ; counter-reset:section2 ; border:thin black solid ; background-color:#fffff0 ;  ">
		<SPAN STYLE = "background-color:#ff9933 ; color:#000000 ; font-size:12pt ; font-weight:bold ;  "> 
			[ counter(section1) ] 

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//head">

		<DIV STYLE = "margin-bottom:1em ; font-size:16pt ; color:#CC0000 ; border:thin black solid ;  ">
		<SPAN STYLE = "color:#000000 ;  "> 
			<xsl:text></xsl:text>

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div">

		<DIV STYLE = "margin-top:10px ; margin-bottom:10px ; counter-increment:section2 ; counter-reset:section3 ;  ">
		<SPAN STYLE = "background-color:#ff9933 ; color:#000000 ; font-size:8pt ; font-weight:bold ;  "> 
			[ counter(section1) .  counter(section2) ] 

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div//head">

		<DIV STYLE = "margin-bottom:1em ; font-size:14pt ; background-color:#666666 ; color:#ffffff ; border:thin black solid ;  ">
		<SPAN STYLE = "color:#000000 ;  "> 
			<xsl:text></xsl:text>

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div//div">

		<DIV STYLE = "margin-top:10px ; margin-bottom:10px ; counter-increment:section3 ; counter-reset:section4 ;  ">
		<SPAN STYLE = "background-color:#ff9933 ; color:#000000 ; font-size:8pt ; font-weight:bold ;  "> 
			[ counter(section1) - counter(section2) - counter(section3, lower-roman) ] 

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div//div//head">

		<DIV STYLE = "background-color:#999999 ; color:#ffffff ; font-size:14pt ; font-weight:bold ; border:thin black solid ;  ">
		<SPAN STYLE = "color:#000000 ;  "> 
			<xsl:text></xsl:text>

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div//div//div">

		<DIV STYLE = "margin-top:10px ; margin-bottom:10px ; counter-increment:section4 ; counter-reset:section5 ;  ">
		<SPAN STYLE = "background-color:#ff9933 ; color:#000000 ; font-size:8pt ; font-weight:bold ;  "> 
			[ counter(section1) - counter(section2) - counter(section3, lower-roman) - counter(section4, lower-alpha) ] 

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div//div//div//head">

		<DIV STYLE = "background-color:#dddddd ; color:#000000 ; font-size:12pt ; font-weight:bold ; border:thin black solid ;  ">
		<SPAN STYLE = "color:#000000 ;  "> 
			<xsl:text></xsl:text>

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div//div//div//div">

		<DIV STYLE = "margin-top:10px ; margin-bottom:10px ; counter-increment:section5 ; counter-reset:section6 ;  ">
		<SPAN STYLE = "background-color:#ffcc99 ; color:#000000 ; font-size:8pt ; font-weight:bold ;  "> 
			[ counter(section1) - counter(section2) - counter(section3, lower-roman) - counter(section4, lower-alpha) - counter(section5, lower-roman) ] 

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div//div//div//div//head">

		<DIV STYLE = "background-color:#cccccc ; color:#000000 ; font-size:12pt ; font-weight:bold ; border:thin black solid ;  ">
		<SPAN STYLE = "color:#000000 ;  "> 
			<xsl:text></xsl:text>

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div//div//div//div//div">

		<DIV STYLE = "margin-top:10px ; margin-bottom:10px ; counter-increment:section6 ; counter-reset:section7 ;  ">
		<SPAN STYLE = "background-color:#ffcc99 ; color:#000000 ; font-size:8pt ; font-weight:bold ;  "> 
			[ counter(section1) - counter(section2) - counter(section3, lower-roman) - counter(section4, lower-alpha) - counter(section5, lower-roman) - counter(section6) ] 

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div//div//div//div//div//head">

		<SPAN STYLE = "background-color:#cccccc ; color:#000000 ; font-size:12pt ; font-weight:bold ;  ">
		<SPAN STYLE = "color:#000000 ;  "> 
			<xsl:text></xsl:text>

		</SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "body//div//div//div//div//div//div//div">

		<DIV STYLE = "margin-top:10px ; margin-bottom:10px ; counter-increment:section7 ; counter-reset:section8 ;  ">
		<SPAN STYLE = "background-color:#ffcc99 ; color:#000000 ; font-size:8pt ; font-weight:bold ;  "> 
			[ counter(section1) - counter(section2) - counter(section3, lower-roman) - counter(section4, lower-alpha) - counter(section5, lower-roman) - counter(section6) - counter(section7, lower-alpha) ] 

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div//div//div//div//div//div//head">

		<SPAN STYLE = "background-color:#cccccc ; color:#000000 ; font-size:12pt ; font-weight:bold ;  ">
		<SPAN STYLE = "color:#000000 ;  "> 
			<xsl:text></xsl:text>

		</SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "body//div//div//div//div//div//div//div//div">

		<DIV STYLE = "margin-top:10px ; margin-bottom:10px ; counter-increment:section8 ; counter-reset:section9 ;  ">
		<SPAN STYLE = "background-color:#ffcc99 ; color:#000000 ; font-size:8pt ; font-weight:bold ;  "> 
			[ counter(section1) - counter(section2) - counter(section3, lower-roman) - counter(section4, lower-alpha) - counter(section5, lower-roman) - counter(section6) - counter(section7, lower-alpha) - counter(section8, lower-roman) ] 

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div//div//div//div//div//div//div//head">

		<SPAN STYLE = "background-color:#cccccc ; color:#000000 ; font-size:12pt ; font-weight:bold ;  ">
		<SPAN STYLE = "color:#000000 ;  "> 
			<xsl:text></xsl:text>

		</SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "body//div//div//div//div//div//div//div//div//div">

		<DIV STYLE = "margin-top:10px ; margin-bottom:10px ; counter-increment:section9 ; counter-reset:section10 ;  ">
		<SPAN STYLE = "color:#ff0000 ; font-size:8pt ; font-weight:bold ;  "> 
			WARNING: NEED NEW COUNTERS IN STYLESHEET AT THIS LEVEL!

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//div//div//div//div//div//div//div//div//div//head">

		<SPAN STYLE = "background-color:#cccccc ; color:#000000 ; font-size:12pt ; font-weight:bold ;  ">
		<SPAN STYLE = "color:#000000 ;  "> 
			<xsl:text></xsl:text>

		</SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "p">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "p[@rend=&quot;pre&quot;]">

		<DIV STYLE = "margin-bottom:0.5em ; color:#000000 ; background-color:#99CCCC ; border:thin black solid ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "p[@rend=&quot;comment&quot;]">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; color:#000000 ; background-color:#cccccc ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "list">

		<OL STYLE = "list-style-type:disc ; list-style-position:outside ; margin-bottom:1em ; margin-left:2em ; margin-top:1em ;  "> 
			<xsl:apply-templates/>

		</OL>
	</xsl:template>



	<xsl:template match= "list[@rend=&quot;runon&quot;]">

		<OL STYLE = "list-style-type:disc ; list-style-position:outside ; margin-bottom:1em ; margin-left:2em ; margin-top:1em ;  "> 
			<xsl:apply-templates/>

		</OL>
	</xsl:template>



	<xsl:template match= "list[@type=&quot;bulleted&quot;]">

		<OL STYLE = "list-style-type:disc ; list-style-position:outside ; margin-bottom:1em ; margin-left:2em ; margin-top:1em ;  "> 
			<xsl:apply-templates/>

		</OL>
	</xsl:template>



	<xsl:template match= "list[@type=&quot;unordered&quot;]">

		<OL STYLE = "list-style-type:disc ; list-style-position:outside ; margin-bottom:1em ; margin-left:2em ; margin-top:1em ;  "> 
			<xsl:apply-templates/>

		</OL>
	</xsl:template>



	<xsl:template match= "list[@type=&quot;ordered&quot;]">

		<OL STYLE = "list-style-type:decimal ; list-style-position:outside ; margin-bottom:1em ; margin-left:2em ; margin-top:1em ;  "> 
			<xsl:apply-templates/>

		</OL>
	</xsl:template>



	<xsl:template match= "list[@type=&quot;numbered&quot;]">

		<OL STYLE = "list-style-type:decimal ; list-style-position:outside ; margin-bottom:1em ; margin-left:2em ; margin-top:1em ;  "> 
			<xsl:apply-templates/>

		</OL>
	</xsl:template>



	<xsl:template match= "label">

		<SPAN STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "row">

		<TR> 
			<xsl:apply-templates/>

		</TR>
	</xsl:template>



	<xsl:template match= "cell">

		<TD> 
			<xsl:apply-templates/>

		</TD>
	</xsl:template>



	<xsl:template match= "cell[@role=&quot;label&quot;]">

		<TD STYLE = "background-color:#cccccc ; font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</TD>
	</xsl:template>



	<xsl:template match= "address">

		<DIV STYLE = "margin-top:2em ; margin-left:2em ; margin-right:2em ; margin-bottom:2em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "addrLine">

		<DIV STYLE = "white-space:nowrap ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "listBibl">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "biblGroup">

		<DIV STYLE = "margin-top:5px ; margin-bottom:10px ; border:thin black solid ; background-color:#FFFF99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "bibl">

		<DIV STYLE = "margin-top:5px ; margin-bottom:10px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "wip">

		<DIV STYLE = "margin-top:5px ; margin-bottom:10px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "album">

		<DIV STYLE = "margin-top:5px ; margin-bottom:10px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "listBibl//bibl">

		<LI STYLE = "list-style-type:disc ; margin-top:5px ; margin-bottom:10px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</LI>
	</xsl:template>



	<xsl:template match= "author">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "q">

		<SPAN STYLE = "quotes:''' ''' ''' ''' ; margin-top:0em ; margin-left:0em ; margin-right:0em ; margin-bottom:0em ; background-color:#eeeeee ; color:#000000 ;  ">
		<SPAN> 
			open-quote

		</SPAN> 
			<xsl:apply-templates/>

		<SPAN> 
			close-quote

		</SPAN>
		</SPAN>
	</xsl:template>



	<xsl:template match= "q[@rend=&quot;display&quot;]">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "argument//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "cit//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div0//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div1//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div2//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div3//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div4//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div5//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div6//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div7//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "epigraph//q">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:3em ; margin-right:3em ; quotes:none ; margin-top:0em ; background-color:#eeeeee ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "note">

		<DIV STYLE = "border:thin black solid ; font-size:75% ; background-color:#FFCCCC ; color:#000000 ; counter-increment:sectionX ;  ">
		<SPAN STYLE = "background-color:#ccccff ; color:#003300 ;  "> 
			[  counter(sectionX) ] 

		</SPAN> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "note[@place=&quot;left&quot;]">

		<DIV STYLE = "float:left ; border:thin black solid ; font-size:75% ; background-color:#FFCCCC ; color:#000000 ; counter-increment:sectionX ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "note[@place=&quot;right&quot;]">

		<DIV STYLE = "float:right ; border:thin black solid ; font-size:75% ; background-color:#FFCCCC ; color:#000000 ; counter-increment:sectionX ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "note[@place=&quot;inline&quot;]">

		<SPAN STYLE = "border:thin black solid ; font-size:75% ; background-color:#FFCCCC ; color:#000000 ; counter-increment:sectionX ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "note[@place=&quot;unspecified&quot;]">

		<SPAN STYLE = "border:thin black solid ; font-size:75% ; background-color:#FFCCCC ; color:#000000 ; counter-increment:sectionX ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "hi[@rend=&quot;italic&quot;]">

		<SPAN STYLE = "font-style:italic ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "hi[@rend=&quot;bold&quot;]">

		<SPAN STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "hi[@rend=&quot;bolditalic&quot;]">

		<SPAN STYLE = "font-weight:bold ; font-style:italic ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "foreign">

		<SPAN STYLE = "font-style:italic ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "term">

		<SPAN STYLE = "background-color:#CC0000 ; color:#FFFFFF ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "gloss">

		<SPAN STYLE = "background-color:#FFFFFF ; color:#0000ff ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "rs">

		<SPAN STYLE = "background-color:#FFFFFF ; color:#006600 ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "rs[@type=&quot;att&quot;]">

		<SPAN STYLE = "font-family:Monospace ; background-color:#ffee99 ; color:#000000 ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "rs[@type=&quot;elem&quot;]">

		<SPAN STYLE = "font-family:Monospace ; background-color:#000099 ; color:#ffffff ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "seg">

		<DIV STYLE = "background-color:#ffff33 ; color:#000000 ; border:thin black solid ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "ref">

		<SPAN STYLE = "color:blue ; text-decoration:underline ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "xref">

		<SPAN STYLE = "background-color:#ffffff ; color:blue ; text-decoration:underline ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "xref:hover">

		<SPAN STYLE = "background-color:blue ; color:white ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "item">

		<LI STYLE = "margin-left:12pt ;  "> 
			<xsl:apply-templates/>

		</LI>
	</xsl:template>



	<xsl:template match= "abbr">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "add">

		<SPAN STYLE = "color:green ; text-decoration:underline ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "argument">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "back">

		<DIV STYLE = "border:thin black solid ; margin-top:1em ; padding-top:0.5em ; padding-left:0.5em ; padding-right:0.5em ; padding-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "argument//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "cit//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div0//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div1//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div2//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div3//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div4//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div5//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div6//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div7//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "epigraph//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "listBibl//bibl//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "taxonomy//bibl">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:5px ; border:thin black solid ; background-color:#fffff0 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "biblFull">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "argument//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "cit//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div0//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div1//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div2//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div3//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div4//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div5//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div6//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div7//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "epigraph//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "listBibl//biblFull//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "taxonomy//biblFull">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "biblScope">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "imprint//biblScope">

		<DIV> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "byline">

		<DIV STYLE = "font-style:italic ; margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "category">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "change">

		<DIV STYLE = "margin-bottom:1em ; margin-left:2em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "cit">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "argument//cit">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//cit">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div//cit">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div0//cit">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div1//cit">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div2//cit">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div3//cit">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div4//cit">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div5//cit">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div6//cit">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div7//cit">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "epigraph//cit">

		<DIV STYLE = "margin-bottom:0.5em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "classCode">

		<DIV> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "classDecl">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "closer">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "code">

		<SPAN STYLE = "font-family:monospace ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "corr">

		<SPAN STYLE = "color:green ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "creation">

		<DIV> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "date">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "change//date">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "publicationStmt//date">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "dateline">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "del">

		<SPAN STYLE = "color:red ; text-decoration:line-through ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "distributor">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "docAuthor">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "byline/docAuthor">

		<SPAN STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "titlePage/docAuthor">

		<DIV STYLE = "font-size:150% ; margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "titlePage/docTitle">

		<DIV STYLE = "font-size:200% ; font-weight:bold ; margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "edition">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "bibl/edition">

		<SPAN STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "wip/edition">

		<SPAN STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "album/edition">

		<SPAN STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "editionStmt">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "editor">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "bibl/editor">

		<SPAN STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "editorialDecl">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "eg">

		<DIV STYLE = "padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; margin-bottom:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "argument//eg">

		<DIV STYLE = "margin-bottom:1em ; padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//eg">

		<DIV STYLE = "margin-bottom:1em ; padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div//eg">

		<DIV STYLE = "margin-bottom:1em ; padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div0//eg">

		<DIV STYLE = "margin-bottom:1em ; padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div1//eg">

		<DIV STYLE = "margin-bottom:1em ; padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div2//eg">

		<DIV STYLE = "margin-bottom:1em ; padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div3//eg">

		<DIV STYLE = "margin-bottom:1em ; padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div4//eg">

		<DIV STYLE = "margin-bottom:1em ; padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div5//eg">

		<DIV STYLE = "margin-bottom:1em ; padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div6//eg">

		<DIV STYLE = "margin-bottom:1em ; padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div7//eg">

		<DIV STYLE = "margin-bottom:1em ; padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "epigraph//eg">

		<DIV STYLE = "margin-bottom:1em ; padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "emph">

		<SPAN STYLE = "font-style:italic ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "epigraph">

		<DIV STYLE = "margin-bottom:1em ; text-align:center ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "extent">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "bibl/extent">

		<SPAN STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "figure">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		<SPAN> 
			<xsl:value-of select = "@figDesc"/>

		</SPAN>
		</DIV>
	</xsl:template>



	<xsl:template match= "formula">

		<SPAN STYLE = "font-style:italic ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "front">

		<DIV STYLE = "margin-bottom:1em ; padding-top:0.5em ; padding-left:0.5em ; padding-right:0.5em ; padding-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "funder">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "gi">

		<SPAN STYLE = "font-family:sans-serif ; color:blue ;  ">
		<SPAN> 
			&lt;

		</SPAN> 
			<xsl:apply-templates/>

		<SPAN> 
			&gt;

		</SPAN>
		</SPAN>
	</xsl:template>



	<xsl:template match= "ident">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "idno">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "bibl/idno">

		<SPAN STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "imprint">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "change/item">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:1em ; margin-top:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "keywords">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "kw">

		<SPAN STYLE = "font-style:italic ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "l">

		<DIV STYLE = "white-space:nowrap ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "argument//label">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "body//label">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div//label">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div0//label">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div1//label">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div2//label">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div3//label">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div4//label">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div5//label">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div6//label">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "div7//label">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "epigraph//label">

		<DIV STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "langUsage">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "lb">

		<DIV> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "lg">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "mentioned">

		<SPAN STYLE = "font-style:italic ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "name">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "notesStmt">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "num">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "opener">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "orig">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "pb">

		<DIV> 
			<xsl:apply-templates/>

		<SPAN STYLE = "font-weight:bold ; margin-bottom:1em ; margin-top:1em ; text-align:center ;  "> 
			<xsl:value-of select = "@n"/>

		</SPAN>
		</DIV>
	</xsl:template>



	<xsl:template match= "principal">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "publicationStmt">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "imprint//publisher">

		<DIV STYLE = "margin-bottom:0.5em ; color:#CC00FF ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "publicationStmt//publisher">

		<DIV STYLE = "margin-bottom:0.5em ; color:#CC00FF ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "pubPlace">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "imprint//pubPlace">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "publicationStmt//pubPlace">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "refsDecl">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "reg">

		<SPAN STYLE = "font-style:italic ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "rendition">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "resp">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "respStmt">

		<DIV> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "bibl/respStmt">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "s">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "salute">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "samplingDecl">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "seriesStmt">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "sic">

		<SPAN STYLE = "color:#339900 ;  "> 
			<xsl:apply-templates/>

		<SPAN> 
			<xsl:text></xsl:text>

		</SPAN>
		</SPAN>
	</xsl:template>



	<xsl:template match= "signed">

		<DIV STYLE = "text-align:right ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "soCalled">

		<SPAN STYLE = "font-style:italic ; quotes:''' ''' ;  ">
		<SPAN> 
			open-quote

		</SPAN> 
			<xsl:apply-templates/>

		<SPAN> 
			close-quote

		</SPAN>
		</SPAN>
	</xsl:template>



	<xsl:template match= "sp">

		<DIV STYLE = "margin-bottom:0.5em ; margin-left:2em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "speaker">

		<SPAN STYLE = "font-weight:bold ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "sponsor">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "stage">

		<SPAN STYLE = "font-style:italic ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "tagsDecl">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "tagUsage">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "taxonomy">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "textClass">

		<DIV STYLE = "margin-bottom:0.5em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "time">

		<SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "titlePage">

		<DIV STYLE = "border:thin black solid ; margin-bottom:2em ; text-align:center ; padding-top:1em ; padding-left:1em ; padding-right:1em ; padding-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "titlePart">

		<DIV> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "titleStmt">

		<SPAN STYLE = "font-size:150% ; font-weight:bold ; margin-bottom:1em ; text-align:center ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "trailer">

		<DIV STYLE = "margin-bottom:1em ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "unclear">

		<SPAN STYLE = "color:silver ; font-style:italic ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "Button">

		<SPAN STYLE = "font-family:monospace ; color:red ; font-weight:bold ; background-color:rgb(75%,75%,75%) ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "Value">

		<SPAN STYLE = "font-family:monospace ; color:green ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "Code">

		<SPAN STYLE = "font-family:monospace ; color:red ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "Field">

		<SPAN STYLE = "font-family:monospace ; color:red ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "Filespec">

		<SPAN STYLE = "font-family:monospace ; color:red ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "Input">

		<SPAN STYLE = "font-family:monospace ; color:green ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "Key">

		<SPAN STYLE = "font-family:monospace ; text-decoration:underline ; color:green ;  ">
		<SPAN STYLE = "color:#000099 ;  "> 
			<xsl:value-of select = "@lang"/>

		</SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "Link">

		<SPAN STYLE = "font-family:monospace ; color:green ; text-decoration:underline ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "Menu">

		<SPAN STYLE = "font-family:monospace ; color:red ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "Output">

		<SPAN STYLE = "font-family:monospace ; color:red ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "Screen">

		<DIV STYLE = "padding-top:3mm ; padding-left:4pt ; padding-bottom:2pt ; margin-top:12pt ; margin-bottom:12pt ; white-space:pre ; background-color:#FFCC99 ;  "> 
			<xsl:apply-templates/>

		</DIV>
	</xsl:template>



	<xsl:template match= "composer">

		<SPAN STYLE = "color:#ff0000 ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "title">

		<SPAN STYLE = "color:#0000ff ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "opus">

		<SPAN STYLE = "color:#33CC33 ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "key">

		<SPAN STYLE = "color:#FF6600 ;  ">
		<SPAN STYLE = "color:#000099 ;  "> 
			<xsl:value-of select = "@lang"/>

		</SPAN> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "pubplace">

		<SPAN STYLE = "color:#007700 ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "publisher">

		<SPAN STYLE = "color:#CC00FF ;  "> 
			<xsl:apply-templates/>

		</SPAN>
	</xsl:template>



	<xsl:template match= "TEI.2">

		<SPAN STYLE = "color:#FFFFFF ; background-color:#CC0000 ; font-size:14pt ;  "> 
			[id]:  <xsl:value-of select = "@id"/>  [n]:  attr(n)

		</SPAN> 
			<xsl:apply-templates/>

	</xsl:template>



	<xsl:template match= "anchor">

		<SPAN STYLE = "vertical-align:super ; background-color:#ffffff ; color:#663366 ;  "> 
			[# <xsl:value-of select = "@id"/> ] 

		</SPAN> 
			<xsl:apply-templates/>

	</xsl:template>



	<xsl:template match= "gap">
 
			<xsl:apply-templates/>

		<SPAN STYLE = "font-style:italic ;  "> 
			[...]

		</SPAN>
	</xsl:template>



<!-- HTML table -->

<xsl:template match = "TABLE">
	<xsl:copy>
		<xsl:copy-of select = "@*"/>
		<xsl:if test = "CAPTION">
			<CAPTION>
				<xsl:apply-templates select = "CAPTION"/>
			</CAPTION>
		</xsl:if>
		<xsl:apply-templates select = "THEAD|TBODY|TFOOT|TR"/>
	</xsl:copy>
</xsl:template>

	<xsl:template match = "THEAD">

		<xsl:copy>
			<xsl:copy-of select = "@*"/>
				<xsl:apply-templates/>

		</xsl:copy>
	</xsl:template>
	<xsl:template match = "TBODY">

		<xsl:copy>
			<xsl:copy-of select = "@*"/>
				<xsl:apply-templates/>

		</xsl:copy>
	</xsl:template>
	<xsl:template match = "TFOOT">

		<xsl:copy>
			<xsl:copy-of select = "@*"/>
				<xsl:apply-templates/>

		</xsl:copy>
	</xsl:template>
	<xsl:template match = "TR">

		<xsl:copy>
			<xsl:copy-of select = "@*"/>
				<xsl:apply-templates/>

		</xsl:copy>
	</xsl:template>
	<xsl:template match = "TH">

		<xsl:copy>
			<xsl:copy-of select = "@*"/>
				<xsl:apply-templates/>

		</xsl:copy>
	</xsl:template>
	<xsl:template match = "TD">

		<xsl:copy>
			<xsl:copy-of select = "@*"/>
				<xsl:apply-templates/>

		</xsl:copy>
	</xsl:template>
<!-- xhtml table -->

<xsl:template match = "xhtml:table">
	<xsl:copy>
		<xsl:copy-of select = "@*"/>
		<xsl:if test = "xhtml:caption">
			<caption>
				<xsl:apply-templates select = "xhtml:caption"/>
			</caption>
		</xsl:if>
		<xsl:apply-templates select = "xhtml:thead|xhtml:tbody|xhtml:tfoot|xhtml:tr"/>
	</xsl:copy>
</xsl:template>

	<xsl:template match = "xhtml:thead">

		<xsl:copy>
			<xsl:copy-of select = "@*"/>
				<xsl:apply-templates/>

		</xsl:copy>
	</xsl:template>
	<xsl:template match = "xhtml:tbody">

		<xsl:copy>
			<xsl:copy-of select = "@*"/>
				<xsl:apply-templates/>

		</xsl:copy>
	</xsl:template>
	<xsl:template match = "xhtml:tfoot">

		<xsl:copy>
			<xsl:copy-of select = "@*"/>
				<xsl:apply-templates/>

		</xsl:copy>
	</xsl:template>
	<xsl:template match = "xhtml:tr">

		<xsl:copy>
			<xsl:copy-of select = "@*"/>
				<xsl:apply-templates/>

		</xsl:copy>
	</xsl:template>
	<xsl:template match = "xhtml:th">

		<xsl:copy>
			<xsl:copy-of select = "@*"/>
				<xsl:apply-templates/>

		</xsl:copy>
	</xsl:template>
	<xsl:template match = "xhtml:td">

		<xsl:copy>
			<xsl:copy-of select = "@*"/>
				<xsl:apply-templates/>

		</xsl:copy>
	</xsl:template></xsl:stylesheet>