<?xml version="1.0" ?>
<!--  
    SVN: $Id: proj_search_DR.xsl 1011 2008-04-18 13:21:19Z jvieira $          
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.1" >
    <xsl:output indent="yes" />
    
    <xsl:param name="listSelect" />

    <!-- Utilities XSLT -->
    <xsl:include href="../utilities/string.xsl" />

    <!-- GENERAL INCLUDES -->
    <xsl:include href="../common/proj_tpl.xsl" />
    <xsl:include href="../common/proj_vars.xsl" />
    <xsl:include href="../common/proj_key.xsl" />

    <!-- INCLUDES COMMON TO MAIN PUBLICATIONS -->
    <xsl:include href="../common/proj_tei_com.xsl" />

    <!-- INCLUDES SPECIFIC TO THIS DRIVER -->
    <xsl:include href="proj_search_tpkey.xsl" />
    <xsl:include href="proj_form_spec.xsl" />
    <xsl:include href="proj_results_spec.xsl" />
</xsl:stylesheet>
