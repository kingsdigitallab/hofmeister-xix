<?xml version="1.0"?>
<!-- ============================================================= -->
<!--  MODULE:           print_key.xsl                            -->
<!--  VERSION DATE:     1.0                                        -->
<!--  VERSION:          2003-09-08 @ 13:28                         -->
<!--  VERSION CONTROL:                                             -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!-- ORIGINAL CREATION DATE:    2003-09-08 @ 13:28                  -->
<!-- PURPOSE:   Key templates for myProjectName printable view infobits       -->
<!-- CREATED FOR:  CCH  www.kcl.ac.uk/cch                          -->
<!-- CREATED BY:   PJS  spencepj@yahoo.com                         -->
<!-- COPYRIGHT:   CCH/PJS                                          -->
<!-- ============================================================= -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.1">
<xsl:output method="html" indent="yes" />

<!--    ***********************************************       -->
<!--    *************   ZAK sorted up to here  *****************       -->
<!--    ***********************************************       -->


<!-- ####################################### -->

<xsl:template name="ctpl_htmltitle">
<head>
<title><xsl:value-of select="ancestor::TEI.2/teiHeader/fileDesc/titleStmt/title[1]" /></title>
<style type="text/css">
<xsl:comment>
a:hover { text-decoration: underline overline; }
a:visited {	text-decoration: none; }
a:link { text-decoration: underline; }
body, td { 	font: 14px Verdana, Arial, Helvetica, sans-serif; }
td.head { font-weight: bold; border-bottom: 1px solid #CCCCCC; }
td.caption { font-size: 11px; }
sup.numsup	 { vertical-align: text-top; font-size: 12px; text-decoration: none; }
<!-- PJS added after here -->
h1, h2, h3, h4, h5, h6 { font-family: Verdana, Arial, Helvetica, sans-serif; }
h1 { 	font-size: 20px; }
h2 { 	font-size: 18px; }
h3 { 	font-size: 16px; }
h4 { 	font-size: 14px; }
h5 { 	font-size: 12px; }
h6 { 	font-size: 12px; }
</xsl:comment>

</style>
</head>
</xsl:template>

<!-- ####################################### -->
<xsl:template name="ctpl_banner">
<p style="font-size: 26px; font-weight: bold; margin-bottom: 0px;">
  PROJFULLNAME
</p>

<hr size="1" color="#CCCCCC" />

<p style="text-align: right; margin-top: -8px; font-size: 12px;">[<a class="content" href="javascript:window.close();">Close Print-Friendly Version</a>]</p>

</xsl:template>

<!-- ####################################### -->
<xsl:template name="ctpl_pagehead">
<p style="font-size: 20px; font-weight: bold; margin-top: -20px;">

    <h1>

       <xsl:apply-templates select="/TEI.2/teiHeader/fileDesc/titleStmt/title[1]" mode="printbannerhead" />
       <xsl:if test="/TEI.2/teiHeader/fileDesc/titleStmt/title[@type='sub']">
         <xsl:text>: </xsl:text>
         <xsl:apply-templates select="/TEI.2/teiHeader/fileDesc/titleStmt/title[@type='sub']" mode="printbannerhead" />
       </xsl:if> 

<!--
       <xsl:text>. </xsl:text>

       <xsl:text>(</xsl:text>
       <xsl:apply-templates select="/TEI.2/teiHeader/fileDesc/titleStmt/*[self::author|self::editor|self::respStmt]" mode="printbannerhead" />
       <xsl:text>)</xsl:text>
-->
    </h1>

    <!-- OPTION 1: just title
      <xsl:apply-templates select="ancestor::TEI.2/teiHeader/fileDesc/titleStmt/title[1]" mode="printbannerhead" />
     -->





    <!-- OPTION 2: title then author info
    <h1 class="content">

       <xsl:apply-templates select="/TEI.2/teiHeader/fileDesc/titleStmt/title[1]" mode="pagehead" />
       <xsl:if test="/TEI.2/teiHeader/fileDesc/titleStmt/title[@type='sub']">
         <xsl:text>: </xsl:text>
         <xsl:apply-templates select="/TEI.2/teiHeader/fileDesc/titleStmt/title[@type='sub']" mode="pagehead" />
       </xsl:if> 

       <xsl:text>. </xsl:text>

       <xsl:text>(</xsl:text>
       <xsl:apply-templates select="/TEI.2/teiHeader/fileDesc/titleStmt/*[self::author|self::editor|self::respStmt]" mode="pagehead" />
       <xsl:text>)</xsl:text>
    </h1>
 -->
</p>
</xsl:template>



<!-- ####################################### -->


<xsl:template name="ctpl_footer">
<p>&#xa0;</p><p>&#xa0;</p>
<p>&#xa0;</p>
<hr size="1" color="#CCCCCC" />

<p style="text-align: right; margin-top: -8px; font-size: 12px;">[<a class="content" href="javascript:window.close();">Close Print-Friendly Version</a>]</p>

</xsl:template>

<!-- ####################################### -->

<xsl:template name="ctpl_footnotes">
    <xsl:if test="//note">
     <br clear="all" />
     <br clear="all" />
     
        			<!-- #TLC# table1.2.3 starts #TLC# -->
                <table border="0" cellspacing="0" cellpadding="0">
		  <tr>
                     <th colspan="3">Footnotes</th>	  
                  </tr>	
                  <tr>
                    <td colspan="3"><img alt="{$alt_text}" border="0" src="{$imgroot}{$genimgswitch}images/shim.gif" width="1" height="1" /></td>	  
                  </tr>

         <!-- START model for each footnote -->
         <xsl:for-each select="//note">
           <xsl:variable name="fnnum">
             <xsl:number level="any" />
           </xsl:variable>
           <xsl:variable name="fnnumfull">
             <xsl:number level="any" format="01" />
           </xsl:variable>

                  <tr>
                    <td valign="top">
                       <xsl:value-of select="$fnnum"/>.
                    </td>
                    <td><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}shim.gif" width="15" height="1" /></td>
                    <td><xsl:apply-templates /></td>
                  </tr>           
         </xsl:for-each>
         <!-- END model for each footnote -->

                </table>
        			<!-- #TLC# table1.2.3 ends #TLC# -->

      </xsl:if>

</xsl:template>

<!--    ***********************************************       -->
<!--    *************   NOT USED FOR PRINT VERSION  ****************       -->
<!--    ***********************************************       -->

<!-- ####################################### -->
<xsl:template name="ctpl_bread">
</xsl:template>
<!-- ####################################### -->
<xsl:template name="ctpl_nav">
</xsl:template>
<!-- ####################################### -->
<xsl:template name="ctpl_submenu">
</xsl:template>
<!-- ####################################### -->
<xsl:template name="ctpl_toc">
</xsl:template>
<!-- ####################################### -->
<xsl:template name="ctpl_toc2">
</xsl:template>
<!-- ####################################### -->
<xsl:template name="ctpl_options">
</xsl:template>
<!-- ####################################### -->

</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->