<?xml version="1.0" ?>
<!--
    This XSLT calls template html_tpl in common/proj_tpl.xsl and proj_tpl.xsl calls back to this xslt.
    
    SVN: $Id: proj_indices_tpkey.xsl 993 2008-02-20 11:46:10Z epierazzo $
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml" version="1.1">
  <xsl:output indent="yes"/>

  <xsl:template match="/">
    <xsl:call-template name="html_tpl"/>
  </xsl:template>

  <xsl:template match="hofclasses">
    
  </xsl:template>


  <!--   MAIN AREAS OF SITE     -->
  <!-- All calls come from proj_tpl.xsl -->

  <xsl:template name="utilLinks"> </xsl:template>


  <xsl:template name="ctpl_submenu">
    <!--<div class="submenu">-->
                  <xsl:if test="$global-tei-id = 'index_hofclasses'">
                <xsl:variable name="redist-link-path"
                    select="//filebase//group[@id='g3']/groupHead/groupFolder"/>
                <div class="options">
                    <div class="t04">
                        <ul>
                            <li>
                                <a class="file" title="File Link">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="$linkroot"/>
                                        <xsl:text>/redist/pdf/</xsl:text>
                                        <xsl:text>HofmeisterMonatsberichteClasses.pdf</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Class Thesaurus</xsl:text>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </xsl:if>
    <div class="alphaNav">
      <div class="t01 clfx-b">
        <h3>Alphabetical Index</h3>
        <ul>
          <xsl:call-template name="alphabetList"/>
        </ul>
      </div>
    </div>
    <!--</div>-->
  </xsl:template>



  <xsl:template name="ctpl_pagehead">
    <div class="pageHeader">
      <div class="t01">
        <h1>
          <xsl:value-of select="$index-display-name"/>
          <xsl:text> by </xsl:text>
          <xsl:value-of select="$orig-starts-with-letter"/>
        </h1>
      </div>
    </div>
  </xsl:template>



  <xsl:template name="ctpl_rhcontent">
    <!-- Sets right hand content variable within correct context -->
    <xsl:variable name="rhcontent">
      <xsl:call-template name="tpl_rhcontent"/>
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
                        <xsl:apply-templates select="." mode="toc"/>
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
            <xsl:variable name="img-group-folder"
              select="//imagebase//image[@id=current()/@url]/parent::*/groupHead/groupFolder"/>
            <xsl:variable name="img-subpath-full" select="'full/'"/>
            <xsl:variable name="img-subpath-thumb" select="'thumb/'"/>
            <!-- file info -->
            <xsl:variable name="img-id" select="//imagebase//image[@id=current()/@url]/@id"/>
            <xsl:variable name="img-ext"
              select="//imagebase//image[@id=current()/@url]/ext/@n"/>
            <xsl:variable name="img-src" select="concat($img-id, '.', $img-ext)"/>
            <xsl:variable name="img-thm-prefix" select="'thm_'"/>
            <!-- other info -->
            <xsl:variable name="img-caption"
              select="//imagebase//image[@id=current()/@url]/caption"/>
            <xsl:variable name="img-desc"
              select="//imagebase//image[@id=current()/@url]/desc"/>
            <xsl:variable name="img-width"
              select="//imagebase//image[@id=current()/@url]/width"/>
            <xsl:variable name="img-height"
              select="//imagebase//image[@id=current()/@url]/height"/>

            <h3>Promo Article</h3>
            <!-- Target output -->
            <dl>
              <dt>
                <img title="" alt="" width="150">
                  <xsl:attribute name="src"><xsl:value-of select="$imgroot"/><xsl:value-of
                      select="$pubimgswitch"/><xsl:value-of select="$img-subpath-full"
                  />img001.jpg</xsl:attribute>
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
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>



  <xsl:template name="ctpl_content">
    <xsl:apply-templates/>
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
        <a href="" class="s01">
          <span>First Page</span>
        </a>
      </li>
      <li>
        <a href="" class="s02">
          <span>Previous Page</span>
        </a>
      </li>
      <li>
        <a href="" class="s03">
          <span>Next Page</span>
        </a>
      </li>
      <li>
        <a href="" class="s04">
          <span>Last Page</span>
        </a>
      </li>
      <li>
        <a href="" class="s05">
          <span>1</span>
        </a>
      </li>
      <li>
        <a href="" class="s06">
          <span>Previous</span>
        </a>
      </li>
      <li>
        <a href="" class="s07">
          <span>Next</span>
        </a>
      </li>
      <li>
        <a href="" class="s08">
          <span>Search</span>
        </a>
      </li>
      <li>
        <a href="" class="s09">
          <span>Search Again</span>
        </a>
      </li>
      <li>
        <a href="" class="s10">
          <span>Refine Search</span>
        </a>
      </li>
      <li>
        <a href="" class="s11">
          <span>Print this Page</span>
        </a>
      </li>
    </ul>
  </xsl:template>

</xsl:stylesheet>
