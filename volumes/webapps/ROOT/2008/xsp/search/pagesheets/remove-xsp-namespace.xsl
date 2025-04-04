<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xsp xsp-session" version="1.0" xmlns="http://apache.org/cocoon/paginate/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsp="http://apache.org/xsp" xmlns:xsp-session="http://apache.org/xsp/session/2.0">
  <xsl:output indent="yes" />

  <xsl:template match="/">
    <pagesheet>
      <rules>
        <count name="hit" num="{normalize-space(//page/page-size)}" type="element" />
        <link num="{normalize-space(//page/page-size)}" type="unit" />
      </rules>
    </pagesheet>
  </xsl:template>
</xsl:stylesheet>
