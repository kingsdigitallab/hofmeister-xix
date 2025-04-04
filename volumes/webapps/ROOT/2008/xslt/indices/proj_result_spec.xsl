<?xml version="1.0" ?>
<!--  
    SVN: $Id: proj_result_spec.xsl 997 2008-02-25 12:27:31Z jvieira $          
-->

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:key match="bibl[@id] | wip[@id] | album[@id]" name="class-month" use="substring(@id, 6, 7)"/>


  <xsl:template name="error">
    <p>
      <xsl:text>No records for </xsl:text>
      <xsl:value-of select="$item-regName"/>
    </p>
  </xsl:template>

  <xsl:template name="result-hofclass">
    <h2>
      <xsl:value-of select="$item-regName"/>
    </h2>
    <div class="unorderedList">
      <div class="t05">
        <ul>
          <xsl:for-each select=".//hit">
            <xsl:sort select="@id"/>
            <li>
              <a class="s02" href="{$linkroot}/{$group-type02-path}{substring(id, 6, 7)}.html ">
                <xsl:value-of select="date"/>
              </a>
            </li>
          </xsl:for-each>
        </ul>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="result-hofsubclass">
    <h2>
      <xsl:value-of select="$item-regName"/>
    </h2>
    <div class="unorderedList">
      <div class="t05">
        <ul>
          <xsl:for-each select="//hits/hit">
            <xsl:sort select="id"/>

            <li>
              <a class="s02" href="{$linkroot}/{$group-type02-path}{substring(id, 6, 7)}.html ">
                <xsl:value-of select="date"/>
              </a>
            </li>
          </xsl:for-each>
        </ul>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="result-body">
    <h2>
      <xsl:value-of select="$item-regName"/>
      <xsl:if test="$index = 'pubPlaces'">
        <xsl:if test="//A_list//*[@id = $item-id]/curName[text()]"> (<xsl:value-of
            select="//A_list/*[@id = $item-id]/curName[text()]"/>)</xsl:if>

        <xsl:variable name="country-id"
          select="//index-al/pub-places/A_list/pubPlace[@id = $item-id]/country"/>
        <xsl:variable name="country"
          select="//index-al/countries/A_list/countryCode[internal = $country-id]/@id"/>

        <xsl:if test="string($country)">
          <xsl:text> &lt;</xsl:text>
          <xsl:value-of select="$country"/>
          <xsl:text>&gt;</xsl:text>
        </xsl:if>
      </xsl:if>

      <xsl:if test="$index = 'publishers'">
        <xsl:if test="//A_list/*[@id = $item-id]/curName[text()]"> (<xsl:value-of
            select="//A_list/*[@id = $item-id]/curName[text()]"/>)</xsl:if>

        <xsl:variable name="pub-place" select="//hits//hit//tei//bibl//pubPlace[1]"/>

        <xsl:if test="string($pub-place)">
          <xsl:text> &lt;</xsl:text>
          <xsl:value-of select="$pub-place"/>
          <xsl:text>&gt;</xsl:text>
        </xsl:if>
      </xsl:if>
    </h2>

    <!-- Checks the number of results, when greater than 1000 creates a link to the advanced search -->
    <xsl:if test="//index/total > 1000">
      <xsl:call-template name="link-to-search"/>
    </xsl:if>

    <!-- Link to maps -->
    <xsl:if test="$index = 'pubPlaces'">
      <xsl:variable name="internal-link-path"
        select="//filebase//item[@id = 'map']/parent::*/groupHead/groupFolder"/>
      <xsl:variable name="internal-link-filename" select="//filebase//item[@id = 'map']/fileName"/>
      <p>
        <xsl:choose>
          <xsl:when test="//A_list/*[@id = $item-id]/country[text()]">
            <a class="int"
              href="{$linkroot}/{$internal-link-path}{$internal-link-filename}.html?site-id={$item-id}">
              <xsl:text>Link to map</xsl:text>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>Country Uncertain</xsl:text>
          </xsl:otherwise>
        </xsl:choose>


      </p>
    </xsl:if>

    <div class="table">
      <div class="t01">
        <table title="Table for {$item-regName}">
          <thead>
            <tr class="z01 r01">
              <!-- Column 1 -->
              <xsl:if test="$index = 'pubPlaces'">
                <th>
                  <xsl:call-template name="col-att-pub"/>
                  <xsl:text>Publisher</xsl:text>
                </th>
              </xsl:if>
              <!-- Column 1 / 2 -->
              <xsl:if test="not($index = 'composers')">
                <th>
                  <xsl:call-template name="col-att-comp"/>
                  <xsl:text>Composer</xsl:text>
                </th>
              </xsl:if>
              <!-- Column 1 / 2 / 3 -->
              <th>
                <xsl:call-template name="col-att-title"/>
                <xsl:text>Title</xsl:text>
              </th>
              <!-- Column 2 / 3 -->
              <th>
                <xsl:call-template name="col-att-opus"/>
                <xsl:text>Opus</xsl:text>
              </th>
              <!-- Column 3 / 4 -->
              <xsl:if test="$index = 'composers'">
                <th>
                  <xsl:call-template name="col-att-pub"/>
                  <xsl:text>Publisher</xsl:text>
                </th>
                <th>
                  <xsl:call-template name="col-att-place"/>
                  <xsl:text>Place</xsl:text>
                </th>
              </xsl:if>
              <!-- Column last -->
              <th class="x01">Date</th>
            </tr>
          </thead>
          <tbody>
            <xsl:choose>
              <xsl:when test="$index = 'publishers'">
                <xsl:for-each select=".//hit">
                  <xsl:sort
                    select="concat(descendant::tei//composer[1], descendant::tei//author[1])"/>
                  <xsl:sort select="descendant::tei//title[1]"/>
                  <xsl:sort select="@id"/>
                  <xsl:call-template name="bibl-result"/>
                </xsl:for-each>
              </xsl:when>
              <xsl:when test="$index = 'pubPlaces'">
                <xsl:for-each select=".//hit">
                  <xsl:sort select="descendant::publisher[1]"/>
                  <xsl:sort select="concat(descendant::composer[1], descendant::author[1])"/>
                  <xsl:sort select="descendant::title[1]"/>
                  <xsl:sort select="@id"/>
                  <xsl:call-template name="bibl-result"/>
                </xsl:for-each>
              </xsl:when>
              <xsl:when test="$index = 'composers'">
                <xsl:for-each select=".//hit">
                  <xsl:sort select="descendant::title[1]"/>
                  <xsl:sort select="descendant::publisher[1]"/>
                  <xsl:sort select="descendant::pubPlace[1]"/>
                  <xsl:sort select="id"/>
                  <xsl:call-template name="bibl-result"/>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise> </xsl:otherwise>
            </xsl:choose>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Checks the number of results, when greater than 1000 creates a link to the advanced search -->
    <xsl:if test="//index/total > 1000">
      <xsl:call-template name="link-to-search"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="link-to-search">
    <p>
      <xsl:text>Found </xsl:text>
      <xsl:value-of select="//index/total"/>
      <xsl:text> items. Displaying 1000 items. </xsl:text>

      <xsl:variable name="thesaurusTxt"
        select="substring-after(//index/parameters/parameter[starts-with(., 'thesaurus1Txt')], ':')"/>
      <xsl:variable name="fieldSelect"
        select="substring-after(//index/parameters/parameter[starts-with(., 'field1Sel')], ':')"/>
      <xsl:variable name="fieldTxt"
        select="substring-after(//index/parameters/parameter[starts-with(., 'field1Txt')], ':')"/>

      <a class="int"
        href="{$linkroot}/content/database/search/do-advanced;jsessionid={//session-id}?field1Sel={$fieldSelect}&amp;thesaurus1Txt={$thesaurusTxt}&amp;field1Txt={$fieldTxt}&amp;maxResults=0">
        <xsl:text>Go to search to view all the results.</xsl:text>
      </a>
    </p>
  </xsl:template>

  <!-- Table of results returned -->
  <xsl:template name="bibl-result">
    <tr>
      <!-- Classes for shaded rows and row numbering -->
      <xsl:attribute name="class">
        <xsl:text>z</xsl:text>
        <xsl:choose>
          <xsl:when test="position() mod 2 = 0">
            <xsl:text>01</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>02</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="preceding-sibling::hit">
            <xsl:text> r</xsl:text>
            <xsl:number format="01" value="position() + 1"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text> x02</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <!-- Column 1 -->
      <xsl:if test="$index = 'pubPlaces'">
        <td>
          <xsl:call-template name="col-att-pub"/>
          <xsl:value-of select="descendant::tei//publisher[1]"/>
        </td>
      </xsl:if>
      <!-- Column 1 / 2 -->
      <xsl:if test="not($index = 'composers')">
        <td>
          <xsl:call-template name="col-att-comp"/>
          <xsl:choose>
            <xsl:when test="descendant::tei//composer">
              <xsl:value-of select="descendant::tei//composer[1]"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="descendant::tei//author[1]"/>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </xsl:if>
      <!-- Column 1 / 2 / 3 -->
      <td>
        <xsl:call-template name="col-att-title"/>
        <a class="s02" href="{$linkroot}/{$group-type02-path}{substring(id, 6, 7)}.html#{id}">
          <xsl:value-of select="descendant::tei//title[1]"/>
        </a>
      </td>
      <!-- Column 2 / 3 -->
      <td>
        <xsl:call-template name="col-att-opus"/>
        <xsl:value-of select="descendant::tei//opus[1]"/>
      </td>
      <!-- Column 3 / 4 -->
      <xsl:if test="$index = 'composers'">
        <td>
          <xsl:call-template name="col-att-pub"/>
          <xsl:value-of select="descendant::tei//publisher[1]"/>
        </td>
        <td>
          <xsl:call-template name="col-att-place"/>
          <xsl:value-of select="descendant::tei//pubPlace[1]"/>
        </td>
      </xsl:if>
      <!-- Column last -->
      <td class="x01">
        <xsl:value-of select="date"/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="col-att-pub">
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="$view = 'composers'">
          <xsl:text>c03</xsl:text>
        </xsl:when>
        <xsl:when test="$view = 'pubPlaces'">
          <xsl:text>c01</xsl:text>
        </xsl:when>
        <xsl:otherwise> </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>

  <xsl:template name="col-att-comp">
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="$view = 'publishers'">
          <xsl:text>c01</xsl:text>
        </xsl:when>
        <xsl:when test="$view = 'pubPlaces'">
          <xsl:text>c02</xsl:text>
        </xsl:when>
        <xsl:otherwise> </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>

  <xsl:template name="col-att-title">
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="$view = 'publishers'">
          <xsl:text>c02</xsl:text>
        </xsl:when>
        <xsl:when test="$view = 'composers'">
          <xsl:text>c01</xsl:text>
        </xsl:when>
        <xsl:when test="$view = 'pubPlaces'">
          <xsl:text>c03</xsl:text>
        </xsl:when>
        <xsl:otherwise> </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>

  <xsl:template name="col-att-place">
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="$view = 'composers'">
          <xsl:text>c04</xsl:text>
        </xsl:when>
        <xsl:otherwise> </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>

  <xsl:template name="col-att-opus">
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="$view = 'publishers'">
          <xsl:text>c03</xsl:text>
        </xsl:when>
        <xsl:when test="$view = 'composers'">
          <xsl:text>c02</xsl:text>
        </xsl:when>
        <xsl:otherwise> </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="html/head/title"> </xsl:template>
</xsl:stylesheet>
