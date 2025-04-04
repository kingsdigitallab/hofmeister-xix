<?xml version="1.0" encoding="UTF-8"?>
  <!--
      XSLT for common link templates 
      SVN: $Id: link_com.xsl 685 2007-04-30 11:14:48Z zau $
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">

    <!-- Context @id -->
    <xsl:template name="link_context_id">
        <td valign="top">
            <xsl:choose>
                <xsl:when test="not(ancestor::TEI.2/@id)">
                    <xsl:attribute name="class">warning</xsl:attribute>
                    <span class="warning">MISSING</span>
                </xsl:when>
                <xsl:when test="not(string(ancestor::TEI.2/@id))">
                    <xsl:attribute name="class">warning</xsl:attribute>
                    <span class="warning">
                        <b>EMPTY VALUE</b>
                    </span>
                </xsl:when>
                <xsl:otherwise>
                    <span class="keyid">
                        <xsl:value-of select="ancestor::TEI.2/@id"/>
                    </span>
                </xsl:otherwise>
            </xsl:choose>
        </td>
    </xsl:template>

    <!-- Context file title -->
    <xsl:template name="link_context_title">
        <td valign="top">
            <xsl:value-of select="ancestor::TEI.2/teiHeader/fileDesc/titleStmt/title"/>
        </td>
    </xsl:template>

    <!-- Context filename -->
    <xsl:template name="link_context_filename">
        <td valign="top">
            <xsl:value-of select="//filebase//item[@id=current()/ancestor::TEI.2/@id]/fileName"/> &#xa0; </td>
    </xsl:template>

    <!-- Linking text -->
    <xsl:template name="link_context_text">
        <td valign="top">
            <xsl:apply-templates/>
        </td>
    </xsl:template>

    <!-- @from and @url -->
    <xsl:template name="link_target_from">
        <td valign="top">
            <xsl:choose>
                <xsl:when test="@from='ROOT'">
                    <xsl:attribute name="class">warning</xsl:attribute>
                    <span class="warning">EMPTY VALUE</span>
                </xsl:when>
                <xsl:when test="not(string(normalize-space(@from)))">
                    <xsl:attribute name="class">warning</xsl:attribute>
                    <span class="warning">EMPTY VALUE</span>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@from"/>
                </xsl:otherwise>
            </xsl:choose>
            <br />
            <xsl:choose>
                <xsl:when test="starts-with(@from, 'g') and not(string(normalize-space(@url)))">
                    <span class="warning">missing @url</span>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@url"/>
                </xsl:otherwise>
            </xsl:choose>
        </td>
    </xsl:template>

    <!-- Target @id -->
    <xsl:template name="link_target_id">
        <xsl:param name="tar-file-id"/>        
        <td valign="top">
            <span class="keyid">
                <xsl:value-of select="//TEI.2[@id=$tar-file-id]/@id"/>
            </span>
        </td>
    </xsl:template>

    <!-- Target filename -->
    <xsl:template name="link_target_filename">
        <td valign="top">
            <xsl:choose>
                <xsl:when test="starts-with(@from, 'g')">
                    <xsl:text>not type01, so not in filebase</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="//filebase//item[@id=current()/@from]/fileName"/>
                </xsl:otherwise>
            </xsl:choose>
            &#xa0; 
        </td>
    </xsl:template>

    <!-- Target file title -->
    <xsl:template name="link_target_filetitle">
        <xsl:param name="tar-file-id"/>        
        <td valign="top">
            <xsl:value-of select="//TEI.2[@id=$tar-file-id]//titleStmt/title"/>
        </td>
    </xsl:template>

    <!-- Warning - target xml -->
    <xsl:template name="link_target_xml">
        <xsl:param name="tar-file-id"/>
        <xsl:param name="tar-grp-id"/>
        <td valign="top">
            <xsl:if test="not(//TEI.2/@id=$tar-file-id)">
                <xsl:attribute name="class">warning</xsl:attribute>
                <span class="warning">X</span>
            </xsl:if>&#xa0; </td>
    </xsl:template>

    <!-- Warning - filebase entry -->
    <xsl:template name="link_target_filebase">
        <xsl:param name="tar-file-id"/>
        <xsl:param name="tar-grp-id"/>
        <td valign="top">
            <xsl:choose>
                <xsl:when test="starts-with(@from, 'g') and not(//filebase//group[@id=$tar-grp-id])">
                    <xsl:attribute name="class">warning</xsl:attribute>
                    <span class="warning">No group</span>
                    <xsl:value-of select="$tar-grp-id"/>
                </xsl:when>
                <xsl:when test="not(starts-with(@from, 'g')) and not(//filebase//item[@id=$tar-file-id])">
                    <xsl:attribute name="class">warning</xsl:attribute>
                    <span class="warning">No file</span>
                </xsl:when>
                <xsl:otherwise>&#xa0;</xsl:otherwise>
            </xsl:choose>
        </td>
    </xsl:template>

</xsl:stylesheet>
