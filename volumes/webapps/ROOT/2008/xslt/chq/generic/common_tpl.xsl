<?xml version="1.0" encoding="UTF-8"?>
  <!--
      XSLT for common templates 
      SVN: $Id: common_tpl.xsl 232 2007-03-02 16:25:20Z zau $
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">

    <!-- Quick links to groups, used in authority list checking pages -->
    <xsl:template name="grp-links">
        <xsl:choose>
            <xsl:when test=".//group">
                <h2>Quick links to groups</h2>
                <table class="links">
                    <xsl:for-each select=".//group">
                        <xsl:if test="position() mod 6 = 1">
                            <tr>
                                <td class="links">
                                    <a class="content" href="#{@id}">[<xsl:value-of select="@id"/>]</a>
                                </td>
                                <td class="links">
                                    <xsl:if test="following::group[1]">
                                        <a class="content" href="#{following::group[1]/@id}">[<xsl:value-of select="following::group[1]/@id"/>]</a>
                                    </xsl:if>
                                </td>
                                <td class="links">
                                    <xsl:if test="following::group[2]">
                                        <a class="content" href="#{following::group[2]/@id}">[<xsl:value-of select="following::group[2]/@id"/>]</a>
                                    </xsl:if>
                                </td>
                                <td class="links">
                                    <xsl:if test="following::group[3]">
                                        <a class="content" href="#{following::group[3]/@id}">[<xsl:value-of select="following::group[3]/@id"/>]</a>
                                    </xsl:if>
                                </td>
                                <td class="links">
                                    <xsl:if test="following::group[4]">
                                        <a class="content" href="#{following::group[4]/@id}">[<xsl:value-of select="following::group[4]/@id"/>]</a>
                                    </xsl:if>
                                </td>
                                <td class="links">
                                    <xsl:if test="following::group[5]">
                                        <a class="content" href="#{following::group[5]/@id}">[<xsl:value-of select="following::group[5]/@id"/>]</a>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>

    <!--    Other templates     -->

    <xsl:template match="p">
        <xsl:choose>
            <xsl:when test="ancestor::TEI.2[@id='AL_imageBase' or @id='AL_designImages']">
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
                <br/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="url">
        <p>
            <a class="content" href="{text()}" target="_blank">
                <xsl:apply-templates/>
            </a>
        </p>
    </xsl:template>

    <xsl:template match="i">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>

    <xsl:template match="b">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>

    <xsl:template match="u">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>

    <xsl:template match="list">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="li">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="label">
        <b>
            <xsl:apply-templates/>
        </b>
        <br/>
    </xsl:template>

    <xsl:template match="con">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="changeNotes">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="changeItem">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="name">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>


</xsl:stylesheet>
