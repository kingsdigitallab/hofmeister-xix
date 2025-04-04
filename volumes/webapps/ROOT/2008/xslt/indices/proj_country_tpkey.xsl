<?xml version="1.0" ?>
<!--
    This XSLT calls template html_tpl in common/proj_tpl.xsl and proj_tpl.xsl calls back to this xslt.
    
    SVN: $Id: proj_country_tpkey.xsl 933 2007-10-30 16:38:20Z jvieira $
-->
<xsl:stylesheet version="1.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" />
  <xsl:key match="country" name="country-key" use="." />
  <xsl:template match="/">
    <xsl:call-template name="html_tpl" />
  </xsl:template>



  <!--   MAIN AREAS OF SITE     -->
  <!-- All calls come from proj_tpl.xsl -->

  <xsl:template name="utilLinks"> </xsl:template>


  <xsl:template name="ctpl_submenu">
    <xsl:if test="string($item-id)">
      <div class="submenu">
        <div class="t01">
          <ul>
            <li>
              <a href="../{$index}.html">
                <xsl:text>Back to list of countries</xsl:text>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </xsl:if>
  </xsl:template>



  <xsl:template name="ctpl_pagehead">
    <div class="pageHeader">
      <div class="t01">
        <h1>
          <xsl:choose>
            <xsl:when test="string($item-id)">
              <xsl:text>Publication places in </xsl:text>

              <xsl:value-of select="//ALcountries//countryCode[internal = $item-id]/full[1]" />

              <!--<xsl:value-of select="$item-id"/>-->
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>List of </xsl:text>
              <xsl:value-of select="$index-display-name" />
              <xsl:if test="$index = 'countries'">
                <xsl:text> (based on 2006 boundaries)</xsl:text>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>
        </h1>
      </div>
    </div>
  </xsl:template>



  <xsl:template name="ctpl_rhcontent">
    <!-- Sets right hand content variable within correct context -->
    <xsl:variable name="rhcontent">
      <xsl:call-template name="tpl_rhcontent" />
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$rhcontent='on'">
        <!-- CHOOSE OPTIONS BELOW AS APPROPRIATE -->
        <div id="rightContent">

          <!-- Table of contents -->
          <!-- OPTIONS: As default, a TOC is only output if there are actually any divisional headings. Footnotes are not included in the TOC. -->
          <xsl:if test="text/body/div/head or text/front/div/head or text/back/div/head">
            <div class="toc">
              <h3>Document contents</h3>
              <ul>
                <xsl:for-each select="//TEI.2/text/*/div/head">
                  <li>
                    <a href="#{generate-id()}">
                      <span>
                        <xsl:apply-templates mode="toc" select="." />
                      </span>
                    </a>
                  </li>
                </xsl:for-each>
              </ul>
            </div>
          </xsl:if>

          <!-- Quick links -->
          <!-- As used on CCH website, subsidiary navigation -->
          <div class="quickLinks">
            <h3>Quicklinks</h3>
            <ul>
              <li>
                <a href="">
                  <span>Quicklink</span>
                </a>
              </li>
              <li>
                <a href="">
                  <span>Quicklink</span>
                </a>
              </li>
              <li>
                <a href="">
                  <span>Quicklink</span>
                </a>
              </li>
              <li>
                <a href="">
                  <span>Quicklink with some additional text</span>
                </a>
              </li>
            </ul>
          </div>

          <!-- Promotional article -->
          <div class="promoArticle">

            <!-- This is a start on the code for promo article, not finished yet -->
            <!--  Find info for  images -->
            <!-- e.g. img001.gif -->

            <!-- folder info -->
            <xsl:variable name="img-group-folder" select="//imagebase//image[@id=current()/@url]/parent::*/groupHead/groupFolder" />
            <xsl:variable name="img-subpath-full" select="'full/'" />
            <xsl:variable name="img-subpath-thumb" select="'thumb/'" />
            <!-- file info -->
            <xsl:variable name="img-id" select="//imagebase//image[@id=current()/@url]/@id" />
            <xsl:variable name="img-ext" select="//imagebase//image[@id=current()/@url]/ext/@n" />
            <xsl:variable name="img-src" select="concat($img-id, '.', $img-ext)" />
            <xsl:variable name="img-thm-prefix" select="'thm_'" />
            <!-- other info -->
            <xsl:variable name="img-caption" select="//imagebase//image[@id=current()/@url]/caption" />
            <xsl:variable name="img-desc" select="//imagebase//image[@id=current()/@url]/desc" />
            <xsl:variable name="img-width" select="//imagebase//image[@id=current()/@url]/width" />
            <xsl:variable name="img-height" select="//imagebase//image[@id=current()/@url]/height" />

            <h3>Promo Article</h3>
            <!-- Target output -->
            <dl>
              <dt>
                <img alt="" title="" width="150">
                  <xsl:attribute name="src"><xsl:value-of select="$imgroot" /><xsl:value-of select="$pubimgswitch" /><xsl:value-of
                      select="$img-subpath-full" />img001.jpg</xsl:attribute>
                </img>
              </dt>
              <dd>
                <p>Photo by Don McPhee, The Guardian</p>
              </dd>
            </dl>

            <!-- Code in progress -->
            <!-- START WIP -->
            <!-- 
             <dl>
               <dt>

                  <img>
                     <xsl:attribute name="src"><xsl:value-of select="$imgroot" /><xsl:value-of select="$pubimgswitch" /><xsl:value-of select="$img-subpath-full" /><xsl:value-of select="$img-src" /></xsl:attribute>
                     <xsl:choose>
                        <xsl:when test="string($img-desc)">
                           <xsl:attribute name="alt"><xsl:value-of select="$img-desc" /></xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:attribute name="alt"><xsl:value-of select="$img-caption" /></xsl:attribute>
                        </xsl:otherwise>
                     </xsl:choose>
                     <xsl:attribute name="title"><xsl:value-of select="$img-caption" /></xsl:attribute>
                     <xsl:attribute name="width"><xsl:value-of select="$img-width" /></xsl:attribute>
                     <xsl:attribute name="height"><xsl:value-of select="$img-height" /></xsl:attribute>
                  </img>    
               </dt>
               <dd><p><xsl:value-of select="$img-caption" /></p></dd>      
             </dl>
             -->
            <!-- END WIP -->

          </div>
          <!-- End of RH options -->
        </div>
      </xsl:when>
      <xsl:otherwise />
    </xsl:choose>
  </xsl:template>



  <xsl:template name="ctpl_content">
    <xsl:choose>
      <xsl:when test="string($item-id)">
        <xsl:call-template name="place-list" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="country-list" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>



  <xsl:template name="ctpl_toc1">
    <!--<xsl:call-template name="ctpl_toc"/>-->
  </xsl:template>

  <xsl:template name="ctpl_toc2">
    <!--<xsl:call-template name="ctpl_toc"/>-->
  </xsl:template>

  <!-- OPTIONS: As default, a TOC is only output if there are actually any divisional headings. Footnotes are not included in the TOC. -->
  <!-- If top and bottom TOC content need to differ change in the separate templates above.  -->

  <xsl:template name="ctpl_toc">
    <div class="toc">
      <div class="t01"> </div>
    </div>
  </xsl:template>



  <xsl:template name="ctpl_footnotes"> </xsl:template>



  <xsl:template name="ctpl_options1">
    <!--
        <div class="options">
            <div class="t01">
                <xsl:call-template name="ctpl_option"/>
            </div>
        </div>
        -->
  </xsl:template>

  <xsl:template name="ctpl_options2">
    <!--
        <div class="options">
            <div class="t02">
                <xsl:call-template name="ctpl_option"/>
            </div>
        </div>
        -->
  </xsl:template>

  <xsl:template name="ctpl_option">
    <ul>
      <li>
        <a class="s01" href="">
          <span>First Page</span>
        </a>
      </li>
      <li>
        <a class="s02" href="">
          <span>Previous Page</span>
        </a>
      </li>
      <li>
        <a class="s03" href="">
          <span>Next Page</span>
        </a>
      </li>
      <li>
        <a class="s04" href="">
          <span>Last Page</span>
        </a>
      </li>
      <li>
        <a class="s05" href="">
          <span>1</span>
        </a>
      </li>
      <li>
        <a class="s06" href="">
          <span>Previous</span>
        </a>
      </li>
      <li>
        <a class="s07" href="">
          <span>Next</span>
        </a>
      </li>
      <li>
        <a class="s08" href="">
          <span>Search</span>
        </a>
      </li>
      <li>
        <a class="s09" href="">
          <span>Search Again</span>
        </a>
      </li>
      <li>
        <a class="s10" href="">
          <span>Refine Search</span>
        </a>
      </li>
      <li>
        <a class="s11" href="">
          <span>Print this Page</span>
        </a>
      </li>
    </ul>
  </xsl:template>

</xsl:stylesheet>
