<?xml version="1.0" encoding="UTF-8"?>
  <!--
      XSLT for the templates called in aggregation.xsl.
      SVN: $Id: aggregation_tpl.xsl 232 2007-03-02 16:25:20Z zau $
  -->
  
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1" xmlns:dir="http://apache.org/cocoon/directory/2.0"
    xmlns:str="http://xsltsl.org/string" exclude-result-prefixes="dir str">
    
    <!-- PAGEHEAD -->
    <xsl:template match="main/*" mode="pagehead">
        <!-- authority list @id or request-name used as @id-->
        <xsl:variable name="id">
            <xsl:choose>
                <xsl:when test="@id">
                    <xsl:value-of select="@id"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$master-id"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="filename">
            <xsl:choose>
                <!-- display name for views type02 -->
                <xsl:when test="string($view)">
                    <xsl:value-of select="@id"/>
                    <xsl:if test="not(@id)">
                        <xsl:text>List of files processed</xsl:text>
                    </xsl:if>
                    <xsl:text> - </xsl:text>
                    <xsl:value-of select="$view"/>
                    <xsl:text> view</xsl:text>
                </xsl:when>
                <!-- goes to AL_docsite - output in aggregation <docsite> to get the display name -->
                <xsl:when test="$id='AL_docsite'">
                    <xsl:value-of select="//docsite//item[@id='iAL_docsite']/fileTitle"/>
                </xsl:when>
                <!-- gets display name for files with ids -->
                <xsl:when test="//docsite//item[@id=$id]">
                    <xsl:value-of select="//docsite//item[@id=$id]/fileTitle"/>
                </xsl:when>
                <!-- uses request-name to generate a display name -->
                <xsl:otherwise>
                    <xsl:call-template name="str:capitalise">
                        <xsl:with-param name="text" select="$master-id"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <a name="top"/>
        <h1>Checking page for: <span class="new">&lt;<xsl:value-of select="$filename"/>&gt;</span></h1>
    </xsl:template>

    <!-- NAVIGATION -->
    <xsl:template match="docsite">
        <table class="toc" cellspacing="0" cellpadding="5">
            <tr>
                <th colspan="2" class="head">Checking pages</th>
            </tr>
            <xsl:for-each select=".//body/group[not(@id='docsite')]//groupTitle[not(ancestor::group[@id='browse'])]">
                <tr>
                    <th class="table4">
                        <xsl:value-of select="."/>
                        <xsl:text>:</xsl:text>
                    </th>
                    <td class="table4">
                        <xsl:for-each select="ancestor::group//item[not(ancestor::group[@id='browse'])]">
                            <!-- creates the path for the links -->
                            <xsl:variable name="grp-folder">
                                <xsl:choose>
                                    <xsl:when test="starts-with(..//groupFolder, '/')">
                                        <xsl:value-of select="substring(..//groupFolder, 2)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="..//groupFolder"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="grp-path">
                                <xsl:choose>
                                    <xsl:when test="not(substring($grp-folder, string-length($grp-folder) - 1, 1) = '/')">
                                        <xsl:value-of select="concat($grp-folder, '/')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$grp-folder"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            
                            <!-- output link and text -->
                            <a class="content">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="$context-path"/>
                                    <xsl:value-of select="$grp-path"/>
                                    <xsl:value-of select="fileName"/>
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="fileTitle"/>
                            </a>
                            <xsl:if test="position() != last()"> | </xsl:if>
                        </xsl:for-each>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        <br/>
    </xsl:template>

    <!-- MAIN CONTENT -->
    <xsl:template match="main">
        <xsl:choose>
            <!-- Using the authority list stylesheet - alist.xsl -->
            <xsl:when test="*[@id='AL_process']">
                <xsl:call-template name="ctpl_filebase"/>
            </xsl:when>
            <xsl:when test="*[@id='AL_fileBase']">
                <xsl:call-template name="ctpl_filebase"/>
            </xsl:when>
            <xsl:when test="*[@id='AL_docsite']">
                <xsl:call-template name="ctpl_filebase"/>
            </xsl:when>
            <!-- Using the navbar stylesheet -->
            <xsl:when test="*[@id='AL_navbar']">
                <xsl:call-template name="ctpl_navbar"/>
            </xsl:when>
            <!-- Using the image stylesheet -->
            <xsl:when test="*[@id='AL_imageBase']">
                <xsl:call-template name="ctpl_image"/>
            </xsl:when>
            <xsl:when test="*[@id='AL_designImages']">
                <xsl:call-template name="ctpl_image"/>
            </xsl:when>
            <!-- Using the master stylesheet -->
            <xsl:when test="starts-with($master-id, 'master_')">
                <xsl:call-template name="ctpl_master"/>
            </xsl:when>
            <!-- Link checking stylesheets -->
            <xsl:when test="$master-id='blink'">
                <xsl:call-template name="blink"/>
            </xsl:when>
            <xsl:when test="$master-id='link'">
                <xsl:call-template name="link"/>
            </xsl:when>
            <xsl:when test="$master-id='targeted'">
                <xsl:call-template name="targeted"/>
            </xsl:when>
            <!-- Project Specific -->
            <!-- List view -->
            <xsl:when test="starts-with(TEI.2/@id, 'hofm_') and $view='list'">
                <xsl:call-template name="type02-list"/>
            </xsl:when>
            <!-- Table view -->
            <xsl:when test="starts-with(TEI.2/@id, 'hofm_') and $view='table'">
                <xsl:call-template name="type02-table"/>
            </xsl:when>
            <!-- Summary view -->
            <xsl:when test="starts-with(TEI.2/@id, 'hofm_') and $view='summary'">
                <xsl:call-template name="type02-summary"/>
            </xsl:when>
            <!-- List index -->
            <xsl:when test="$view='list' or $view='table' or $view='summary'">
                <xsl:call-template name="view-indices"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- CTPL_FOOTER -->
    <xsl:template name="ctpl_footer"> </xsl:template>
    
</xsl:stylesheet>
