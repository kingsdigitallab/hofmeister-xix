<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output indent="yes"/>

    <xsl:key name="nonletter" match="regName" use="translate(normalize-space(.), '’-&gt;&lt; &amp;ABCDEFGHIJKLMNOPQRSTUVWXYZ(),.abcdefghijklmnopqrstuvwxyz', '')"/>

<xsl:template match="/">
    <nonletter>        
        <xsl:for-each select="//regName[generate-id(.)=generate-id(key('nonletter', translate(normalize-space(.), '’-&gt;&lt; &amp;„“ABCDEFGHIJKLMNOPQRSTUVWXYZ(),.abcdefghijklmnopqrstuvwxyz', ''))[1])]">
        <xsl:value-of select="translate(normalize-space(.), '’-&gt;&lt; &amp;ABCDEFGHIJKLMNOPQRSTUVWXYZ(),.abcdefghijklmnopqrstuvwxyz', '')"/>
    </xsl:for-each>
    </nonletter>    
</xsl:template>
</xsl:stylesheet>
