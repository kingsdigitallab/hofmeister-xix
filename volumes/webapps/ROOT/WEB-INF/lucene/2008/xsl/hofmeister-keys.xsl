<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:excel="urn:schemas-microsoft-com:office:spreadsheet"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" />

  <xsl:template match="/">
    <lucene-document id="key-thesaurus">
      <header>
        <tei> </tei>
      </header>
      <fields>
        <xsl:for-each-group group-by="." select="//excel:Row/excel:Cell[2]">
          <xsl:variable name="reg-name" select="current-grouping-key()" />
          
          <field indexed="un-tokenized" name="key-thesaurus" stored="yes" vector="no">
            <xsl:value-of select="lower-case($reg-name)" />
            <xsl:text>#</xsl:text>
            <xsl:value-of select="$reg-name" />
            <xsl:text>#</xsl:text>
            <xsl:for-each select="//excel:Row/excel:Cell[1][../excel:Cell[2] = current-grouping-key()]">
              <xsl:value-of select="lower-case(.)" />
              
              <xsl:if test="position() != last()">
                <xsl:text>,</xsl:text>
              </xsl:if>
            </xsl:for-each>
          </field>
        </xsl:for-each-group>
      </fields>
    </lucene-document>
  </xsl:template>
</xsl:stylesheet>
