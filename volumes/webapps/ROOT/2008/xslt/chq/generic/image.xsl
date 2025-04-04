<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
    
    <!-- START CONTENT  --> 
    
    <xsl:template name="ctpl_image">

        <!-- Quick links to groups -->
        <xsl:call-template name="grp-links"/>
        
        <!-- Quick links to each item -->
        <h2>List of images used</h2>
        <table class="list">
            <xsl:for-each select=".//image">
                <xsl:if test="position() mod 9 = 1">
                    <tr>
                        <td class="list">
                            <a class="content" href="#{@id}">[<xsl:value-of select="@id"/>]</a>
                        </td>
                        <td class="list">
                            <xsl:if test="following::image[1]">
                                <a class="content" href="#{following::image[1]/@id}">[<xsl:value-of select="following::image[1]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::image[2]">
                                <a class="content" href="#{following::image[2]/@id}">[<xsl:value-of select="following::image[2]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::image[3]">
                                <a class="content" href="#{following::image[3]/@id}">[<xsl:value-of select="following::image[3]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::image[4]">
                                <a class="content" href="#{following::image[4]/@id}">[<xsl:value-of select="following::image[4]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::image[5]">
                                <a class="content" href="#{following::image[5]/@id}">[<xsl:value-of select="following::image[5]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::image[6]">
                                <a class="content" href="#{following::image[6]/@id}">[<xsl:value-of select="following::image[6]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::image[7]">
                                <a class="content" href="#{following::image[7]/@id}">[<xsl:value-of select="following::image[7]/@id"/>]</a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::image[8]">
                                <a class="content" href="#{following::image[8]/@id}">[<xsl:value-of select="following::image[8]/@id"/>]</a>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
        </table>
        
        <!-- Main output -->
        <h2>Main tables</h2>

        <xsl:apply-templates select=".//group"/>

        <h2>List of @id's used</h2>

        <xsl:for-each select=".//image">
            <xsl:sort select="@id" order="ascending"/>
            <a class="content" href="#{generate-id()}">
                <xsl:value-of select="@id"/>
            </a>
            <xsl:if test="position() != last()"> | </xsl:if>
        </xsl:for-each>
        
        <!-- END CONTENT  -->
        <a name="bottom" id="bottom"/>
    </xsl:template>
    

    <!-- GROUP TEXT -->
    
    <xsl:template match="group[../group/image]">
        <xsl:choose>
            <xsl:when test="child::image">
                <xsl:call-template name="group-head"/>

                <!--  MAIN TABLE STARTS  -->
                <table border="1" cellpadding="6" cellspacing="0" class="detail">
                    <!-- headings -->
                    <tr>
                        <th valign="top" class="id">@id</th>
                        <th valign="top" class="main">&lt;imgTitle&gt;</th>
                        <th valign="top" class="main">&lt;caption&gt;</th>
                        <th valign="top" class="main">&lt;path&gt;</th>
                        <th valign="top" class="main">&lt;desc&gt;</th>
                        <th valign="top" class="main">&lt;width&gt;</th>
                        <th valign="top" class="main">&lt;height&gt;</th>
                        <th valign="top" class="main">&lt;ext&gt;/@n</th>
                        <th valign="top" class="main">&lt;creator&gt;</th>
                        <th valign="top" class="main">&lt;copyright&gt;</th>
                        <th valign="top" class="main">&lt;notes&gt;</th>
                        <th valign="top" class="main">&lt;internal&gt;</th>
                    </tr>
                    <xsl:apply-templates select="image">
                        <xsl:sort select="@id" order="ascending"/>
                    </xsl:apply-templates>
                </table>
                <br clear="all"/>
                <br clear="all"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- GROUP GROUP -->
                <xsl:call-template name="group-head"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="image">
        <!-- a row for each image -->
        <tr>
            <!--  ID  -->
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
                        <a name="{@id}" id="{generate-id()}"/>
                        <xsl:apply-templates select="@id"/>
                    </td>
                </xsl:otherwise>
            </xsl:choose>

            <!--  TITLE  -->
            <xsl:choose>
                <xsl:when test="not(string(imgTitle))">
                    <td valign="top" class="warning2"> CONTENT MISSING </td>
                </xsl:when>
                <xsl:otherwise>
                    <td valign="top" class="authList3">
                        <xsl:apply-templates select="imgTitle"/>
                    </td>
                </xsl:otherwise>
            </xsl:choose>

            <!--  CAPTION  -->
            <xsl:choose>
                <xsl:when test="not(string(caption))">
                    <td valign="top" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:otherwise>
                    <td valign="top">
                        <xsl:apply-templates select="caption"/>
                    </td>
                </xsl:otherwise>
            </xsl:choose>

            <!--  PATH -->

            <xsl:choose>
                <xsl:when test="not(string(path))">
                    <td valign="top" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:otherwise>
                    <td valign="top">
                        <xsl:apply-templates select="path"/>
                    </td>
                </xsl:otherwise>
            </xsl:choose>

            <!-- DESC  -->
            <xsl:choose>
                <xsl:when test="not(string(desc))">
                    <td valign="top" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:otherwise>
                    <td valign="top">
                        <xsl:apply-templates select="desc"/>
                    </td>
                </xsl:otherwise>
            </xsl:choose>

            <!--  WIDTH  -->
            <xsl:choose>
                <xsl:when test="not(string(width))">
                    <td valign="top" align="center" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:otherwise>
                    <td align="center" valign="top">
                        <xsl:apply-templates select="width"/>
                    </td>
                </xsl:otherwise>
            </xsl:choose>

            <!--  HEIGHT -->

            <xsl:choose>
                <xsl:when test="not(string(height))">
                    <td valign="top" align="center" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:otherwise>
                    <td align="center" valign="top">
                        <xsl:apply-templates select="height"/>
                    </td>
                </xsl:otherwise>
            </xsl:choose>

            <!-- EXT  -->
            <xsl:choose>
                <xsl:when test="not(string(ext/@n))">
                    <td valign="top" align="center" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:otherwise>
                    <td align="center" valign="top">
                        <xsl:apply-templates select="ext/@n"/>
                    </td>
                </xsl:otherwise>
            </xsl:choose>

            <!-- CREATOR  -->
            <xsl:choose>
                <xsl:when test="not (string(creator/name) and not(creator/p))">
                    <td valign="top" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:otherwise>
                    <td valign="top">
                        <xsl:apply-templates select="creator"/>
                    </td>
                </xsl:otherwise>
            </xsl:choose>

            <!--  COPYRIGHT  -->
            <xsl:choose>
                <xsl:when test="not(copyright)">
                    <td valign="top" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:when test="not(string(copyright/p))">
                    <td valign="top" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:otherwise>
                    <td valign="top">
                        <xsl:apply-templates select="copyright"/>
                    </td>
                </xsl:otherwise>
            </xsl:choose>

            <!--  NOTES  -->
            <xsl:choose>
                <xsl:when test="not(notes)">
                    <td valign="top" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:when test="not(string(notes/p))">
                    <td valign="top" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:otherwise>
                    <td valign="top">
                        <xsl:apply-templates select="notes"/>
                    </td>
                </xsl:otherwise>
            </xsl:choose>

            <!--  INTERNAL -->
            <xsl:choose>
                <xsl:when test="not(internal)">
                    <td valign="top" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:when test="not(string(internal/p))">
                    <td valign="top" class="blank"> &#xa0; </td>
                </xsl:when>
                <xsl:otherwise>
                    <td valign="top">
                        <xsl:apply-templates select="internal"/>
                    </td>
                </xsl:otherwise>
            </xsl:choose>
        </tr>
    </xsl:template>
    
    
    <!-- CALL TEMPLATES -->
    <xsl:template name="group-head">
        <a name="{@id}"/>
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
    </xsl:template>

</xsl:stylesheet>