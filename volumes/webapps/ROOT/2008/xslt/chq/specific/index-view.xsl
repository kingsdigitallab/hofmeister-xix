<?xml version="1.0" ?>
<!--
    XSLT for the templates called in aggregation.xsl.
    SVN: $Id: index-view.xsl 232 2007-03-02 16:25:20Z zau $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1" xmlns:dir="http://apache.org/cocoon/directory/2.0"
    exclude-result-prefixes="dir">

    <xsl:template name="view-indices">
        <!-- List of files processed -->
        <h2>Files processed</h2>

        <table class="list">
            <xsl:choose>
                <xsl:when test="$view='summary' and $group='monatshefte'">
                    <xsl:for-each select=".//dir:file">
                        <xsl:if test="position() mod 9 = 1">
                            <tr>
                                <td class="list">
                                    <a href="#{substring(dir:xpath/text()[1], 1, 12)}">
                                        <xsl:value-of select="substring(dir:xpath/text()[1], 1, 12)"/>
                                    </a>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[1]">
                                        <a href="#{substring(following::dir:xpath[1]/text()[1], 1, 12)}">
                                            <xsl:value-of select="substring(following::dir:xpath[1]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[2]">
                                        <a href="#{substring(following::dir:xpath[2]/text()[1], 1, 12)}">
                                            <xsl:value-of select="substring(following::dir:xpath[2]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[3]">
                                        <a href="#{substring(following::dir:xpath[3]/text()[1], 1, 12)}">
                                            <xsl:value-of select="substring(following::dir:xpath[3]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[4]">
                                        <a href="#{substring(following::dir:xpath[4]/text()[1], 1, 12)}">
                                            <xsl:value-of select="substring(following::dir:xpath[4]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[5]">
                                        <a href="#{substring(following::dir:xpath[5]/text()[1], 1, 12)}">
                                            <xsl:value-of select="substring(following::dir:xpath[5]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[6]">
                                        <a href="#{substring(following::dir:xpath[6]/text()[1], 1, 12)}">
                                            <xsl:value-of select="substring(following::dir:xpath[6]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[7]">
                                        <a href="#{substring(following::dir:xpath[7]/text()[1], 1, 12)}">
                                            <xsl:value-of select="substring(following::dir:xpath[7]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[8]">
                                        <a href="#{substring(following::dir:xpath[8]/text()[1], 1, 12)}">
                                            <xsl:value-of select="substring(following::dir:xpath[8]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select=".//dir:file">
                        <xsl:if test="position() mod 9 = 1">
                            <tr>
                                <td class="list">
                                    <a href="{substring(dir:xpath/text()[1], 1, 12)}.html">
                                        <xsl:value-of select="substring(dir:xpath/text()[1], 1, 12)"/>
                                    </a>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[1]">
                                        <a href="{substring(following::dir:xpath[1]/text()[1], 1, 12)}.html">
                                            <xsl:value-of select="substring(following::dir:xpath[1]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[2]">
                                        <a href="{substring(following::dir:xpath[2]/text()[1], 1, 12)}.html">
                                            <xsl:value-of select="substring(following::dir:xpath[2]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[3]">
                                        <a href="{substring(following::dir:xpath[3]/text()[1], 1, 12)}.html">
                                            <xsl:value-of select="substring(following::dir:xpath[3]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[4]">
                                        <a href="{substring(following::dir:xpath[4]/text()[1], 1, 12)}.html">
                                            <xsl:value-of select="substring(following::dir:xpath[4]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[5]">
                                        <a href="{substring(following::dir:xpath[5]/text()[1], 1, 12)}.html">
                                            <xsl:value-of select="substring(following::dir:xpath[5]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[6]">
                                        <a href="{substring(following::dir:xpath[6]/text()[1], 1, 12)}.html">
                                            <xsl:value-of select="substring(following::dir:xpath[6]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[7]">
                                        <a href="{substring(following::dir:xpath[7]/text()[1], 1, 12)}.html">
                                            <xsl:value-of select="substring(following::dir:xpath[7]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                                <td class="list">
                                    <xsl:if test="following::dir:xpath[8]">
                                        <a href="{substring(following::dir:xpath[8]/text()[1], 1, 12)}.html">
                                            <xsl:value-of select="substring(following::dir:xpath[8]/text()[1], 1, 12)"/>
                                        </a>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </table>

        <xsl:if test="$view='summary' and $group='monatshefte'">

            <h2>Quick summary of publications</h2>

            <table width="100%" cellpadding="6" class="detail">
                <tr>
                    <th valign="top" class="main">autonum</th>
                    <th valign="top" class="main">@n</th>
                    <th valign="top" class="id">@id</th>
                    <th valign="top" class="main">&lt;titleStmt/title&gt; &amp; &lt;author&gt;</th>
                    <th valign="top" class="main">last &lt;change&gt;</th>
                </tr>

                <xsl:for-each select=".//dir:file[starts-with(@name, '1')]" mode="maintable">

                    <tr>
                        <td valign="top">
                            <a name="{substring(dir:xpath/text()[1], 1, 12)}"/>
                            <xsl:number format="01"/>
                        </td>
                        <td valign="top">
                            <xsl:value-of select="substring(dir:xpath/text()[1], 13)"/>
                            <xsl:if test="not(substring(dir:xpath/text()[1], 13))">
                                <br/>
                            </xsl:if>
                        </td>
                        <td valign="top">
                            <xsl:choose>
                                <xsl:when test="not(dir:xpath/text()[1])">
                                    <xsl:attribute name="class">warning</xsl:attribute>
                                    <span class="warning">MISSING</span>
                                </xsl:when>
                                <xsl:when test="not(string(dir:xpath/text()[1]))">
                                    <xsl:attribute name="class">warning</xsl:attribute>
                                    <span class="warning">
                                        <b>EMPTY VALUE</b>
                                    </span>
                                </xsl:when>
                                <xsl:when test="substring(dir:xpath/text()[1], 1, 12)=preceding::dir:xpath/text()[1]">
                                    <xsl:attribute name="class">warning</xsl:attribute>
                                    <span class="warning">
                                        <b>REPEATED VALUE</b>
                                    </span>:<br/>
                                    <xsl:apply-templates select="substring(dir:xpath/text()[1], 1, 12)"/>&#xa0; </xsl:when>
                                <!--                 <xsl:when test="not(starts-with(@id , 'g4_2_'))">
                                    <xsl:attribute name="class">warning</xsl:attribute>
                                    <xsl:apply-templates select="@id" />&#xa0; 
                                    </xsl:when>
                                    <xsl:when test="string-length (@id) != 10">
                                    <xsl:attribute name="class">warning</xsl:attribute>
                                    <xsl:apply-templates select="@id" />&#xa0; 
                                    </xsl:when>-->
                                <xsl:otherwise>
                                    <span class="keyid">
                                        <xsl:value-of select="substring(dir:xpath/text()[1], 1, 12)"/>
                                    </span>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td valign="top">
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="substring(dir:xpath/text()[1], 1, 12)"/>
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="normalize-space(.//teiHeader/fileDesc/titleStmt/title)"/>
                            </a>
                                <br/>
                                <xsl:apply-templates select=".//teiHeader/fileDesc/titleStmt/author"/>
                        </td>
                        <td valign="top">
                            <b>
                                <xsl:apply-templates select=".//teiHeader/revisionDesc/change[1]/date"/>
                            </b>
                            <br/>
                            <xsl:apply-templates select=".//teiHeader/revisionDesc/change[1]/respStmt/name"/>
                            <br/>
                        </td>
                    </tr>
                </xsl:for-each>

            </table>

            <br clear="all"/>


        </xsl:if>

    </xsl:template>
</xsl:stylesheet>
