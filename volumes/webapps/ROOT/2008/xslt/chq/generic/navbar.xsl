<?xml version="1.0" encoding="UTF-8"?>
  <!--
      XSLT for Navigation authority list 
      SVN: $Id: navbar.xsl 685 2007-04-30 11:14:48Z zau $
  -->
  
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">

    <!-- Main template -->
    <xsl:template name="ctpl_navbar">
        <h1 class="content">Navbar Structure</h1>
        <xsl:apply-templates select=".//layout"/>
    </xsl:template>
    
    <!-- simple templates -->
    <xsl:template match="layout">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="line">
        <hr style="height: 10px; border: 0; color: #000; background-color: #000;"/>
    </xsl:template>

    <xsl:template match="heading">
        <table cellspacing="0" cellpadding="5" class="head">
            <tr>
                <th class="head" valign="bottom">Heading:</th>
                <td width="60%">
                    <b>
                        <xsl:apply-templates/>
                    </b>
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="break">
        <table cellspacing="0" cellpadding="5" class="detail">
            <tr>
                <th class="subsid" valign="bottom">Break: </th>
                <td valign="bottom">
                    <xsl:apply-templates select="@height"/>
                </td>
            </tr>
        </table>
        <br/>
    </xsl:template>

    <!-- Templates for the different levels -->
    <xsl:template match="level01">
        <div class="level1">
            <table cellspacing="3" cellpadding="6" class="group">
                <tr>
                    <th valign="center">
                        <h3>1</h3>
                    </th>
                    <xsl:call-template name="ctpl_item_info"/>
                </tr>
            </table>
        </div>
        <xsl:if test="./active">
            <div class="level2">
                <xsl:call-template name="ctpl_active"/>
            </div>
        </xsl:if>
        <xsl:if test="./sub02">
            <xsl:apply-templates select=".//level02"/>
        </xsl:if>
    </xsl:template>


    <xsl:template match="level02">
        <div class="level2">
            <table cellspacing="3" cellpadding="6" class="group">
                <tr>
                    <th valign="center">
                        <h3>2</h3>
                    </th>
                    <xsl:call-template name="ctpl_item_info"/>
                </tr>
            </table>
        </div>
        <xsl:if test="./active">
            <div class="level3">
                <xsl:call-template name="ctpl_active"/>
            </div>
        </xsl:if>
        <xsl:if test="./sub03">
            <xsl:apply-templates select=".//level03"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="level03">
        <div class="level3">
            <table cellspacing="3" cellpadding="6" class="group">
                <tr>
                    <th valign="center">
                        <h3>3</h3>
                    </th>
                    <xsl:call-template name="ctpl_item_info"/>
                </tr>
            </table>
        </div>
        <xsl:if test="./active">
            <div class="level4">
                <xsl:call-template name="ctpl_active"/>
            </div>
        </xsl:if>
        <xsl:if test="./sub04">
            <xsl:apply-templates select=".//level04"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="level04">
        <div class="level4">
            <table cellspacing="3" cellpadding="6" class="group">
                <tr>
                    <th valign="center">
                        <h3>4</h3>
                    </th>
                    <xsl:call-template name="ctpl_item_info"/>
                </tr>
            </table>
        </div>
        <xsl:if test="./active">
            <div class="level5">
                <xsl:call-template name="ctpl_active"/>
            </div>
        </xsl:if>
    </xsl:template>

    <!-- Call templates -->
    <!-- Item information -->
    <xsl:template name="ctpl_item_info">
        <td width="60%">
            <p>
                <xsl:choose>
                    <xsl:when test="not(label)">
                        <span class="warning2">no label</span>
                        <br/>
                    </xsl:when>
                    <xsl:when test="not(string(label))">
                        <span class="warning2">no label</span>
                        <br/>
                    </xsl:when>
                    <xsl:otherwise> [label] <b>
                        <xsl:value-of select="label"/>
                    </b><br/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>[default] </xsl:text>
                <xsl:if test="not(//filebase//item[@id=current()/default/@ref]/fileName)">
                    <span class="warning2">not in fileBase: </span>
                    <br/>
                </xsl:if>
                <xsl:value-of select="default/@ref"/>
            </p>
        </td>
    </xsl:template>
    
    <!-- Active information -->
    <xsl:template name="ctpl_active">
        <table cellspacing="0" cellpadding="5" class="detail">
            <tr>
                <th class="subsid" width="40%" rowspan="2">active</th>
                <xsl:if test="./active/file/@ref">
                    <th class="subsid">@ref</th>
                </xsl:if>
                <xsl:if test="./active/file/@start">
                    <th class="subsid">@start</th>
                </xsl:if>
                <xsl:if test="not(./active/file[@start or @ref])">
                    <td rowspan="2" class="warning">no @ref or @start</td>
                </xsl:if>
            </tr>
            <tr>
                <xsl:if test="./active/file/@ref">
                    <td valign="top" align="center">
                        <xsl:for-each select="./active/file/@ref">
                            <xsl:value-of select="."/>
                            <br/>
                        </xsl:for-each>
                    </td>
                </xsl:if>
                <xsl:if test="./active/file/@start">
                    <td valign="top" align="center">
                        <xsl:for-each select="./active/file/@start">
                            <xsl:value-of select="."/>
                            <br/>
                        </xsl:for-each>
                    </td>
                </xsl:if>
            </tr>
        </table>
    </xsl:template>
    
    
</xsl:stylesheet>