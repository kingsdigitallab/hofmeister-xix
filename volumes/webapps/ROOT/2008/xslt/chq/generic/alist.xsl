<?xml version="1.0" encoding="UTF-8"?>
  <!--
      XSLT for the templates called in aggregation.xsl.
      SVN: $Id: alist.xsl 232 2007-03-02 16:25:20Z zau $
  -->
  
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">

    <!-- START CONTENT  -->    
    <xsl:template name="ctpl_filebase">
        <xsl:variable name="nameid">
            <xsl:value-of select="@id"/>
        </xsl:variable>
        
        <!-- Quick links to groups -->
        <xsl:call-template name="grp-links"/>

        <!-- Quick links to each item -->
        <h2>List of &lt;text&gt;/@id's used</h2>
        <table class="list">
            <xsl:for-each select=".//item">
                <xsl:if test="position() mod 9 = 1">
                    <tr>
                        <td class="list">
                            <a class="content" href="#{@id}">[<xsl:value-of select="@id"/>]</a>
                        </td>
                        <td class="list">
                            <xsl:if test="following::item[1]">
                                <a class="content" href="#{following::item[1]/@id}">[<xsl:value-of select="following::item[1]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::item[2]">
                                <a class="content" href="#{following::item[2]/@id}">[<xsl:value-of select="following::item[2]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::item[3]">
                                <a class="content" href="#{following::item[3]/@id}">[<xsl:value-of select="following::item[3]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::item[4]">
                                <a class="content" href="#{following::item[4]/@id}">[<xsl:value-of select="following::item[4]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::item[5]">
                                <a class="content" href="#{following::item[5]/@id}">[<xsl:value-of select="following::item[5]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::item[6]">
                                <a class="content" href="#{following::item[6]/@id}">[<xsl:value-of select="following::item[6]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::item[7]">
                                <a class="content" href="#{following::item[7]/@id}">[<xsl:value-of select="following::item[7]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::item[8]">
                                <a class="content" href="#{following::item[8]/@id}">[<xsl:value-of select="following::item[8]/@id"/>]</a>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
        </table>

        <!-- Main output -->
        <h2>Main tables</h2>

        <xsl:choose>
            <xsl:when test="descendant::group">
                <xsl:apply-templates select=".//group"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select=".//item"/>
            </xsl:otherwise>
        </xsl:choose>

        <a name="bottom" id="bottom"/>
    </xsl:template>

    <!-- END CONTENT  -->

  
    <!--  GROUP  -->
    <xsl:template match="group[../*/item]">
        <xsl:choose>
            <!--  LEVEL ONE  -->
            <xsl:when test="parent::body">
                <hr size="1"/>
                <a name="{@id}"/>
                <div class="level1">
                    <xsl:call-template name="ctpl_group"/>
                </div>
            </xsl:when>
            <!--  LEVEL TWO  -->
            <xsl:when test="../parent::body">
                <hr size="1"/>
                <a name="{@id}"/>
                <div class="level2">
                    <xsl:call-template name="ctpl_group"/>
                </div>
            </xsl:when>
            <!-- LEVEL THREE -->
            <xsl:otherwise>
                <a name="{@id}"/>
                <div class="level3">
                    <xsl:call-template name="ctpl_group"/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="ctpl_group">
        <!-- Information about the group -->
        <table cellspacing="3" cellpadding="6" class="group">
            <tr>
                <th>
                    <h3>Group:</h3>                    
                </th>
                <td>
                    <p> [@id] <span class="keyid">
                        <strong>
                            <xsl:value-of select="@id"/>
                        </strong>
                    </span>
                        <br/> [groupTitle] <strong>
                            <xsl:value-of select="groupHead/groupTitle"/>
                        </strong>
                        <br/> [groupFolder] <span class="ftype">
                            <xsl:value-of select="groupHead/groupFolder"/>
                        </span>
                    </p>
                </td>
            </tr>
        </table>
        <br clear="all"/>
        
        <!-- Information about the items in the group -->
        <xsl:if test="child::item">
            <table cellspacing="0" cellpadding="5" class="detail">
                <!-- headings -->
                <tr>
                    <th valign="top" class="main">@id</th>
                    <xsl:if test="not(ancestor::authorityList[@id='AL_process'])">
                        <th valign="top" class="main">&lt;filetitle&gt;</th>
                    </xsl:if>
                    <xsl:if test="not(ancestor::authorityList[@id='AL_process'])">
                        <th valign="top" class="main">&lt;filename&gt;</th>
                    </xsl:if>
                    <th valign="top" class="main">&lt;param&gt;</th>
                    <xsl:if test="not(ancestor::authorityList[@id='AL_process'])">
                        <th valign="top" class="subsid">&lt;@print&gt;</th>
                    </xsl:if>
                    <th valign="top" class="subsid">&lt;notes&gt;</th>
                    <th valign="top" class="subsid">&lt;internal&gt;</th>
                </tr>
                <xsl:apply-templates select="item">
                    <xsl:sort select="@id" order="ascending"/>
                </xsl:apply-templates>
            </table>
            <br clear="all"/>
            <br clear="all"/>
        </xsl:if>
    </xsl:template>
    
    <!-- ITEM -->
    <xsl:template match="item">
        <xsl:choose>
            <xsl:when test="parent::group">
                <!-- a row for each item -->
                <tr>
                    <!--  first table cell  -->
                    <xsl:choose>
                        <xsl:when test="not(string(@id))">
                            <td valign="top" class="warning"> CONTENT MISSING </td>
                        </xsl:when>
                        <xsl:when test="string-length(@id) &lt; 2">
                            <td valign="top" class="warning">
                                <xsl:apply-templates select="@id"/> TOO SHORT? </td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td valign="top" class="keyid">
                                <a name="{@id}" id="{@id}"/>
                                <strong>
                                    <xsl:apply-templates select="@id"/>
                                </strong>
                            </td>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!--  next table cell  -->
                    <xsl:if test="not(ancestor::authorityList[@id='AL_process'])">
                        <xsl:choose>
                            <xsl:when test="not(string(fileName))">
                                <td valign="top" class="blank"> &#xa0; </td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td valign="top" class="fname">
                                    <xsl:value-of select="fileName"/>
                                </td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!--  next table cell  -->
                    <xsl:if test="not(ancestor::authorityList[@id='AL_process'])">
                        <xsl:choose>
                            <xsl:when test="not(string(fileTitle))">
                                <td valign="top" class="blank"> &#xa0; </td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td valign="top" class="authList4">
                                    <xsl:value-of select="fileTitle"/>
                                </td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!--  next table cell  -->
                    <xsl:choose>
                        <xsl:when test="not(string(param))">
                            <td valign="top" class="blank"> &#xa0; </td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td valign="top" class="authList4">
                                <xsl:value-of select="param"/>
                            </td>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!--  next table cell  -->
                    <xsl:if test="not(ancestor::authorityList[@id='AL_process'])">
                        <xsl:choose>
                            <xsl:when test="not(string(@print))">
                                <td valign="top" class="blank"> &#xa0; </td>
                            </xsl:when>
                            <xsl:when test="string-length(@print) &lt; 2">
                                <td valign="top" class="blank"> &#xa0; <xsl:apply-templates select="@print"/>
                                </td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td valign="top" class="authList3">
                                    <xsl:value-of select="@print"/>
                                </td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <!--  next table cell  -->
                    <xsl:choose>
                        <xsl:when test="not(string(notes))">
                            <td valign="top" class="blank"> &#xa0; </td>
                        </xsl:when>
                        <xsl:when test="not(string(notes/p))">
                            <td valign="top" class="blank"> &#xa0; </td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td valign="top">
                                <xsl:value-of select="notes"/>
                            </td>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!--  next table cell  -->
                    <xsl:choose>
                        <xsl:when test="not(string(internal))">
                            <td valign="top" class="blank"> &#xa0; </td>
                        </xsl:when>
                        <xsl:when test="not(string(internal/p))">
                            <td valign="top" class="blank"> &#xa0; </td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td valign="top">
                                <xsl:value-of select="internal"/>
                            </td>
                        </xsl:otherwise>
                    </xsl:choose>
                </tr>
            </xsl:when>
            <xsl:otherwise>
                <table width="100%" cellspacing="0" cellpadding="5" class="detail">
                    <tr>
                        <th width="10%" class="id">
                            <a name="{@id}"/>
                            <strong>@id</strong>
                        </th>
                        <th width="10%" class="main">Full Name</th>
                        <th width="40%" class="subsid">Notes</th>
                        <th width="40%" class="subsid">Internal</th>
                    </tr>
                    <tr>
                        <td valign="top" align="center" class="keyid">
                            <xsl:apply-templates select="@id"/>
                        </td>
                        <td valign="top" align="center">
                            <xsl:value-of select="full"/>
                        </td>
                        <xsl:choose>
                            <xsl:when test="not(string(notes))">
                                <td valign="top" class="blank"> &#xa0; </td>
                            </xsl:when>
                            <xsl:when test="not(string(notes/p))">
                                <td valign="top" class="blank"> &#xa0; </td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td valign="top">
                                    <xsl:value-of select="notes"/>
                                </td>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="not(string(internal))">
                                <td valign="top" class="blank"> &#xa0; </td>
                            </xsl:when>
                            <xsl:when test="not(string(internal/p))">
                                <td valign="top" class="blank"> &#xa0; </td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td valign="top">
                                    <xsl:value-of select="internal"/>
                                </td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tr>
                </table>
                <br clear="all"/>
                <br clear="all"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
        
</xsl:stylesheet>
