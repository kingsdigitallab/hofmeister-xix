<?xml version="1.0" ?>
<!--
    This XSLT calls template html_tpl in common/proj_tpl.xsl and proj_tpl.xsl calls back to this xslt.
    
    SVN: $Id: proj_result_tpkey.xsl 991 2008-02-19 16:09:58Z jvieira $
-->
<xsl:stylesheet version="1.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" />

  <xsl:variable name="item-regName" select="substring-after(//index/parameters/parameter[starts-with(., 'field1Txt')], ':')" />
  <xsl:variable name="item-letter" select="translate(substring($item-regName, 1, 1), $regNameBefore, $regNameAfter)" />

  <!-- Position of current word in a sorted list -->
  <xsl:variable name="cur-item-position">
    <xsl:for-each select="//alist-index//A_list//*">
      <xsl:sort case-order="lower-first" select="translate(regName, $regNameBefore, $regNameAfter)" />
      <xsl:if test="@id=$item-id">
        <xsl:value-of select="position()" />
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>

  <!-- Position of previous word in a sorted list -->
  <xsl:variable name="item-before">
    <xsl:if test="//index/nav/terms/previous">
      <xsl:variable name="l" select="substring(//index/nav/terms/start, 1, 1)" />
      
      <xsl:value-of select="//index/nav/terms/previous/@id" />
      <xsl:text>.html?fieldTxt=</xsl:text>
      <xsl:value-of select="$index" />
      <xsl:text>&amp;startTxt=</xsl:text>
      <xsl:value-of select="$l"/>
      <xsl:text>a-</xsl:text>
      <xsl:value-of select="$l"/>
      <xsl:text>z&amp;current=</xsl:text>
      <xsl:value-of select="//index/nav/terms/previous/@id" />
      <xsl:text>&amp;field1Txt=</xsl:text>
      <xsl:value-of select="//index/nav/terms/previous" />
    </xsl:if>
  </xsl:variable>

  <!-- Position of following word in a sorted list -->
  <xsl:variable name="item-after">
    <xsl:if test="//index/nav/terms/next">
      <xsl:variable name="l" select="substring(//index/nav/terms/start, 1, 1)" />
      
      <xsl:value-of select="//index/nav/terms/next/@id" />
      <xsl:text>.html?fieldTxt=</xsl:text>
      <xsl:value-of select="$index" />
      <xsl:text>&amp;startTxt=</xsl:text>
      <xsl:value-of select="$l"/>
      <xsl:text>a-</xsl:text>
      <xsl:value-of select="$l"/>
      <xsl:text>z&amp;current=</xsl:text>
      <xsl:value-of select="//index/nav/terms/next/@id" />
      <xsl:text>&amp;field1Txt=</xsl:text>
      <xsl:value-of select="//index/nav/terms/next" />
    </xsl:if>
  </xsl:variable>

  <!-- Creating the root page -->
  <xsl:template match="//index">
    <xsl:call-template name="html_tpl" />
  </xsl:template>

  <xsl:template match="index-al" />


  <!--   MAIN AREAS OF SITE     -->
  <!-- All calls come from proj_tpl.xsl -->

  <xsl:template name="utilLinks"> </xsl:template>


  <!-- Previous and Next -->
  <xsl:template name="ctpl_submenu">
    <div class="submenu">
      <div class="t03">
        <ul>
          <li>
            <xsl:choose>
              <xsl:when test="string($item-before)">
                <a href="{$item-before}">
                  <xsl:text>Previous</xsl:text>
                </a>
              </xsl:when>
              <xsl:otherwise>
                <span>
                  <xsl:text>Previous</xsl:text>
                </span>
              </xsl:otherwise>
            </xsl:choose>
          </li>
          <li>
            <!-- Last letter of the first group -->
            <xsl:variable name="group1-last-letter">
              <xsl:choose>
                <xsl:when test="$index = 'publishers'">
                  <xsl:text>f</xsl:text>
                </xsl:when>
                <xsl:when test="$index = 'composers'">
                  <xsl:text>d</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>z</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <a href="../{$item-letter}a-{$item-letter}{$group1-last-letter}.html">
              <xsl:text>Back to </xsl:text>
              <xsl:value-of select="$index-display-name" />
              <xsl:text> by </xsl:text>
              <xsl:value-of select="$item-letter" />
            </a>
          </li>
          <li>
            <xsl:choose>
              <xsl:when test="string($item-after)">
                <a href="{$item-after}">
                  <xsl:text>Next</xsl:text>
                </a>
              </xsl:when>
              <xsl:otherwise>
                <span>
                  <xsl:text>Next</xsl:text>
                </span>
              </xsl:otherwise>
            </xsl:choose>
          </li>
        </ul>
      </div>
    </div>
  </xsl:template>



  <xsl:template name="ctpl_pagehead">
    <div class="pageHeader">
      <div class="t01">
        <h1>
          <xsl:value-of select="$index-display-name" />
          <xsl:text> by </xsl:text>
          <xsl:value-of select="$item-letter" />
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
      <xsl:when test="error">
        <xsl:call-template name="error" />
      </xsl:when>
      <xsl:when test="$index = 'hofclasses'">
        <xsl:call-template name="result-hofclass" />
      </xsl:when>
      <xsl:when test="$index = 'hofsubclasses'">
        <xsl:call-template name="result-hofsubclass" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="result-body" />
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
    <!--<div class="toc">
            <div class="t01">
            </div>            
        </div>-->
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
