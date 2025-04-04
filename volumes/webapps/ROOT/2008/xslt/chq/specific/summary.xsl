<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="type02-summary">

        <table width="100%" border="1" cellspacing="3" cellpadding="6">
            <!-- Navigation information -->
            <tr>
                <xsl:call-template name="pvandnx"/>
                <td colspan="4">&#xa0; </td>
                <td align="center" colspan="2">
                    <xsl:call-template name="option-views"/>
                </td>
            </tr>
            <!-- Meta information -->
            <tr>
                <td width="7%">&#xa0; </td>
                <td width="7%">&#xa0; </td>
                <th class="id" width="16%">file @id: </th>
                <td width="20%" class="keyid">
                    <b>
                        <xsl:value-of select="TEI.2/@id"/>
                    </b>
                </td>
                <th class="tablenormal" width="16%">languages included: </th>
                <td width="20%">
                    <xsl:apply-templates select=".//langUsage"/>
                </td>
                <td width="7%">&#xa0; </td>
                <td width="7%">&#xa0; </td>
            </tr>

            <tr>
                <td>&#xa0; </td>
                <td>&#xa0; </td>
                <th class="tablenormal"> Main Title of Page </th>
                <td colspan="3">
                    <xsl:apply-templates select=".//teiHeader/fileDesc/titleStmt/title" mode="main"/>
                    <xsl:apply-templates select=".//teiHeader/fileDesc/titleStmt/author" mode="main"/>
                </td>
                <td>&#xa0; </td>
                <td>&#xa0; </td>
            </tr>
            <tr>
                <td>&#xa0; </td>
                <td>&#xa0; </td>
                <th class="tablenormal" colspan="4"> Change Log </th>
                <td>&#xa0; </td>
                <td>&#xa0; </td>
            </tr>
            <tr>
                <td>&#xa0; </td>
                <td>&#xa0; </td>
                <td colspan="4">
                    <table width="100%" border="1">
                        <tr>
                            <th class="tablenormal" width="15%"> Date </th>
                            <th class="tablenormal" width="15%"> Name </th>
                            <th class="tablenormal"> Notes </th>
                        </tr>
                        <xsl:apply-templates select=".//change"/>
                    </table>
                </td>
                <td>&#xa0; </td>
                <td>&#xa0; </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <xsl:call-template name="option-views"/>
                </td>
                <!--
                    <td colspan="6">&#xa0;
                    </td>
                -->
                <td colspan="4">&#xa0; </td>
                <xsl:call-template name="pvandnx"/>
            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>
