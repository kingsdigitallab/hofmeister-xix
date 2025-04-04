<?xml version="1.0"?>
<!--   $Id: proj_tpl.xsl 1041 2018-05-23 11:16:54Z jvieira $    -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml" version="1.1"
  xmlns:filename="filename.uri" exclude-result-prefixes=" filename">

  <!--   MAIN TEMPLATE STARTS        -->
  <xsl:template name="html_tpl">
    <!-- START HTML -->
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <!--  CTPL_HTMLTITLE  -->
        <xsl:comment>CTPL_HTMLTITLE STARTS</xsl:comment>
        <xsl:call-template name="ctpl_htmltitle"/>
        <xsl:comment>CTPL_HTMLTITLE ENDS</xsl:comment>
      </head>

      <body>
        <!-- Sets right hand content variable within correct context -->
        <xsl:variable name="rhcontent">
          <xsl:call-template name="tpl_rhcontent"/>
        </xsl:variable>
        <xsl:variable name="body-global-class" select="'v1 r3'"/>
        <xsl:attribute name="id">xmd</xsl:attribute>
        <xsl:attribute name="class">
          <!-- Defines whether or not there is space for a right-hand box -->
          <xsl:choose>
            <xsl:when test="$rhcontent='on'">
              <xsl:value-of select="$body-global-class"/>
              <xsl:text> rc1</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$body-global-class"/>
              <xsl:text> rc0</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>

        <div id="wrapper">
          <!--  CTPL_BANNER  -->
          <xsl:comment>CTPL_BANNER STARTS</xsl:comment>
          <xsl:call-template name="ctpl_banner"/>
          <xsl:comment>CTPL_BANNER ENDS</xsl:comment>
          <!--  -->
          <!--  CTPL_BANNER ENDS  -->
          <!--  -->

          <table id="xlt" summary="" cellpadding="0" cellspacing="0">

            <!--  BREADCRUMB ROW -->
            <tr class="r01">
              <td id="breadcrumb" colspan="2">
                <!--  CTPL_BREAD  -->
                <xsl:comment>CTPL_BREAD STARTS</xsl:comment>
                <xsl:call-template name="ctpl_bread"/>
                <xsl:comment>CTPL_BREAD ENDS</xsl:comment>
              </td>
            </tr>

            <!--  ROW FOR EVERYTHING ELSE -->
            <tr class="r02">
              <td id="sidenav">
                <div id="pn">
                  <!--  CTPL_NAV  -->
                  <xsl:comment>CTPL_NAV STARTS</xsl:comment>
                  <xsl:call-template name="ctpl_nav"/>
                  <xsl:comment>CTPL_NAV ENDS</xsl:comment>
                </div>
              </td>

              <td id="content">
                <!--  CTPL_RHCONTENT  -->
                <xsl:comment>CTPL_RHCONTENT STARTS</xsl:comment>
                <xsl:call-template name="ctpl_rhcontent"/>
                <xsl:comment>CTPL_RHCONTENT ENDS</xsl:comment>

                <div id="mainContent">
                  <!--  CTPL_OPTIONS1  -->
                  <xsl:comment>CTPL_OPTIONS1 STARTS</xsl:comment>
                  <!--  Allows for options at the top of the page  -->
                  <xsl:call-template name="ctpl_options1"/>
                  <xsl:comment>CTPL_OPTIONS1 END</xsl:comment>

                  <!--  CTPL_SUBMENU  -->
                  <xsl:comment>CTPL_SUBMENU STARTS</xsl:comment>
                  <xsl:call-template name="ctpl_submenu"/>
                  <xsl:comment>CTPL_SUBMENU ENDS</xsl:comment>

                  <!-- CTPL_PAGEHEAD  -->
                  <xsl:comment>CTPL_PAGEHEAD STARTS</xsl:comment>
                  <xsl:call-template name="ctpl_pagehead"/>
                  <xsl:comment>CTPL_PAGEHEAD ENDS</xsl:comment>

                  <!--  CTPL_TOC1  -->
                  <xsl:comment>CTPL_TOC1 STARTS</xsl:comment>
                  <xsl:call-template name="ctpl_toc1"/>
                  <xsl:comment>CTPL_TOC1 ENDS</xsl:comment>

                  <!--  CTPL_CONTENT  -->
                  <xsl:comment>CTPL_CONTENT STARTS</xsl:comment>
                  <xsl:call-template name="ctpl_content"/>
                  <xsl:comment>CTPL_CONTENT ENDS</xsl:comment>

                  <!--  CTPL_FOOTNOTES  -->
                  <xsl:comment>CTPL_FOOTNOTES STARTS</xsl:comment>
                  <xsl:call-template name="ctpl_footnotes"/>
                  <xsl:comment>CTPL_FOOTNOTES ENDS</xsl:comment>

                  <!--  CTPL_TOC2  -->
                  <xsl:comment>CTPL_TOC2 STARTS</xsl:comment>
                  <xsl:call-template name="ctpl_toc2"/>
                  <xsl:comment>CTPL_TOC2 ENDS</xsl:comment>

                  <!--  CTPL_OPTIONS2 START  -->
                  <xsl:comment>CTPL_OPTIONS2 STARTS</xsl:comment>
                  <xsl:call-template name="ctpl_options2"/>
                  <xsl:comment>CTPL_OPTIONS2 END</xsl:comment>
                </div>
              </td>
            </tr>
          </table>

          <!--  CTPL_FOOTER   -->
          <xsl:comment>CTPL_FOOTER STARTS</xsl:comment>
          <xsl:call-template name="ctpl_footer"/>
          <xsl:comment>CTPL_FOOTER ENDS</xsl:comment>
        </div>

        <xsl:if test="$view = 'map'">
          <script src="{$scriptpers}/s/map.js" type="text/javascript">&#160;</script>
        </xsl:if>
        <script src="/2008/Assets/sla-acpp/js/sla.js" type="text/javascript">&#160;</script>
      </body>
    </html>
    <!-- END OF HTML -->
  </xsl:template>
  <!--       MAIN TEMPLATE ENDS        -->
</xsl:stylesheet>
