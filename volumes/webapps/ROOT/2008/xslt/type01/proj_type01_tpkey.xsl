<?xml version="1.0" ?>
<!--
    This XSLT calls template html_tpl in common/proj_tpl.xsl and proj_tpl.xsl calls back to this xslt.
    
    SVN: $Id: proj_type01_tpkey.xsl 993 2008-02-20 11:46:10Z epierazzo $
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="1.1">

    <xsl:strip-space elements="group"/>


    <xsl:template match="//TEI.2">
        <xsl:call-template name="html_tpl"/>
    </xsl:template>



    <!--   MAIN AREAS OF SITE     -->
    <!-- All calls come from proj_tpl.xsl -->

    <xsl:template name="utilLinks"></xsl:template>


    <xsl:template name="ctpl_submenu">

        <xsl:choose>
            <xsl:when test="starts-with($global-tei-id,'p2_')">
                <xsl:variable name="help-link-path" select="//filebase//group[@id='g3']/groupHead/groupFolder"/>
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
                                            <xsl:when test="$global-tei-id = 'p2_1' ">
                                                <xsl:text>browsing</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="$global-tei-id = 'p2_2' ">
                                                <xsl:text>indices</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="$global-tei-id = 'p2_3' ">
                                                <xsl:text>search</xsl:text>
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
        </xsl:choose>
    </xsl:template>



    <xsl:template name="ctpl_pagehead">
        <div class="pageHeader">
            <div class="t01">
                <h1>
                    <xsl:apply-templates select="//TEI.2/teiHeader/fileDesc/titleStmt/title[1]" mode="pagehead"/>
                </h1>

                <!-- START test for subtitle. -->

                <xsl:if test="//TEI.2/teiHeader/fileDesc/titleStmt/title[@type='sub']">
                    <h2>
                        <xsl:apply-templates select="//TEI.2/teiHeader/fileDesc/titleStmt/title[@type='sub']" mode="pagehead"/>
                    </h2>
                </xsl:if>
                <!-- END test for subtitle. -->

                <!-- START test for author or editor. -->
                <xsl:if test="//TEI.2/teiHeader/fileDesc/titleStmt/author or /TEI.2/teiHeader/fileDesc/titleStmt/editor">
                    <p>
                        <xsl:text>(</xsl:text>
                        <xsl:apply-templates select="//TEI.2/teiHeader/fileDesc/titleStmt/*[self::author|self::editor]" mode="pagehead"/>
                        <xsl:text>)</xsl:text>
                    </p>
                </xsl:if>
                <!-- END test for author or editor. -->
            </div>
        </div>

        <!-- START test for author, editor or respstmt. -->
        <!-- OPTIONAL: replace above author/editor model with this code if needed -->
        <!--
            <p>      
            <xsl:if test="//TEI.2/teiHeader/fileDesc/titleStmt/author or /TEI.2/teiHeader/fileDesc/titleStmt/editor or /TEI.2/teiHeader/fileDesc/titleStmt/respStmt">
            <xsl:text>(</xsl:text>
            <xsl:apply-templates select="//TEI.2/teiHeader/fileDesc/titleStmt/*[self::author|self::editor|self::respStmt]" mode="pagehead" />
            <xsl:text>)</xsl:text>
            </xsl:if> 
            </p>
        -->
        <!-- END test for author, editor or respstmt. -->
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
                            <div class="t01">
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
                        <xsl:variable name="img-group-folder" select="//imagebase//image[@id=current()/@url]/parent::*/groupHead/groupFolder"/>
                        <xsl:variable name="img-subpath-full" select="'full/'"/>
                        <xsl:variable name="img-subpath-thumb" select="'thumb/'"/>
                        <!-- file info -->
                        <xsl:variable name="img-id" select="//imagebase//image[@id=current()/@url]/@id"/>
                        <xsl:variable name="img-ext" select="//imagebase//image[@id=current()/@url]/ext/@n"/>
                        <xsl:variable name="img-src" select="concat($img-id, '.', $img-ext)"/>
                        <xsl:variable name="img-thm-prefix" select="'thm_'"/>
                        <!-- other info -->
                        <xsl:variable name="img-caption" select="//imagebase//image[@id=current()/@url]/caption"/>
                        <xsl:variable name="img-desc" select="//imagebase//image[@id=current()/@url]/desc"/>
                        <xsl:variable name="img-width" select="//imagebase//image[@id=current()/@url]/width"/>
                        <xsl:variable name="img-height" select="//imagebase//image[@id=current()/@url]/height"/>

                        <h3>Promo Article</h3>
                        <!-- Target output -->
                        <dl>
                            <dt>
                                <img title="" alt="" width="150">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="$imgroot" />
                                        <xsl:value-of select="$pubimgswitch"/>
                                        <xsl:value-of select="$img-subpath-full"/>
img001.jpg</xsl:attribute>
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
        <xsl:if test="text/body/div/head or text/front/div/head or text/back/div/head">
            <xsl:if test="not($home)">
                <div class="toc">
                    <div class="t03">
                        <xsl:call-template name="ctpl_toc"/>
                    </div>
                </div>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template name="ctpl_toc2">
        <xsl:if test="text/body/div/head or text/front/div/head or text/back/div/head">
            <xsl:if test="not($home)">
                <div class="toc">
                    <div class="t02">
                        <xsl:call-template name="ctpl_toc"/>
                    </div>
                </div>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <!-- OPTIONS: As default, a TOC is only output if there are actually any divisional headings. Footnotes are not included in the TOC. -->
    <!-- If top and bottom TOC content need to differ change in the separate templates above.  -->

    <xsl:template name="ctpl_toc">
        <h3>Document Contents</h3>
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
    </xsl:template>



    <xsl:template name="ctpl_footnotes">
        <xsl:if test="//TEI.2//note">
            <div class="footnotes">
                <h3>Footnotes</h3>
                <!-- START model for each footnote -->
                <xsl:for-each select="//note">
                    <!-- Variables -->
                    <xsl:variable name="fnnum">
                        <xsl:number level="any"/>
                    </xsl:variable>
                    <xsl:variable name="fnnumfull">
                        <xsl:number level="any" format="01"/>
                    </xsl:variable>
                    <!-- Output -->
                    <dl>
                        <dt id="fn{$fnnumfull}">
                            <xsl:value-of select="$fnnum"/>
.</dt>
                        <dd>
                            <xsl:apply-templates/>
                            <xsl:text></xsl:text>
                            <a href="#fnLink{$fnnumfull}" class="back">Back to context...</a>
                        </dd>
                    </dl>
                </xsl:for-each>
                <!-- END model for each footnote -->
            </div>
        </xsl:if>
    </xsl:template>



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
