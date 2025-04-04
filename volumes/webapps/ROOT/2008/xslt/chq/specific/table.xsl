<?xml version="1.0" encoding="UTF-8"?>
<!--
    XSLT for the templates called in aggregation.xsl.
    SVN: $Id: table.xsl 232 2007-03-02 16:25:20Z zau $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">

    <xsl:template name="type02-table">
        <table width="100%" border="1" cellspacing="3" cellpadding="6">
            <!-- Navigational information -->
            <tr>
                <xsl:call-template name="pvandnx"/>
                <td colspan="4"> </td>
                <td align="center" colspan="2">
                    <xsl:call-template name="option-views"/>
                </td>
            </tr>

            <!-- Meta information -->
            <xsl:call-template name="view-meta"/>

            <tr>
                <td class="table3" colspan="8">
                    <table width="100%" border="1">
                        <tr>
                            <td width="7%">
                                <b> Element <br/>
                                    <span class="keyid">@id</span>
                                </b>
                            </td>
                            <td width="12%">
                                <b>
                                    <span class="composer">
                                        <xsl:text>composer </xsl:text>
                                    </span>
                                </b>
                            </td>
                            <td width="10%">
                                <b>
                                    <span class="composer">
                                        <xsl:text>author </xsl:text>
                                    </span>
                                </b>
                            </td>
                            <td>
                                <b>
                                    <span class="title">
                                        <xsl:text>title </xsl:text>
                                    </span>
                                </b>
                            </td>
                            <td width="8%">
                                <b>
                                    <span class="pubplace">
                                        <xsl:text>pubplace </xsl:text>
                                    </span>
                                </b>
                            </td>
                            <td width="10%">
                                <b>
                                    <span class="publisher">
                                        <xsl:text>publisher </xsl:text>
                                    </span>
                                </b>
                            </td>
                            <!--
                                <td width="10%">
                                <b>
                                <span class="price">
                                <xsl:text>price </xsl:text>
                                </span>
                                </b>
                                </td>
                            -->
                        </tr>
                        <xsl:for-each select=".//bibl|//wip|//album|//head[parent::div]">
                            <xsl:if test="preceding-sibling::*[1][local-name()='biblGroup']">
                                <tr>
                                    <td colspan="5">
                                        <span class="biblgroup">
                                            <xsl:text>end biblGroup</xsl:text>
                                        </span>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="local-name()='head'">
                                    <tr>
                                        <td valign="top">
                                            <xsl:text>head </xsl:text>
                                        </td>
                                        <td colspan="5">
                                            <b>
                                                <xsl:apply-templates/>
                                            </b>
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr>
                                        <td valign="top">
                                            <xsl:value-of select="local-name()"/>
                                            <br/>
                                            <span class="keyid">
                                                <xsl:value-of select="@id"/>
                                            </span>
                                        </td>
                                        <td valign="top">
                                            <xsl:choose>
                                                <xsl:when test="not(string(.//composer))">
                                                    <span class="warning"> No Composer </span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <span class="composer">
                                                        <xsl:apply-templates select=".//composer"/>
                                                    </span>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td valign="top">
                                            <xsl:choose>
                                                <xsl:when test="not(string(.//author))"> </xsl:when>
                                                <xsl:otherwise>
                                                    <span class="composer">
                                                        <xsl:apply-templates select=".//author"/>
                                                    </span>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td valign="top">
                                            <xsl:choose>
                                                <xsl:when test="not(string(.//title))">
                                                    <span class="warning"> No Title </span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <span class="title">
                                                        <xsl:apply-templates select=".//title"/>
                                                    </span>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td valign="top">
                                            <xsl:choose>
                                                <xsl:when test="not(string(.//pubPlace))"> </xsl:when>
                                                <xsl:otherwise>
                                                    <span class="pubplace">
                                                        <xsl:apply-templates select=".//pubPlace"/>
                                                    </span>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td valign="top">
                                            <xsl:choose>
                                                <xsl:when test="not(string(.//publisher))"> </xsl:when>
                                                <xsl:otherwise>
                                                    <span class="publisher">
                                                        <xsl:apply-templates select=".//publisher"/>
                                                    </span>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <!--
                                            <td valign="top">
                                            <xsl:choose>
                                            <xsl:when test="not(string(.//price))">
                                            &#xa0;
                                            </xsl:when>
                                            <xsl:otherwise>
                                            <span class="price">
                                            <xsl:apply-templates select=".//price" />
                                            </span>
                                            </xsl:otherwise>
                                            </xsl:choose>
                                            </td>
                                        -->
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="following-sibling::*[1][local-name()='biblGroup']">
                                <tr>
                                    <td colspan="5">
                                        <span class="biblgroup">
                                            <xsl:text>biblGroup</xsl:text>
                                        </span>
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:for-each>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <xsl:call-template name="option-views"/>
                </td>
                <td colspan="4"> </td>

                <xsl:call-template name="pvandnx"/>

            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>
