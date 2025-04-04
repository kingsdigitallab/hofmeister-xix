<?xml version="1.0" encoding="UTF-8"?>
  <!--
      XSLT to create a list of all internal links using source that is taken from an xquery 
      SVN: $Id: link.xsl 685 2007-04-30 11:14:48Z zau $
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">

    <xsl:template name="link">
        <h2>List of working links</h2>
        <table width="100%" cellpadding="6" class="detail">
            <tr>
                <th valign="top" class="id">From file TEI/@id</th>
                <th valign="top" class="main">From file title</th>
                <th valign="top" class="main">From HTML fileName</th>
                <th valign="top" class="subsid">Linking text</th>
                <th valign="top" class="subsid">xref/@from<br/>xref/@url</th>
                <th valign="top" class="id">target file @id</th>
                <th valign="top" class="tablenormal">target file title</th>
                <th valign="top" class="tablenormal">Target HTML fileName</th>
            </tr>

            <xsl:for-each select="/aggregation/main/xquery/TEI.2/xref[@type='internal' or @rend='internal']">
                <xsl:sort select="ancestor::TEI.2/@id"/>
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

                <!-- If target file exists in filebase -->
                <xsl:if test="/aggregation/main/xquery/TEI.2/@id=$tar-file-id and //filebase//*[@id=current()/@from]">
                    <tr>
                        <!-- Tempates in link_com -->
                        <!-- Context @id -->
                        <xsl:call-template name="link_context_id"/>
                        <!-- Context title -->
                        <xsl:call-template name="link_context_title"/>
                        <!-- Context filename -->
                        <xsl:call-template name="link_context_filename"/>
                        <!-- Linking text -->
                        <xsl:call-template name="link_context_text"/>
                        <!-- @from -->
                        <xsl:call-template name="link_target_from"/>
                        <!-- Target @id -->
                        <xsl:call-template name="link_target_id">
                            <xsl:with-param name="tar-file-id" select="$tar-file-id"/>
                        </xsl:call-template>
                        <!-- Target filetitle -->
                        <xsl:call-template name="link_target_filetitle">
                            <xsl:with-param name="tar-file-id" select="$tar-file-id"/>
                        </xsl:call-template>
                        <!-- Target HTML filename -->
                        <xsl:call-template name="link_target_filename"/>
                    </tr>
                </xsl:if>
            </xsl:for-each>
        </table>
        <br clear="all"/>
    </xsl:template>

</xsl:stylesheet>
