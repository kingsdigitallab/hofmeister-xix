<?xml version="1.0" encoding="UTF-8"?>
  <!--
    XSLT for the output of aggregated results.
    SVN: $Id: aggregation.xsl 232 2007-03-02 16:25:20Z zau $
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output indent="yes" encoding="UTF-8"/>

    <!-- Global variable definitions -->
    <xsl:include href="../common/proj_vars.xsl"/>

    <!-- Aggregation templates -->
    <xsl:include href="aggregation_tpl.xsl"/>
    
    <!-- Generic stylesheets -->
    <xsl:include href="generic/common_tpl.xsl"/>
    <xsl:include href="generic/alist.xsl"/>
    <xsl:include href="generic/navbar.xsl"/>
    <xsl:include href="generic/image.xsl"/>
    <xsl:include href="generic/master.xsl"/>
    <xsl:include href="generic/link_com.xsl"/>
    <xsl:include href="generic/link_broken.xsl"/>
    <xsl:include href="generic/link.xsl"/>
    <xsl:include href="generic/link_targeted.xsl"/>
    
    <!-- Specific stylesheets -->
    <xsl:include href="specific/list.xsl"/>
    <xsl:include href="specific/table.xsl"/>
    <xsl:include href="specific/summary.xsl"/>
    <xsl:include href="specific/views_com.xsl"/>
    <xsl:include href="specific/index-view.xsl"/>
    

    <!-- Utilities XSLT -->
    <xsl:include href="../utilities/string.xsl"/>

    <!-- Global variable with the id of the current TEI document being transformed -->
    <xsl:variable name="global-tei-id">
        <xsl:value-of select="//authorityList/@id"/>
    </xsl:variable>

    
    <!-- Matches the aggregation element defined in the mainSitemap to generate the main structure for the HTML page -->
    <xsl:template match="aggregation">
        <html>
            <head>
                <!-- CSS call  -->
                <link rel="stylesheet" media="screen" type="text/css" href="Assets/g/c/projchq.css"/>
                <!-- script -->
                <script src="{$scriptswitch}/s/corelib.js" type="text/javascript"><xsl:comment>&#160;</xsl:comment></script>
                <script src="{$scriptswitch}/s/config.js" type="text/javascript">&#160;</script>
                <script src="{$scriptswitch}/s/init.js" type="text/javascript">&#160;</script>
                
                <title>
                    <xsl:text>Hofmeister: Checking pages</xsl:text>
                </title>
            </head>

            <!-- Templates in aggregation_tpl.xsl -->
            <body>
                <!-- Main Page Head -->
                <div id="header">
                    <xsl:apply-templates select="main/*" mode="pagehead"/>
                </div>

                <!-- Checking Pages Navigation - using AL_docsite.xml -->
                <div id="nav">
                    <xsl:apply-templates select="docsite"/>
                </div>

                <!-- Main Checking Content -->
                <div id="main">
                    <div id="content">
                        <div id="toc"> </div>
                        <div id="mainContent">
                            <xsl:apply-templates select="main"/>
                        </div>
                    </div>
                </div>
                
                <!-- Any Footer information -->
                <div id="footer"></div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
