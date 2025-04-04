<?xml version="1.0" ?>
<!--  
    SVN: $Id: proj_country_spec.xsl 933 2007-10-30 16:38:20Z jvieira $          
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">

  <xsl:key name="country-key" match="country" use="."/>

  <xsl:template name="country-list">
    <div class="unorderedList">
      <div class="t05">
        <ul>
          <xsl:for-each select="//country[generate-id(.)=generate-id(key('country-key', .)[1])]">
            <xsl:sort select="//ALcountries//countryCode[internal = current()]/full"/>
            <li>
              <a href="{$index}/{.}.html">
                <xsl:value-of select="//ALcountries//countryCode[internal = current()]/full"/>
              </a>
            </li>
          </xsl:for-each>
        </ul>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="place-list">
    <xsl:for-each select="//country[generate-id(.)=generate-id(key('country-key', .)[1])]">
      <xsl:if test="$item-id = .">
        <div class="unorderedList">
          <div class="t05">
            <ul>
              <xsl:for-each select="key('country-key', .)">
                <xsl:sort
                  select="translate(preceding-sibling::regName, $regNameBefore, $regNameAfter)"/>
                <li>
                  <xsl:variable name="l" select="substring(preceding-sibling::regName, 1, 1)" />
                  
                  <a href="../pubPlaces/pubplace/{parent::pubPlace/@id}.html?fieldTxt=pubPlaces&amp;startTxt={$l}a-{$l}z&amp;current={parent::pubPlace/@id}&amp;field1Txt={preceding-sibling::regName}">
                    <xsl:value-of select="preceding-sibling::regName"/>
                  </a>
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </div>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
