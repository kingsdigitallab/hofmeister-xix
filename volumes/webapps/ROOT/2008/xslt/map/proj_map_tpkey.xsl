<?xml version="1.0" ?>
<!--
    This XSLT calls template html_tpl in common/proj_tpl.xsl and proj_tpl.xsl calls back to this xslt.
    
    SVN: $Id$
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml" version="1.1">
  <xsl:output indent="yes"/>
  <xsl:strip-space elements="group"/>

  <xsl:template match="/">
    <xsl:call-template name="html_tpl"/>
  </xsl:template>

  <xsl:template match="ALcountries"/>

  <!--   MAIN AREAS OF SITE     -->
  <!-- All calls come from proj_tpl.xsl -->

  <xsl:template name="utilLinks"/>

  <xsl:template name="ctpl_submenu"> </xsl:template>

  <xsl:template name="ctpl_pagehead">
    <div class="pageHeader">
      <div class="t01">
        <h1>
          <xsl:text>Hofmeister Map</xsl:text>
        </h1>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="ctpl_rhcontent"> </xsl:template>

  <xsl:template name="ctpl_content">
    <div class="jumpNav">
      <div class="t01 clfx-b">
        <form name="mapOptionsForm" id="mapOptionsForm">
          <fieldset class="f06 n04">
            <button type="button" name="reset-map" id="reset-map">Reset
              Map</button>
          </fieldset>
        </form>
      </div>
    </div>
    <div id="map" style="width: 100%; height: 400px">&#160;</div>
    <noscript> JavaScript must be enabled in order for you to use the Map. However, it seems
      JavaScript is either disabled or not supported by your browser. To view the Map, enable
      JavaScript by changing your browser options, and then try again. </noscript>
    <xsl:apply-templates select="//ALpubplaces"/>
  </xsl:template>

  <xsl:template name="ctpl_toc1">
    <!--<xsl:call-template name="ctpl_toc"/>-->
  </xsl:template>

  <xsl:template name="ctpl_toc2">
    <!--<xsl:call-template name="ctpl_toc"/>-->
  </xsl:template>

  <!-- OPTIONS: As default, a TOC is only output if there are actually any divisional headings. Footnotes are not included in the TOC. -->
  <!-- If top and bottom TOC content need to differ change in the separate templates above.  -->

  <xsl:template name="ctpl_toc"/>

  <xsl:template name="ctpl_footnotes"/>

  <xsl:template name="ctpl_options1" />

  <xsl:template name="ctpl_options2" />

  <xsl:template name="ctpl_option" />
</xsl:stylesheet>
