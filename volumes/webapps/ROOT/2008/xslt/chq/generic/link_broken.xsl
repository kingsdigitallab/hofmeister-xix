<?xml version="1.0" encoding="UTF-8"?>
  <!--
      XSLT for broken links using source that is taken from an xquery 
      SVN: $Id: link_broken.xsl 685 2007-04-30 11:14:48Z zau $
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">

    <xsl:template name="blink">

        <h2>List of broken links</h2>

        <table width="100%" cellpadding="6" class="detail">
            <tr>
                <th valign="top" class="id">From file TEI/@id</th>
                <th valign="top" class="main">From file title</th>
                <th valign="top" class="main">From HTML fileName</th>
                <th valign="top" class="subsid">Linking text</th>
                <th valign="top" class="subsid">xref/@from</th>
                <th valign="top" class="subsid">Target HTML fileName</th>
                <th valign="top" class="tablenormal">No target XML file</th>
                <th valign="top" class="tablenormal">Missing fileBase entry</th>
            </tr>

            <!-- Checking internal links -->
            <xsl:for-each select="/aggregation/main/xquery/TEI.2/xref[@type='internal' or @rend='internal']">
                <!-- Get @id of file -->
                <xsl:variable name="tar-file-id">
                    <xsl:choose>
                        <xsl:when test="starts-with(@from, 'g')">
                            <xsl:value-of select="@url"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@from"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <!-- Get group name -->
                <xsl:variable name="tar-grp-id">
                    <xsl:choose>
                        <xsl:when test="starts-with(@from, 'g')">
                            <xsl:value-of select="@from"/>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                </xsl:variable>
                
                <xsl:choose>
                    <xsl:when test="not(/aggregation/main/xquery/TEI.2/@id=$tar-file-id)">
                        <xsl:call-template name="blink-row">
                            <xsl:with-param name="tar-file-id" select="$tar-file-id"/>
                            <xsl:with-param name="tar-grp-id" select="$tar-grp-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="starts-with(@from, 'g') and not(//filebase//group[@id=$tar-grp-id])">
                        <xsl:call-template name="blink-row">
                            <xsl:with-param name="tar-file-id" select="$tar-file-id"/>
                            <xsl:with-param name="tar-grp-id" select="$tar-grp-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="not(starts-with(@from, 'g')) and not(//filebase//item[@id=$tar-file-id])">
                        <xsl:call-template name="blink-row">
                            <xsl:with-param name="tar-file-id" select="$tar-file-id"/>
                            <xsl:with-param name="tar-grp-id" select="$tar-grp-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise/>                    
                </xsl:choose>              
                
            </xsl:for-each>
        </table>

        <br clear="all"/>
    </xsl:template>

    <xsl:template name="blink-row">
        <xsl:param name="tar-file-id"/>
        <xsl:param name="tar-grp-id"/>
        <tr>
            <!-- Tempates in link_com -->
            <xsl:call-template name="link_context_id"/>
            <xsl:call-template name="link_context_title"/>
            <xsl:call-template name="link_context_filename"/>
            <xsl:call-template name="link_context_text"/>
            <xsl:call-template name="link_target_from"/>
            <xsl:call-template name="link_target_filename"/>
            <xsl:call-template name="link_target_xml">
                <xsl:with-param name="tar-file-id" select="$tar-file-id"/>
                <xsl:with-param name="tar-grp-id" select="$tar-grp-id"/>
            </xsl:call-template>
            <xsl:call-template name="link_target_filebase">
                <xsl:with-param name="tar-file-id" select="$tar-file-id"/>
                <xsl:with-param name="tar-grp-id" select="$tar-grp-id"/>
            </xsl:call-template>
        </tr>
    </xsl:template>
</xsl:stylesheet>
