<?xml version="1.0"?>
<!--
    Other calls made from proj_tpl
    SVN: $Id: proj_key.xsl 1041 2018-05-23 11:16:54Z jvieira $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:date="http://exslt.org/dates-and-times"
    extension-element-prefixes="date" version="1.1">

    <!-- Template matches to exclude aggregated files -->
    <xsl:template match="filenav" />
    <xsl:template match="alist-index" />
    <xsl:template match="xml-decade" />


    <!-- HTML TITLE -->
    <xsl:template name="ctpl_htmltitle">
        <!-- TWO OPTIONS at present -->

        <!-- Current option: option 1 -->
        <xsl:variable name="htmltitle"
            select="//TEI.2/teiHeader/fileDesc/titleStmt/title[1]" />

        <!-- Option 1: always use the FIRST title element in the TEI header -->

        <!--            <xsl:variable name="htmltitle" select="/TEI.2/teiHeader/fileDesc/titleStmt/title[1]"
        />-->


        <!-- Option 2: Concatenates whatfoo is /head tag of the group/text with what is in the TEI
        header. For genweb (now type04) docs,  the TEI 
            header MUST be empty. For all others, there won't be a group/text combination, so it will only pick
        up on what is in the teiHeader//title. -->
        <!--
            <xsl:variable name="htmltitle-1" select="/TEI.2/teiHeader/fileDesc/titleStmt/title[1]" />
            <xsl:variable name="htmltitle-2" select="body/head" />
            <xsl:variable name="htmltitle" select="concat($htmltitle-1, $htmltitle-2)" />
         -->
        <meta http-equiv="content-type"
            content="text/html; charset=utf-8" />
        <meta http-equiv="imagetoolbar" content="no" />
        <meta
            name="abstract" content="" />
        <meta name="author" content="" />
        <meta name="copyright"
            content="Copyright (c) 2006" />
        <meta name="date" content="2005-11-26" />
        <meta
            name="description" content="" />
        <meta name="keywords" content="" />
        <meta name="robots"
            content="index,follow,archive" />
        <meta name="generator" content="xMod 1.3" />


        <title>
            <xsl:text>Hofmeister XIX</xsl:text>
            <xsl:if test="//TEI.2/teiHeader/fileDesc/titleStmt/title">
                <xsl:text>: </xsl:text>
                <xsl:value-of select="$htmltitle" />
            </xsl:if>
        </title>

        <link
            rel="shortcut icon" href="{$scriptpers}/i/customicon.ico" />

        <!-- CSS calls -->
        <link rel="stylesheet"
            type="text/css" media="screen, projection"
            href="{$scriptswitch}/c/default.css" />
        <link rel="stylesheet" type="text/css"
            media="print" href="{$scriptpers}/c/print.css" />
        <link rel="stylesheet" type="text/css"
            media="screen, projection"
            href="{$scriptpers}/c/personality.css" />
        <xsl:if test="$view = 'map'">
            <link rel="stylesheet" type="text/css" media="screen, projection"
                href="/2008/Assets/leaflet/leaflet.css" />
            <link rel="stylesheet" type="text/css"
                media="screen, projection"
                href="/2008/Assets/leaflet/markercluster/MarkerCluster.css" />
            <link rel="stylesheet"
                type="text/css" media="screen, projection"
                href="/2008/Assets/leaflet/markercluster/MarkerCluster.Default.css" />
        </xsl:if>

        <script
            src="{$scriptswitch}/s/corelib.js" type="text/javascript">
            &amp;#160;</script>
        <script src="{$scriptpers}/s/config.js" type="text/javascript">
        &amp;#160;</script>
        <script src="{$scriptpers}/s/default.js" type="text/javascript">
        &amp;#160;</script>
        <script src="{$scriptpers}/s/init.js" type="text/javascript">
            &amp;#160;</script>

        <xsl:if test="$view = 'map'">
            <script src="/2008/Assets/leaflet/leaflet.js" type="text/javascript">
                &amp;#160;</script>
            <script
                src="/2008/Assets/leaflet/markercluster/leaflet.markercluster.js"
                type="text/javascript">
                &amp;#160;</script>
        </xsl:if>
    </xsl:template>

    <!-- BANNER TEMPLATE -->
    <xsl:template name="ctpl_banner">
        <div id="banner">
            <div class="utilLinks">
                <div class="s01">
                    <xsl:text>&#xA;</xsl:text>
                </div>
            </div>
            <div id="decalRight">
                <span class="printOnly">Right Hand Decal</span>
            </div>
            <div id="decalLeft">
                <span class="printOnly">Left Hand Decal</span>
            </div>
        </div>
    </xsl:template>


    <!-- BREADCRUMBS TEMPLATE -->
    <xsl:template name="ctpl_bread">
        <div class="s01">
            <ul>
                <li>
                    <span class="s01">You are here:</span>
                </li>
                <xsl:choose>
                    <xsl:when test="//navbar//default[@ref = $global-tei-id]">
                        <xsl:for-each select="//navbar//default[@ref = $global-tei-id]">
                            <xsl:for-each
                                select="ancestor::*[not(default[@ref = $global-tei-id])][label]">
                                <xsl:call-template name="bread-links">
                                    <xsl:with-param name="nav_default_id" select="default/@ref" />
                                </xsl:call-template>
                            </xsl:for-each>
                            <li>
                                <span class="s02">
                                    <xsl:value-of select="preceding-sibling::label[1]" />
                                </span>
                            </li>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each
                            select="//navbar//file[starts-with($global-tei-id, @start) and string(@start)]">
                            <xsl:for-each
                                select="ancestor::*[starts-with(local-name(), 'level')][.//file[@ref = $global-tei-id or starts-with($global-tei-id, @start) and string(@start)]]">
                                <xsl:call-template name="bread-links">
                                    <xsl:with-param name="nav_default_id" select="default/@ref" />
                                </xsl:call-template>
                            </xsl:for-each>
                            <xsl:if
                                test="string-length($bread-search) > 7">
                                <li>
                                    <a href="{$bread-search-link}" title="{$bread-search}">
                                        <span>
                                            <xsl:value-of select="$bread-search" />
                                        </span>
                                    </a>
                                </li>
                            </xsl:if>
                            <xsl:if
                                test="starts-with($global-tei-id, 'hofm_')">
                                <xsl:call-template name="bread-links">
                                    <xsl:with-param name="nav_default_id" select="'p2_1'" />
                                    <xsl:with-param name="bc-lab" select="'on'" />
                                </xsl:call-template>
                            </xsl:if>
                            <li>
                                <span class="s02">
                                    <xsl:value-of select="$bread-title" />
                                </span>
                            </li>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
            </ul>
            <!--            <xsl:call-template name="utilLinks"/>-->
            <!-- 
            <div class="utilLinks">
                <a href="">
                    <span>Print this page</span>
                </a>
                -->
            <!--Start
            form code -->
            <!--        Form can also be placed here. Copy from above.   -->
            <!-- End form code -->
            <!--            </div>-->
        </div>
        <div
            class="utilLinks">
            <div class="t01">
                <a class="extNew" href="http://www2.onb.ac.at/sammlungen/musik/hofmeister1.htm"
                    target="_blank">
                    <span> Österreichische Nationalbibliothek</span>
                </a>
            </div>
        </div>
    </xsl:template>


    <xsl:template name="bread-links">
        <xsl:param name="bc-lab" />

        <!-- Sets up context //Gets @ref from 'AL_navbar.xml'  -->
        <xsl:param name="nav_default_id" />

        <!-- Outputs filePath for a given navbar item //  -->
        <xsl:variable
            name="nav_default_path"
            select="//filebase//group[item[@id = $nav_default_id]]/groupHead/groupFolder" />

        <!-- Outputs fileName for a given navbar item // Then matches that with fileBase to get
        fileName // Then adds '.html' -->
        <xsl:variable
            name="nav_default_name"
            select="//filebase//item[@id = $nav_default_id]/fileName" />
        <xsl:variable
            name="nav_default_fullname" select="concat($nav_default_name, '.html')" />

        <!-- Outputs filePath plus fileName -->
        <xsl:variable
            name="nav_default"
            select="concat($linkroot, '/', $nav_default_path, $nav_default_fullname)" />

        <xsl:variable
            name="bc-label">
            <xsl:choose>
                <xsl:when test="$bc-lab = 'on'">
                    <xsl:value-of select="//navbar//body//level02[default[@ref = 'p2_1']]/label" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="label" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <li>
            <a href="{$nav_default}" title="{$bc-label}">
                <span>
                    <xsl:value-of select="$bc-label" />
                </span>
            </a>
        </li>
    </xsl:template>


    <!-- NAVIGATION TEMPLATE - NAVBAR -->
    <xsl:template name="ctpl_nav">
        <!-- Sets up context //Gets @ref from 'AL_navbar.xml'  -->
        <xsl:variable name="context_id">
            <xsl:value-of select="$global-tei-id" />
        </xsl:variable>

        <!-- START main navbar items -->
        <!--  START level 1 navigation  -->
        <xsl:for-each
            select="//navbar//body/layout/*">

            <xsl:choose>
                <!-- navbar heading -->
                <xsl:when test="self::heading">
                    <h3>
                        <span>
                            <xsl:value-of select="." />
                        </span>
                    </h3>
                </xsl:when>

                <!--  linebreaks  -->
                <xsl:when test="self::line">
                    <!-- spacer with dividing line -->
                    <!-- Need to add new code here -->
                </xsl:when>

                <!--  breaks  -->
                <xsl:when test="self::break">
                    <!-- spacer with height determined by XML -->
                    <!-- Need to add new code here -->
                    <!-- END spacer -->
                </xsl:when>

                <!--  START LEVEL 01 LABELS -->
                <xsl:otherwise>
                    <!--  START level 1 navigation  -->
                    <ul class="pn1">
                        <xsl:for-each select="level01">
                            <li>
                                <xsl:call-template name="nav-item" />

                                <!--  START level 2 navigation  -->
                                <xsl:if
                                    test=".//file[@ref = $context_id or starts-with($context_id, @start) and string(@start)]">
                                    <xsl:text>&#xA;</xsl:text>
                                    <ul class="pn2">
                                        <xsl:for-each select="sub02/level02">
                                            <li>
                                                <xsl:call-template name="nav-item" />

                                                <!--  START level 3 navigation  -->
                                                <xsl:if
                                                    test=".//file[@ref = $context_id or starts-with($context_id, @start) and string(@start)]">
                                                    <xsl:text>&#xA;</xsl:text>
                                                  <ul class="pn3">
                                                        <xsl:for-each select="sub03/level03">
                                                            <li>
                                                                <xsl:call-template name="nav-item" />

                                                                <!--  START level 4 navigation  -->
                                                                <xsl:if
                                                                    test=".//file[@ref = $context_id or starts-with($context_id, @start) and string(@start)]">
                                                                    <xsl:text>&#xA;</xsl:text>
                                                  <ul
                                                                        class="pn4">
                                                                        <xsl:for-each
                                                                            select="sub04/level04">
                                                                            <li>
                                                                                <xsl:call-template
                                                                                    name="nav-item" />
                                                                            </li>
                                                                        </xsl:for-each>
                                                                    </ul>
                                                                </xsl:if>
                                                                <!--  END level 4 navigation  -->
                                                            </li>
                                                        </xsl:for-each>
                                                    </ul>
                                                </xsl:if>
                                                <!--  END level 3 navigation  -->
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </xsl:if>
                                <!--  END level 2 navigation  -->
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <!--  END level 1 navigation  -->
    </xsl:template>

    <xsl:template name="nav-item">
        <!-- Sets up context //Gets @ref from 'AL_navbar.xml'  -->
        <xsl:variable name="nav_default_id" select="default/@ref" />

        <!-- Outputs filePath for a given navbar item //  -->
        <xsl:variable
            name="nav_default_path"
            select="//filebase//group[item[@id = $nav_default_id]]/groupHead/groupFolder" />

        <!-- Outputs fileName for a given navbar item // Then matches that with fileBase to get
        fileName // Then adds '.html' -->
        <xsl:variable
            name="nav_default_name"
            select="//filebase//item[@id = $nav_default_id]/fileName" />
        <xsl:variable
            name="nav_default_fullname" select="concat($nav_default_name, '.html')" />

        <!-- Outputs filePath plus fileName -->
        <xsl:variable
            name="nav_default"
            select="concat($linkroot, '/', $nav_default_path, $nav_default_fullname)" />

        <!-- Outputs text for each nav item // Option 1 takes it from 'AL_fileBase.xml' // Option 2
        takes it from 'AL_navbar.xml' -->
        <xsl:variable
            name="nav_fileTitle"
            select="//filebase//item[@id = $nav_default_id]/fileTitle" />
        <xsl:variable
            name="nav_label" select="label" />

        <xsl:if
            test="starts-with($nav_default_id, 'p2') or starts-with($nav_default_id, 'index')">
            <xsl:attribute name="class">
                <xsl:text>x01</xsl:text>
            </xsl:attribute>
        </xsl:if>

        <a>
            <!-- Active page Class -->
            <xsl:if
                test="descendant::*[@ref = $global-tei-id] or .//file[starts-with($global-tei-id, @start) and string(@start)]">
                <xsl:attribute name="class">
                    <xsl:text>s03</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="href">
                <!-- Check for external links -->
                <xsl:choose>
                    <xsl:when test="default/@type = 'external'">
                        <xsl:value-of select="default/@ref" />
                    </xsl:when>
                    <!-- Otherwise, look in fileBase for a fileTitle -->
                    <xsl:otherwise>
                        <xsl:value-of select="$nav_default" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>

            <!-- If 'AL_navbar.xml' entry does not have a 'label' element or it is empty, look in
            fileBase for a fileTitle  -->
            <xsl:choose>
                <xsl:when test="not(string(label))">
                    <span>
                        <xsl:value-of select="$nav_fileTitle" />
                    </span>
                </xsl:when>
                <!-- Otherwise, use 'label' in 'AL_navbar.xml' -->
                <xsl:otherwise>
                    <span>
                        <xsl:value-of select="$nav_label" />
                    </span>
                </xsl:otherwise>
            </xsl:choose>
        </a>
    </xsl:template>


    <xsl:template name="ctpl_footer">
        <div id="footer">
            <div class="utilLinks">
                <div class="s01">
                    <ul>
                        <xsl:if test="//teiHeader/revisionDesc/change[1]/date">
                            <li>Last Updated: <!-- Add last update
                                code here-->
                                <xsl:text>2008-09-22</xsl:text>
                                <!--<xsl:value-of
                                select="//teiHeader/revisionDesc/change[1]/date"/>-->
                                <!--<xsl:variable
                                name="date" select="string(date:date())"/>
                            <xsl:value-of select="string(date:day-name())"/>
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="string(date:month-name())"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="substring($date, 9, 2)"/>
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="substring($date, 1, 4)"/>-->
                            </li>
                        </xsl:if>
                        <li>Resp: <a href="http://www.kcl.ac.uk/cch">CCH</a>
                        </li>
                        <li class="s01">Powered by <a href="http://www.kcl.ac.uk/cch/xmod/"
                                title="link to the xMod home page">
                                <span>xMod 1.3</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="s02"> &#xa9;<strong>2007</strong> Royal Holloway, University of London <a
                        class="cc" href="{$context-path}/content/about/copyright.html"
                        title="Creative Commons License">
                        <b>Copyright and License Information</b>
                    </a> | ISBN:
        978-1-912466-30-6 </div>
            </div>
        </div>
    </xsl:template>


    <!-- # -->

</xsl:stylesheet>
<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->