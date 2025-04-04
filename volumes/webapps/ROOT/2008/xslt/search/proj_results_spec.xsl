<?xml version="1.0" ?>
<!--  
    SVN: $Id: proj_basic_spec.xsl 390 2007-03-22 14:37:17Z jvieira $          
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.1">
  <xsl:output indent="yes" />

  <xsl:template name="tpl-xsp-results">
    <xsl:choose>
      <xsl:when test="string(//search-results/error)"> </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="total" select="//search-results/total" />
        <xsl:variable name="hits" select="//search-results/size" />

        <xsl:choose>
          <xsl:when test="$total">
            <xsl:choose>
              <xsl:when test="$total > $hits">
                <p>
                  <xsl:text>Found </xsl:text>
                  <xsl:value-of select="$total" />
                  <xsl:text> item(s). Displaying </xsl:text>
                  <xsl:value-of select="$hits" />
                  <xsl:text> item(s):</xsl:text>
                </p>
              </xsl:when>
              <xsl:otherwise>
                <p>
                  <xsl:text>Found </xsl:text>
                  <xsl:value-of select="$total" />
                  <xsl:text> item(s):</xsl:text>
                </p>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <p>
              <xsl:text>Found </xsl:text>
              <xsl:value-of select="$hits" />
              <xsl:text> item(s):</xsl:text>
            </p>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name="tpl-xsp-display-results" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="tpl-xsp-display-results">
    <!-- ## COMPLEX LIST ## -->
    <div class="complexList">
      <div class="t01">
        <ul class="clfx-b">
          <xsl:choose>
            <xsl:when test="string($listSelect) or starts-with(//search-results/search-link, 'list')">
              <xsl:variable name="listSelect" select="substring-after(//search-results/parameters/parameter[starts-with(., 'listSelect')], ':')" />
              
              <xsl:variable name="whereSelect" select="substring-after(//search-results/parameters/parameter[starts-with(., 'whereSelect')], ':')" />
              <xsl:variable name="thesaurus1Txt" select="substring-after(//search-results/parameters/parameter[starts-with(., 'thesaurus1Txt')], ':')" />
              <xsl:variable name="field1Txt" select="substring-after(//search-results/parameters/parameter[starts-with(., 'field1Txt')], ':')" />
              
              <xsl:variable name="exceptSelect" select="substring-after(//search-results/parameters/parameter[starts-with(., 'exceptSelect')], ':')" />
              <xsl:variable name="thesaurus2Txt" select="substring-after(//search-results/parameters/parameter[starts-with(., 'thesaurus2Txt')], ':')" />
              <xsl:variable name="field2Txt" select="substring-after(//search-results/parameters/parameter[starts-with(., 'field2Txt')], ':')" />
              
              <xsl:variable name="lowerDateYear" select="substring-after(//search-results/parameters/parameter[starts-with(., 'lowerDateYear')], ':')" />
              <xsl:variable name="higherDateYear" select="substring-after(//search-results/parameters/parameter[starts-with(., 'higherDateYear')], ':')" />
              
              <xsl:variable name="maxResults" select="substring-after(//search-results/parameters/parameter[starts-with(., 'list-max-results')], ':')" />
              <xsl:variable name="sortKey1" select="substring-after(//search-results/parameters/parameter[starts-with(., 'sortKey1')], ':')" />
              
              <!-- 0001962 -->
              <!--
              <xsl:variable name="sortKey2" select="substring-after(//search-results/parameters/parameter[starts-with(., 'sortKey2')], ':')" />
              <xsl:variable name="sortKey3" select="substring-after(//search-results/parameters/parameter[starts-with(., 'sortKey3')], ':')" />
              -->
              
              <xsl:for-each select="//search-results/hits/hit">
                <xsl:variable name="key">
                  <xsl:choose>
                    <xsl:when test="$listSelect = 'title'"> </xsl:when>
                    <xsl:otherwise>
                      <xsl:choose>
                        <xsl:when test="contains(key, '_____')">
                          <xsl:value-of select="substring-after(key, '_____')" />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="key" />                          
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>
                <xsl:variable name="value" select="value" />

                <li>
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="@position mod 2 = 0">clfx-b z02</xsl:when>
                      <xsl:otherwise>clfx-b z01</xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <label>
                    <xsl:value-of select="@position" />
                  </label>
                  <ul>
                    <li class="s01">
                      <xsl:value-of select="$value" />
                    </li>
                    <li class="s02">
                      <xsl:value-of select="count" />
                    </li>
                  </ul>
                  <ul class="s01">
                    <li>
                      <a
                        href="do-basic;jsessionid={//session-id}?listSearchLink=list&amp;field1Sel={$listSelect}&amp;thesaurus1Txt={$key}&amp;field1Txt={$value}&amp;field2Sel={$whereSelect}&amp;thesaurus2Txt={$thesaurus1Txt}&amp;field2Txt={$field1Txt}&amp;fieldExceptSel={$exceptSelect}&amp;thesaurusExceptTxt={$thesaurus2Txt}&amp;fieldExceptTxt={$field2Txt}&amp;lowerDate={$lowerDateYear}&amp;higherDate={$higherDateYear}&amp;maxResults={$maxResults}&amp;sortKey1={$sortKey1}"
                        class="intNew" title="View Results">
                        <span>View Results</span>
                      </a>
                    </li>
                  </ul>
                </li>
              </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
              <xsl:for-each select="//search-results/hits/hit">
                <xsl:variable name="id">
                  <xsl:choose>
                    <xsl:when test="contains(id, '.')">
                      <xsl:value-of select="substring-before(id, '.')" />
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="id" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>
                
                <li>
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="@position mod 2 = 0">clfx-b z02</xsl:when>
                      <xsl:otherwise>clfx-b z01</xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <label>
                    <xsl:value-of select="@position" />
                  </label>
                  <ul>
                    <li class="s01">
                      <xsl:choose>
                        <xsl:when test="tei//head">
                          <xsl:apply-templates select="tei//head/following-sibling::node()" />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:apply-templates select="tei/node()" />                          
                        </xsl:otherwise>
                      </xsl:choose>
                    </li>
                    <li class="s02">
                      <xsl:value-of select="date" />
                    </li>
                    <li class="s03">
                      <xsl:text>Page </xsl:text>
                      <xsl:value-of select="page-number" />
                    </li>
                  </ul>
                  <ul class="s01">
                    <li>
                      <a href="{$linkroot}/{$group-type02-path}{substring($id, 6, 7)}.html#{$id}" class="intNew" rel="external"
                        title="View Transcription (opens in a new window)">
                        <span>View Transcription</span>
                      </a>
                    </li>
                    <li>
                      <xsl:choose>
                        <xsl:when test="string(page-number-ed) and page-number-ed != 'null'">
                          <xsl:call-template name="onb">
                            <xsl:with-param name="id" select="substring($id, 1, 12)" />
                            <xsl:with-param name="pb" select="page-number" />
                            <xsl:with-param name="page-number-ed" select="page-number-ed" />
                          </xsl:call-template>    
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="onb">
                            <xsl:with-param name="id" select="substring($id, 1, 12)" />
                            <xsl:with-param name="pb" select="page-number" />
                          </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                    </li>
                    <li />
                  </ul>
                </li>
              </xsl:for-each>
            </xsl:otherwise>
          </xsl:choose>
        </ul>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="highlight">
    <span class="s01">
      <xsl:value-of select="." />
    </span>
  </xsl:template>

  <xsl:template name="onb">
    <!-- Double pages won't work, @ed will need to be passed from xml into db -->
    <xsl:param name="id" />
    <xsl:param name="pb" />
    <xsl:param name="page-number-ed" />
    
    <xsl:variable name="onb-main">
      <xsl:text>http://anno.onb.ac.at/cgi-content/anno-buch?apm=0&amp;aid=1000001</xsl:text>
    </xsl:variable>
    <xsl:variable name="b-year">
      <xsl:value-of select="substring($id, 6, 4)" />
    </xsl:variable>
    <xsl:variable name="onb-year">
      <xsl:text>&amp;bd=</xsl:text>
      <xsl:number value="$b-year" format="0000001" />
    </xsl:variable>
    <xsl:variable name="onb-mid">
      <xsl:text>&amp;teil=0203</xsl:text>
    </xsl:variable>
    <!--
            <xsl:variable name="b-mth">
            <xsl:value-of select="substring($id, 11, 2)" />
            </xsl:variable>
        -->
    <xsl:variable name="b-pb">
      <xsl:choose>
        <xsl:when test="string($page-number-ed)">
          <xsl:choose>
            <xsl:when test="contains($page-number-ed, '/')">
              <xsl:value-of select="substring-before(substring-after($page-number-ed, 'ONB:'), '/')" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring-after($page-number-ed, 'ONB:')" />              
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$pb" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="onb-pb">
      <xsl:text>&amp;seite=</xsl:text>
      <xsl:number value="$b-pb" format="00000001" />
    </xsl:variable>
    <xsl:variable name="onb-pb-2">
      <xsl:choose>
        <xsl:when test="string($page-number-ed)">
          <xsl:number value="substring-after($page-number-ed, '/')" format="00000001" />
        </xsl:when>
        <xsl:otherwise />
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="onb-end">
      <xsl:text>&amp;zoom=1</xsl:text>
    </xsl:variable>
    <a class="extNew" rel="external" title="View Facsimile (opens in a new window)">
      <xsl:attribute name="href">
        <xsl:value-of select="$onb-main" />
        <xsl:value-of select="$onb-year" />
        <xsl:value-of select="$onb-mid" />
        <xsl:value-of select="$onb-pb" />
        <xsl:value-of select="$onb-pb-2" />
        <xsl:value-of select="$onb-end" />
      </xsl:attribute>
      <span>View Facsimile</span>
    </a>
  </xsl:template>
</xsl:stylesheet>
