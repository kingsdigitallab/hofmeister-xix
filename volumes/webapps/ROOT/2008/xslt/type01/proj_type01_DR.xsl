<?xml version="1.0" ?>
<!--  
    SVN: $Id: proj_type01_DR.xsl 234 2007-03-02 16:26:07Z zau $          
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
    <xsl:include href="proj_type01_tpkey.xsl"/>
    <xsl:include href="proj_type01_spec.xsl"/>
    <xsl:include href="proj_type01_stdext.xsl"/>
    
    <!-- So the aggregation does not cause an error -->
    <xsl:template match="monatdir"></xsl:template>

</xsl:stylesheet>
