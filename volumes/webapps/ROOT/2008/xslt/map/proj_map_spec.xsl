<?xml version="1.0" ?>
<!--  
    SVN: $Id$      
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="1.1">
    <xsl:template match="ALpubplaces">
        <xsl:if test="0">
            <script type="text/javascript">
                <xsl:text>const markers = [</xsl:text>
                
                <xsl:variable name="apos">'</xsl:variable>
                <xsl:variable name="apos-sub">\'</xsl:variable>
                
                <xsl:for-each select="//ALpubplaces/A_list/pubPlace[string(regName)][string(coordinates/latitude)][string(country)]">
                    <xsl:sort select="country"/>
                    
                    <xsl:variable name="cur-country-name" select="//ALcountries/A_list/countryCode[internal = current()/country]/full"/>
                    <xsl:variable name="cur-site-name" select="regName"/>
                    <xsl:variable name="cur-site-cur-name" select="curName"/>
                    <xsl:variable name="start-txt">
                        <xsl:value-of select="substring($cur-site-name, 1, 1)"/>
                        <xsl:text>a-</xsl:text>
                        <xsl:value-of select="substring($cur-site-name, 1, 1)"/>
                        <xsl:text>z</xsl:text>
                    </xsl:variable>
                    
                    <xsl:text>{</xsl:text>
                    <xsl:text>country: `</xsl:text>
                    <xsl:value-of select="country"/>
                    <xsl:text>`, coords: [</xsl:text>
                    <xsl:value-of select="coordinates/latitude"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="coordinates/longitude"/>
                    <xsl:text>], </xsl:text>
                    
                    <xsl:text>info: `</xsl:text>
                    <xsl:value-of select="$cur-country-name"/> 
                    <br/> 
                    <a class="int" href="content/database/indices/pubPlaces/pubplace/{@id}.html?fieldTxt=pubPlaces&amp;startTxt={$start-txt}&amp;current={@id}&amp;field1Txt={$cur-site-name}">
                    <xsl:value-of select="$cur-site-name"/>
                    <xsl:if test="string(curName)"> 
                        (<xsl:value-of select="translate(curName, $apos, $apos-sub)"/>)
                    </xsl:if>
                    </a>
                    
                    <xsl:if test=".//variant[not(name = $cur-site-name)]">
                        <ul>
                            <xsl:for-each select=".//variant[not(name = $cur-site-name)]">
                                <li><xsl:value-of select="name"/></li>
                            </xsl:for-each>
                        </ul>
                    </xsl:if>
                    <xsl:text>`}, </xsl:text>
                </xsl:for-each>
                
                <xsl:text>];</xsl:text>
             </script>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
