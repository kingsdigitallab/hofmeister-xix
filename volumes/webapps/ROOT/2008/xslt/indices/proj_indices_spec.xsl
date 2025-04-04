<?xml version="1.0" ?>
<!--  
    SVN: $Id: proj_indices_spec.xsl 1008 2008-04-09 16:41:21Z epierazzo $          
-->

<xsl:stylesheet version="1.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:variable name="alpha-lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
  <xsl:variable name="alpha-upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

  <!-- Key to create letters at the top -->
  <xsl:key match="regName[not(ancestor::sublevel)]" name="alphalist"
    use="translate(substring(., 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />

  <!-- Key to create the grouping -->
  <xsl:key match="regName" name="letter-group" use="translate(translate(substring(., 1, 2),$regNameBefore, $regNameAfter), $upper, $lower)" />

  <!-- Last letter of the first group -->
  <xsl:variable name="group1-last-letter">
    <xsl:choose>
      <xsl:when test="$index = 'publishers'">
        <xsl:text>f</xsl:text>
      </xsl:when>
      <xsl:when test="$index = 'composers'">
        <xsl:text>d</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>z</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- Variables extracted from the URL  -->
  <xsl:variable name="orig-starts-with-letter" select="substring($view, 1, 1)" />
  <xsl:variable name="starts-with-letter" select="translate(substring($view, 1, 1), $upper, $lower)" />
  <xsl:variable name="lower-limit-letter" select="translate(substring($view, 2, 1), $upper, $lower)" />
  <xsl:variable name="upper-limit-letter" select="translate(substring($view, 5, 1), $upper, $lower)" />
  <xsl:variable name="lower-limit-letter-pos" select="string-length(substring-before($lower, $lower-limit-letter)) + 1" />
  <xsl:variable name="limit-letter-pos" select="string-length(substring-before($lower, $upper-limit-letter)) + 1" />

  <!-- Creates the letter groups on top of the page - template called from below in match='index' -->
  <xsl:template name="group-letters">
    <xsl:param name="group-start-letter" />
    <xsl:param name="group-end-letter" />

    <xsl:variable name="group-start-letter-pos" select="string-length(substring-before($lower, $group-start-letter)) + 1" />
    <xsl:variable name="group-end-letter-pos" select="string-length(substring-before($lower, $group-end-letter)) + 1" />

    <xsl:variable name="span-page">
      <xsl:value-of select="$orig-starts-with-letter" />
      <xsl:value-of select="$group-start-letter" />
      <xsl:text>-</xsl:text>
      <xsl:value-of select="$orig-starts-with-letter" />
      <xsl:value-of select="$group-end-letter" />
    </xsl:variable>

    <!-- Link to the group of letters -->
    <li>
      <a>
        <xsl:choose>
          <!-- When it is the current page sublist is open -->
          <xsl:when test="$view=$span-page">
            <xsl:attribute name="class">
              <xsl:text>x70 z03</xsl:text>
            </xsl:attribute>
          </xsl:when>
          <!-- When the page is in the group of letters no link is created -->
          <!--<xsl:when test="$group-end-letter-pos >= $lower-limit-letter-pos and $lower-limit-letter-pos >= $group-start-letter-pos">
            <xsl:attribute name="class">
                                        <xsl:text>x70 z04</xsl:text>
                                    </xsl:attribute>
          </xsl:when>-->
          <!-- Otherwise link to the new group of letters -->
          <xsl:otherwise>
            <!--<xsl:attribute name="class">
                                        <xsl:text>x70 z03</xsl:text>
                                    </xsl:attribute>-->
            <xsl:attribute name="href">
              <xsl:value-of select="$span-page" />
              <xsl:text>.html</xsl:text>
            </xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$span-page" />
      </a>
      <xsl:choose>
        <xsl:when test="$view = $span-page">
          <xsl:if test="terms/term">
            <ul class="x71 z02">
              <!-- If needs to be open, uncomment below -->
              <!--<xsl:choose>
                                <xsl:when test="$view=$span-page">
                                    <xsl:attribute name="class">
                                        <xsl:text>x71 z01</xsl:text>
                                    </xsl:attribute>
                                </xsl:when>                                
                                <xsl:when
                                    test="$group-end-letter-pos >= $lower-limit-letter-pos and $lower-limit-letter-pos >= $group-start-letter-pos">
                                    <xsl:attribute name="class">
                                        <xsl:text>x71 z01</xsl:text>
                                    </xsl:attribute>
                                </xsl:when>                                
                                <xsl:otherwise>
                                    <xsl:attribute name="class">
                                        <xsl:text>x71 z02</xsl:text>
                                    </xsl:attribute>
                                </xsl:otherwise>
                            </xsl:choose>-->
              <xsl:for-each select="terms/term[@is-new = 'true'][not(@sec = '.')]">
                <xsl:variable name="cur-sec" select="@sec" />
                <xsl:if test="not($cur-sec = preceding-sibling::term[@is-new='true']/@sec)">
                  <xsl:variable name="cur-reg-letter" select="translate(substring(@lower, 2, 1), $regNameBefore, $regNameAfter)" />
                  <xsl:variable name="cur-reg-letter-pos" select="string-length(substring-before($lower, $cur-reg-letter)) + 1" />

                  <!-- Link to the letters -->
                  <xsl:if test="$group-end-letter-pos >= $cur-reg-letter-pos and $cur-reg-letter-pos >= $group-start-letter-pos">
                    <li>
                      <a href="{$orig-starts-with-letter}{$cur-reg-letter}.html">
                        <xsl:value-of select="$orig-starts-with-letter" />
                        <xsl:value-of select="$cur-reg-letter" />
                      </a>
                    </li>
                  </xsl:if>
                </xsl:if>
              </xsl:for-each>
              <xsl:if test="count(terms/term[@is-new = 'true'][not(@sec = '.')]) = 0">
                <xsl:if test="terms/term[@is-new = 'true'][@sec = '.']">
                  <li>
                    <a href="{$orig-starts-with-letter}a.html">
                      <xsl:value-of select="$orig-starts-with-letter" />
                      <xsl:text>a</xsl:text>
                    </a>
                  </li>
                </xsl:if>
              </xsl:if>
            </ul>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise />
      </xsl:choose>
    </li>
  </xsl:template>


  <!-- Page output -->
  <xsl:template match="index">
    <div class="unorderedList">
      <!-- NEED TO CHANGE WITH CSS CHANGE -->
      <div class="t03">
        <ul>
          <!-- Group of letters above, with parameters set  -->
          <xsl:choose>
            <xsl:when test="$index = 'composers'">
              <xsl:call-template name="group-letters">
                <xsl:with-param name="group-start-letter" select="'a'" />
                <xsl:with-param name="group-end-letter" select="$group1-last-letter" />
              </xsl:call-template>

              <xsl:call-template name="group-letters">
                <xsl:with-param name="group-start-letter" select="'e'" />
                <xsl:with-param name="group-end-letter" select="'h'" />
              </xsl:call-template>

              <xsl:call-template name="group-letters">
                <xsl:with-param name="group-start-letter" select="'i'" />
                <xsl:with-param name="group-end-letter" select="'l'" />
              </xsl:call-template>

              <xsl:call-template name="group-letters">
                <xsl:with-param name="group-start-letter" select="'m'" />
                <xsl:with-param name="group-end-letter" select="'p'" />
              </xsl:call-template>

              <xsl:call-template name="group-letters">
                <xsl:with-param name="group-start-letter" select="'q'" />
                <xsl:with-param name="group-end-letter" select="'t'" />
              </xsl:call-template>

              <xsl:call-template name="group-letters">
                <xsl:with-param name="group-start-letter" select="'u'" />
                <xsl:with-param name="group-end-letter" select="'z'" />
              </xsl:call-template>
            </xsl:when>
            <xsl:when test="$index = 'publishers'">
              <xsl:call-template name="group-letters">
                <xsl:with-param name="group-start-letter" select="'a'" />
                <xsl:with-param name="group-end-letter" select="$group1-last-letter" />
              </xsl:call-template>

              <xsl:call-template name="group-letters">
                <xsl:with-param name="group-start-letter" select="'g'" />
                <xsl:with-param name="group-end-letter" select="'n'" />
              </xsl:call-template>

              <xsl:call-template name="group-letters">
                <xsl:with-param name="group-start-letter" select="'o'" />
                <xsl:with-param name="group-end-letter" select="'z'" />
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise />
          </xsl:choose>
        </ul>
      </div>
    </div>

    <!-- List of words below -->
    <xsl:if test="not(terms/term)">
            <p>No entries starting with this range</p>
          </xsl:if>
      <div class="unorderedList">
      <div class="t05">
        <ul>
          

          <xsl:for-each select="terms/term">
            <li>
              <xsl:call-template name="item-link" />
            </li>
          </xsl:for-each>
        </ul>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="item-link">
    <li>
      <xsl:variable name="path" select="substring-before(//index/terms/field, '-')" />
      <xsl:variable name="l" select="substring($view, 1, 1)" />


      <a href="{$path}/{@id}.html?fieldTxt={$index}&amp;startTxt={$l}a-{$l}z&amp;current={@id}&amp;field1Txt={.}">
        <xsl:value-of select="." />
      </a>

      <!-- Adds subclasses -->
      <xsl:if test="//A_list/hofClass[@id = current()/@id]/sublevel">
        <ul>
          <xsl:for-each select="//A_list/hofClass[@id = current()/@id]/sublevel">
            <li>
              <a href="{$path}/{@id}.html?fieldTxt={$index}&amp;startTxt={$l}a-{$l}z&amp;current={@id}&amp;field1Txt={regName}">
                <xsl:value-of select="regName" />
              </a>
            </li>
          </xsl:for-each>
        </ul>
      </xsl:if>
    </li>
  </xsl:template>

  <!-- Recursive template for alphabet list -->
  <xsl:template name="alphabetList">
    <xsl:for-each select="//alpha/item">
      <xsl:variable name="letter">
        <xsl:call-template name="to-upper-case">
          <xsl:with-param name="str" select="@letter" />
        </xsl:call-template>
      </xsl:variable>

      <li>
        <xsl:choose>
          <xsl:when test="@exists = 'true'">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="$letter" />

                <!-- NOTE: for composers and publishers by Q or Y, the link is hardcoded to the current first interval with data -->
                <xsl:choose>
                  <xsl:when test="contains($context-id, 'composers') and $letter = 'Q'">
                    <xsl:text>u-</xsl:text>
                    <xsl:value-of select="$letter" />
                    <xsl:text>z</xsl:text>
                  </xsl:when>
                     <xsl:when test="contains($context-id, 'composers') and $letter = 'Y'">
                    <xsl:text>e-</xsl:text>
                    <xsl:value-of select="$letter" />
                    <xsl:text>h</xsl:text>
                  </xsl:when>
                  <xsl:when test="contains($context-id, 'publishers') and $letter = 'Q'">
                    <xsl:text>o-</xsl:text>
                    <xsl:value-of select="$letter" />
                    <xsl:text>z</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>a-</xsl:text>
                    <xsl:value-of select="$letter" />
                    <xsl:value-of select="$group1-last-letter" />
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:text>.html</xsl:text>
              </xsl:attribute>

              <xsl:value-of select="$letter" />
            </a>
          </xsl:when>
          <xsl:otherwise>
            <span>
              <xsl:value-of select="$letter" />
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </li>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="to-lower-case">
    <xsl:param name="str" />

    <xsl:value-of select="translate($str, $alpha-upper, $alpha-lower)" />
  </xsl:template>

  <xsl:template name="to-upper-case">
    <xsl:param name="str" />

    <xsl:value-of select="translate($str, $alpha-lower, $alpha-upper)" />
  </xsl:template>
</xsl:stylesheet>
