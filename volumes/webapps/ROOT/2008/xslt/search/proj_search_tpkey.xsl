<?xml version="1.0" ?>
<!--
    This XSLT calls template html_tpl in common/proj_tpl.xsl and proj_tpl.xsl calls back to this xslt.
    
    SVN: $Id: proj_search_tpkey.xsl 1011 2008-04-18 13:21:19Z jvieira $
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:page="http://apache.org/cocoon/paginate/1.0"
    exclude-result-prefixes="page" version="1.1">
    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="$view = 'thesaurus'">
                <xsl:call-template name="html_tpl_thesaurus"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="html_tpl"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>



    <!--   MAIN AREAS OF SITE     -->
    <!-- All calls come from proj_tpl.xsl -->

    <xsl:template name="utilLinks"> </xsl:template>


    <xsl:template name="ctpl_submenu">
        
            <div class="submenu">
                <xsl:choose>
                    <xsl:when
                        test="//filebase//item[@id = $global-tei-id][ancestor::group/@id='g2_3']">
                        <xsl:variable name="help-link-path"
            select="//filebase//group[@id='g3_1']/groupHead/groupFolder"/>
                        <div class="options">
                            <div class="t04">
                                <ul>
                                    <li>
                                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="$linkroot"/>
                                <xsl:text>/</xsl:text>
                               <xsl:value-of select="$help-link-path"/>
                               <xsl:choose>
                                   <xsl:when test="$global-tei-id = 'search_basic' ">
                                       <xsl:text>basic</xsl:text>
                                   </xsl:when>
                                   <xsl:when test="$global-tei-id = 'search_advanced' ">
                                       <xsl:text>advanced</xsl:text>
                                   </xsl:when>
                                   <xsl:when test="$global-tei-id = 'search_free_text' ">
                                       <xsl:text>freetext</xsl:text>
                                   </xsl:when>
                                   <xsl:when test="$global-tei-id = 'search_list' ">
                                       <xsl:text>list</xsl:text>
                                   </xsl:when>
                               </xsl:choose>
                                
                                <xsl:text>.html</xsl:text>
                                
                            </xsl:attribute>
                            <xsl:text>Help</xsl:text>
                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </xsl:when>
                    <xsl:when test="//search-results/search-link">
                        <div class="t01">
                            <ul>
                                <li>
                                    <xsl:choose>
                                        <xsl:when
                                            test="//search-results//parameters/parameter[starts-with(., 'listSearchLink:')]">
                                            <a class="s07"
                                                href="refine-list.html;jsessionid={//session-id}">
                                                <span>Back to search</span>
                                            </a>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <a class="s07"
                                                href="refine-{//search-results/search-link}.html;jsessionid={//session-id}">
                                                <span>Back to search</span>
                                            </a>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </li>

                                <xsl:if test="not(//page:page)">
                                    <xsl:variable name="link">
                                        <xsl:choose>
                                            <xsl:when test="//search-link = 'list'">listPage</xsl:when>
                                            <xsl:otherwise>page</xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>

                                    <li>
                                        <a class="s05" href="{$link}(1);jsessionid={//session-id}">
                                            <span>Back to search results</span>
                                        </a>
                                    </li>
                                </xsl:if>
                            </ul>
                        </div>
                    </xsl:when>
                </xsl:choose>


            </div>
        
    </xsl:template>

    <xsl:template name="ctpl_pagehead">
        <div class="pageHeader">
            <div class="t01">
                <h1>
                    <xsl:choose>
                        <xsl:when test="$global-tei-id = 'search_results'">
                            <xsl:choose>
                                <xsl:when test="string(//search-results/error)">
                                    <xsl:value-of select="//search-results/error"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>Results for </xsl:text>
                                    <xsl:for-each
                                        select="//search-results/parameters/parameter[starts-with(., 'field')][contains(., 'Txt')]">
                                        <xsl:value-of select="substring-after(., ':')"/>

                                        <xsl:if
                                            test="following-sibling::parameter[starts-with(., 'field')][contains(., 'Txt')]">
                                            <xsl:text>, </xsl:text>
                                        </xsl:if>
                                    </xsl:for-each>

                                    <xsl:if
                                        test="//search-results/parameters/parameter[starts-with(., 'field')][contains(., 'Txt')]">
                                        <xsl:if
                                            test="//search-results/parameters/parameter[contains(., 'Date')]">
                                            <xsl:text>, </xsl:text>
                                        </xsl:if>
                                    </xsl:if>

                                    <xsl:for-each
                                        select="//search-results/parameters/parameter[contains(., 'Date')]">
                                        <xsl:value-of select="substring-after(., ':')"/>

                                        <xsl:if
                                            test="following-sibling::parameter[contains(., 'Date')]">
                                            <xsl:text>, </xsl:text>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="//filebase//item[@id = $global-tei-id]/fileTitle"
                            />
                        </xsl:otherwise>
                    </xsl:choose>
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
                        <xsl:variable name="img-id"
                            select="//imagebase//image[@id=current()/@url]/@id"/>
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
                                    <xsl:attribute name="src"><xsl:value-of select="$imgroot"
                                            /><xsl:value-of select="$pubimgswitch"/><xsl:value-of
                                            select="$img-subpath-full"/>img001.jpg</xsl:attribute>
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
        <xsl:choose>
            <xsl:when test="$context-id = 'search_basic'">
                <xsl:call-template name="tpl-search-basic-form"/>
            </xsl:when>
            <xsl:when test="$context-id = 'search_advanced'">
                <xsl:call-template name="tpl-search-advanced-form"/>
            </xsl:when>
            <xsl:when test="$context-id = 'search_free_text'">
                <xsl:call-template name="tpl-search-free-text-form"/>
            </xsl:when>
            <xsl:when test="$context-id = 'search_list'">
                <xsl:call-template name="tpl-search-list-form"/>
            </xsl:when>
            <xsl:when test="$view = 'thesaurus'">
                <xsl:call-template name="html_tpl_thesaurus"/>
            </xsl:when>
            <xsl:when test="$view = 'results' or $view = 'all-results'">
                <xsl:call-template name="tpl-xsp-results"/>
            </xsl:when>
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
        <xsl:if test="$view = 'results'">
            <xsl:if test="//page:page[not(@total = '1')]">
                <div class="options">
                    <div class="t03">
                        <xsl:call-template name="ctpl_option"/>
                    </div>
                </div>
            </xsl:if>
            <!--<xsl:if test="//search-results[total > 0] and //search-results[size > page-size] and not(//search-results/page = 0)">
        <div class="options">
          <div class="t03">
            <xsl:call-template name="ctpl_option"/>
          </div>
        </div>
      </xsl:if>-->
        </xsl:if>
    </xsl:template>

    <xsl:template name="ctpl_options2">
        <xsl:if test="$view = 'results'">
            <xsl:if test="//page:page[not(@total = '1')]">
                <div class="options">
                    <div class="t02">
                        <xsl:call-template name="ctpl_option"/>
                    </div>
                </div>
            </xsl:if>
            <!--<xsl:if test="//search-results[hits > 0] and //search-results[hits > page-size] and not(//search-results/page = 0)">
        <xsl:if test="//page:page[not(@total = '1')]">
        <div class="options">
        <div class="t02">
        <xsl:call-template name="ctpl_option"/>
        </div>
        </div>
        </xsl:if>
      </xsl:if>-->
        </xsl:if>
    </xsl:template>

    <xsl:template name="ctpl_option">
        <xsl:variable name="link">
            <xsl:choose>
                <xsl:when test="//search-link = 'list'">listPage</xsl:when>
                <xsl:otherwise>page</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:for-each select="//page:page">
            <ul>
                <xsl:variable name="current-page" select="@current"/>
                <li>
                    <xsl:choose>
                        <xsl:when test="page:link[@type = 'prev'][position() = last()]">
                            <a class="s07"
                                href="{$link}({page:link[@type = 'prev'][position() = last()]/@page});jsessionid={//session-id}">
                                <span>Previous</span>
                            </a>
                        </xsl:when>
                        <xsl:otherwise>
                            <span>Previous</span>
                        </xsl:otherwise>
                    </xsl:choose>
                </li>
                <xsl:for-each select="page:link[@page &lt; $current-page]">
                    <li>
                        <a class="s05" href="{$link}({@page});jsessionid={//session-id}">
                            <span>
                                <xsl:value-of select="@page"/>
                            </span>
                        </a>
                    </li>
                </xsl:for-each>
                <li>
                    <span>
                        <xsl:value-of select="$current-page"/>
                    </span>
                </li>
                <xsl:for-each select="page:link[@page > $current-page]">
                    <li>
                        <a class="s05" href="{$link}({@page});jsessionid={//session-id}">
                            <span>
                                <xsl:value-of select="@page"/>
                            </span>
                        </a>
                    </li>
                </xsl:for-each>
              <xsl:if test="1000 >= //search-results/size">
                <li>
                    <a class="s05" href="{$link}-all;jsessionid={//session-id}">
                        <span>All</span>
                    </a>
                </li>
              </xsl:if>
                <li>
                    <xsl:choose>
                        <xsl:when test="page:link[@type = 'next'][position() = 1]">
                            <a class="s07"
                                href="{$link}({page:link[@type = 'next'][position() = 1]/@page});jsessionid={//session-id}">
                                <span>Next</span>
                            </a>
                        </xsl:when>
                        <xsl:otherwise>
                            <span>Next</span>
                        </xsl:otherwise>
                    </xsl:choose>
                </li>
            </ul>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
