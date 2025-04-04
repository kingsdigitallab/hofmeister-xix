<?xml version="1.0" ?>
<!--  
    SVN: $Id: proj_basic_spec.xsl 390 2007-03-22 14:37:17Z jvieira $          
-->

<xsl:stylesheet version="1.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" />

  <xsl:template name="tpl-search-basic-form">
    <div class="form">
      <div class="t02">
        <form action="do-basic" id="frmSearch" method="POST" name="frmSearch">
          <fieldset class="s01">
            <legend>Use Thesaurus Button or Type in Text</legend>
            <ol>
              <li class="clfx-b">
                <fieldset class="f05 n01">
                  <legend>Primary Search Criteria</legend>
                  <label for="field1Sel">Search for:</label>

                  <xsl:variable name="selected">
                    <xsl:choose>
                      <xsl:when test="//refine/parameters/parameter[starts-with(., 'field1Sel')] != ''">
                        <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'field1Sel')], ':')" />
                      </xsl:when>
                      <xsl:otherwise>composer</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <select id="field1Sel" name="field1Sel"
                    onchange="toggleEnable(document.forms.frmSearch.field1Sel.options[document.forms.frmSearch.field1Sel.selectedIndex].value, document.forms.frmSearch.field1Txt);">
                    <xsl:call-template name="tpl-basic-select">
                      <xsl:with-param name="selected" select="$selected" />
                    </xsl:call-template>
                  </select>
                  <a class="s01"
                    href="javascript:openThesaurus(1, document.forms.frmSearch.field1Sel.options[document.forms.frmSearch.field1Sel.selectedIndex].value);"
                    title="Look up a search term in the thesaurus">
                    <span>Thesaurus...</span>
                  </a>
                  <input name="thesaurus1Txt" type="hidden">
                    <xsl:attribute name="value">
                      <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'thesaurus1Txt')], ':')" />
                    </xsl:attribute>
                  </input>

                  <xsl:variable name="field-value">
                    <xsl:choose>
                      <xsl:when test="//refine/parameters/parameter[starts-with(., 'field1Txt')] != ''">
                        <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'field1Txt')], ':')" />
                      </xsl:when>
                      <xsl:otherwise>Filled from Thesaurus</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>
                  <xsl:variable name="class">
                    <xsl:choose>
                      <xsl:when test="$selected = 'title'">f01</xsl:when>
                      <xsl:otherwise>f01 s01</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <input class="{$class}" id="field1Txt" name="field1Txt" onchange="document.forms.frmSearch.thesaurus1Txt.value = '';" type="text"
                    value="{$field-value}">
                    <xsl:if test="not($selected = 'title')">
                      <xsl:attribute name="readOnly">readonly</xsl:attribute>
                    </xsl:if>
                  </input>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f05 n02">
                  <legend>Secondary Search Criteria</legend>
                  <label for="field2Sel">and</label>

                  <xsl:variable name="selected">
                    <xsl:choose>
                      <xsl:when test="//refine/parameters/parameter[starts-with(., 'field2Sel')] != ''">
                        <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'field2Sel')], ':')" />
                      </xsl:when>
                      <xsl:otherwise>title</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <select id="field2Sel" name="field2Sel"
                    onchange="toggleEnable(document.forms.frmSearch.field2Sel.options[document.forms.frmSearch.field2Sel.selectedIndex].value, document.forms.frmSearch.field2Txt);">
                    <xsl:value-of select="$selected" />
                    <xsl:call-template name="tpl-basic-select">
                      <xsl:with-param name="selected" select="$selected" />
                    </xsl:call-template>
                  </select>
                  <a class="s01"
                    href="javascript:openThesaurus(2, document.forms.frmSearch.field2Sel.options[document.forms.frmSearch.field2Sel.selectedIndex].value);"
                    title="Look up a search term in the thesaurus">
                    <span>Thesaurus...</span>
                  </a>
                  <input name="thesaurus2Txt" type="hidden">
                    <xsl:attribute name="value">
                      <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'thesaurus2Txt')], ':')" />
                    </xsl:attribute>
                  </input>

                  <xsl:variable name="field-value">
                    <xsl:choose>
                      <xsl:when test="//refine/parameters/parameter[starts-with(., 'field2Txt')] != ''">
                        <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'field2Txt')], ':')" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:if test="$selected != 'title'">Filled from Thesaurus</xsl:if>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>
                  <xsl:variable name="class">
                    <xsl:choose>
                      <xsl:when test="$selected = 'title'">f01</xsl:when>
                      <xsl:otherwise>f01 s01</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>
                  <input class="{$class}" id="field2Txt" name="field2Txt" onchange="document.forms.frmSearch.thesaurus2Txt.value = '';" type="text"
                    value="{$field-value}">
                    <xsl:if test="not($selected = 'title')">
                      <xsl:attribute name="readOnly">readonly</xsl:attribute>
                    </xsl:if>
                  </input>
                  <label class="s02" for="select2ID">(optional)</label>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f06 n03">
                  <legend>Date Range</legend>
                  <label class="s01" for="select3ID">from</label>
                  <select id="select3ID" name="lowerDate">
                    <xsl:call-template name="tpl-year">
                      <xsl:with-param name="year" select="substring-after(//parameters//parameter[starts-with(., 'lowerDate')], ':')" />
                    </xsl:call-template>
                  </select>
                  <label class="s01" for="select4ID">to</label>
                  <select id="select4ID" name="higherDate">
                    <xsl:call-template name="tpl-year">
                      <xsl:with-param name="year" select="substring-after(//parameters//parameter[starts-with(., 'higherDate')], ':')" />
                    </xsl:call-template>
                  </select>
                  <label class="s02" for="select4ID">(optional)</label>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f06 n04">
                  <legend>Submit Search</legend>
                  <div>
                    <button type="submit">Search</button>
                    <button onclick="location.href='basic.html';" type="reset">Reset Form</button>
                  </div>
                </fieldset>
              </li>
            </ol>
          </fieldset>
        </form>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="tpl-basic-select">
    <xsl:param name="selected" />

    <option value="composer"><xsl:if test="$selected = 'composer'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Composer</option>
    <option value="title"><xsl:if test="$selected = 'title'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Title</option>
    <option value="publisher"><xsl:if test="$selected = 'publisher'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Publisher</option>
    <option value="pubplace"><xsl:if test="$selected = 'pubplace'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Publication Place</option>
    <option value="country"><xsl:if test="$selected = 'country'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Country</option>
  </xsl:template>

  <xsl:template name="tpl-year">
    <xsl:param name="year" />

    <option value="">Year...</option>
    <option value="1829"><xsl:if test="$year = '1829'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1829</option>
    <option value="1830"><xsl:if test="$year = '1830'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1830</option>
    <option value="1831"><xsl:if test="$year = '1831'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1831</option>
    <option value="1832"><xsl:if test="$year = '1832'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1832</option>
    <option value="1833"><xsl:if test="$year = '1833'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1833</option>
    <option value="1834"><xsl:if test="$year = '1834'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1834</option>
    <option value="1835"><xsl:if test="$year = '1835'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1835</option>
    <option value="1836"><xsl:if test="$year = '1836'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1836</option>
    <option value="1837"><xsl:if test="$year = '1837'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1837</option>
    <option value="1838"><xsl:if test="$year = '1838'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1838</option>
    <option value="1839"><xsl:if test="$year = '1839'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1839</option>
    <option value="1840"><xsl:if test="$year = '1840'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1840</option>
    <option value="1841"><xsl:if test="$year = '1841'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1841</option>
    <option value="1842"><xsl:if test="$year = '1842'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1842</option>
    <option value="1843"><xsl:if test="$year = '1843'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1843</option>
    <option value="1844"><xsl:if test="$year = '1844'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1844</option>
    <option value="1845"><xsl:if test="$year = '1845'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1845</option>
    <option value="1846"><xsl:if test="$year = '1846'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1846</option>
    <option value="1847"><xsl:if test="$year = '1847'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1847</option>
    <option value="1848"><xsl:if test="$year = '1848'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1848</option>
    <option value="1849"><xsl:if test="$year = '1849'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1849</option>
    <option value="1850"><xsl:if test="$year = '1850'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1850</option>
    <option value="1851"><xsl:if test="$year = '1851'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1851</option>
    <option value="1852"><xsl:if test="$year = '1852'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1852</option>
    <option value="1853"><xsl:if test="$year = '1853'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1853</option>
    <option value="1854"><xsl:if test="$year = '1854'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1854</option>
    <option value="1855"><xsl:if test="$year = '1855'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1855</option>
    <option value="1856"><xsl:if test="$year = '1856'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1856</option>
    <option value="1857"><xsl:if test="$year = '1857'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1857</option>
    <option value="1858"><xsl:if test="$year = '1858'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1858</option>
    <option value="1859"><xsl:if test="$year = '1859'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1859</option>
    <option value="1860"><xsl:if test="$year = '1860'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1860</option>
    <option value="1861"><xsl:if test="$year = '1861'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1861</option>
    <option value="1862"><xsl:if test="$year = '1862'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1862</option>
    <option value="1863"><xsl:if test="$year = '1863'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1863</option>
    <option value="1864"><xsl:if test="$year = '1864'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1864</option>
    <option value="1865"><xsl:if test="$year = '1865'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1865</option>
    <option value="1866"><xsl:if test="$year = '1866'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1866</option>
    <option value="1867"><xsl:if test="$year = '1867'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1867</option>
    <option value="1868"><xsl:if test="$year = '1868'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1868</option>
    <option value="1869"><xsl:if test="$year = '1869'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1869</option>
    <option value="1870"><xsl:if test="$year = '1870'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1870</option>
    <option value="1871"><xsl:if test="$year = '1871'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1871</option>
    <option value="1872"><xsl:if test="$year = '1872'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1872</option>
    <option value="1873"><xsl:if test="$year = '1873'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1873</option>
    <option value="1874"><xsl:if test="$year = '1874'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1874</option>
    <option value="1875"><xsl:if test="$year = '1875'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1875</option>
    <option value="1876"><xsl:if test="$year = '1876'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1876</option>
    <option value="1877"><xsl:if test="$year = '1877'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1877</option>
    <option value="1878"><xsl:if test="$year = '1878'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1878</option>
    <option value="1879"><xsl:if test="$year = '1879'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1879</option>
    <option value="1880"><xsl:if test="$year = '1880'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1880</option>
    <option value="1881"><xsl:if test="$year = '1881'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1881</option>
    <option value="1882"><xsl:if test="$year = '1882'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1882</option>
    <option value="1883"><xsl:if test="$year = '1883'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1883</option>
    <option value="1884"><xsl:if test="$year = '1884'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1884</option>
    <option value="1885"><xsl:if test="$year = '1885'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1885</option>
    <option value="1886"><xsl:if test="$year = '1886'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1886</option>
    <option value="1887"><xsl:if test="$year = '1887'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1887</option>
    <option value="1888"><xsl:if test="$year = '1888'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1888</option>
    <option value="1889"><xsl:if test="$year = '1889'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1889</option>
    <option value="1890"><xsl:if test="$year = '1890'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1890</option>
    <option value="1891"><xsl:if test="$year = '1891'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1891</option>
    <option value="1892"><xsl:if test="$year = '1892'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1892</option>
    <option value="1893"><xsl:if test="$year = '1893'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1893</option>
    <option value="1894"><xsl:if test="$year = '1894'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1894</option>
    <option value="1895"><xsl:if test="$year = '1895'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1895</option>
    <option value="1896"><xsl:if test="$year = '1896'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1896</option>
    <option value="1897"><xsl:if test="$year = '1897'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1897</option>
    <option value="1898"><xsl:if test="$year = '1898'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1898</option>
    <option value="1899"><xsl:if test="$year = '1899'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1899</option>
    <option value="1900"><xsl:if test="$year = '1900'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1900</option>
  </xsl:template>

  <xsl:template name="tpl-search-free-text-form">
    <div class="form">
      <div class="t03">
        <form action="do-free-text" id="frmSearch" method="POST" name="frmSearch">
          <fieldset class="s03">
            <legend>Type in Text</legend>
            <ol>
              <li class="clfx-b">
                <fieldset class="f12 n01">
                  <legend>Primary Search Criteria</legend>
                  <label for="field1Txt">Search for:</label>
                  <input class="f01" id="field1Txt" name="field1Txt" type="text"
                    value="{substring-after(//refine/parameters/parameter[starts-with(., 'field1Txt')], ':')}" />

                  <fieldset>
                    <xsl:variable name="searchMode">
                      <xsl:choose>
                        <xsl:when test="//refine/parameters/parameter[starts-with(., 'searchMode')] != ''">
                          <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'searchMode')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>all</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <legend>Search Mode</legend>
                    <ol>
                      <li class="clfx-b">
                        <input class="f02" id="all" name="searchMode" type="radio" value="all">
                          <xsl:if test="$searchMode = 'all'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="all">All Words</label>
                      </li>
                      <li class="clfx-b">
                        <input class="f02" id="any" name="searchMode" type="radio" value="any">
                          <xsl:if test="$searchMode = 'any'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="any">At least one word</label>
                      </li>
                      <li class="clfx-b">
                        <input class="f02" name="searchMode" type="radio" value="exact">
                          <xsl:if test="$searchMode = 'exact'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="exact">Exact Search</label>
                      </li>
                    </ol>
                  </fieldset>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f11 n02">
                  <legend>Date Range</legend>
                  <label class="s01" for="startMonthID">from</label>
                  <select id="startMonthID" name="lowerDateMonth">
                    <xsl:call-template name="tpl-month">
                      <xsl:with-param name="month" select="substring-after(//parameters//parameter[starts-with(., 'lowerDateMonth')], ':')" />
                    </xsl:call-template>
                  </select>
                  <select id="startYearID" name="lowerDateYear">
                    <xsl:call-template name="tpl-year">
                      <xsl:with-param name="year" select="substring-after(//parameters//parameter[starts-with(., 'lowerDateYear')], ':')" />
                    </xsl:call-template>
                  </select>
                  <label class="s01" for="endMonthID">to</label>
                  <select id="endMonthID" name="higherDateMonth">
                    <xsl:call-template name="tpl-month">
                      <xsl:with-param name="month" select="substring-after(//parameters//parameter[starts-with(., 'higherDateMonth')], ':')" />
                    </xsl:call-template>
                  </select>
                  <select id="endYearID" name="higherDateYear">
                    <xsl:call-template name="tpl-year">
                      <xsl:with-param name="year" select="substring-after(//parameters//parameter[starts-with(., 'higherDateYear')], ':')" />
                    </xsl:call-template>
                  </select>
                  <label class="s02" for="endYearID">(optional)</label>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f10 n03">
                  <legend>Results Sorting</legend>
                  <label class="s01" for="sortKey1ID">Sort results by</label>
                  <select id="sortKey1ID" name="sortKey1">
                    <xsl:variable name="sort">
                      <xsl:choose>
                        <xsl:when test="string(substring-after(//parameters//parameter[starts-with(., 'sortKey1')], ':'))">
                          <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'sortKey1')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>by-date</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <xsl:call-template name="tpl-sort">
                      <xsl:with-param name="sort-by" select="$sort" />
                    </xsl:call-template>
                  </select>
                  <label class="s01" for="sortKey2ID">then by</label>
                  <select id="sortKey2ID" name="sortKey2">
                    <xsl:call-template name="tpl-sort">
                      <xsl:with-param name="sort-by" select="substring-after(//parameters//parameter[starts-with(., 'sortKey2')], ':')" />
                    </xsl:call-template>
                  </select>
                  <label class="s01" for="sortKey3ID">then by</label>
                  <select id="sortKey3ID" name="sortKey3">
                    <xsl:call-template name="tpl-sort">
                      <xsl:with-param name="sort-by" select="substring-after(//parameters//parameter[starts-with(., 'sortKey3')], ':')" />
                    </xsl:call-template>
                  </select>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f10 n04">
                  <legend>Results Display</legend>
                  <label class="s01" for="maxResultsID">Total results to return</label>
                  <select id="maxResultsID" name="maxResults">
                    <xsl:variable name="max">
                      <xsl:choose>
                        <xsl:when test="substring-after(//parameters//parameter[starts-with(., 'max-results')], ':') != ''">
                          <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'max-results')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>1000</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <xsl:call-template name="tpl-max-results">
                      <xsl:with-param name="max" select="$max" />
                    </xsl:call-template>
                  </select>
                  <!--
                  <label class="s01" for="resperPageID">Maximum results per page</label>
                  <select id="resperPageID" name="resultsPerPage">
                    <xsl:variable name="size">
                      <xsl:choose>
                        <xsl:when test="substring-after(//parameters//parameter[starts-with(., 'results-per-page')], ':') != ''">
                          <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'results-per-page')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>10</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <xsl:call-template name="tpl-resperpage">
                      <xsl:with-param name="size" select="$size" />
                    </xsl:call-template>
                  </select>
                  -->
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f13 n05">
                  <legend>Submit Search</legend>
                  <div>
                    <button type="submit">Search</button>
                    <button onclick="location.href='free_text.html';" type="reset">Reset Form</button>
                  </div>
                </fieldset>
              </li>
            </ol>
          </fieldset>
        </form>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="tpl-advanced-select">
    <xsl:param name="selected" />
    <xsl:param name="no-title" select="false()" />

    <option value="composer"><xsl:if test="$selected = 'composer'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Composer</option>
    <xsl:if test="$no-title = false()">
      <option value="title"><xsl:if test="$selected = 'title'">
          <xsl:attribute name="selected">selected</xsl:attribute>
        </xsl:if>Title</option>
    </xsl:if>
    <option value="opus"><xsl:if test="$selected = 'opus'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Opus</option>
    <option value="key"><xsl:if test="$selected = 'key'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Key</option>
    <option value="publisher"><xsl:if test="$selected = 'publisher'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Publisher</option>
    <option value="pubplace"><xsl:if test="$selected = 'pubplace'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Publication Place</option>
    <option value="country"><xsl:if test="$selected = 'country'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Country</option>
    <option value="hofclass"><xsl:if test="$selected = 'hofclass'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Class</option>
    <option value="regnumber"><xsl:if test="$selected = 'regnumber'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Registration Number</option>
  </xsl:template>

  <xsl:template name="tpl-month">
    <xsl:param name="month" />

    <option value="">Month...</option>
    <option value="01"><xsl:if test="$month = '01'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Januar</option>
    <option value="02"><xsl:if test="$month = '02'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Februar</option>
    <option value="03"><xsl:if test="$month = '03'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>März</option>
    <option value="04"><xsl:if test="$month = '04'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>April</option>
    <option value="05"><xsl:if test="$month = '05'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Mai</option>
    <option value="06"><xsl:if test="$month = '06'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Juni</option>
    <option value="07"><xsl:if test="$month = '07'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Juli</option>
    <option value="08"><xsl:if test="$month = '08'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>August</option>
    <option value="09"><xsl:if test="$month = '09'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>September</option>
    <option value="10"><xsl:if test="$month = '10'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>October</option>
    <option value="11"><xsl:if test="$month = '11'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>November</option>
    <option value="12"><xsl:if test="$month = '12'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>December</option>
  </xsl:template>

  <xsl:template name="tpl-sort">
    <xsl:param name="sort-by" />
    <xsl:param name="no-title" select="false()" />

    <option value="" />
    <option value="by-composer"><xsl:if test="$sort-by = 'by-composer'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Composer</option>
    <option value="by-date"><xsl:if test="$sort-by = 'by-date'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Date</option>
    <option value="by-opus"><xsl:if test="$sort-by = 'by-opus'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Opus</option>
    <option value="by-pubplace"><xsl:if test="$sort-by = 'by-pubplace'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Publication Place</option>
    <option value="by-publisher"><xsl:if test="$sort-by = 'by-publisher'">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>Publisher</option>
    <xsl:if test="$no-title = false()">
      <option value="by-title"><xsl:if test="$sort-by = 'by-title'">
          <xsl:attribute name="selected">selected</xsl:attribute>
        </xsl:if>Title</option>
    </xsl:if>
  </xsl:template>

  <xsl:template name="tpl-max-results">
    <xsl:param name="max" />

    <option value="0"><xsl:if test="$max = 0">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>All</option>
    <option value="250"><xsl:if test="$max = 250">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>250</option>
    <option value="500"><xsl:if test="$max = 500">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>500</option>
    <option value="1000"><xsl:if test="$max = 1000">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>1000</option>
  </xsl:template>

  <xsl:template name="tpl-resperpage">
    <xsl:param name="size" />

    <option value="10"><xsl:if test="$size = 10">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>10</option>
    <option value="25"><xsl:if test="$size = 25">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>25</option>
    <option value="50"><xsl:if test="$size = 50">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>50</option>
    <option value="100"><xsl:if test="$size = 100">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>100</option>
  </xsl:template>

  <xsl:template name="tpl-search-advanced-form">
    <div class="form">
      <div class="t03">
        <form action="do-advanced" id="frmSearch" method="POST" name="frmSearch">
          <fieldset class="s03">
            <legend>Use Thesaurus Button or Type in Text</legend>
            <ol>
              <li class="clfx-b">
                <fieldset class="f12 n01">
                  <legend>Primary Search Criteria</legend>
                  <label for="field1Sel">Search for:</label>

                  <xsl:variable name="selected">
                    <xsl:choose>
                      <xsl:when test="//refine/parameters/parameter[starts-with(., 'field1Sel')] != ''">
                        <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'field1Sel')], ':')" />
                      </xsl:when>
                      <xsl:otherwise>composer</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <select id="field1Sel" name="field1Sel"
                    onchange="enableField(document.forms.frmSearch.field1Txt); toggleEnableKey(document.forms.frmSearch.field1Sel.options[document.forms.frmSearch.field1Sel.selectedIndex].value, document.forms.frmSearch.field1Txt);">
                    <xsl:call-template name="tpl-advanced-select">
                      <xsl:with-param name="selected" select="$selected" />
                    </xsl:call-template>
                  </select>
                  <a class="s01"
                    href="javascript:openThesaurus(1, document.forms.frmSearch.field1Sel.options[document.forms.frmSearch.field1Sel.selectedIndex].value);"
                    title="Look up a search term in the thesaurus">
                    <span>Thesaurus...</span>
                  </a>

                  <xsl:variable name="thesaurus" select="substring-after(//parameters//parameter[starts-with(., 'thesaurus1Txt')], ':')" />

                  <input name="thesaurus1Txt" type="hidden">
                    <xsl:attribute name="value">
                      <xsl:value-of select="$thesaurus" />
                    </xsl:attribute>
                  </input>

                  <xsl:variable name="class">
                    <xsl:choose>
                      <xsl:when test="string-length($thesaurus) > 0">f01 s01</xsl:when>
                      <xsl:otherwise>f01</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <input class="{$class}" id="field1Txt" name="field1Txt" onchange="document.forms.frmSearch.thesaurus1Txt.value = '';" type="text">
                    <xsl:attribute name="value">
                      <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'field1Txt')], ':')" />
                    </xsl:attribute>
                    <xsl:if test="$thesaurus != ''">
                      <xsl:attribute name="readOnly">readonly</xsl:attribute>
                    </xsl:if>
                  </input>
                  <fieldset>
                    <xsl:variable name="searchMode">
                      <xsl:choose>
                        <xsl:when test="//refine/parameters/parameter[starts-with(., 'searchMode1')] != ''">
                          <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'searchMode1')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>all</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <legend>Search Mode</legend>
                    <ol>
                      <li class="clfx-b">
                        <input class="f02" name="searchMode1" type="radio" value="all">
                          <xsl:if test="$searchMode = 'all'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="all">All Words</label>
                      </li>
                      <li class="clfx-b">
                        <input class="f02" name="searchMode1" type="radio" value="any">
                          <xsl:if test="$searchMode = 'any'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="any">At least one word</label>
                      </li>
                      <li class="clfx-b">
                        <input class="f02" name="searchMode1" type="radio" value="exact">
                          <xsl:if test="$searchMode = 'exact'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="exact">Exact Search</label>
                      </li>
                    </ol>
                  </fieldset>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f12 n02">
                  <legend>Secondary Search Criteria</legend>
                  <fieldset class="s01">
                    <legend>Boolean Operators</legend>

                    <xsl:variable name="booleanOp">
                      <xsl:choose>
                        <xsl:when test="//refine/parameters/parameter[starts-with(., 'booleanOp1')] != ''">
                          <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'booleanOp1')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>and</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <ol>
                      <li>
                        <input class="f02" name="booleanOp1" type="radio" value="and">
                          <xsl:if test="$booleanOp = 'and'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="and">and</label>
                      </li>
                      <li>
                        <input class="f02" name="booleanOp1" type="radio" value="or">
                          <xsl:if test="$booleanOp = 'or'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="or">or</label>
                      </li>
                      <li>
                        <input class="f02" name="booleanOp1" type="radio" value="not">
                          <xsl:if test="$booleanOp = 'not'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="not">not</label>
                      </li>
                    </ol>
                  </fieldset>
                  <label for="field2Sel">Search for:</label>

                  <xsl:variable name="selected">
                    <xsl:choose>
                      <xsl:when test="//refine/parameters/parameter[starts-with(., 'field2Sel')] != ''">
                        <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'field2Sel')], ':')" />
                      </xsl:when>
                      <xsl:otherwise>title</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <select id="field2Sel" name="field2Sel"
                    onchange="enableField(document.forms.frmSearch.field2Txt);
                    toggleEnableKey(document.forms.frmSearch.field2Sel.options[document.forms.frmSearch.field2Sel.selectedIndex].value,
                    document.forms.frmSearch.field2Txt);">
                    <xsl:call-template name="tpl-advanced-select">
                      <xsl:with-param name="selected" select="$selected" />
                    </xsl:call-template>
                  </select>
                  <a class="s01"
                    href="javascript:openThesaurus(2, document.forms.frmSearch.field2Sel.options[document.forms.frmSearch.field2Sel.selectedIndex].value);"
                    title="Look up a search term in the thesaurus">
                    <span>Thesaurus...</span>
                  </a>

                  <xsl:variable name="thesaurus" select="substring-after(//parameters//parameter[starts-with(., 'thesaurus2Txt')], ':')" />

                  <input name="thesaurus2Txt" type="hidden">
                    <xsl:attribute name="value">
                      <xsl:value-of select="$thesaurus" />
                    </xsl:attribute>
                  </input>

                  <xsl:variable name="class">
                    <xsl:choose>
                      <xsl:when test="string-length($thesaurus) > 0">f01 s01</xsl:when>
                      <xsl:otherwise>f01</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <input class="{$class}" id="field2Txt" name="field2Txt" onchange="document.forms.frmSearch.thesaurus2Txt.value = '';" type="text">
                    <xsl:attribute name="value">
                      <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'field2Txt')], ':')" />
                    </xsl:attribute>
                    <xsl:if test="$thesaurus != ''">
                      <xsl:attribute name="readOnly">readonly</xsl:attribute>
                    </xsl:if>
                  </input>
                  <fieldset>
                    <xsl:variable name="searchMode">
                      <xsl:choose>
                        <xsl:when test="//refine/parameters/parameter[starts-with(., 'searchMode2')] != ''">
                          <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'searchMode2')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>all</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <legend>Search Mode</legend>
                    <ol>
                      <li class="clfx-b">
                        <input class="f02" name="searchMode2" type="radio" value="all">
                          <xsl:if test="$searchMode = 'all'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="all">All Words</label>
                      </li>
                      <li class="clfx-b">
                        <input class="f02" name="searchMode2" type="radio" value="any">
                          <xsl:if test="$searchMode = 'any'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="any">At least one word</label>
                      </li>
                      <li class="clfx-b">
                        <input class="f02" name="searchMode2" type="radio" value="exact">
                          <xsl:if test="$searchMode = 'exact'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="exact">Exact Search</label>
                      </li>
                    </ol>
                  </fieldset>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f12 n03">
                  <legend>Tertiary Search Criteria</legend>
                  <fieldset class="s01">
                    <legend>Boolean Operators</legend>

                    <xsl:variable name="booleanOp">
                      <xsl:choose>
                        <xsl:when test="//refine/parameters/parameter[starts-with(., 'booleanOp2')] != ''">
                          <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'booleanOp2')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>and</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <ol>
                      <li>
                        <input class="f02" name="booleanOp2" type="radio" value="and">
                          <xsl:if test="$booleanOp = 'and'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="and">and</label>
                      </li>
                      <li>
                        <input class="f02" name="booleanOp2" type="radio" value="or">
                          <xsl:if test="$booleanOp = 'or'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="or">or</label>
                      </li>
                      <li>
                        <input class="f02" name="booleanOp2" type="radio" value="not">
                          <xsl:if test="$booleanOp = 'not'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="not">not</label>
                      </li>
                    </ol>
                  </fieldset>
                  <label for="field3Sel">Search for:</label>

                  <xsl:variable name="selected">
                    <xsl:choose>
                      <xsl:when test="//refine/parameters/parameter[starts-with(., 'field3Sel')] != ''">
                        <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'field3Sel')], ':')" />
                      </xsl:when>
                      <xsl:otherwise>opus</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <select id="field3Sel" name="field3Sel"
                    onchange="enableField(document.forms.frmSearch.field3Txt);
                    toggleEnableKey(document.forms.frmSearch.field3Sel.options[document.forms.frmSearch.field3Sel.selectedIndex].value,
                    document.forms.frmSearch.field3Txt);">
                    <xsl:call-template name="tpl-advanced-select">
                      <xsl:with-param name="selected" select="$selected" />
                    </xsl:call-template>
                  </select>
                  <a class="s01"
                    href="javascript:openThesaurus(3, document.forms.frmSearch.field3Sel.options[document.forms.frmSearch.field3Sel.selectedIndex].value);"
                    title="Look up a search term in the thesaurus">
                    <span>Thesaurus...</span>
                  </a>

                  <xsl:variable name="thesaurus" select="substring-after(//parameters//parameter[starts-with(., 'thesaurus3Txt')], ':')" />

                  <input name="thesaurus3Txt" type="hidden">
                    <xsl:attribute name="value">
                      <xsl:value-of select="$thesaurus" />
                    </xsl:attribute>
                  </input>

                  <xsl:variable name="class">
                    <xsl:choose>
                      <xsl:when test="string-length($thesaurus) > 0">f01 s01</xsl:when>
                      <xsl:otherwise>f01</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <input class="{$class}" id="field3Txt" name="field3Txt" onchange="document.forms.frmSearch.thesaurus3Txt.value = '';" type="text">
                    <xsl:attribute name="value">
                      <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'field3Txt')], ':')" />
                    </xsl:attribute>
                    <xsl:if test="$thesaurus != ''">
                      <xsl:attribute name="readOnly">readonly</xsl:attribute>
                    </xsl:if>
                  </input>
                  <fieldset>
                    <xsl:variable name="searchMode">
                      <xsl:choose>
                        <xsl:when test="//refine/parameters/parameter[starts-with(., 'searchMode3')] != ''">
                          <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'searchMode3')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>all</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <legend>Search Mode</legend>
                    <ol>
                      <li class="clfx-b">
                        <input class="f02" name="searchMode3" type="radio" value="all">
                          <xsl:if test="$searchMode = 'all'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="all">All Words</label>
                      </li>
                      <li class="clfx-b">
                        <input class="f02" name="searchMode3" type="radio" value="any">
                          <xsl:if test="$searchMode = 'any'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="any">At least one word</label>
                      </li>
                      <li class="clfx-b">
                        <input class="f02" name="searchMode3" type="radio" value="exact">
                          <xsl:if test="$searchMode = 'exact'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <label for="exact">Exact Search</label>
                      </li>
                    </ol>
                  </fieldset>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f11 n02">
                  <legend>Date Range</legend>
                  <label class="s01" for="startMonthID">from</label>
                  <select id="startMonthID" name="lowerDateMonth">
                    <xsl:call-template name="tpl-month">
                      <xsl:with-param name="month" select="substring-after(//parameters//parameter[starts-with(., 'lowerDateMonth')], ':')" />
                    </xsl:call-template>
                  </select>
                  <select id="startYearID" name="lowerDateYear">
                    <xsl:call-template name="tpl-year">
                      <xsl:with-param name="year" select="substring-after(//parameters//parameter[starts-with(., 'lowerDateYear')], ':')" />
                    </xsl:call-template>
                  </select>
                  <label class="s01" for="endMonthID">to</label>
                  <select id="endMonthID" name="higherDateMonth">
                    <xsl:call-template name="tpl-month">
                      <xsl:with-param name="month" select="substring-after(//parameters//parameter[starts-with(., 'higherDateMonth')], ':')" />
                    </xsl:call-template>
                  </select>
                  <select id="endYearID" name="higherDateYear">
                    <xsl:call-template name="tpl-year">
                      <xsl:with-param name="year" select="substring-after(//parameters//parameter[starts-with(., 'higherDateYear')], ':')" />
                    </xsl:call-template>
                  </select>
                  <label class="s02" for="endYearID">(optional)</label>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f10 n03">
                  <legend>Results Sorting</legend>
                  <label class="s01" for="sortKey1ID">Sort results by</label>
                  <select id="sortKey1ID" name="sortKey1">
                    <xsl:variable name="sort">
                      <xsl:choose>
                        <xsl:when test="substring-after(//parameters//parameter[starts-with(., 'sortKey1')], ':') != ''">
                          <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'sortKey1')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>by-date</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <xsl:call-template name="tpl-sort">
                      <xsl:with-param name="sort-by" select="$sort" />
                    </xsl:call-template>
                  </select>
                  <label class="s01" for="sortKey2ID">then by</label>
                  <select id="sortKey2ID" name="sortKey2">
                    <xsl:call-template name="tpl-sort">
                      <xsl:with-param name="sort-by" select="substring-after(//parameters//parameter[starts-with(., 'sortKey2')], ':')" />
                    </xsl:call-template>
                  </select>
                  <label class="s01" for="sortKey3ID">then by</label>
                  <select id="sortKey3ID" name="sortKey3">
                    <xsl:call-template name="tpl-sort">
                      <xsl:with-param name="sort-by" select="substring-after(//parameters//parameter[starts-with(., 'sortKey3')], ':')" />
                    </xsl:call-template>
                  </select>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f10 n04">
                  <legend>Results Display</legend>
                  <label class="s01" for="maxResultsID">Total results to return</label>
                  <select id="maxResultsID" name="maxResults">
                    <xsl:variable name="max">
                      <xsl:choose>
                        <xsl:when test="substring-after(//parameters//parameter[starts-with(., 'max-results')], ':') != ''">
                          <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'max-results')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>1000</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <xsl:call-template name="tpl-max-results">
                      <xsl:with-param name="max" select="$max" />
                    </xsl:call-template>
                  </select>
                  <!--
                  <label class="s01" for="resperPageID">Maximum results per page</label>
                  <select id="resperPageID" name="resultsPerPage">
                    <xsl:variable name="size">
                      <xsl:choose>
                        <xsl:when test="substring-after(//parameters//parameter[starts-with(., 'results-per-page')], ':') != ''">
                          <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'results-per-page')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>10</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <xsl:call-template name="tpl-resperpage">
                      <xsl:with-param name="size" select="$size" />
                    </xsl:call-template>
                  </select>
                  -->
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f13 n07">
                  <legend>Submit Search</legend>
                  <div>
                    <button type="submit">Search</button>
                    <button onclick="location.href='advanced.html';" type="reset">Reset Form</button>
                  </div>
                </fieldset>
              </li>
            </ol>
          </fieldset>
        </form>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="tpl-search-list-form">
    <div class="form">
      <div class="t03">
        <form action="do-list" id="frmSearch" method="POST" name="frmSearch">
          <fieldset class="s03">
            <legend>Use Drop Down Menu, Then Thesaurus Button or Type in Text</legend>
            <ol>
              <li class="clfx-b">
                <fieldset class="f12 n01">
                  <legend>Search Criteria</legend>
                  <label for="listSelectID">List all:</label>

                  <xsl:variable name="selected">
                    <xsl:choose>
                      <xsl:when test="//refine/parameters/parameter[starts-with(., 'listSelect')] != ''">
                        <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'listSelect')], ':')" />
                      </xsl:when>
                      <xsl:otherwise>composer</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <select id="listSelectID" name="listSelect">
                    <xsl:call-template name="tpl-advanced-select">
                      <xsl:with-param name="selected" select="$selected" />
                      <xsl:with-param name="no-title" select="true()" />
                    </xsl:call-template>
                  </select>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f12 n02">
                  <legend>Moderator</legend>
                  <label for="whereSelectID">Where:</label>

                  <xsl:variable name="selected">
                    <xsl:choose>
                      <xsl:when test="//refine/parameters/parameter[starts-with(., 'whereSelect')] != ''">
                        <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'whereSelect')], ':')" />
                      </xsl:when>
                      <xsl:otherwise>pubplace</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <select id="whereSelectID" name="whereSelect"
                    onchange="enableField(document.forms.frmSearch.field1Txt);
                    toggleEnableKey(document.forms.frmSearch.whereSelect.options[document.forms.frmSearch.whereSelect.selectedIndex].value, document.forms.frmSearch.field1Txt);">
                    <xsl:call-template name="tpl-advanced-select">
                      <xsl:with-param name="selected" select="$selected" />
                      <xsl:with-param name="no-title" select="true()" />
                    </xsl:call-template>
                  </select>
                  <a class="s01"
                    href="javascript:openThesaurus(1, document.forms.frmSearch.whereSelect.options[document.forms.frmSearch.whereSelect.selectedIndex].value);"
                    title="Look up a search term in the thesaurus">
                    <span>Thesaurus...</span>
                  </a>

                  <xsl:variable name="thesaurus" select="substring-after(//parameters//parameter[starts-with(., 'thesaurus1Txt')], ':')" />

                  <input name="thesaurus1Txt" type="hidden" value="{$thesaurus}" />

                  <xsl:variable name="class">
                    <xsl:choose>
                      <xsl:when test="string-length($thesaurus) > 0">f01 s01</xsl:when>
                      <xsl:otherwise>f01</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <label class="s01" for="field1TxtID">is:</label>
                  <input class="{$class}" id="field1TxtID" name="field1Txt" onchange="document.forms.frmSearch.thesaurus1Txt.value = '';" type="text">
                    <xsl:attribute name="value">
                      <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'field1Txt')], ':')" />
                    </xsl:attribute>
                    <xsl:if test="$thesaurus != ''">
                      <xsl:attribute name="readOnly">readonly</xsl:attribute>
                    </xsl:if>
                  </input>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f12 n03">
                  <legend>Qualifier</legend>
                  <label for="exceptSelectID">Except where:</label>

                  <xsl:variable name="selected">
                    <xsl:choose>
                      <xsl:when test="//refine/parameters/parameter[starts-with(., 'exceptSelect')] != ''">
                        <xsl:value-of select="substring-after(//refine/parameters/parameter[starts-with(., 'exceptSelect')], ':')" />
                      </xsl:when>
                      <xsl:otherwise>publisher</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <select id="exceptSelectID" name="exceptSelect"
                    onchange="enableField(document.forms.frmSearch.field2Txt);
                    toggleEnableKey(document.forms.frmSearch.exceptSelect.options[document.forms.frmSearch.exceptSelect.selectedIndex].value, document.forms.frmSearch.field2Txt);">
                    <xsl:call-template name="tpl-advanced-select">
                      <xsl:with-param name="selected" select="$selected" />
                      <xsl:with-param name="no-title" select="true()" />
                    </xsl:call-template>
                  </select>
                  <a class="s01"
                    href="javascript:openThesaurus(2, document.forms.frmSearch.exceptSelect.options[document.forms.frmSearch.exceptSelect.selectedIndex].value);"
                    title="Look up a search term in the thesaurus">
                    <span>Thesaurus...</span>
                  </a>

                  <xsl:variable name="thesaurus" select="substring-after(//parameters//parameter[starts-with(., 'thesaurus2Txt')], ':')" />

                  <input name="thesaurus2Txt" type="hidden" value="{$thesaurus}" />

                  <xsl:variable name="class">
                    <xsl:choose>
                      <xsl:when test="string-length($thesaurus) > 0">f01 s01</xsl:when>
                      <xsl:otherwise>f01</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <label class="s01" for="field2TxtID">is:</label>
                  <input class="{$class}" id="field2TxtID" name="field2Txt" onchange="document.forms.frmSearch.thesaurus2Txt.value = '';" type="text">
                    <xsl:attribute name="value">
                      <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'field2Txt')], ':')" />
                    </xsl:attribute>
                    <xsl:if test="$thesaurus != ''">
                      <xsl:attribute name="readOnly">readonly</xsl:attribute>
                    </xsl:if>
                  </input>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f11 n02">
                  <legend>Date Range</legend>
                  <label class="s01" for="startMonthID">from</label>
                  <select id="startMonthID" name="lowerDateMonth">
                    <xsl:call-template name="tpl-month">
                      <xsl:with-param name="month" select="substring-after(//parameters//parameter[starts-with(., 'lowerDateMonth')], ':')" />
                    </xsl:call-template>
                  </select>
                  <select id="startYearID" name="lowerDateYear">
                    <xsl:call-template name="tpl-year">
                      <xsl:with-param name="year" select="substring-after(//parameters//parameter[starts-with(., 'lowerDateYear')], ':')" />
                    </xsl:call-template>
                  </select>
                  <label class="s01" for="endMonthID">to</label>
                  <select id="endMonthID" name="higherDateMonth">
                    <xsl:call-template name="tpl-month">
                      <xsl:with-param name="month" select="substring-after(//parameters//parameter[starts-with(., 'higherDateMonth')], ':')" />
                    </xsl:call-template>
                  </select>
                  <select id="endYearID" name="higherDateYear">
                    <xsl:call-template name="tpl-year">
                      <xsl:with-param name="year" select="substring-after(//parameters//parameter[starts-with(., 'higherDateYear')], ':')" />
                    </xsl:call-template>
                  </select>
                  <label class="s02" for="endYearID">(optional)</label>
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f10 n03">
                  <legend>Results Sorting</legend>
                  <label class="s01" for="sortKey1ID">Sort results by</label>
                  <select id="sortKey1ID" name="sortKey1">
                    <xsl:variable name="sort">
                      <xsl:choose>
                        <xsl:when test="substring-after(//parameters//parameter[starts-with(., 'sortKey1')], ':') != ''">
                          <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'sortKey1')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>by-date</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <xsl:call-template name="tpl-sort">
                      <xsl:with-param name="sort-by" select="$sort" />
                      <xsl:with-param name="no-title" select="true()" />
                    </xsl:call-template>
                  </select>
                  <!-- Mantis: 0001962 -->
                  <!--
                  <label class="s01" for="sortKey2ID">then by</label>
                  <select id="sortKey2ID" name="sortKey2">
                    <xsl:call-template name="tpl-sort">
                      <xsl:with-param name="sort-by" select="substring-after(//parameters//parameter[starts-with(., 'sortKey2')], ':')" />
                    </xsl:call-template>
                  </select>
                  <label class="s01" for="sortKey3ID">then by</label>
                  <select id="sortKey3ID" name="sortKey3">
                    <xsl:call-template name="tpl-sort">
                      <xsl:with-param name="sort-by" select="substring-after(//parameters//parameter[starts-with(., 'sortKey3')], ':')" />
                    </xsl:call-template>
                  </select>
                  -->
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f10 n04">
                  <legend>Results Display</legend>
                  <label class="s01" for="maxResultsID">Total results to return</label>
                  <select id="maxResultsID" name="maxResults">
                    <xsl:variable name="max">
                      <xsl:choose>
                        <xsl:when test="substring-after(//parameters//parameter[starts-with(., 'max-results')], ':') != ''">
                          <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'max-results')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>1000</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <xsl:call-template name="tpl-max-results">
                      <xsl:with-param name="max" select="$max" />
                    </xsl:call-template>
                  </select>
                  <!--
                  <label class="s01" for="resperPageID">Maximum results per page</label>
                  <select id="resperPageID" name="resultsPerPage">
                    <xsl:variable name="size">
                      <xsl:choose>
                        <xsl:when test="substring-after(//parameters//parameter[starts-with(., 'results-per-page')], ':') != ''">
                          <xsl:value-of select="substring-after(//parameters//parameter[starts-with(., 'results-per-page')], ':')" />
                        </xsl:when>
                        <xsl:otherwise>10</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    <xsl:call-template name="tpl-resperpage">
                      <xsl:with-param name="size" select="$size" />
                    </xsl:call-template>
                  </select>
                  -->
                </fieldset>
              </li>
              <li class="clfx-b">
                <fieldset class="f13 n07">
                  <legend>Submit Search</legend>
                  <div>
                    <button type="submit">Search</button>
                    <button onclick="location.href='list.html';" type="reset">Reset Form</button>
                  </div>
                </fieldset>
              </li>
            </ol>
          </fieldset>
        </form>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="html_tpl_thesaurus">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta content="text/html; charset=utf-8" http-equiv="content-type" />
        <meta content="no" http-equiv="imagetoolbar" />
        <meta content="" name="abstract" />
        <meta content="" name="author" />
        <meta content="Copyright (c) 2006" name="copyright" />
        <meta content="2005-11-26" name="date" />
        <meta content="" name="description" />
        <meta content="" name="keywords" />
        <meta content="index,follow,archive" name="robots" />
        <meta content="xMod 1.3" name="generator" />
        <link href="{$scriptswitch}/i/favicon.ico" rel="shortcut icon" />

        <!-- CSS calls -->
        <link href="{$scriptswitch}/c/default.css" media="screen, projection" rel="stylesheet" type="text/css" />
        <link href="{$scriptswitch}/c/print.css" media="print" rel="stylesheet" type="text/css" />
        <link href="{$scriptpers}/c/personality.css" media="screen, projection" rel="stylesheet" type="text/css" />

        <!-- IE browser specific css and script -->
        <!-- IE browser specific css and script -->
        <xsl:comment>[if LTE IE 6]&gt; &lt;link rel="stylesheet" type="text/css" href="<xsl:value-of select="$scriptpers"
           />/c/compat_MSIE_6_0_lte.css" /&gt; &lt;![endif]</xsl:comment>
        <xsl:comment>[if GTE IE 7]&gt; &lt;link rel="stylesheet" type="text/css" href="<xsl:value-of select="$scriptpers"
           />/c/compat_MSIE_7_0_gte.css" /&gt; &lt;![endif]</xsl:comment>
        <xsl:comment>[if IE]&gt; &lt;script src="<xsl:value-of select="$scriptswitch" />/s/compat.js" type="text/javascript" &gt;
          &lt;/script&gt; &lt;![endif]</xsl:comment>

        <!-- script -->
        <script src="{$scriptpers}/s/default.js" type="text/javascript">&amp;#160;</script>
        <title>Thesaurus</title>
      </head>

      <body id="xmd">
        <xsl:choose>
          <xsl:when test="$view = 'thesaurus'">
            <xsl:attribute name="class">v1 r3 pu</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="class">v1 r3 rc0</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>

        <div id="mainContent">
          <xsl:variable name="field" select="//thesaurus//terms/field" />
          <xsl:variable name="help-link-path" select="//filebase//group[@id='g3']/groupHead/groupFolder" />
          <div class="options">
            <div class="t04">
              <ul>
                <li>
                  <a target="_blank">
                    <xsl:attribute name="href">
                      <xsl:value-of select="$linkroot" />
                      <xsl:text>/</xsl:text>
                      <xsl:value-of select="$help-link-path" />
                      <xsl:choose>
                        <xsl:when test="$field = 'hofclass'">
                          <xsl:text>classes_help</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text>thesauri_help</xsl:text>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:text>.html</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Help</xsl:text>
                  </a>
                </li>
              </ul>
              <br />
              <br />
            </div>
          </div>

          <div class="form">
            <div class="t04">
              <form action="display-thesaurus.html" method="GET" name="frmThesaurus">
                <!--<xsl:variable name="field" select="//thesaurus//terms/field" />-->
                <xsl:variable name="start" select="//thesaurus//terms/start" />
                <xsl:variable name="term-num" select="//thesaurus//terms/term-num" />

                <fieldset class="s02">
                  <legend>
                    <xsl:choose>
                      <xsl:when test="$field = 'pubplace'">Publication Place</xsl:when>
                      <xsl:when test="$field = 'hofclass'">Class</xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="$field" />
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text> thesaurus</xsl:text>
                  </legend>
                  <ol>
                    <xsl:if test="not($field = 'country') and not($field = 'key') and not($field = 'opus')">
                      <li class="clfx-b">
                        <xsl:call-template name="tpl-alphabetical-index">
                          <xsl:with-param name="field" select="$field" />
                          <xsl:with-param name="term-num" select="$term-num" />
                        </xsl:call-template>
                      </li>
                    </xsl:if>
                    <xsl:if test="not($field = 'key')">
                      <li class="clfx-b">
                        <fieldset class="f05 n02">
                          <legend>Partial Match</legend>
                          <label for="$select2ID">Starting with:</label>
                          <input class="f01" name="startTxt" type="text" value="{$start}" />
                          <button type="submit">View</button>
                        </fieldset>
                      </li>
                    </xsl:if>
                    <li class="clfx-b">
                      <fieldset class="f06 n03">
                        <input name="fieldTxt" type="hidden" value="{$field}" />
                        <input name="termNumTxt" type="hidden" value="{$term-num}" />

                        <select class="f03" id="thesaurusSel" multiple="multiple">
                          <xsl:for-each select="//thesaurus//terms/term[string-length(.) > 0]">
                            <xsl:variable name="key" select="@id" />

                            <xsl:if test=". != '##'">
                              <option value="{$key}">
                                <xsl:value-of select="." />
                              </option>
                            </xsl:if>
                          </xsl:for-each>
                        </select>
                      </fieldset>
                    </li>
                    <li class="clfx-b">
                      <fieldset class="f06 n04">
                        <legend>Submit Search</legend>
                        <div>
                          <button onclick="addTerms({$term-num});" type="">Insert</button>
                          <button type="reset">Reset</button>
                          <button onclick="window.close();" type="">Close</button>
                        </div>
                      </fieldset>
                    </li>
                  </ol>
                </fieldset>
              </form>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="tpl-alphabetical-index">
    <xsl:param name="field" />
    <xsl:param name="term-num" />

    <fieldset class="f05 n01">
      <legend>Alphabetical Index</legend>
      <div class="alphaNav">
        <div class="t01">
          <ul>
            <li>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=A">A</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=B">B</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=C">C</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=D">D</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=E">E</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=F">F</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=G">G</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=H">H</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=I">I</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=J">J</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=K">K</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=L">L</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=M">M</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=N">N</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=O">O</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=P">P</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=Q">Q</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=R">R</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=S">S</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=T">T</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=U">U</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=V">V</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=W">W</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=X">X</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=Y">Y</a>
              <a href="?fieldTxt={$field}&amp;termNumTxt={$term-num}&amp;startTxt=Z">Z</a>
            </li>
          </ul>
        </div>
      </div>
    </fieldset>
  </xsl:template>
</xsl:stylesheet>
