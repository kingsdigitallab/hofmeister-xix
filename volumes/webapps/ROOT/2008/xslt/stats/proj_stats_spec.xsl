<?xml version="1.0" ?>
<!--
SVN: $Id: proj_stats_spec.xsl 695 2007-04-30 14:22:40Z zau $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
  <xsl:template name="tbl-works">
    <div class="table">
      <div class="t01">
        <table>
          <thead>
            <tr class="z01 r01">
              <th class="c01">
                <xsl:text>Overview</xsl:text>
              </th>
              <th class="x01">
                <xsl:text>Total</xsl:text>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr class="z02 r02">
              <td class="c01">
                <xsl:text>Number of entries</xsl:text>
              </td>
              <td class="x01">
                <xsl:value-of
                  select="//item[@name='bibl']/@total + //item[@name='album']/@total + //item[@name='wip']/@total"
                />
              </td>
            </tr>
            <tr class="z01 r03">
              <td class="c01">
                <xsl:text>Number of pages</xsl:text>
              </td>
              <td class="x01">
                <xsl:value-of select="//item[@name='pb']/@total"/>
              </td>
            </tr>
            <tr class="z02 x02">
              <td class="c01">
                <xsl:text>Word Count</xsl:text>
              </td>
              <td class="x01">
                <xsl:text>8,055,556</xsl:text>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="tbl-items">
    <div class="table">
      <div class="t01">
        <table>
          <thead>
            <tr class="z01 r01">
              <th class="c01">
                <xsl:text>Content</xsl:text>
              </th>
              <th class="c02">
                <xsl:text>Total</xsl:text>
              </th>
              <th class="c03">
                <xsl:text>Unique</xsl:text>
              </th>
              <th class="x01">
                <xsl:text>With thesaurus</xsl:text>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr class="z02 r02">
              <td class="c01">
                <xsl:text>Number of composers</xsl:text>
              </td>
              <td class="c02">
                <xsl:value-of select="//item[@name='composer']/@total"/>
              </td>
              <td class="c03">
                <xsl:value-of select="//item[@name='composer']/@unique"/>
              </td>
              <td class="x01">
                <xsl:value-of select="//item[@name='composer']/@thesaurus"/>
              </td>
            </tr>
            <tr class="z01 r03">
              <td class="c01">
                <xsl:text>Number of publishers</xsl:text>
              </td>
              <td class="c02">
                <xsl:value-of select="//item[@name='publisher']/@total"/>
              </td>
              <td class="c03">
                <xsl:value-of select="//item[@name='publisher']/@unique"/>
              </td>
              <td class="x01">
                <xsl:value-of select="//item[@name='publisher']/@thesaurus"/>
              </td>
            </tr>
            <tr class="z02 r04">
              <td class="c01">
                <xsl:text>Number of publication places</xsl:text>
              </td>
              <td class="c02">
                <xsl:value-of select="//item[@name='pubPlace']/@total"/>
              </td>
              <td class="c03">
                <xsl:value-of select="//item[@name='pubPlace']/@unique"/>
              </td>
              <td class="x01">
                <xsl:value-of select="//item[@name='pubPlace']/@thesaurus"/>
              </td>
            </tr>
            <tr class="z01 r05">
              <td class="c01">
                <xsl:text>Number of classifications</xsl:text>
              </td>
              <td class="c02">
                <xsl:value-of select="//item[@name='hofclass']/@total"/>
              </td>
              <td class="c03">
                <xsl:text>-</xsl:text>
              </td>
              <td class="x01">
                <xsl:value-of select="count(//A_list/hofClass)"/>
              </td>
            </tr>
            <tr class="z02 r06">
              <td class="c01">
                <xsl:text>Number of countries (present day boundaries)</xsl:text>
              </td>
              <td class="c02">
                <xsl:text>-</xsl:text>
              </td>
              <td class="c03">
                <xsl:text>-</xsl:text>
              </td>
              <td class="x01">
                <xsl:value-of select="//item[@name='countries']/@thesaurus"/>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
