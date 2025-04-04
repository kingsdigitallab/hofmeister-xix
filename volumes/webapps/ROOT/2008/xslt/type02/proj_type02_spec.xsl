<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml" version="1.1"
  xmlns:dir="http://apache.org/cocoon/directory/2.0" exclude-result-prefixes="dir">

  <!-- ============================================================= -->
  <!--MODULE: proj_type02_spec.xsl -->
  <!--VERSION DATE: 1.0-->
  <!--VERSION:$Id: proj_type02_spec.xsl 806 2007-07-11 13:30:07Z epierazzo $-->
  <!--VERSION CONTROL: -->
  <!-- ============================================================= -->

  <!-- ============================================================= -->
  <!-- ORIGINAL CREATION DATE:2003-09-05 -->
  <!-- PURPOSE: Special templates for type02 transformations -->
  <!-- CREATED FOR:CCHwww.kcl.ac.uk/cch-->
  <!-- CREATED BY: PJSspencepj@yahoo.com -->
  <!-- COPYRIGHT: CCH/PJS-->
  <!-- ============================================================= -->


  <!-- Common variables for ctpl_option prev and next month navigation -->
  <xsl:variable name="pre-file-id">
    <xsl:value-of
      select="//dir:file[starts-with(@name, $cur-file-id)]/preceding-sibling::dir:file[1]/@name"/>
  </xsl:variable>
  <xsl:variable name="fol-file-id">
    <xsl:value-of
      select="//dir:file[starts-with(@name, $cur-file-id)]/following-sibling::dir:file[1]/@name"/>
  </xsl:variable>


  <!-- SUPERSEDES TEMPLATES IN PROJ_TEI_COM -->

  <xsl:template match="body[starts-with(ancestor::TEI.2/@id, 'hofm_')]" priority="1">
    <div class="definitionList">
      <div>
        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="div/head[@rend = 'inline']">
              <xsl:text>t01</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>t02</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <dl>
          <xsl:apply-templates/>
        </dl>
      </div>
    </div>
  </xsl:template>

  <!--    <xsl:template match="body/div/head[child::hofClass]" priority="1">
        <xsl:apply-templates/>
        </xsl:template>-->

  <xsl:template match="div[starts-with(ancestor::TEI.2/@id, 'hofm')]" priority="1">
    <xsl:choose>
      <xsl:when test="@rend = 'curly'">
        <xsl:choose>
          <xsl:when test="descendant::bibl[@sameAs]">
            <!-- Template called from the first div/@rend='curly'' -->
          </xsl:when>
          <!-- First curly div, creates surrounding table, first row and calls the template for the following curly divs -->
          <xsl:otherwise>
            <dt class="s01">
              <xsl:value-of select="head"/>
            </dt>
            <xsl:for-each select="following-sibling::div[bibl[@sameAs=current()/bibl/@id]]">
              <dt class="s01">
                <xsl:value-of select="head"/>
              </dt>
            </xsl:for-each>
            <dd class="s01">
              <div class="table">
                <div class="t04">
                  <table>
                    <tbody>
                      <tr class="r01 z01">
                        <xsl:apply-templates/>
                      </tr>
                      <xsl:call-template name="fol-curly-div">
                        <xsl:with-param name="cur-child-id" select="bibl/@id"/>
                      </xsl:call-template>
                    </tbody>
                  </table>
                </div>
              </div>
            </dd>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="head"/>
        <xsl:apply-templates select="*[not(local-name() = 'head')]"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- following curly divs, called from first div/@rend='curly'' -->
  <!-- starting context, first curly div -->
  <xsl:template name="fol-curly-div">
    <xsl:param name="cur-child-id"/>

    <xsl:for-each select="following-sibling::div[descendant::*[@sameAs=$cur-child-id]]">
      <!-- Odd and even row class -->
      <xsl:variable name="odd-even">
        <xsl:choose>
          <xsl:when test="position() mod 2 = 0"> z01</xsl:when>
          <xsl:otherwise>
            <xsl:text> z02</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <!-- row position -->
      <xsl:variable name="row-pos">
        <xsl:choose>
          <xsl:when test="position() = last()">
            <xsl:text>x02</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>r</xsl:text>
            <xsl:number value="position() + 1" format="01"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <!-- Row output -->
      <tr>
        <xsl:attribute name="class">
          <xsl:value-of select="$row-pos"/>
          <xsl:value-of select="$odd-even"/>
        </xsl:attribute>
        <xsl:apply-templates/>
      </tr>
    </xsl:for-each>
  </xsl:template>

  <!-- All other children in div/@rend=curly, which is not a head - wip|album|bibl -->
  <xsl:template name="curly-child">
    <!-- current @id -->
    <xsl:variable name="cur-id" select="@id"/>
    <!-- Number of elements with @same As equal to the current @id -->
    <xsl:variable name="no-sameAs">
      <xsl:value-of select="count(../..//div/*[@sameAs=$cur-id])"/>
    </xsl:variable>
    <!-- Rowspan -->
    <xsl:variable name="rs">
      <xsl:value-of select="$no-sameAs +1"/>
    </xsl:variable>

    <!-- Following div output -->
    <xsl:choose>
      <xsl:when test="contains(@rend, 'curly')">
        <td>
          <xsl:attribute name="class">
            <xsl:text>c02 rs</xsl:text>
            <xsl:value-of select="$rs"/>
          </xsl:attribute>
          <xsl:attribute name="rowspan">
            <xsl:value-of select="$rs"/>
          </xsl:attribute>
          <div class="bracket">
            <span>}</span>
          </div>
        </td>
        <td>
          <xsl:attribute name="class">
            <xsl:text>x01 rs</xsl:text>
            <xsl:value-of select="$rs"/>
          </xsl:attribute>
          <xsl:attribute name="rowspan">
            <xsl:value-of select="$rs"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </td>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="head[descendant::hofClass]" priority="1">
    <xsl:choose>
      <!-- Hofclass view -->
      <xsl:when test="string($hofclass)">
        <dt>&#160;</dt>
      </xsl:when>
      <!-- First head cell -->
      <xsl:when test="parent::div[@rend='curly']">
        <td class="c01">
          <xsl:attribute name="id">
              <xsl:value-of select="ancestor::div/@id"/>
            <!--<xsl:value-of select="ancestor::TEI.2/@id"/>
            <xsl:number level="any" from="TEI.2"/>-->
          </xsl:attribute>
          <xsl:apply-templates/>
        </td>
      </xsl:when>
      <xsl:otherwise>
        <dt>
          <xsl:attribute name="id">
              <xsl:value-of select="ancestor::div/@id"/>
            <!--<xsl:value-of select="ancestor::TEI.2/@id"/>
            <xsl:number level="any" from="TEI.2"/>-->
          </xsl:attribute>
          <xsl:choose>
            <xsl:when test="starts-with($hofclass, 'div')"/>
            <xsl:otherwise>
              <xsl:apply-templates/>
            </xsl:otherwise>
          </xsl:choose>
        </dt>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="listBibl[parent::div]">
    <xsl:apply-templates/>
  </xsl:template>


  <xsl:template name="bibl-item">
    <!--
        <xsl:choose>
            <xsl:when test="string($monat-pb)">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>-->
    <dd id="{@id}">
      <xsl:apply-templates/>
    </dd>
    <!--
            </xsl:otherwise>
        </xsl:choose>-->
  </xsl:template>

  <xsl:template match="bibl" priority="1">
    <xsl:param name="temp-total-col"/>
    <xsl:choose>
      <xsl:when test="string($hofclass) and parent::div[@rend = 'curly']">
        <xsl:choose>
          <xsl:when test="@sameAs">
            <xsl:apply-templates select="preceding::bibl[@id = current()/@sameAs]"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="bibl-item"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="parent::div[@rend='curly']">
        <xsl:call-template name="curly-child"/>
      </xsl:when>
      <xsl:when test="child::list[@type = 'curly'] and child::seg">
        <dd>
          <div class="table">
            <div class="t04">
              <table>
                <tbody>
                  <tr class="z01 r01">
                    <td class="c01">
                      <div class="array">
                        <div class="t03">
                          <xsl:apply-templates select="list"/>
                        </div>
                      </div>
                    </td>
                    <td class="c02 as15">
                      <div class="bracket">
                        <span>}</span>
                      </div>
                    </td>
                    <td class="x01">
                      <xsl:apply-templates select="seg"/>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </dd>
      </xsl:when>
      <xsl:when test="not(parent::listBibl)">
        <xsl:call-template name="bibl-item"/>
      </xsl:when>
      <xsl:when test="parent::listBibl[parent::div]">
        <xsl:call-template name="bibl-item"/>
      </xsl:when>
      <xsl:otherwise>
        <!-- Odd and even row class -->
        <xsl:variable name="odd-even">
          <xsl:choose>
            <xsl:when test="count(preceding-sibling::bibl) mod 2 = 0"> z01</xsl:when>
            <xsl:otherwise>
              <xsl:text> z02</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <!-- current row position -->
        <xsl:variable name="cur-row-pos">
          <xsl:choose>
            <xsl:when test="not(following-sibling::bibl)">
              <xsl:text>x02</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>r</xsl:text>
              <xsl:number level="single" count="bibl" format="01"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>


        <!-- output list curly -->
        <tr>
          <xsl:attribute name="class">
            <xsl:value-of select="$cur-row-pos"/>
            <xsl:value-of select="$odd-even"/>
          </xsl:attribute>
          <xsl:apply-templates>
            <xsl:with-param name="temp-total-col" select="$temp-total-col"/>
          </xsl:apply-templates>
        </tr>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="wip">
    <xsl:choose>
      <xsl:when test="parent::div[@rend='curly']">
        <xsl:call-template name="curly-child"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="bibl-item"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="album">
    <xsl:choose>
      <xsl:when test="parent::div[@rend='curly']">
        <xsl:call-template name="curly-child"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="bibl-item"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="list[starts-with(@rend, 'columns')]">
    <xsl:choose>
      <xsl:when
        test="not(preceding-sibling::*[1][local-name()='list'][starts-with(@rend, 'columns')])">
        <div class="array">
          <div>
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="@rend='columns-border'">
                  <xsl:text>t02</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>t01</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <ul class="s01">
              <xsl:apply-templates/>
            </ul>
            <xsl:for-each select="following-sibling::list[1][starts-with(@rend, 'columns')]">
              <ul>
                <xsl:apply-templates select="node()"/>
              </ul>
            </xsl:for-each>
          </div>
        </div>
      </xsl:when>
      <xsl:otherwise> </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="list[@type = 'curly']">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="item[parent::list[@type = 'curly']]">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <xsl:template match="listBibl[@rend='curly']">
    <xsl:variable name="tt-seg" select="count(bibl[1]/seg)"/>
    <xsl:variable name="tt-seg-left" select="count(bibl[1]/seg[contains(@rend, 'curly-left')])"/>
    <xsl:variable name="tt-seg-right" select="count(bibl[1]/seg[contains(@rend, 'curly-right')])"/>
    <xsl:variable name="tt-seg-dots" select="count(bibl[1]/seg[@rend = 'dots'])"/>

    <xsl:variable name="temp-total-col">
      <xsl:choose>
        <xsl:when test="string(@n)">
          <xsl:value-of select="@n"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$tt-seg + $tt-seg-left + $tt-seg-right + $tt-seg-dots"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <div class="table">
      <div class="t04">
        <table tt="{$temp-total-col}">
          <tbody>
            <xsl:apply-templates>
              <xsl:with-param name="temp-total-col" select="$temp-total-col"/>
            </xsl:apply-templates>
          </tbody>
        </table>
      </div>
    </div>
  </xsl:template>

  <!-- Where all the cell output and curly brackets are being produced -->
  <xsl:template match="seg">
    <xsl:param name="temp-total-col"/>

    <!-- id of the current seg -->
    <xsl:variable name="cur-id">
      <xsl:value-of select="@id"/>
    </xsl:variable>
    <!-- number of preceding seg including self -->
    <xsl:variable name="pre-seg">
      <xsl:text>0</xsl:text>
      <xsl:number level="single" count="seg"/>
    </xsl:variable>
    <!-- number of preceding seg with @rend containing curly-left and curly-right -->
    <xsl:variable name="pre-br-seg">
      <xsl:text>0</xsl:text>
      <xsl:if test="preceding-sibling::seg[@id]">
        <xsl:value-of
          select="count(preceding-sibling::seg[@id][contains(@rend, 'curly-right')]) + count(preceding-sibling::seg[@id][contains(@rend, 'curly-left')])"
        />
      </xsl:if>
    </xsl:variable>
    <!-- self seg with @id -->
    <xsl:variable name="cur-br-seg">
      <xsl:choose>
        <xsl:when test="@id and contains(@rend, 'curly-left')">1</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-- number of preceding seg with @sameAs checking the @rend from the corresponding @id -->
    <xsl:variable name="pre-sa-seg">
      <xsl:text>0</xsl:text>
      <xsl:if test="preceding-sibling::seg[@sameAs]">
        <xsl:value-of
          select="count(preceding::seg[@id=current()/preceding-sibling::seg/@sameAs][contains(@rend, 'curly-right')]) + count(preceding::seg[@id=current()/preceding-sibling::seg/@sameAs][contains(@rend, 'curly-left')])"
        />
      </xsl:if>
    </xsl:variable>
    <!-- number of preceding seg with @corresp checking the @rend from the corresponding @id -->
    <xsl:variable name="pre-cor-seg">
      <xsl:text>0</xsl:text>
      <xsl:if test="preceding-sibling::seg[@corresp]">
        <xsl:value-of
          select="count(preceding::seg[@id=current()/preceding-sibling::seg/@corresp][contains(@rend, 'curly-right')]) + count(preceding::seg[@id=current()/preceding-sibling::seg/@corresp][contains(@rend, 'curly-left')])"/>
        <xsl:value-of select="count(preceding-sibling::seg[@corresp])"/>
      </xsl:if>
    </xsl:variable>
    <!-- number of preceding seg with @rend='dots' -->
    <xsl:variable name="pre-dot-seg">
      <xsl:text>0</xsl:text>
      <xsl:if test="preceding-sibling::seg[@rend='dots']">
        <xsl:value-of select="count(preceding-sibling::seg[@rend='dots'])"/>
      </xsl:if>
    </xsl:variable>
    <!-- self seg with @rend='dots' -->
    <xsl:variable name="cur-dot-seg">
      <xsl:choose>
        <xsl:when test="@rend='dots'">1</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-- Original cell position without other factors-->
    <xsl:variable name="orig-cell-pos">
      <xsl:number
        value="$pre-seg + $pre-br-seg + $cur-br-seg + $pre-sa-seg + $pre-cor-seg + $pre-dot-seg + $cur-dot-seg"
      />
    </xsl:variable>
    <!-- cell position of the seg -->
    <xsl:variable name="seg-cell-pos">
      <xsl:choose>
        <!-- Last cell -->
        <xsl:when test="not(following-sibling::seg)">
          <xsl:text>x01</xsl:text>
        </xsl:when>
        <!-- Column number -->
        <xsl:otherwise>
          <xsl:text>c</xsl:text>
          <xsl:number value="$orig-cell-pos" format="01"/>
          <!--<xsl:choose>
                        
                        <xsl:when test="contains(@rend, 'curly-right')">
                        <xsl:number value="$orig-cell-pos -1" format="01"/>
                        </xsl:when>
                        <xsl:otherwise>
                        <xsl:number value="$orig-cell-pos" format="01"/>
                        </xsl:otherwise>
                        </xsl:choose>-->
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-- cell position of the special cell before seg/@id-->
    <xsl:variable name="pre-special-cell-pos">
      <xsl:text>c</xsl:text>
      <xsl:number value="$orig-cell-pos -1" format="01"/>
    </xsl:variable>
    <!-- cell position of the special cell following seg/@id -->
    <xsl:variable name="post-special-cell-pos">
      <xsl:text>c</xsl:text>
      <xsl:number value="$orig-cell-pos +1" format="01"/>
    </xsl:variable>
    <!-- number of segs whose sameAs is @id -->
    <xsl:variable name="no-sameAs">
      <xsl:value-of select="count(ancestor::listBibl//seg[@sameAs=$cur-id])"/>
    </xsl:variable>
    <!-- number of segs whose corresp is @id -->
    <xsl:variable name="no-corresp">
      <xsl:value-of select="count(ancestor::listBibl//seg[@corresp=$cur-id])"/>
    </xsl:variable>
    <!-- calculating the rowspan -->
    <!-- sameAs rowspan -->
    <xsl:variable name="sa-rs">
      <xsl:choose>
        <xsl:when test="$no-sameAs = 0"/>
        <xsl:otherwise>
          <xsl:text> rs</xsl:text>
          <xsl:value-of select="$no-sameAs +1"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-- corresp rowspan -->
    <xsl:variable name="cor-rs">
      <xsl:choose>
        <xsl:when test="$no-corresp = 0"/>
        <xsl:otherwise>
          <xsl:text> rs</xsl:text>
          <xsl:value-of select="$no-corresp +1"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <!-- CELL OUTPUT -->
    <xsl:choose>
      <!-- OPTION 1: output cell with content and it's corresponding bracket(s) -->
      <xsl:when test="@id">
        <!-- When the braces appear before (on the left) the cell -->
        <xsl:if test="contains(@rend, 'curly-left')">
          <td>
            <xsl:choose>
              <!-- sameAs option -->
              <xsl:when test="ancestor::listBibl//seg[@sameAs=$cur-id]">
                <xsl:attribute name="class">
                  <xsl:value-of select="$pre-special-cell-pos"/>
                  <xsl:value-of select="$sa-rs"/>
                </xsl:attribute>
                <xsl:call-template name="td-att-rowspan">
                  <xsl:with-param name="no-span">
                    <xsl:value-of select="$no-sameAs"/>
                  </xsl:with-param>
                </xsl:call-template>
                <div class="bracket">
                  <span>}</span>
                </div>
              </xsl:when>
              <!-- corresp option -->
              <xsl:when test="ancestor::listBibl//seg[@corresp=$cur-id]">
                <xsl:attribute name="class">
                  <xsl:value-of select="$pre-special-cell-pos"/>
                  <xsl:value-of select="$cor-rs"/>
                </xsl:attribute>
                <xsl:call-template name="td-att-rowspan">
                  <xsl:with-param name="no-span">
                    <xsl:value-of select="$no-corresp"/>
                  </xsl:with-param>
                </xsl:call-template>
                <div class="bracket">
                  <span>{</span>
                </div>
              </xsl:when>
            </xsl:choose>
          </td>
        </xsl:if>
        <!-- output cell with content -->
        <td>
          <xsl:choose>
            <!-- sameAs option -->
            <xsl:when test="ancestor::listBibl//seg[@sameAs=$cur-id]">
              <xsl:call-template name="td-att-class">
                <xsl:with-param name="seg-cell-pos">
                  <xsl:value-of select="$seg-cell-pos"/>
                </xsl:with-param>
                <xsl:with-param name="rs">
                  <xsl:value-of select="$sa-rs"/>
                </xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="td-att-rowspan">
                <xsl:with-param name="no-span">
                  <xsl:value-of select="$no-sameAs"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <!-- corresp option -->
            <xsl:when test="ancestor::listBibl//seg[@corresp=$cur-id]">
              <xsl:call-template name="td-att-class">
                <xsl:with-param name="seg-cell-pos">
                  <xsl:value-of select="$seg-cell-pos"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:when>
          </xsl:choose>
          <xsl:apply-templates/>
        </td>
        <!-- When the braces appear after the cell -->
        <xsl:if test="contains(@rend, 'curly-right')">
          <td>
            <xsl:choose>
              <!-- sameAs option -->
              <xsl:when test="ancestor::listBibl//seg[@sameAs=$cur-id]">
                <xsl:attribute name="class">
                  <xsl:value-of select="$post-special-cell-pos"/>
                  <xsl:value-of select="$sa-rs"/>
                </xsl:attribute>
                <xsl:call-template name="td-att-rowspan">
                  <xsl:with-param name="no-span">
                    <xsl:value-of select="$no-sameAs"/>
                  </xsl:with-param>
                </xsl:call-template>
                <div class="bracket">
                  <span>{</span>
                </div>
              </xsl:when>
              <!-- corresp option -->
              <xsl:when test="ancestor::listBibl//seg[@corresp=$cur-id]">
                <xsl:attribute name="class">
                  <xsl:value-of select="$post-special-cell-pos"/>
                  <xsl:value-of select="$cor-rs"/>
                </xsl:attribute>
                <xsl:call-template name="td-att-rowspan">
                  <xsl:with-param name="no-span">
                    <xsl:value-of select="$no-corresp"/>
                  </xsl:with-param>
                </xsl:call-template>
                <div class="bracket">
                  <span>}</span>
                </div>
              </xsl:when>
            </xsl:choose>
          </td>
        </xsl:if>
      </xsl:when>
      <!-- OPTION 2: no output for seg/@sameAs -->
      <xsl:when test="@sameAs"/>
      <xsl:when test="@corresp">
        <!-- output cell with content -->
        <td>
          <xsl:call-template name="td-att-class">
            <xsl:with-param name="seg-cell-pos">
              <xsl:value-of select="$seg-cell-pos"/>
            </xsl:with-param>
          </xsl:call-template>
          <xsl:apply-templates/>
        </td>
      </xsl:when>
      <!-- OPTION 3: output normal seg and seg/@corrsep -->
      <xsl:otherwise>
        <!-- output seg/@rend='dots' -->
        <xsl:if test="@rend='dots'">
          <td>
            <xsl:attribute name="class">
              <xsl:value-of select="$pre-special-cell-pos"/>
            </xsl:attribute>
            <xsl:attribute name="colspan">
              <xsl:value-of select="$temp-total-col - $orig-cell-pos + 1"/>
            </xsl:attribute>
            <div class="leader">&#160;</div>
          </td>
        </xsl:if>

        <xsl:if
          test="not($orig-cell-pos = $temp-total-col) and $seg-cell-pos='x01' and not(@rend='dots')">
          <td>
            <xsl:attribute name="class">
              <xsl:text>c</xsl:text>
              <xsl:number value="$orig-cell-pos" format="01"/>
            </xsl:attribute>
            <xsl:attribute name="colspan">
              <xsl:value-of select="$temp-total-col - $orig-cell-pos"/>
            </xsl:attribute>
            <xsl:text> </xsl:text>
          </td>
        </xsl:if>
        <!-- output cell with content -->
        <td>
          <xsl:call-template name="td-att-class">
            <xsl:with-param name="seg-cell-pos">
              <xsl:value-of select="$seg-cell-pos"/>
            </xsl:with-param>
          </xsl:call-template>
          <xsl:apply-templates/>
        </td>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Cell attribute templates -->
  <!-- Class -->
  <xsl:template name="td-att-class">
    <xsl:param name="seg-cell-pos"/>
    <xsl:param name="rs"/>

    <xsl:attribute name="class">
      <xsl:value-of select="$seg-cell-pos"/>
      <xsl:value-of select="$rs"/>
    </xsl:attribute>
  </xsl:template>


  <!-- Rowspan -->
  <xsl:template name="td-att-rowspan">
    <xsl:param name="no-span"/>

    <xsl:choose>
      <xsl:when test="not($no-span=0)">
        <xsl:attribute name="rowspan">
          <xsl:value-of select="$no-span +1"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="sic">
    <xsl:apply-templates/>
    <xsl:text>(sic)</xsl:text>
  </xsl:template>

  <xsl:template match="title[starts-with(ancestor::TEI.2/@id, 'hofm_')]">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="author" priority="1">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="composer" priority="1">
    <strong>
      <xsl:apply-templates/>
    </strong>
  </xsl:template>

  <xsl:template match="xref[@type='cross']" priority="1">
    <xsl:variable name="cross-link-path"
      select="//filebase//group[@id='monatshefte']//groupFolder"/>
    <xsl:variable name="cross-link-filename" select="substring(@from, 1, 12)"/>
    <xsl:variable name="cross-link-anchor" select="@from"/>
    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="$linkroot"/>
        <xsl:value-of select="$cross-link-path"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="$cross-link-filename"/>
        <xsl:text>.html#</xsl:text>
        <xsl:value-of select="@from"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </a>
  </xsl:template>

  <xsl:template match="lb">
    <xsl:choose>
      <xsl:when test="ancestor::listBibl[@rend = 'curly']"/>
      <xsl:otherwise>
        <br/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="pb">
    <xsl:choose>
      <!-- No facsimile-->
      <xsl:when test="contains(@ed, 'na')">
        <xsl:choose>
          <xsl:when test="parent::body">
            <dt class="s02">
              <xsl:call-template name="pb-anchor"/>
              <strong>
                <xsl:text>[Page </xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:text>] </xsl:text>
              </strong>
            </dt>
          </xsl:when>
          <xsl:when test="parent::div | parent::listBibl">
            <dt class="s02">
              <xsl:call-template name="pb-anchor"/>
              <strong>
                <xsl:text>[Page </xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:text>] </xsl:text>
              </strong>
            </dt>
          </xsl:when>
          <xsl:otherwise>
            <strong>
              <xsl:call-template name="pb-anchor"/>
              <xsl:text> [Page </xsl:text>
              <xsl:value-of select="@n"/>
              <xsl:text>] </xsl:text>
            </strong>
            <br/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <!-- Links to facsimile -->
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="parent::body">
            <xsl:choose>
              <xsl:when test="1830 >= substring(ancestor::TEI.2/@id, 6, 4)">
                <dt class="s02">
                  <xsl:call-template name="pb-anchor"/>
                  <strong>
                    <xsl:text>[Page </xsl:text>
                    <xsl:value-of select="@n"/>
                    <xsl:call-template name="onb"/>
                    <xsl:text>] </xsl:text>
                  </strong>
                </dt>
              </xsl:when>
              <xsl:otherwise>
                <dt class="s02">
                  <xsl:call-template name="pb-anchor"/>
                  <strong>
                    <xsl:text>[Page </xsl:text>
                    <xsl:value-of select="@n"/>
                    <xsl:call-template name="onb"/>
                    <xsl:text>] </xsl:text>
                  </strong>
                </dt>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="parent::div | parent::listBibl">
            <dt class="s02">
              <xsl:call-template name="pb-anchor"/>
              <strong>
                <xsl:text>[Page </xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:call-template name="onb"/>
                <xsl:text>] </xsl:text>
              </strong>
            </dt>
          </xsl:when>
          <xsl:otherwise>
            <strong>
              <xsl:call-template name="pb-anchor"/>
              <xsl:text> [Page </xsl:text>
              <xsl:value-of select="@n"/>
              <xsl:call-template name="onb"/>
              <xsl:text>] </xsl:text>
              <br/>
            </strong>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="pb-anchor">
    <xsl:attribute name="id">
      <xsl:text>pb-</xsl:text>
      <xsl:value-of select="@n"/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template name="onb">
    <xsl:variable name="onb-main">
      <xsl:text>http://anno.onb.ac.at/cgi-content/anno-buch?apm=0&amp;aid=1000001</xsl:text>
    </xsl:variable>
    <xsl:variable name="b-year">
      <xsl:value-of select="substring(ancestor::TEI.2/@id, 6, 4)"/>
    </xsl:variable>
    <xsl:variable name="onb-year">
      <xsl:text>&amp;bd=</xsl:text>
      <xsl:number value="$b-year" format="0000001"/>
    </xsl:variable>
    <xsl:variable name="onb-mid">
      <xsl:text>&amp;teil=0203</xsl:text>
    </xsl:variable>
    <!--
<xsl:variable name="b-mth">
<xsl:value-of select="substring(ancestor::TEI.2/@id, 11, 2)" />
</xsl:variable>
-->
    <xsl:variable name="b-pb">
      <xsl:choose>
        <xsl:when test="@ed">
          <xsl:choose>
            <xsl:when test="contains(@ed, '/')">
              <xsl:value-of select="substring-before(substring-after(@ed, 'ONB:'), '/')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring-after(@ed, 'ONB:')"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@n"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="onb-pb">
      <xsl:text>&amp;seite=</xsl:text>
      <xsl:number value="$b-pb" format="00000001"/>
    </xsl:variable>
    <xsl:variable name="onb-pb-2">
      <xsl:choose>
        <xsl:when test="@ed">
          <xsl:choose>
            <xsl:when test="contains(@ed, '/')">
              <xsl:number value="substring-after(@ed, '/')" format="00000001"/>
            </xsl:when>
            <xsl:otherwise/>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise/>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="onb-end">
      <xsl:text>&amp;zoom=1</xsl:text>
    </xsl:variable>
    <a class="extNew" rel="external">
      <xsl:attribute name="href">
        <xsl:value-of select="$onb-main"/>
        <xsl:value-of select="$onb-year"/>
        <xsl:value-of select="$onb-mid"/>
        <xsl:value-of select="$onb-pb"/>
        <xsl:value-of select="$onb-pb-2"/>
        <xsl:value-of select="$onb-end"/>
      </xsl:attribute>
      <xsl:text>View facsimile</xsl:text>
    </a>
  </xsl:template>

  <xsl:template name="facsimile">
    <xsl:choose>
      <!-- No facsimile -->
      <xsl:when test="contains(@ed, 'na')"> </xsl:when>
      <!-- Links to facsimile -->
      <xsl:otherwise>
        <dt class="s02">
          <xsl:call-template name="pb-anchor"/>
          <xsl:call-template name="onb"/>
        </dt>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
