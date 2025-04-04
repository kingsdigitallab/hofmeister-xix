<?xml version="1.0" encoding="UTF-8"?>
  <!--
      XSLT for targeted files checking page 
      SVN: $Id: link_targeted.xsl 685 2007-04-30 11:14:48Z zau $
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">

    <xsl:key name="index" match="xref[@type='internal']" use="concat(normalize-space(@from), '-', normalize-space(@url))"/>

    <xsl:template name="targeted">
        
        <!-- List of all the targeted files -->
        <h2>Quick links to Targeted files</h2>
        <!-- Puts them into a table with 4 columns -->
        <table class="links">
            <xsl:for-each select="//xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])]">
                <xsl:if test="position() mod 4 = 1">
                    <tr>
                        <td class="links">
                            <a class="content" href="#{@from}{@url}">
                                <xsl:text>[</xsl:text>
                                <xsl:value-of select="@from"/>
                                    <xsl:if test="@url">
                                    <xsl:text> - </xsl:text>
                                    <xsl:value-of select="@url"/>
                                    </xsl:if>
                                <xsl:text>]</xsl:text>
                            </a>
                        </td>
                        <td class="links">
                            <xsl:if test="following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][1]">
                                <a class="content"
                                    href="#{following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][1]/@from}{following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][1]/@url}">
                                    <xsl:text>[</xsl:text>
                                    <xsl:value-of select="following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][1]/@from" />
                                        <xsl:if test="following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][1]/@url">
                                        <xsl:text> - </xsl:text>
                                        <xsl:value-of select="following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][1]/@url"/>
                                        </xsl:if>
                                    <xsl:text>]</xsl:text>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="links">
                            <xsl:if test="following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][2]">
                                <a class="content"
                                    href="#{following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][2]/@from}{following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][2]/@url}">
                                    <xsl:text>[</xsl:text>
                                    <xsl:value-of select="following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][2]/@from" />
                                        <xsl:if test="following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][2]/@url">
                                        <xsl:text> - </xsl:text>
                                        <xsl:value-of select="following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][2]/@url"/>
                                        </xsl:if>
                                    <xsl:text>]</xsl:text>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="links">
                            <xsl:if test="following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][3]">
                                <a class="content"
                                    href="#{following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][3]/@from}{following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][3]/@url}">
                                    <xsl:text>[</xsl:text>
                                    <xsl:value-of select="following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][3]/@from" />
                                        <xsl:if test="following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][3]/@url">
                                        <xsl:text> - </xsl:text>
                                        <xsl:value-of select="following::xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])][3]/@url"/>
                                        </xsl:if>
                                    <xsl:text>]</xsl:text>
                                </a>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
        </table>
        
        
        <h2>Targeted files</h2>

        <!-- xref with empty @from  -->
        
        <xsl:for-each
            select="//xref[@type='internal'][@from='ROOT'][generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])]">
            <xsl:call-template name="tar-tables"/>
        </xsl:for-each>

        <!-- xref with target -->
        <xsl:for-each select="//xref[generate-id(.)=generate-id(key('index', concat(normalize-space(@from), '-', normalize-space(@url)))[1])]">
            <xsl:sort select="@from"/>
            <xsl:sort select="@url"/>
            
            <xsl:call-template name="tar-tables"/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="tar-tables">        
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
        <xsl:variable name="tar-grp-name">
            <xsl:value-of select="//filebase//group[@id=current()/@from]/groupHead/groupFolder"/>
        </xsl:variable>
        
            <!-- General information about the targeted file -->
            <table cellspacing="3" cellpadding="6" class="group">
                <tr>
                    <th>
                        <h3>Targeted file:</h3>
                    </th>
                    <td>
                        <p>
                            <!-- content of the @from -->
                            <a name="{@from}{@url}"> </a>
                            <b>
                                <xsl:text>[xref/@from] </xsl:text>
                            </b>
                            <xsl:choose>
                                <!-- Testing for empty values -->
                                <xsl:when test="@from='ROOT'">
                                    <span class="warning">ROOT - EMPTY VALUE</span>
                                </xsl:when>
                                <!-- Testing for empty values -->
                                <xsl:when test="not(string(normalize-space(@from)))">
                                    <span class="warning">EMPTY VALUE</span>
                                </xsl:when>
                                <!-- Testing for type02 or type03 links -->
                                <xsl:when test="string(@url) and not(starts-with(@from, 'g'))">
                                    <span class="warning2">Wrong group @id? </span>
                                    <xsl:value-of select="@from"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@from"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <br/>
                            <!-- If @from starts with 'g' (group) than output group name in fileBase -->
                            <xsl:if test="starts-with(@from, 'g')">
                                <b>
                                    <xsl:text>[groupFolder in filebase] </xsl:text>
                                </b>
                                <xsl:value-of select="$tar-grp-name"/>
                                <br/>
                            </xsl:if>
                            <!-- content of the @url -->
                            <b>
                                <xsl:text>[xref/@url] </xsl:text>
                            </b>
                            <xsl:choose>
                                <!-- If @from starts with 'g' (group) than test that there is a @url -->
                                <xsl:when test="starts-with(@from, 'g') and not(string(@url))">
                                    <span class="warning">EMPTY VALUE need file @id</span>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@url"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <br/>
                            <!-- whether the file exists as a file or in filebase  -->
                            <b>
                                <xsl:text>[@id] </xsl:text>
                            </b>
                            <xsl:choose>
                                <!-- Test if the XML file exists and if the file or group is in filebase -->
                                <xsl:when test="not(/aggregation/main/xquery/TEI.2/@id=$tar-file-id)">
                                    <span class="warning">No XML file</span>
                                    <xsl:if test="not(starts-with(@from, 'g')) and not(//filebase//item[@id=$tar-file-id])">
                                        <xsl:text> and </xsl:text>
                                        <span class="warning">FILE NOT IN FILEBASE</span>
                                    </xsl:if>
                                    <xsl:if test="starts-with(@from, 'g') and not(//filebase//group[@id=current()/@from])">
                                        <xsl:text> and </xsl:text>
                                        <span class="warning">GROUP NOT IN FILEBASE</span>
                                    </xsl:if>
                                </xsl:when>
                                <!-- Test if the file is filebase  -->
                                <xsl:when test="not(starts-with(@from, 'g')) and not(//filebase//item[@id=$tar-file-id])">
                                    <span class="warning">FILE NOT IN FILEBASE</span>
                                </xsl:when>
                                <!-- Test if the group is filebase  -->
                                <xsl:when test="starts-with(@from, 'g') and not(//filebase//group[@id=current()/@from])">
                                    <span class="warning">GROUP NOT IN FILEBASE</span>
                                </xsl:when>
                                <xsl:otherwise>
                                    <span class="keyid">
                                        <xsl:value-of select="/aggregation/main/xquery/TEI.2[@id=$tar-file-id]/@id"/>
                                    </span>
                                </xsl:otherwise>
                            </xsl:choose>
                            <br/>
                            <!-- title inside targeted file -->
                            <b>
                                <xsl:text>[fileTitle] </xsl:text>
                            </b>
                            <xsl:value-of select="/aggregation/main/xquery/TEI.2[@id=$tar-file-id]//fileDesc/titleStmt/title"/>&#xa0; <br/>
                            <!-- html filename taken from filebase -->
                            <xsl:if test="not(starts-with(@from, 'g'))">
                                <b>
                                    <xsl:text>[HTML fileName] </xsl:text>
                                </b>
                                <xsl:value-of select="//filebase//item[@id=$tar-file-id]/fileName"/>&#xa0; <br/>
                            </xsl:if>
                        </p>
                    </td>
                </tr>
            </table>
            <br clear="all"/>

            <!-- List of the files it is linked from -->
            <table cellspacing="0" cellpadding="5" class="detail" width="90%">
                <tr>
                    <th class="subsid" align="center" colspan="4">
                        <xsl:text>Link file</xsl:text>
                    </th>
                </tr>
                <tr>
                    <th class="id" width="10%">
                        <xsl:text>TEI.2/@id</xsl:text>
                    </th>
                    <th class="tablenormal" width="15%">
                        <xsl:text>fileTitle:</xsl:text>
                    </th>
                    <th class="tablenormal">
                        <xsl:text>Linking text:</xsl:text>
                    </th>
                    <th class="tablenormal" width="25%">
                        <xsl:text>HTML fileName:</xsl:text>
                    </th>
                </tr>
                <xsl:for-each select="key('index', concat(normalize-space(@from), '-', normalize-space(@url)))">
                    <xsl:sort select="ancestor::TEI.2/@id"/>
                    <tr>
                        <!-- file @id -->
                        <td>
                            <span class="keyid">
                                <xsl:value-of select="ancestor::TEI.2/@id"/>
                            </span>
                        </td>
                        <!-- file title -->
                        <td valign="top">
                            <xsl:value-of select="ancestor::TEI.2//fileDesc/titleStmt/title"/>&#xa0; </td>
                        <!-- linked text -->
                        <td>
                            <xsl:value-of select="."/>
                        </td>
                        <!-- file name from filebase -->
                        <td>
                            <xsl:value-of select="//filebase//item[@id=current()/ancestor::TEI.2/@id]/fileName"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
            <br clear="all"/>
            <hr size="1"/>
    </xsl:template>

</xsl:stylesheet>
