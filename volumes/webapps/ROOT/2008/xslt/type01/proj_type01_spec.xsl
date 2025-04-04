<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1"
  xmlns:dir="http://apache.org/cocoon/directory/2.0">
  <!-- VERSION: $Id: proj_type01_spec.xsl 727 2007-05-01 16:45:54Z epierazzo $ -->

  <!-- Index Keys -->
  <xsl:key name="decade" match="item" use="substring(@id, 6, 4)"/>

  <xsl:key name="browse" match="dir:file" use="substring(@name, 1, 4)"/>

  <xsl:key name="headerAuth" match="titleStmt/author" use="normalize-space(name[@type='surname'])"/>
  <xsl:key name="kwForeign" match="file" use="concat(@id, '-', ancestor::row/head)"/>
  <xsl:key name="kwForeignAZ" match="head"
    use="translate(substring(., 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>

  <!-- START: divGen-->
  <xsl:template match="divGen">

    <xsl:if test="@id='browse'">
      <div class="unorderedList">
        <div class="t03">
          <ul>
            <xsl:for-each select="//xml-decade//list">
              <xsl:variable name="count-item" select="count(item)"/>
              <xsl:variable name="start-year" select="substring(item[1]/@id, 6, 4)"/>
              <xsl:variable name="end-year" select="substring(item[$count-item]/@id, 6, 4)"/>
              <li>
                <a class="x70 z03">
                  <xsl:value-of select="$start-year"/>
                  <xsl:if test="not($start-year=$end-year)">
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="$end-year"/>
                  </xsl:if>
                </a>
                <ul class="x71 z02">
                  <xsl:for-each
                    select="child::item[generate-id(.)=generate-id(key('decade', substring(@id, 6, 4))[1])]">
                    <li>
                      <a class="x70 z03">
                        <xsl:value-of select="substring(@id, 6, 4)"/>
                      </a>
                      <ul class="x71 z02">
                        <xsl:for-each select="key('decade', substring(@id, 6, 4))">
                          <li>
                            <xsl:value-of select="."/>
                            <xsl:text> - View by: </xsl:text>
                            <a class="int"
                              href="{$linkroot}/{$group-type02-path}{substring(@id, 6)}/{@pb}.html">
                              <xsl:text>Page</xsl:text>
                            </a>
                            <a class="int"
                              href="{$linkroot}/{$group-type02-path}{substring(@id, 6)}.html">
                              <xsl:text>Month</xsl:text>
                            </a>
                            <a class="int"
                              href="{$linkroot}/{$group-type02-path}hofclass/{substring(@id, 6)}/div01.html">
                              <xsl:text>Class</xsl:text>
                            </a>
                          </li>
                        </xsl:for-each>
                      </ul>
                    </li>
                  </xsl:for-each>
                </ul>
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </div>
    </xsl:if>


    <xsl:if test="@id = 'form_corr'">
          
                
      <p>This is a beta version of Hofmeister XIX and will contain a variety of errors. We welcome
        reports on errors for correction in the first full delivery. <strong>Please ensure that you
          enter your e-mail address in the box below.</strong></p>
      <p>To comment on the design of Hofmeister XIX, please use the <a class="int" href="comment.html">Comments
          form.</a></p>
      <div class="form">
        <div class="t09">
           <form name="hof_e" action="http://curlew.cch.kcl.ac.uk/cgi-bin/doemail.pl" method="post">
            <input name="script" type="hidden" value="hof_e"/>
            <fieldset class="s04">
              <legend>Error Feedback</legend>
              <ol>
                <li class="clfx-b s01">
                  <label for="fe01" class="s01">Please describe the error below, being sure to
                    provide any necessary location details.</label>
                  <textarea id="fe01" name="fe01">&#160;</textarea>
                </li>
                <li class="clfx-b">
                  <fieldset class="f15 n03">
                    <legend>Contact Details</legend>
                    <ol>
                      <li class="clfx-b">
                        <label for="fe16">Name:</label>
                        <input id="fe16" type="text" class="f01" name="fe16"/>
                      </li>
                      <li class="clfx-b">
                        <label for="fe19">Email Address:</label>
                        <input id="fe19" type="text" class="f01" name="fe19"/>
                      </li>
                    </ol>
                  </fieldset>
                </li>
                <li class="clfx-b">
                  <fieldset class="f13 n07">
                    <legend>Send Comments</legend>
                    <div>
                      <input type="text" value="" name="subtotal" class="fs" />
                      <button type="submit">Submit</button>
                      <button type="reset">Reset Form</button>
                    </div>
                  </fieldset>
                </li>
              </ol>
            </fieldset>
          </form>
        </div>
      </div>

    </xsl:if>


    <xsl:if test="@id = 'form_comment'">
      <div class="form">
        <div class="t09">
          <form name="hof_c" action="http://curlew.cch.kcl.ac.uk/cgi-bin/doemail.pl" method="post">
            <input name="script" type="hidden" value="hof_c"/>
            <fieldset class="s03">
              <legend>Comments</legend>
              <ol>
                <li class="clfx-b">
                  <fieldset class="f06">
                    <legend>General</legend>
                    <ol>
                      <li class="clfx-b">
                        <label for="fe01">Design Quality:</label>
                        <select id="fe01" name="fe01">
                          <option selected="selected"> Please select... </option>
                          <option value="10"> 10 </option>
                          <option value="9"> 9 </option>
                          <option value="8"> 8 </option>
                          <option value="7"> 7 </option>
                          <option value="6"> 6 </option>
                          <option value="5"> 5 </option>
                          <option value="4"> 4 </option>
                          <option value="3"> 3 </option>
                          <option value="2"> 2 </option>
                          <option value="1"> 1 </option>
                          <option value="0"> 0 </option>
                        </select>
                      </li>
                      <li class="clfx-b s01">
                        <label for="fe02" class="s01">Is the overall design clear and easy to use?
                          Are there aspects that could be made clearer, by changing either the
                          design or the documentation?</label>
                        <textarea id="fe02" name="fe02">&#160;</textarea>
                      </li>
                      <li class="clfx-b">
                        <label for="fe03">Ease of Navigation:</label>
                        <select id="fe03" name="fe03">
                          <option selected="selected"> Please select... </option>
                          <option value="10"> 10 </option>
                          <option value="9"> 9 </option>
                          <option value="8"> 8 </option>
                          <option value="7"> 7 </option>
                          <option value="6"> 6 </option>
                          <option value="5"> 5 </option>
                          <option value="4"> 4 </option>
                          <option value="3"> 3 </option>
                          <option value="2"> 2 </option>
                          <option value="1"> 1 </option>
                          <option value="0"> 0 </option>
                        </select>
                      </li>
                      <li class="clfx-b">
                        <label for="fe04" class="s01">Could navigation be improved, and if so, how?</label>
                        <textarea id="fe04" name="fe04">&#160;</textarea>
                      </li>
                      <li class="clfx-b">
                        <label for="fe05">Accessing information:</label>
                        <select id="fe05" name="fe05">
                          <option selected="selected"> Please select... </option>
                          <option value="10"> 10 </option>
                          <option value="9"> 9 </option>
                          <option value="8"> 8 </option>
                          <option value="7"> 7 </option>
                          <option value="6"> 6 </option>
                          <option value="5"> 5 </option>
                          <option value="4"> 4 </option>
                          <option value="3"> 3 </option>
                          <option value="2"> 2 </option>
                          <option value="1"> 1 </option>
                          <option value="0"> 0 </option>
                        </select>
                      </li>
                      <li class="clfx-b">
                        <label for="fe06" class="s01">Please describe any specific suggestions for
                          improving the browsing, index, or search interfaces.</label>
                        <textarea id="fe06" name="fe06">&#160;</textarea>
                      </li>
                      <li class="clfx-b">
                        <label for="fe07">Usefulness of the resource:</label>
                        <select id="fe07" name="fe07">
                          <option selected="selected"> Please select... </option>
                          <option value="10"> 10 </option>
                          <option value="9"> 9 </option>
                          <option value="8"> 8 </option>
                          <option value="7"> 7 </option>
                          <option value="6"> 6 </option>
                          <option value="5"> 5 </option>
                          <option value="4"> 4 </option>
                          <option value="3"> 3 </option>
                          <option value="2"> 2 </option>
                          <option value="1"> 1 </option>
                          <option value="0"> 0 </option>
                        </select>
                      </li>
                      <li class="clfx-b">
                        <label for="fe08" class="s01">Are there ways in which the usefulness of the
                          resource could be enhanced? If so, how?</label>
                        <textarea id="fe08" name="fe08">&#160;</textarea>
                      </li>
                      <li class="clfx-b">
                        <label for="fe08b" class="s02">Are there any further comments you would like
                          to make?</label>
                        <textarea id="fe08b" name="fe08b">&#160;</textarea>
                      </li>
                    </ol>
                  </fieldset>
                </li>
                <li>
                  <fieldset class="f06 n02">
                    <legend>Practicalities</legend>
                    <ol>
                      <li>
                        <fieldset class="s01">
                          <legend>Did you access the database from home or work?</legend>
                          <ol>
                            <li class="clfx-b">
                              <input class="f02" type="radio" name="homeWork" value="home" id="fe09" />
                              <label for="fe09" class="s03">Home</label>
                            </li>
                            <li class="clfx-b">
                              <input class="f02" type="radio" name="homeWork" value="work" id="fe10"/>
                              <label for="fe10" class="s03">Work</label>
                            </li>
                          </ol>
                        </fieldset>
                      </li>
                      <li>
                        <fieldset class="s01">
                          <legend>Did it take long to download material?</legend>
                          <ol>
                            <li class="clfx-b">
                              <input class="f02" type="radio" name="howLong" value="yes" id="fe11"/>
                              <label for="fe11" class="s03">Yes</label>
                            </li>
                            <li class="clfx-b">
                              <input class="f02" type="radio" name="howLong" value="no" id="fe12"/>
                              <label for="fe12" class="s03">No</label>
                            </li>
                          </ol>
                        </fieldset>
                      </li>
                      <li>
                        <fieldset class="s01">
                          <legend>Are you using a PC or a Mac?</legend>
                          <ol>
                            <li class="clfx-b">
                              <input class="f02" type="radio" name="platform" value="pc" id="fe13"/>
                              <label for="fe13" class="s03">PC</label>
                            </li>
                            <li class="clfx-b">
                              <input class="f02" type="radio" name="platform" value="mac" id="fe14"/>
                              <label for="fe14" class="s03">Mac</label>
                            </li>
                          </ol>
                        </fieldset>
                      </li>
                      <li>
                        <label for="fe15">Which web browser are you using (please include version
                          number if possible)</label>
                        <input id="fe15" type="text" class="f01" name="fe15"/>
                      </li>
                    </ol>
                  </fieldset>
                </li>
                <li class="clfx-b">
                  <fieldset class="f15 n03">
                    <legend>Personal Details</legend>
                    <div class="s01">
                      <em>It would be helpful to us to know in what capacity you have used this
                      site</em>
                    </div>
                    <ol>
                      <li class="clfx-b">
                        <label for="fe16">Name:</label>
                        <input id="fe16" type="text" class="f01" name="fe16"/>
                      </li>
                      <li class="clfx-b">
                        <label for="fe17">Occupation:</label>
                        <input id="fe17" type="text" class="f01" name="fe17"/>
                      </li>
                      <li class="clfx-b">
                        <label for="fe18">Country:</label>
                        <input id="fe18" type="text" class="f01" name="fe18"/>
                      </li>
                      <li class="clfx-b">
                        <label for="fe19">Email Address:</label>
                        <input id="fe19" type="text" class="f01" name="fe19"/>
                      </li>
                    </ol>
                  </fieldset>
                </li>
                <li class="clfx-b">
                  <fieldset class="f06 n07">
                    <legend>Send Comments</legend>
                    <div>
                      <input type="text" value="" name="subtotal" class="fs" />
                      <button type="submit">Submit</button>
                      <button type="reset">Reset Form</button>
                    </div>
                  </fieldset>
                </li>
              </ol>
            </fieldset>
          </form>
        </div>
      </div>
    </xsl:if>



    <!-- Templates in proj_type01_stdext.xsl -->

    <!--GLOSSARY -->
    <xsl:if test="@id='tpl_glossary'">
      <xsl:call-template name="ctpl_glossary"/>
    </xsl:if>

    <!--SITE MAP -->
    <xsl:if test="@id='tpl_sitemap'">
      <xsl:call-template name="ctpl_sitemap"/>
    </xsl:if>

    <!-- END: divGen-->
  </xsl:template>



  <!--INDEX TEMPLATES-->

  <xsl:template name="simp-idx">

    <!--Getting each unique instance -->
    <xsl:for-each
      select="//titleStmt/author[generate-id()=generate-id(key('headerAuth', normalize-space(name[@type='surname']))[1])]">
      <xsl:sort select="normalize-space(name[@type='surname'])"/>

      <!--Variables for CSS -->
      <xsl:variable name="row">
        <xsl:call-template name="row-vars"/>
      </xsl:variable>

      <xsl:variable name="oddeven">
        <xsl:call-template name="oddeven"/>
      </xsl:variable>

      <!--Output the unique instance -->
      <dt>
        <xsl:attribute name="class">
          <xsl:value-of select="$row"/>
          <xsl:value-of select="$oddeven"/>
        </xsl:attribute>
        <xsl:value-of select="name[@type='surname']"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="name[@type='foreName']"/>
      </dt>

      <!--Each instance -->
      <xsl:for-each select="key('headerAuth', normalize-space(name[@type='surname']))">
        <xsl:sort select="ancestor::titleStmt/title[1]"/>

        <!--Variables for CSS -->
        <xsl:variable name="col">
          <xsl:call-template name="col-vars"/>
        </xsl:variable>

        <!--Link output -->
        <dd>
          <xsl:attribute name="class">
            <xsl:value-of select="$row"/>
            <xsl:value-of select="$col"/>
            <xsl:value-of select="$oddeven"/>
          </xsl:attribute>
          <a>
            <xsl:choose>
              <xsl:when test="ancestor::TEI.2[@rend='type03']">
                <xsl:attribute name="href">
                  <xsl:value-of select="$linkroot"/>
                  <xsl:value-of select="$group-type03-path"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="ancestor::TEI.2/@n"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="ancestor::TEI.2/@n"/>
                  <xsl:text>-01.html</xsl:text>
                </xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="href">
                  <xsl:value-of select="$linkroot"/>
                  <xsl:value-of select="$group-type02-path"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="ancestor::TEI.2/@id"/>
                  <xsl:text>.html</xsl:text>
                </xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
            <span>
              <xsl:apply-templates select="ancestor::titleStmt/title[1]" mode="index"/>
            </span>
          </a>
        </dd>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>



  <xsl:template name="kw-idx">

    <!--Variables for CSS -->
    <xsl:variable name="row">
      <xsl:call-template name="row-vars"/>
    </xsl:variable>
    <xsl:variable name="oddeven">
      <xsl:call-template name="oddeven"/>
    </xsl:variable>

    <!--Output the unique instance -->
    <dt>
      <xsl:attribute name="class">
        <xsl:value-of select="$row"/>
        <xsl:value-of select="$oddeven"/>
      </xsl:attribute>
      <xsl:value-of select="head"/>
    </dt>

    <!--Getting each unique instance -->
    <xsl:for-each
      select="file[generate-id()=generate-id(key('kwForeign', concat(@id, '-', ancestor::row/head))[1])]">

      <!--Variables for CSS -->
      <xsl:variable name="col">
        <xsl:call-template name="col-vars"/>
      </xsl:variable>
      <!--Link output -->
      <dd>
        <xsl:attribute name="class">
          <xsl:value-of select="$row"/>
          <xsl:value-of select="$col"/>
          <xsl:value-of select="$oddeven"/>
        </xsl:attribute>
        <label>
          <xsl:apply-templates/>
        </label>
        <xsl:for-each select="key('kwForeign', concat(@id, '-', ancestor::row/head))">
          <a class="s02">
            <xsl:choose>
              <xsl:when test="@rend='type03'">
                <xsl:attribute name="href">
                  <xsl:value-of select="$linkroot"/>
                  <xsl:value-of select="$group-type03-path"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="@n"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="@n"/>
                  <xsl:text>-</xsl:text>
                  <xsl:number value="@pg" format="01"/>
                  <xsl:text>.html</xsl:text>
                  <xsl:if test="string(@href)">
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="@href"/>
                  </xsl:if>
                </xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="href">
                  <xsl:value-of select="$linkroot"/>
                  <xsl:value-of select="$group-type02-path"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="@id"/>
                  <xsl:text>.html</xsl:text>
                  <xsl:if test="string(@href)">
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="@href"/>
                  </xsl:if>
                </xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
            <span>
              <xsl:text>Occurrence </xsl:text>
              <xsl:value-of select="position()"/>
            </span>
          </a>
        </xsl:for-each>
      </dd>
    </xsl:for-each>
  </xsl:template>

  <!--Variables for CSS on the dt and dd -->
  <xsl:template name="row-vars">
    <xsl:text>r</xsl:text>
    <xsl:number value="position()" format="01"/>
  </xsl:template>

  <xsl:template name="col-vars">
    <xsl:choose>
      <xsl:when test="position() = count(key('headerAuth', normalize-space(name[@type='surname'])))">
        <xsl:text> x01</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> c</xsl:text>
        <xsl:number value="position()" format="01"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>



  <!--Moded Templates-->

  <!-- Does not process notes in the titles -->
  <xsl:template match="note" mode="index"> </xsl:template>

</xsl:stylesheet>
