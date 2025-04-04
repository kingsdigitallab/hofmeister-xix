<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.1" xmlns:dir="http://apache.org/cocoon/directory/2.0">

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

  <table width="100%" border="1" cellspacing="3" cellpadding="6">

  <tr>
    <xsl:call-template name="pvandnx" />
    <td colspan="4">&#xa0;
    </td>
    <td align="center" colspan="2">
      <form name="toc1" id="toc1">
        <select name="toc1" onchange="MM_jumpMenu('parent',this,0)">
          <option value="">
            Select a different view
          </option>
          <option value="../{@id}.html">
            Publication view
          </option>
          <option value="../list/{@id}.html">
            List view
          </option>
          <option value="../table/{@id}.html">
            Table view
          </option>
       </select>
      </form>
    </td>
   </tr>
   <tr>
    <td width="7%">&#xa0;
    </td>
    <td width="7%">&#xa0;
    </td>
    <th class="id" width="16%">file @id:
    </th>
    <td width="20%" class="keyid"><b><xsl:apply-templates select="@id" /></b></td>
    <th class="tablenormal" width="16%">languages included:
    </th>
    <td width="20%">
    	<xsl:apply-templates select=".//langUsage" />
    </td>
    <td width="7%">&#xa0;
    </td>
    <td width="7%">&#xa0;
    </td>
   </tr> 

   <tr>
    <td>&#xa0;
    </td>
    <td>&#xa0;
    </td>
    <th class="tablenormal">
    	Main Title of Page
    </th>
    <td colspan="3">
      <xsl:apply-templates select="teiHeader/fileDesc/titleStmt/title" mode="main" />
      <xsl:apply-templates select="teiHeader/fileDesc/titleStmt/author" mode="main" />
    </td>
    <td>&#xa0;
    </td>
    <td>&#xa0;
    </td>
   </tr>
   <tr>
    <td>&#xa0;
    </td>
    <td>&#xa0;
    </td>
    <th class="tablenormal" colspan="4">
      Change Log
    </th>
    <td>&#xa0;
    </td>
    <td>&#xa0;
    </td>
   </tr> 
   <tr>
    <td>&#xa0;
    </td>
    <td>&#xa0;
    </td>
    <td colspan="4">
    	<table width="100%" border="1">
    		<tr>
    			<th class="tablenormal" width="15%">
    				Date
    			</th>
    			<th class="tablenormal" width="15%">
    				Name
    			</th>
    			<th class="tablenormal">
    				Notes
    			</th>
    		</tr>
    		<xsl:apply-templates select=".//change" />
    	</table>
    </td>
    <td>&#xa0;
    </td>
    <td>&#xa0;
    </td>
   </tr> 
   <tr>
     <td align="center" colspan="2">
      <form name="toc1" id="toc1">
        <select name="toc1" onchange="MM_jumpMenu('parent',this,0)">
            <option value="">
              Select a different view
            </option>
            <option value="{$linkroot}/monatshefte/{@id}.html">
              Publication view
            </option>
            <option value="../table/{@id}.html">
              Table view
            </option>
       </select>
      </form>
     </td>
<!--
    <td colspan="6">&#xa0;
    </td>
-->
    <td colspan="4">&#xa0;
    </td>

    <xsl:call-template name="pvandnx" />

   </tr>
  </table>

</xsl:template>

<xsl:template match="bibl|album|wip|head[parent::div]">
	<xsl:if test="preceding-sibling::*[1][local-name()='biblGroup']">
  	<tr>
  		<td colspan="2">
				<span class="biblgroup">
    			<xsl:text>end biblGroup</xsl:text>
				</span>
  		</td>
  	</tr>
  </xsl:if>

	<tr>
		<td>
			<xsl:value-of select="local-name()" />
			<br />
			<xsl:value-of select="@id" />
		</td>
		<td>
			<xsl:if test="local-name()='head'">
				<xsl:text disable-output-escaping="yes">
					<![CDATA[<b>]]>
				</xsl:text>
			</xsl:if>
			<xsl:apply-templates />
			<xsl:if test="local-name()='head'">
				<xsl:text disable-output-escaping="yes">
					<![CDATA[</b>]]>
				</xsl:text>
			</xsl:if>
		</td>
	</tr>
	<xsl:if test="following-sibling::*[1][local-name()='biblGroup']">
  	<tr>
  		<td colspan="2">
				<span class="biblgroup">
    			<xsl:text>biblGroup</xsl:text>
				</span>
  		</td>
  	</tr>
  </xsl:if>
</xsl:template>

<xsl:template match="head">
</xsl:template>

<xsl:template match="composer|author|artist">
	<span class="composer">
		<xsl:apply-templates />
	</span>
</xsl:template>

<xsl:template match="opus">
	<span class="opus">
		<xsl:apply-templates />
	</span>
</xsl:template>

<xsl:template match="key">
	<span class="key">
		<xsl:apply-templates />
	</span>
</xsl:template>

<xsl:template match="title">
	<span class="title">
		<xsl:apply-templates />
	</span>
</xsl:template>

<xsl:template match="pubPlace">
	<span class="pubplace">
		<xsl:apply-templates />
	</span>
</xsl:template>

<xsl:template match="publisher">
	<span class="publisher">
		<xsl:apply-templates />
	</span>
</xsl:template>

<xsl:template match="price">
	<span class="price">
		<xsl:apply-templates />
	</span>
</xsl:template>

<xsl:template match="pb">
	<xsl:if test="preceding-sibling::*[1][local-name()='biblGroup']">
  	<tr>
  		<td colspan="2">
				<span class="biblgroup">
    			<xsl:text>end biblGroup</xsl:text>
				</span>
  		</td>
  	</tr>
  </xsl:if>
	<xsl:choose>
		<xsl:when test="ancestor::bibl">
			<span class="warning2">
				<xsl:value-of select="@n" />
			</span>
		</xsl:when>
		<xsl:when test="ancestor::album">
			<span class="warning2">
				<xsl:value-of select="@n" />
			</span>
		</xsl:when>
		<xsl:when test="ancestor::wip">
			<span class="warning2">
				<xsl:value-of select="@n" />
			</span>
		</xsl:when>
		<xsl:when test="ancestor::head">
			<span class="warning2">
				<xsl:value-of select="@n" />
			</span>
		</xsl:when>
		<xsl:otherwise>
			<tr>
				<td colspan="2">
					<span class="warning2">
						<xsl:value-of select="@n" />
					</span>
				</td>
			</tr>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:if test="following-sibling::*[1][local-name()='biblGroup']">
  	<tr>
  		<td colspan="2">
				<span class="biblgroup">
    			<xsl:text>biblGroup</xsl:text>
				</span>
  		</td>
  	</tr>
  </xsl:if>

</xsl:template>

<xsl:template match="abbr|add|address|anchor|biblScope|code|corr|del|emph|extent|foreign|formula|gap|gi|gloss|hi|ident|idno|imprint|index|interp|interpGrp|kw|mentioned|milestone|note|num|orig|ptr|pubInfo|quoted|ref|reg|remark|respStmt|rs|s|seg|soCalled|term|time|xptr">
  <xsl:if test="ancestor::bibl | ancestor::album | ancestor::wip">
  	<span class="warning">
  	  <xsl:text>&lt;</xsl:text>
  	  <xsl:value-of select="local-name()" />
  	  <xsl:text>&gt;</xsl:text>
  	</span>
  		<xsl:apply-templates />
  	<span class="warning">
  	  <xsl:text>&lt;/</xsl:text>
  	  <xsl:value-of select="local-name()" />
  	  <xsl:text>&gt;</xsl:text>
  	</span>
  </xsl:if>
</xsl:template>

<xsl:template match="language">
  <xsl:apply-templates />
  <br />
</xsl:template>
	
<xsl:template match="change">
  <tr>
    <td>
      <xsl:apply-templates select="date"/>
    </td>
    <td>
      <xsl:apply-templates select="respStmt/name" />
    </td>
    <td>
      <xsl:apply-templates select="item" />
    </td>
  </tr>
</xsl:template>


	
<xsl:template name="pvandnx">
  <xsl:variable name="directory">
    <xsl:value-of select="$linkroot" />
    <xsl:text>/</xsl:text>
    <xsl:value-of select="$group" />
    <xsl:text>/monatdir.xml</xsl:text>
  </xsl:variable>

	<xsl:choose>
    <xsl:when test="starts-with(document($directory)//dir:file[descendant::text()=current()/@id]/preceding::dir:file/@name, '1')">
	    <td>
	    	<a class="content" href="hofm_{substring-before(document($directory)//dir:file[descendant::text()=current()/@id]/preceding::dir:file[1]/@name, '.xml')}.html"><img alt="{$alt_text}" border="0" class="imgover" src="{$imgroot}{$genimgswitch}button_previous.gif" width="61" height="17" />
	    	</a>
				<img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}shim.gif" height="17" width="10"/>
			</td>	
	  </xsl:when>
	  <xsl:otherwise>
	    <td>&#xa0;
	    	<img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}shim.gif" height="17" width="10"/>
	    </td>	
	  </xsl:otherwise>
	</xsl:choose>
  <xsl:choose>
    <xsl:when test="starts-with(document($directory)//dir:file[descendant::text()=current()/@id]/following::dir:file/@name, '1')">
	    <td>
	    	<a class="content" href="hofm_{substring-before(document($directory)//dir:file[descendant::text()=current()/@id]/following::dir:file[1]/@name, '.xml')}.html"><img alt="{$alt_text}" border="0" class="imgover" src="{$imgroot}{$genimgswitch}button_next.gif" width="40" height="17" />
	    	</a>
				<img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}shim.gif" height="17" width="10"/>
			</td>
	  </xsl:when>
	  <xsl:otherwise>
	    <td>&#xa0;
	    	<img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}shim.gif" height="17" width="10"/>
	    </td>	
	  </xsl:otherwise>
	</xsl:choose>
</xsl:template>
	
</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->
