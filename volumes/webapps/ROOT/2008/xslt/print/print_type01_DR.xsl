<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.1">

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="address" />

<!-- ============================================================= -->
<!--  MODULE:           print_type01_DR.xsl                                 -->
<!--  VERSION DATE:     1.0                                        -->
<!--  VERSION:          2003-09-05 @ 14:16                       -->
<!--  VERSION CONTROL:                                             -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!-- ORIGINAL CREATION DATE:    2003-09-05 @ 14:16                   -->
<!-- PURPOSE:   Driver for printable view of publication type01  -->
<!-- CREATED FOR:  CCH  www.kcl.ac.uk/cch                          -->
<!-- CREATED BY:   PJS  spencepj@yahoo.com                         -->
<!-- COPYRIGHT:   CCH/PJS                                          -->
<!-- ============================================================= -->

<!-- GENERAL INCLUDES -->
<xsl:include href="../common/proj_vars.xsl" />
<xsl:include href="print_tpl.xsl" />
<xsl:include href="print_key.xsl" />

<!-- INCLUDES COMMON TO PRINTABLE VIEWS -->
<xsl:include href="print_tei_com.xsl" />

<!-- INCLUDES SPECIFIC TO THIS DRIVER -->
<xsl:include href="print_type01_tpkey.xsl" />

</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->