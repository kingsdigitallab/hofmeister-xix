<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1" xmlns:dir="http://apache.org/cocoon/directory/2.0">


    <xsl:template name="ctpl_master">

        <!-- Start Filelist -->
        <xsl:call-template name="filelist"/>
        <!-- End Filelist -->

        <!-- Start Main table -->

        <h2>Quick summary of publications</h2>

        <table width="100%" cellpadding="6" class="detail">
            <tr>
                <th valign="top" class="main">autonum</th>
                <th valign="top" class="main">@n</th>
                <th valign="top" class="id">@id</th>
                <th valign="top" class="main">&lt;titleStmt/title&gt; </th>
                <th valign="top" class="main">last &lt;change&gt;</th>
                <xsl:if test="//TEI.2//text//text">
                    <th width="*" valign="top" class="main">&lt;group&gt;/&lt;text&gt;</th>
                </xsl:if>
            </tr>

            <!-- Each file is a row in the table -->
            <xsl:for-each select="//TEI.2">
                <tr>
                    <!-- auto number -->
                    <td valign="top">
                        <a name="{@id}"/>
                        <a>
                            <xsl:attribute name="href">html/<xsl:value-of select="@id"/>.html</xsl:attribute>
                            <xsl:number format="01"/>
                        </a>
                    </td>
                    <!-- @n -->
                    <td valign="top">
                        <a class="content" href="#{generate-id()}">
                            <xsl:value-of select="@n"/>
                        </a>
                        <xsl:if test="not(string(@n))">
                            <br/>
                        </xsl:if>
                    </td>
                    <!-- @id -->
                    <td valign="top">
                        <xsl:variable name="curTextId" select="@id"/>
                        <xsl:choose>
                            <xsl:when test="not(@id)">
                                <xsl:attribute name="class">warning</xsl:attribute>
                                <span class="warning">MISSING</span>
                            </xsl:when>
                            <xsl:when test="not(string(@id))">
                                <xsl:attribute name="class">warning</xsl:attribute>
                                <span class="warning">
                                    <b>EMPTY VALUE</b>
                                </span>
                            </xsl:when>
                            <xsl:when test="@id=preceding::*[@id = $curTextId]/@id">
                                <xsl:attribute name="class">warning</xsl:attribute>
                                <span class="warning">
                                    <xsl:value-of select="$curTextId"/>
                                    <br/>
                                    <b>REPEATED VALUE</b>
                                </span>:<br/>
                                <xsl:value-of select="@id"/>&#xa0; </xsl:when>
                            <xsl:otherwise>
                                <span class="keyid">
                                    <xsl:value-of select="@id"/>
                                </span>
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <!-- title -->
                    <td valign="top">
                        <xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/>
                    </td>
                    <!-- changes and revisions -->
                    <td valign="top">
                        <b>
                            <xsl:value-of select="teiHeader/revisionDesc/change[1]/date"/>
                        </b>
                        <br/>
                        <xsl:value-of select="teiHeader/revisionDesc/change[1]/respStmt/name"/>
                        <br/>
                    </td>
                    <!-- text information -->
                    <xsl:if test="text[descendant::text]">
                        <xsl:variable name="colspan">
                            <xsl:choose>
                                <xsl:when test="$master-id='frh3-rolls'">
                                    <xsl:text>2</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>3</xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <td width="*" valign="top">
                            <table width="100%" border="1" cellpadding="6" cellspacing="3">
                                <tr>
                                    <th class="id">text/@id</th>
                                    <td colspan="{$colspan}">
                                        <xsl:value-of select="text/@id"/>
                                        <xsl:value-of select="$master-id"/>
                                    </td>
                                </tr>

                                <xsl:for-each select="text/group">
                                    <tr>
                                        <th class="id">group/@id</th>
                                        <td colspan="{$colspan}">
                                            <xsl:value-of select="@id"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="subsid">#</th>
                                        <th class="id">@id</th>
                                        <xsl:if test="not($master-id='frh3-rolls')">
                                            <th class="subsid">head</th>
                                        </xsl:if>
                                    </tr>
                                    <xsl:for-each select="text">
                                        <tr>
                                            <!-- New cell starts -->
                                            <td>
                                                <xsl:number format="01"/>
                                            </td>

                                            <!-- New cell starts -->
                                            <!--                                           <td>
                                                <xsl:variable name="curTextId" select="ancestor::text/@id"/>
                                                <xsl:choose>
                                                    <xsl:when test="@id=preceding::text[ancestor::text/@id = $curTextId]/@id">
                                                        <xsl:attribute name="class">warning</xsl:attribute>
                                                        <span class="warning">
                                                            <b>REPEATED VALUE</b>
                                                        </span>:<br/>
                                                        <xsl:value-of select="@id"/>&#xa0; </xsl:when>
                                                    <xsl:when test="not(@id)">
                                                        <xsl:attribute name="class">warning</xsl:attribute>
                                                        <span class="warning">MISSING</span>
                                                    </xsl:when>
                                                    <xsl:when test="not(string(@id))">
                                                        <xsl:attribute name="class">warning</xsl:attribute>
                                                        <span class="warning">
                                                            <b>EMPTY VALUE</b>
                                                        </span>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="@id"/>&#xa0; </xsl:otherwise>
                                                </xsl:choose>
                                            </td>
 -->
                                                <!-- New cell starts -->
                                                <td class="table2">
                                                    <xsl:choose>
                                                        <xsl:when test="not(body/head)">
                                                            <xsl:attribute name="class">warning</xsl:attribute>
                                                            <span class="warning">MISSING</span>
                                                        </xsl:when>
                                                        <xsl:when test="not(string(body/head))">
                                                            <xsl:attribute name="class">warning</xsl:attribute>
                                                            <span class="warning">
                                                                <b>EMPTY VALUE</b>
                                                            </span>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                    <xsl:value-of select="body/head"/>
                                                </td>
                                        </tr>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </table>
                        </td>
                    </xsl:if>
                </tr>
            </xsl:for-each>

        </table>


        <br clear="all"/>

        <!-- End Main table -->

        <!-- Start Filelist -->
        <xsl:call-template name="filelist"/>
        <!-- End Filelist -->
    </xsl:template>
    
    

    <!--   FILELIST       -->

    <xsl:template name="filelist">
        <h2>File list</h2>
        <p>
            <b>Files processed:</b>
        </p>
        <table class="list">
            <xsl:for-each select="//TEI.2">

                <xsl:if test="position() mod 9 = 1">
                    <tr>
                        <td class="list">
                            <a class="content" href="#{@id}">
                                <xsl:value-of select="@id"/>
                            </a>
                        </td>
                        <td class="list">
                            <xsl:if test="following::TEI.2[1]">
                                <a class="content" href="#{following::TEI.2[1]/@id}">
                                    <xsl:value-of select="following::TEI.2[1]/@id"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::TEI.2[2]">
                                <a class="content" href="#{following::TEI.2[2]/@id}">
                                    <xsl:value-of select="following::TEI.2[2]/@id"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::TEI.2[3]">
                                <a class="content" href="#{following::TEI.2[3]/@id}">
                                    <xsl:value-of select="following::TEI.2[3]/@id"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::TEI.2[4]">
                                <a class="content" href="#{following::TEI.2[4]/@id}">
                                    <xsl:value-of select="following::TEI.2[4]/@id"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::TEI.2[5]">
                                <a class="content" href="#{following::TEI.2[5]/@id}">
                                    <xsl:value-of select="following::TEI.2[5]/@id"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::TEI.2[6]">
                                <a class="content" href="#{following::TEI.2[6]/@id}">
                                    <xsl:value-of select="following::TEI.2[6]/@id"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::TEI.2[7]">
                                <a class="content" href="#{following::TEI.2[7]/@id}">
                                    <xsl:value-of select="following::TEI.2[7]/@id"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::TEI.2[8]">
                                <a class="content" href="#{following::TEI.2[8]/@id}">
                                    <xsl:value-of select="following::TEI.2[8]/@id"/>
                                </a>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:if>

            </xsl:for-each>
            <!--<xsl:for-each select=".//dir:file">
                <xsl:variable name="file-loc">
                    <xsl:value-of select="$frh3-xml"/>
                    <xsl:text>/</xsl:text>
                    <xsl:for-each select="ancestor::dir:directory[not(@name='xml')]">
                        <xsl:value-of select="@name"/>
                        <xsl:text>/</xsl:text>
                    </xsl:for-each>
                    <xsl:value-of select="@name"/>
                </xsl:variable>
                <xsl:if test="position() mod 9 = 1">
                    <tr>
                        <td class="list">
                            <a class="content" href="#{dir:xpath}">
                                <xsl:value-of select="dir:xpath"/>
                            </a>
                        </td>
                        <td class="list">
                            <xsl:if test="following::dir:file[1]">
                                <a class="content" href="#{following::dir:file[1]/dir:xpath}">
                                    <xsl:value-of select="following::dir:file[1]/dir:xpath"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::dir:file[2]">
                                <a class="content" href="#{following::dir:file[2]/dir:xpath}">
                                    <xsl:value-of select="following::dir:file[2]/dir:xpath"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::dir:file[3]">
                                <a class="content" href="#{following::dir:file[3]/dir:xpath}">
                                    <xsl:value-of select="following::dir:file[3]/dir:xpath"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::dir:file[4]">
                                <a class="content" href="#{following::dir:file[4]/dir:xpath}">
                                    <xsl:value-of select="following::dir:file[4]/dir:xpath"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::dir:file[5]">
                                <a class="content" href="#{following::dir:file[5]/dir:xpath}">
                                    <xsl:value-of select="following::dir:file[5]/dir:xpath"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::dir:file[6]">
                                <a class="content" href="#{following::dir:file[6]/dir:xpath}">
                                    <xsl:value-of select="following::dir:file[6]/dir:xpath"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::dir:file[7]">
                                <a class="content" href="#{following::dir:file[7]/dir:xpath}">
                                    <xsl:value-of select="following::dir:file[7]/dir:xpath"/>
                                </a>
                            </xsl:if>
                        </td>
                        <td class="list">
                            <xsl:if test="following::dir:file[8]">
                                <a class="content" href="#{following::dir:file[8]/dir:xpath}">
                                    <xsl:value-of select="following::dir:file[8]/dir:xpath"/>
                                </a>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
-->
        </table>
    </xsl:template>

</xsl:stylesheet>