<?xml version="1.0" ?>
<!--  
    SVN: $Id: proj_stats_DR.xsl 382 2007-03-20 14:13:08Z zau $          
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.1">
    <xsl:output indent="yes"/>
    
    <!-- Utilities XSLT -->
    <xsl:include href="../utilities/string.xsl"/>

    <!-- GENERAL INCLUDES -->
    <xsl:include href="../common/proj_tpl.xsl"/>
    <xsl:include href="../common/proj_vars.xsl"/>
    <xsl:include href="../common/proj_key.xsl"/>

    <!-- INCLUDES COMMON TO MAIN PUBLICATIONS -->
    <xsl:include href="../common/proj_tei_com.xsl"/>

    <!-- INCLUDES SPECIFIC TO THIS DRIVER -->
    <xsl:include href="proj_stats_tpkey.xsl"/>
    <xsl:include href="proj_stats_spec.xsl"/>    

</xsl:stylesheet>
