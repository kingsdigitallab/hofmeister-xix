<?xml version="1.0" encoding="UTF-8"?>
<!--
    XSLT for the templates called in aggregation.xsl.
    SVN: $Id: views_com.xsl 232 2007-03-02 16:25:20Z zau $
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1" xmlns:dir="http://apache.org/cocoon/directory/2.0"
    exclude-result-prefixes="dir">

    <xsl:template name="option-views">
        <a href="../{TEI.2/@id}.html">Publication view</a>
        <br/>
        <xsl:if test="$view='list' or $view='table'">
            <a href="../summary/{TEI.2/@id}.html">teiHeader Info</a>
            <br/>
        </xsl:if>
        <xsl:if test="$view='list' or $view='summary'">
            <a href="../table/{TEI.2/@id}.html">Table view</a>
            <br/>
        </xsl:if>
        <xsl:if test="$view='summary' or $view='table'">
            <a href="../list/{TEI.2/@id}.html">List view</a>
            <br/>
        </xsl:if>
        <!--
            <form action="#">
            <fieldset>
            <select id="jumpMenu" name="jumpMenu" size="1" onchange="jumpMenu('parent',this,0)">
            <option value=""> Select a different view </option>
            <option value="../{TEI.2/@id}.html"> Publication view </option>
            <option value="../table/{TEI.2/@id}.html"> Table view </option>
            <option value="../summary/{TEI.2/@id}.html"> teiHeader info </option>
            </select>
            </fieldset>
            </form>
            
            <form name="toc1" id="toc1">
            <select name="toc1" onchange="MM_jumpMenu('parent',this,0)">
            <option value=""> Select a different view </option>
            <option value="../{@id}.html"> Publication view </option>
            <option value="../table/{@id}.html"> Table view </option>
            <option value="../summary/{@id}.html"> teiHeader info </option>
            </select>
            </form>-->
    </xsl:template>

    <xsl:template name="pvandnx">
        <!--
            <xsl:variable name="directory">
            <xsl:value-of select="$linkroot"/>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="$group"/>
            <xsl:text>/monatdir.xml</xsl:text>
            </xsl:variable>-->

        <xsl:choose>
            <xsl:when test="starts-with(//monatdir//dir:file[descendant::text()=current()/TEI.2/@id]/preceding::dir:file/@name, '1')">
                <td>
                    <a class="content"
                        href="hofm_{substring-before(//monatdir//dir:file[descendant::text()=current()/TEI.2/@id]/preceding::dir:file[1]/@name, '.xml')}.html"
                        > Previous </a>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td> </td>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="starts-with(//monatdir//dir:file[descendant::text()=current()/TEI.2/@id]/following::dir:file/@name, '1')">
                <td>
                    <a class="content"
                        href="hofm_{substring-before(//monatdir//dir:file[descendant::text()=current()/TEI.2/@id]/following::dir:file[1]/@name, '.xml')}.html"
                        > Next </a>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td> </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="view-meta">
        <tr>
            <td width="7%"> </td>
            <td width="7%"> </td>
            <!-- File @id -->
            <th class="id" width="16%">file @id: </th>
            <td width="20%" class="keyid">
                <b>
                    <xsl:value-of select="TEI.2/@id"/>
                </b>
            </td>
            <!-- Last updated -->
            <th class="tablenormal" width="16%">last updated: <br/>name: </th>
            <td width="20%">
                <xsl:apply-templates select=".//revisionDesc/change[1]/date"/>
                <br/>
                <xsl:apply-templates select=".//revisionDesc/change[1]/respStmt/name"/>
            </td>
            <td width="7%"> </td>
            <td width="7%"> </td>
        </tr>
        <!-- Page title -->
        <tr>
            <td> </td>
            <td> </td>
            <th class="tablenormal"> Main Title of Page </th>
            <td colspan="3">
                <xsl:apply-templates select=".//fileDesc/titleStmt/title" mode="main"/>
                <xsl:apply-templates select=".//fileDesc/titleStmt/author" mode="main"/>
            </td>
            <td> </td>
            <td> </td>
        </tr>
    </xsl:template>

    <xsl:template match="bibl">
        <xsl:choose>
            <xsl:when test="$view='list'">
                <xsl:call-template name="list-bawh"/>
            </xsl:when>
            <xsl:when test="$view='table'">
                <xsl:call-template name="table-bawh"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="album">
        <xsl:choose>
            <xsl:when test="$view='list'">
                <xsl:call-template name="list-bawh"/>
            </xsl:when>
            <xsl:when test="$view='table'">
                <xsl:call-template name="table-bawh"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="wip">
        <xsl:choose>
            <xsl:when test="$view='list'">
                <xsl:call-template name="list-bawh"/>
            </xsl:when>
            <xsl:when test="$view='table'">
                <xsl:call-template name="table-bawh"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="head">
        <xsl:choose>
            <xsl:when test="parent::div and $view='list'">
                <xsl:call-template name="list-bawh"/>
            </xsl:when>
            <xsl:when test="$view='list'"> </xsl:when>
            <xsl:when test="$view='table'">
                <xsl:call-template name="table-bawh"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="list-bawh">
        <xsl:if test="preceding-sibling::*[1][local-name()='biblGroup']">
            <tr>
                <td colspan="2">
                    <span class="biblgroup">
                        <xsl:text>end biblGroup</xsl:text>
                    </span>
                </td>
            </tr>
        </xsl:if>
        <tr>
            <td>
                <xsl:value-of select="local-name()"/>
                <br/>
                <xsl:value-of select="@id"/>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="local-name()='head'">
                        <strong>
                            <xsl:apply-templates/>
                        </strong>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
        <xsl:if test="following-sibling::*[1][local-name()='biblGroup']">
            <tr>
                <td colspan="2">
                    <span class="biblgroup">
                        <xsl:text>biblGroup</xsl:text>
                    </span>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>

    <xsl:template name="table-bawh">
        <tr>
            <td>
                <xsl:value-of select="local-name()"/>
                <br/>
                <xsl:value-of select="@id"/>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="local-name()='head'">
                        <strong>
                            <xsl:apply-templates/>
                        </strong>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="composer|author|artist">
        <span class="composer">
            <xsl:apply-templates/>
        </span>
        <xsl:if test="$view='table'">
            <br/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="opus">
        <span class="opus">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="key">
        <span class="key">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="title">
        <span class="title">
            <xsl:apply-templates/>
        </span>
        <xsl:if test="$view='table'">
            <br/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="pubPlace">
        <span class="pubplace">
            <xsl:apply-templates/>
        </span>
        <xsl:if test="$view='table'">
            <br/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="publisher">
        <span class="publisher">
            <xsl:apply-templates/>
        </span>
        <xsl:if test="$view='table'">
            <br/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="price">
        <span class="price">
            <xsl:apply-templates/>
        </span>
        <xsl:if test="$view='table'">
            <br/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="edition|format">
        <span class="edition">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="pb">
        <xsl:choose>
            <xsl:when test="$view='list'">
                <xsl:if test="preceding-sibling::*[1][local-name()='biblGroup']">
                    <tr>
                        <td colspan="2">
                            <span class="biblgroup">
                                <xsl:text>end biblGroup</xsl:text>
                            </span>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$view='table'">
                <xsl:if test="preceding-sibling::*[1][local-name()='biblGroup']">
                    <tr>
                        <td colspan="5">
                            <span class="biblgroup">
                                <xsl:text>end biblGroup</xsl:text>
                            </span>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="ancestor::bibl">
                <span class="warning2">
                    <xsl:value-of select="@n"/>
                </span>
            </xsl:when>
            <xsl:when test="ancestor::album">
                <span class="warning2">
                    <xsl:value-of select="@n"/>
                </span>
            </xsl:when>
            <xsl:when test="ancestor::wip">
                <span class="warning2">
                    <xsl:value-of select="@n"/>
                </span>
            </xsl:when>
            <xsl:when test="ancestor::head">
                <span class="warning2">
                    <xsl:value-of select="@n"/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <tr>
                    <td colspan="2">
                        <span class="warning2">
                            <xsl:value-of select="@n"/>
                        </span>
                    </td>
                </tr>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="$view='list'">
                <xsl:if test="following-sibling::*[1][local-name()='biblGroup']">
                    <tr>
                        <td colspan="2">
                            <span class="biblgroup">
                                <xsl:text>biblGroup</xsl:text>
                            </span>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$view='table'">
                <xsl:if test="following-sibling::*[1][local-name()='biblGroup']">
                    <tr>
                        <td colspan="5">
                            <span class="biblgroup">
                                <xsl:text>biblGroup</xsl:text>
                            </span>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template
        match="abbr|add|address|anchor|biblScope|code|corr|del|emph|extent|foreign|formula|gap|gi|gloss|hi|ident|idno|imprint|index|interp|interpGrp|kw|mentioned|milestone|note|num|orig|ptr|pubInfo|quoted|ref|reg|remark|respStmt|rs|s|seg|soCalled|term|time|xptr">
        <xsl:if test="ancestor::bibl | ancestor::album | ancestor::wip">
            <span class="warning">
                <xsl:text>&lt;</xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&gt;</xsl:text>
            </span>
            <xsl:apply-templates/>
            <span class="warning">
                <xsl:text>&lt;/</xsl:text>
                <xsl:value-of select="local-name()"/>
                <xsl:text>&gt;</xsl:text>
            </span>
        </xsl:if>
    </xsl:template>

    <xsl:template match="lb">
        <br/>
    </xsl:template>

    <xsl:template match="hi">
        <xsl:choose>
            <!-- ITALICS -->
            <xsl:when test="@rend='italic'">
                <i>
                    <xsl:apply-templates/>
                </i>
            </xsl:when>
            <!-- BOLD -->
            <xsl:when test="@rend='bold'">
                <b>
                    <xsl:apply-templates/>
                </b>
            </xsl:when>
            <!-- BOLD AND ITALICS -->
            <xsl:when test="@rend='bolditalic'">
                <b>
                    <i>
                        <xsl:apply-templates/>
                    </i>
                </b>
            </xsl:when>
            <!-- SUPERSCRIPT -->
            <xsl:when test="@rend='sup'">
                <sup>
                    <xsl:apply-templates/>
                </sup>
            </xsl:when>
            <!-- CURRENT DEFAULT: italics -->
            <xsl:otherwise>
                <i>
                    <xsl:apply-templates/>
                </i>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Summary view -->
    <xsl:template match="language">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="change">
        <tr>
            <td>
                <xsl:apply-templates select="date"/>
            </td>
            <td>
                <xsl:apply-templates select="respStmt/name"/>
            </td>
            <td>
                <xsl:value-of select="item"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
