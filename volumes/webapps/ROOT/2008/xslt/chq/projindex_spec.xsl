<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.1">

<xsl:output method="html" indent="yes" />

<!-- ============================================================= -->
<!--  MODULE:           proj_type01_spec.xsl                                 -->
<!--  VERSION DATE:     1.0                                        -->
<!--  VERSION:          2003-09-05 @ 14:16                       -->
<!--  VERSION CONTROL:                                             -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!-- ORIGINAL CREATION DATE:    2003-09-05                   -->
<!-- PURPOSE:   Special templates for type01 transformations  -->
<!-- CREATED FOR:  CCH  www.kcl.ac.uk/cch                          -->
<!-- CREATED BY:   PJS  spencepj@yahoo.com                         -->
<!-- COPYRIGHT:   CCH/PJS                                          -->
<!-- ============================================================= -->

<!--##############################
	 ######## CTPL_CONTENT #########
    ##############################-->
<xsl:template name="ctpl_content">

<h2>Index to create</h2>
  <table width="100%" cellpadding="6" class="detail">
    <tr> 
      <form action="do-index" method="get">
        <th class="subsid">
          &lt;composer&gt;
        </th>
        <td width="15%">
          <textarea style="visibility: hidden;" rows="0" cols="0" name="index">
            for $composer in //composer
            let $id := $composer/ancestor::TEI.2/@id
            return
            <file>{$id}{$composer}</file>
          </textarea>
          <input type="submit" value="show" />
        </td>
      </form>      
      <form action="do-query" method="get">
        <th class="subsid">
          &lt;bibl&gt;
        </th>
        <td width="15%">
          <textarea style="visibility: hidden;" rows="0" cols="0" name="query">
            <count><bibl/>{count(//bibl)}</count>
          </textarea>
          <input type="submit" value="count" />
        </td>
      </form>      
      <form action="do-query" method="get">
        <th class="subsid">
          &lt;wip&gt;
        </th>
        <td width="15%">
          <textarea style="visibility: hidden;" rows="0" cols="0" name="query">
            <count><wip/>{count(//wip)}</count>
          </textarea>
          <input type="submit" value="count" />
        </td>
      </form>      
    </tr>
    <tr> 
      <form action="do-query" method="get">
        <th class="subsid">
          &lt;album&gt;
        </th>
        <td width="15%">
          <textarea style="visibility: hidden;" rows="0" cols="0" name="query">
            <count><album/>{count(//album)}</count>
          </textarea>
          <input type="submit" value="count" />
        </td>
      </form>      
      <form action="do-query" method="get">
        <th class="subsid">
          &lt;biblGroup&gt; 
        </th>
        <td width="15%">
          <textarea style="visibility: hidden;" rows="0" cols="0" name="query">
            <count><biblGroup/>{count(//biblGroup)}</count>
          </textarea>
          <input type="submit" value="count" />
        </td>
      </form>      
      <form action="do-query" method="get">
        <th class="subsid">
          &lt;composer&gt; 
        </th>
        <td width="15%">
          <textarea style="visibility: hidden;" rows="0" cols="0" name="query">
            <count><composer/>{count(//composer)}</count>
          </textarea>
          <input type="submit" value="count" />
        </td>
      </form>      
    </tr>
    <tr> 
      <form action="do-query" method="get">
        <th class="subsid">
          &lt;author&gt; 
        </th>
        <td width="15%">
          <textarea style="visibility: hidden;" rows="0" cols="0" name="query">
            <count><author/>{count(//author)}</count>
          </textarea>
          <input type="submit" value="count" />
        </td>
      </form>      
      <form action="do-query" method="get">
        <th class="subsid">
          &lt;publisher&gt;
        </th>
        <td width="15%">
          <textarea style="visibility: hidden;" rows="0" cols="0" name="query">
            <count><publisher/>{count(//publisher)}</count>
          </textarea>
          <input type="submit" value="count" />
        </td>
      </form>      
      <form action="do-query" method="get">
        <th class="subsid">
          &lt;pubPlace&gt;
        </th>
        <td width="15%">
          <textarea style="visibility: hidden;" rows="0" cols="0" name="query">
            <count><pubPlace/>{count(//pubPlace)}</count>
          </textarea>
          <input type="submit" value="count" />
        </td>
      </form>      
    </tr>
  </table>    
<!--
    <select class="dropdown" name="query">
      <option value="">Choose</option>
      <option value="&lt;p>{count(//pb)}&lt;/p>">PB</option>
    </select>
    <input type="submit" value="page break" />
-->
</xsl:template>

<xsl:template match="count/*">
  <xsl:text>&lt;</xsl:text>
  <xsl:value-of select="local-name()" />
  <xsl:text>>: </xsl:text>
</xsl:template>

<!--    ***********************************************       -->

</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->
