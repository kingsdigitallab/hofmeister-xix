<?xml version="1.0" ?>
<!--
    This XSLT calls template html_tpl in common/proj_tpl.xsl and proj_tpl.xsl calls back to this xslt.
    
    SVN: $Id: proj_hofclass_tpkey.xsl 886 2007-10-01 12:57:22Z epierazzo $
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml" version="1.1"
  xmlns:dir="http://apache.org/cocoon/directory/2.0" exclude-result-prefixes="dir">
  <xsl:output indent="yes"/>
  <xsl:strip-space elements="group"/>
  
  <xsl:template match="ALhofclass"/>
  

  <!-- Main HTML creation in coommon/proj_tpl.xsl -->
  <xsl:template match="TEI.2">
    <xsl:choose>
      <xsl:when test="//div[substring(@id, 19) = $hofclass]">
        <xsl:apply-templates select="//div[substring(@id, 19) = $hofclass]" mode="page"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="//div[bibl[@id = $hofclass]]" mode="page"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="div" mode="page">
    <xsl:call-template name="html_tpl"/>
  </xsl:template>

  <!-- Current TEI month and year from ID -->
  <xsl:variable name="cur-file-id">
    <xsl:value-of select="substring(//TEI.2/@id, 6)"/>
  </xsl:variable>

  <!--MAIN AREAS OF SITE -->
  <!-- All calls come from proj_tpl.xsl -->

  <xsl:template name="utilLinks">
    <!-- Previous and Next months -->
    <!--<div class="utilLinks">
            <div class="t01">
            </div>
        </div>-->
  </xsl:template>


  <xsl:template name="ctpl_submenu">
    <div class="submenu">
      <div class="t03">
        <h3>
          <xsl:text>Browse </xsl:text>
          <xsl:value-of select="//TEI.2/teiHeader/fileDesc/titleStmt/title[1]"/>
          <xsl:text>:</xsl:text>
        </h3>
        <ul>
          <li>
            <a href="{$linkroot}/{$group-type02-path}{$cur-file-id}/{//text/body/pb/@n}.html"
              class="s02">
              <span>by page</span>
            </a>
          </li>
          <li>
            <a href="{$linkroot}/{$group-type02-path}{$cur-file-id}.html" class="s02">
              <span>by month</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </xsl:template>



  <xsl:template name="ctpl_pagehead">
    <div class="pageHeader">
      <div class="t01">
        <h1>
          <xsl:apply-templates select="//TEI.2/teiHeader/fileDesc/titleStmt/title[1]"
            mode="pagehead"/>
          <xsl:text>: </xsl:text>
          <xsl:value-of select="head/hofClass"/>
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
        <!--  CHOOSE OPTIONS BELOW AS APPROPRIATE  -->
        <div id="rightContent">
          <!--  Table of contents  -->
          <!-- OPTIONS: As default, a TOC is only output if there are actually any divisional headings. Footnotes are not included in the TOC. -->
          <xsl:if test="text/body/div/head or text/front/div/head or text/back/div/head">
            <div class="toc">
              <h3>Document contents</h3>
              <ul>
                <xsl:for-each select="/TEI.2/text/*/div/head">
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

          <!--  Quick links  -->
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

          <!--  Promotional article  -->
          <div class="promoArticle">
            <!-- This is a start on the code for promo article, not finished yet -->

            <!-- Find info forimages -->
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
                    <xsl:attribute name="src">
                      <xsl:value-of select="$imgroot" />
                      <xsl:value-of select="$pubimgswitch" />
                      <xsl:value-of select="$img-subpath-full" />
                      <xsl:value-of select="$img-src" />
                    </xsl:attribute>
                    <xsl:choose>
                      <xsl:when test="string($img-desc)">
                        <xsl:attribute name="alt">
                          <xsl:value-of select="$img-desc" />
                        </xsl:attribute>
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
                <dd>
                  <p><xsl:value-of select="$img-caption" /></p>
                </dd>
              </dl>
            -->
            <!-- END WIP -->

          </div>
          <!--  End of RH options  -->
        </div>
      </xsl:when>
      <xsl:otherwise> </xsl:otherwise>
    </xsl:choose>
  </xsl:template>



  <xsl:template name="ctpl_content">
    <div class="definitionList">
      <div>
        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="div/head[@rend = 'inline']">
              <xsl:text>t01</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>t02</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <dl>
          <xsl:apply-templates/>
        </dl>
      </div>
    </div>
  </xsl:template>



  <xsl:template name="ctpl_toc1">
    <xsl:call-template name="ctpl_toc"/>
  </xsl:template>

  <xsl:template name="ctpl_toc2">
    <xsl:call-template name="ctpl_toc"/>
  </xsl:template>

  <!-- OPTIONS: As default, a TOC is only output if there are actually any divisional headings. Footnotes are not included in the TOC. -->
  <!-- If top and bottom TOC content need to differ change in the separate templates above.-->
  <xsl:template name="ctpl_toc">
    <xsl:if test="//TEI.2//div/head/hofClass">
      <!--        <div class="toc">
            <div class="t01">-->
      <div class="jumpNav">
        <div class="t01">
          <form action="#">
            <fieldset>
              <label for="jumpMenu">Select a class:</label>
              <select id="{generate-id()}" name="generate-id()" size="1"
                onchange="jumpMenu('parent',this,0)">
                  <option value="#"></option>
                <xsl:for-each select="//TEI.2//div/head/hofClass"> <xsl:variable name="cur-class" select="."/>
                  <xsl:sort
                  select="//ALhofclass//hofClass[@id=current()/@key]/regName"/>
                  <option>
                    <xsl:attribute name="value">
                      <xsl:choose>
                        <xsl:when test="string(ancestor::div/@id)">
                          <xsl:value-of select="substring(ancestor::div/@id, 19)"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="ancestor::div/bibl[1]/@id"/>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:text>.html</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of
                      select="//ALhofclass//hofClass[@id=current()/@key]/regName"
                    /><xsl:if test="starts-with($cur-file-id,'1829') or starts-with($cur-file-id, '1830')"> 
                            (<xsl:value-of select="$cur-class"/><xsl:text> - </xsl:text><xsl:number count="hofClass" from="body" level="any"/>)
                    </xsl:if>
                  </option>
                </xsl:for-each>
              </select>
            </fieldset>
          </form>
        </div>
      </div>
      <!--                </div>
        </div>        -->
    </xsl:if>
  </xsl:template>



  <xsl:template name="ctpl_footnotes">
    <xsl:if test="//TEI.2//note">
      <div class="footnotes">
        <h3>Footnotes</h3>

        <!-- START model for each footnote -->
        <xsl:for-each select="//note">
          <xsl:variable name="fnnum">
            <xsl:number level="any"/>
          </xsl:variable>
          <xsl:variable name="fnnumfull">
            <xsl:number level="any" format="01"/>
          </xsl:variable>

          <dl>
            <dt id="fn{$fnnumfull}"><xsl:value-of select="$fnnum"/>.</dt>
            <dd>
              <xsl:apply-templates/>
              <xsl:text> </xsl:text>
              <a href="#fnLink{$fnnumfull}" class="back">Back to context...</a>
            </dd>
          </dl>

        </xsl:for-each>
        <!-- END model for each footnote -->
      </div>
    </xsl:if>
  </xsl:template>



  <xsl:template name="ctpl_options1">
    <div class="options">
      <!-- Changed to t03 from t01 for type02 pages -->
      <div class="t03">
        <xsl:call-template name="ctpl_option"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="ctpl_options2">
    <div class="options">
      <!-- Changed to t03 from t01 for type02 pages -->
      <div class="t03">
        <xsl:call-template name="ctpl_option"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="ctpl_option">
    <ul>
      <xsl:if test="string($pre-file-id)">
        <li>
          <a href="{$linkroot}/{$group-type02-path}{substring-before($pre-file-id, '.xml')}.html"
            class="s01">
            <span>Previous Month</span>
          </a>
        </li>
      </xsl:if>
      <xsl:if test="preceding-sibling::*[1][local-name()='div']">
        <li>
          <a class="s02">
            <xsl:attribute name="href">
              <xsl:choose>
                <xsl:when test="string(preceding-sibling::*[1]/@id)">
                  <xsl:value-of select="substring(preceding-sibling::*[1]/@id, 19)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="preceding-sibling::*[1]/bibl[1]/@id"/>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:text>.html</xsl:text>
            </xsl:attribute>
            <span>Previous class</span>
          </a>
        </li>
      </xsl:if>
      <xsl:if test="following-sibling::*[1][local-name()='div']">
        <li>
          <a class="s03">
            <xsl:attribute name="href">
              <xsl:choose>
                <xsl:when test="string(following-sibling::*[1]/@id)">
                  <xsl:value-of select="substring(following-sibling::*[1]/@id, 19)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="following-sibling::*[1]/bibl[1]/@id"/>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:text>.html</xsl:text>
            </xsl:attribute>
            <span>Next class</span>
          </a>
        </li>
      </xsl:if>
      <xsl:if test="string($fol-file-id)">
        <li>
          <a href="{$linkroot}/{$group-type02-path}{substring-before($fol-file-id, '.xml')}.html"
            class="s04">
            <span>Next Month</span>
          </a>
        </li>
      </xsl:if>
    </ul>
  </xsl:template>

</xsl:stylesheet>
<!--END OF STYLESHEET -->
