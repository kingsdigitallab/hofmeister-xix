<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
    version="1.1">
    <!-- ============================================================= -->
    <!--  MODULE:           proj_type01_stdext.xsl                                                                         -->
    <!--  VERSION DATE:     1.0                                                                                                      -->
    <!--  VERSION:          $Id: proj_type01_stdext.xsl 685 2007-04-30 11:14:48Z zau $      -->
    <!--  VERSION CONTROL:                                                                                                       -->
    <!-- ============================================================= -->
    <!-- ============================================================= -->
    <!-- ORIGINAL CREATION DATE:    2006-08-11                                                                  -->
    <!-- PURPOSE:   Special templates extensions for type01 transformations                 -->
    <!-- CREATED FOR:  CCH  www.kcl.ac.uk/cch                                                                    -->
    <!-- CREATED BY:   ZA                                                                                                              -->
    <!-- COPYRIGHT:   CCH/ZA                                                                                                      -->
    <!-- ============================================================= -->


    <!--  KEYS   -->

    <xsl:key name="alphagloss" match="term" use="translate(substring(., 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>


    <!-- GLOSSARY  -->
    <xsl:template name="ctpl_glossary">
        <!--  A-Z submenu Call Template  -->
        <xsl:for-each select="document('../../xml/glossary/glossary.xml')">
            <div class="alphaNav">
                <div class="t01">
                    <ul>
                        <xsl:call-template name="azgloss"/>
                    </ul>
                </div>
            </div>
        </xsl:for-each>

        <!--  Glossary  -->
        <xsl:for-each select="document('../../xml/glossary/glossary.xml')//*/list[@type='gloss']/item">
            <xsl:sort select="label/term"/>
            <div class="resourceList">
                <div class="t02">
                    <dl>
                        <dt>
                            <xsl:attribute name="class">
                                <xsl:text>r</xsl:text>
                                <xsl:number value="position()" format="01"/>
                                <xsl:call-template name="oddeven"/>
                            </xsl:attribute>
                            <a class="content" name="{label/term/@id}">
                                <xsl:attribute name="id">
                                    <xsl:value-of
                                        select="translate(substring(label/term, 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
                                </xsl:attribute>
                            </a>
                            <xsl:apply-templates select="label/term"/>
                        </dt>
                        <dd>
                            <xsl:attribute name="class">
                                <xsl:text>r</xsl:text>
                                <xsl:number value="position()" format="01"/>
                                <xsl:call-template name="oddeven"/>
                                <xsl:text> c01</xsl:text>
                            </xsl:attribute>
                            <xsl:apply-templates select="gloss"/>
                        </dd>
                    </dl>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

    <!--  A-Z submenu Creation  -->
    <xsl:template name="azgloss">
        <xsl:param name="alphabet" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
        <xsl:variable name="letter" select="substring($alphabet, 1, 1)"/>
        <xsl:variable name="remainder" select="substring($alphabet, 2)"/>
        <xsl:variable name="azentry" select="key('alphagloss', $letter)"/>

        <xsl:choose>
            <xsl:when test="$azentry">
                <li>
                    <a class="content" href="#{$letter}">
                        <xsl:value-of select="$letter"/>
                    </a>
                </li>
            </xsl:when>
            <xsl:otherwise>
                <li>
                    <xsl:value-of select="$letter"/>
                </li>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:if test="$remainder">
            <xsl:call-template name="azgloss">
                <xsl:with-param name="alphabet" select="$remainder"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!--  SITE MAP -->
    <xsl:template name="ctpl_sitemap">
        <div class="sitemap">
            <div class="t01">
                <ul>
                    <!-- START main sitemap items -->
                    <!--  START level 1 navigation  -->
                    <xsl:for-each select="//navbar//level01[not(default/@ref='sitemap')]">
                        <!--  level01 labels  -->
                        <li>
                            <xsl:call-template name="sitemap_item"/>

                            <!--  START level 2 navigation  -->
                            <xsl:if test="sub02/level02">
                                <ul>
                                    <xsl:for-each select="sub02/level02[not(default/@ref='sitemap')]">
                                        <li>
                                            <xsl:call-template name="sitemap_item"/>

                                            <!--  START level 3 navigation  -->
                                            <xsl:if test="sub03/level03[not(default/@ref='sitemap')]">
                                                <ul>
                                                    <xsl:for-each select="sub03/level03">
                                                        <li>
                                                            <xsl:call-template name="sitemap_item"/>

                                                            <!--  START level 4 navigation  -->

                                                            <xsl:if test="sub04/level04[not(default/@ref='sitemap')]">
                                                                <ul>
                                                                    <xsl:for-each select="sub04/level04">
                                                                        <li>
                                                                           <xsl:call-template name="sitemap_item"/>
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
                <!--  END level 1 navigation  -->
            </div>
        </div>
        <!--END-->
    </xsl:template>

    <xsl:template name="sitemap_item">
        <!-- Sets up context //Gets @ref from 'AL_navbar.xml'  -->
        <xsl:variable name="nav_default_id" select="default/@ref"/>

        <!-- Outputs filePath for a given navbar item //  -->
        <xsl:variable name="nav_default_path" select="//filebase//group[item[@id=$nav_default_id]]/groupHead/groupFolder"/>

        <!-- Outputs fileName for a given navbar item // Then matches that with fileBase to get fileName // Then adds '.html' -->
        <xsl:variable name="nav_default_name" select="//filebase//item[@id=$nav_default_id]/fileName"/>
        <xsl:variable name="nav_default_fullname" select="concat($nav_default_name, '.html')"/>

        <!-- Outputs filePath plus fileName -->
        <xsl:variable name="nav_default" select="concat($linkroot, $nav_default_path, '/', $nav_default_fullname)"/>

        <!-- Outputs text for each nav item // Option 1 takes it from 'AL_fileBase.xml' // Option 2 takes it from 'AL_navbar.xml' -->
        <xsl:variable name="nav_fileTitle" select="//filebase//item[@id=$nav_default_id]/fileTitle"/>
        <xsl:variable name="nav_label" select="label"/>

        <a>
            <xsl:attribute name="href">
                <!-- Check for external links -->
                <xsl:choose>
                    <xsl:when test="default/@type='external'">
                        <xsl:value-of select="default/@ref"/>
                    </xsl:when>
                    <!-- Otherwise, look in fileBase for a fileTitle -->
                    <xsl:otherwise>
                        <xsl:value-of select="$nav_default"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>

            <!-- If 'AL_navbar.xml' entry does not have a 'label' element or it is empty, look in fileBase for a fileTitle  -->
            <xsl:choose>
                <xsl:when test="not(string(label))">
                    <xsl:value-of select="$nav_fileTitle"/>
                </xsl:when>
                <!-- Otherwise, use 'label' in 'AL_navbar.xml' -->
                <xsl:otherwise>
                    <xsl:value-of select="$nav_label"/>
                </xsl:otherwise>
            </xsl:choose>
        </a>
    </xsl:template>


    <!-- ODD and EVEN SHADING -->
    <xsl:template name="oddeven">
        <xsl:choose>
            <xsl:when test="position() mod 2 = 0">
                <xsl:text> z02</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text> z01</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
