<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.1">

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="address" />

<!-- ============================================================= -->
<!--  MODULE:           print_type02_tpkey.xsl                                 -->
<!--  VERSION DATE:     1.0                                        -->
<!--  VERSION:          2003-09-05 @ 14:16                       -->
<!--  VERSION CONTROL:                                             -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!-- ORIGINAL CREATION DATE:    2003-09-05 @ 14:16                   -->
<!-- PURPOSE:   Driver for printable view of publication type02  -->
<!-- CREATED FOR:  CCH  www.kcl.ac.uk/cch                          -->
<!-- CREATED BY:   PJS  spencepj@yahoo.com                         -->
<!-- COPYRIGHT:   CCH/PJS                                          -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--     CREATES INDIVIDUAL HTML FILES                             -->
<!-- ============================================================= -->

<xsl:template match="TEI.2">

  <!-- pathcreator = constructs path to where printables are stored -->
  <xsl:variable name="pathcreator" select="'print'" />

  <!-- filename = constructs correct filename from the id itself -->
  <xsl:variable name="filename" select="@id" />

  <!-- document function = splits files according to variables -->
   <xsl:document href="{$outputroot}/{$outswitch}/{$pathcreator}/{$filename}.html">
     <xsl:call-template name="html_tpl">
     </xsl:call-template>
   </xsl:document>
</xsl:template>

<!-- ============================================================= -->
<!--     MAIN CONTENT OF PAGES                             -->
<!-- ============================================================= -->

<xsl:template name="ctpl_content">
  <xsl:apply-templates />
</xsl:template>


</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->