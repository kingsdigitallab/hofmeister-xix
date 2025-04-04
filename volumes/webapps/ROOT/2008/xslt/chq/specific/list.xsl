<?xml version="1.0" encoding="UTF-8"?>
<!--
    XSLT for the templates called in aggregation.xsl.
    SVN: $Id: list.xsl 232 2007-03-02 16:25:20Z zau $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
    <xsl:template name="type02-list">
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

            <!-- Colour code for the table -->
            <tr>
                <td class="table3" colspan="8">
                    <table width="100%" border="1">
                        <tr>
                            <th class="tablenormal" width="10%"> Colour code: </th>
                            <td>
                                <span class="warning2">
                                    <xsl:text>Page break </xsl:text>
                                </span>
                                <span class="biblgroup">
                                    <xsl:text>biblGroup </xsl:text>
                                </span>
                                <span class="composer">
                                    <xsl:text>composer </xsl:text>
                                    <xsl:text>author </xsl:text>
                                    <xsl:text>artist </xsl:text>
                                </span>
                                <xsl:text>other text </xsl:text>
                                <span class="title">
                                    <xsl:text>title </xsl:text>
                                </span>
                                <span class="opus">
                                    <xsl:text>opus </xsl:text>
                                </span>
                                <span class="key">
                                    <xsl:text>key </xsl:text>
                                </span>
                                <span class="pubplace">
                                    <xsl:text>pubplace </xsl:text>
                                </span>
                                <span class="publisher">
                                    <xsl:text>publisher </xsl:text>
                                </span>
                                <span class="edition">
                                    <xsl:text>edition </xsl:text>
                                    <xsl:text>format </xsl:text>
                                </span>
                                <!--
                                    <span class="price">
                                    <xsl:text>price </xsl:text>
                                    </span>
                                -->
                                <span class="warning">
                                    <xsl:text>&lt;illegal tag&gt;</xsl:text>
                                </span>
                                <xsl:text>text tagged wrong</xsl:text>
                                <span class="warning">
                                    <xsl:text>&lt;/illegal tag&gt;</xsl:text>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <th class="tablenormal" width="10%"> Element <br/> Item @id </th>
                            <th class="tablenormal"> Item </th>
                        </tr>
                        <xsl:apply-templates select=".//body"/>
                    </table>
                </td>
            </tr>
            <!-- Navigation -->
            <tr>
                <td align="center" colspan="2">
                    <xsl:call-template name="option-views"/>
                </td>
                <!--
                    <td colspan="6">
                    </td>
                -->
                <td colspan="4"> </td>
                <xsl:call-template name="pvandnx"/>
            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>
