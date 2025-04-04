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
      <xsl:call-template name="views" />
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
    <th class="tablenormal" width="16%">last updated: <br />name:
    </th>
    <td width="20%">
    	<xsl:apply-templates select="./teiHeader/revisionDesc/change[1]/date" />
    	<br />
    	<xsl:apply-templates select="./teiHeader/revisionDesc/change[1]/respStmt/name" />
    </td>
    <td width="7%">&#xa0;
    </td>
    <td width="7%">&#xa0;
    </td>
   </tr> 

   <tr>
    <td width="7%">&#xa0;
    </td>
    <td width="7%">&#xa0;
    </td>
    <th class="tablenormal">
    	Main Title of Page
    </th>
    <td colspan="3">
      <xsl:apply-templates select="teiHeader/fileDesc/titleStmt/title" mode="main" />
      <xsl:apply-templates select="teiHeader/fileDesc/titleStmt/author" mode="main" />
    </td>
    <td width="7%">&#xa0;
    </td>
    <td width="7%">&#xa0;
    </td>
   </tr> 
   <tr>
    <td class="table3" colspan="8">
    	<table width="100%" border="1">
    		<tr>
    			<td width="7%">
    				<b>
							Element <br />
							<span class="keyid">@id</span>
    				</b>
    			</td>
    			<td width="12%">
    				<b>
							<span class="composer">
								<xsl:text>composer </xsl:text>
							</span>
    				</b>
    			</td>
    			<td width="10%">
    				<b>
							<span class="composer">
								<xsl:text>author </xsl:text>
							</span>
    				</b>
    			</td>
    			<td>
    				<b>
							<span class="title">
								<xsl:text>title </xsl:text>
							</span>
    				</b>
    			</td>
    			<td width="8%">
    				<b>
							<span class="pubplace">
								<xsl:text>pubplace </xsl:text>
							</span>
    				</b>
    			</td>
    			<td width="10%">
    				<b>
							<span class="publisher">
								<xsl:text>publisher </xsl:text>
							</span>
    				</b>
    			</td>
<!--
    			<td width="10%">
    				<b>
							<span class="price">
								<xsl:text>price </xsl:text>
							</span>
    				</b>
    			</td>
-->
    		</tr>
			  <xsl:for-each select="//bibl|//wip|//album|//head[parent::div]">
        	<xsl:if test="preceding-sibling::*[1][local-name()='biblGroup']">
          	<tr>
            	<td colspan="5">
            		<span class="biblgroup">
            			<xsl:text>end biblGroup</xsl:text>
            		</span>
            	</td>
          	</tr>
          </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='head'">
		    			<tr>
		    				<td valign="top">
									<xsl:text>head </xsl:text>
		    				</td>
		    				<td colspan="5">
		    					<b><xsl:apply-templates /></b>
		    				</td>
		    			</tr>
						</xsl:when>
						<xsl:otherwise>
		    			<tr>
		    				<td valign="top">
									<xsl:value-of select="local-name()" />
									<br />
									<span class="keyid"><xsl:value-of select="@id" /></span>
								</td>
		    				<td valign="top">
									<xsl:choose>
										<xsl:when test="not(string(.//composer))">
											<span class="warning">
												No Composer
											</span>
										</xsl:when>
										<xsl:otherwise>
											<span class="composer">
												<xsl:apply-templates select=".//composer" />
											</span>
										</xsl:otherwise>
									</xsl:choose>
								</td>
		    				<td valign="top">
									<xsl:choose>
										<xsl:when test="not(string(.//author))">
											&#xa0;
										</xsl:when>
										<xsl:otherwise>
											<span class="composer">
												<xsl:apply-templates select=".//author" />
											</span>
										</xsl:otherwise>
									</xsl:choose>
								</td>
		    				<td valign="top">
									<xsl:choose>
										<xsl:when test="not(string(.//title))">
											<span class="warning">
												No Title
											</span>
										</xsl:when>
										<xsl:otherwise>
											<span class="title">
												<xsl:apply-templates select=".//title" />
											</span>
										</xsl:otherwise>
									</xsl:choose>
								</td>
		    				<td valign="top">
									<xsl:choose>
										<xsl:when test="not(string(.//pubPlace))">
											&#xa0;
										</xsl:when>
										<xsl:otherwise>
											<span class="pubplace">
												<xsl:apply-templates select=".//pubPlace" />
											</span>
										</xsl:otherwise>
									</xsl:choose>
								</td>
		    				<td valign="top">
									<xsl:choose>
										<xsl:when test="not(string(.//publisher))">
											&#xa0;
										</xsl:when>
										<xsl:otherwise>
											<span class="publisher">
												<xsl:apply-templates select=".//publisher" />
											</span>
										</xsl:otherwise>
									</xsl:choose>
								</td>
<!--
		    				<td valign="top">
									<xsl:choose>
										<xsl:when test="not(string(.//price))">
											&#xa0;
										</xsl:when>
										<xsl:otherwise>
											<span class="price">
												<xsl:apply-templates select=".//price" />
											</span>
										</xsl:otherwise>
									</xsl:choose>
								</td>
-->
			    		</tr>
						</xsl:otherwise>
					</xsl:choose>
        	<xsl:if test="following-sibling::*[1][local-name()='biblGroup']">
          	<tr>
          		<td colspan="5">
        				<span class="biblgroup">
            			<xsl:text>biblGroup</xsl:text>
        				</span>
          		</td>
          	</tr>
          </xsl:if>
				</xsl:for-each>
    	</table>
    </td>
   </tr>
  <tr>
    <td align="center" colspan="2">
      <xsl:call-template name="views" />
    </td>
    <td colspan="4">&#xa0;
    </td>

    <xsl:call-template name="pvandnx" />

   </tr>
  </table>

</xsl:template>

<xsl:template match="bibl|album|wip|head">
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
</xsl:template>

<xsl:template match="composer">
	<span class="composer">
		<xsl:apply-templates />
	</span>
	<br />
</xsl:template>

<xsl:template match="title">
	<span class="title">
		<xsl:apply-templates />
	</span>
	<br />
</xsl:template>

<xsl:template match="pubPlace">
	<span class="pubplace">
		<xsl:apply-templates />
	</span>
	<br />
</xsl:template>

<xsl:template match="publisher">
	<span class="publisher">
		<xsl:apply-templates />
	</span>
	<br />
</xsl:template>

<xsl:template match="price">
	<span class="price">
		<xsl:apply-templates />
	</span>
	<br />
</xsl:template>

<xsl:template match="pb">
	<xsl:if test="preceding-sibling::*[1][local-name()='biblGroup']">
  	<tr>
    	<td colspan="5">
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
  		<td colspan="5">
				<span class="biblgroup">
    			<xsl:text>biblGroup</xsl:text>
				</span>
  		</td>
  	</tr>
  </xsl:if>

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

<xsl:template name="views">
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
      <option value="../summary/{@id}.html">
        teiHeader info
      </option>
    </select>
  </form>
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


<xsl:template match="hi">
<xsl:choose>
  <!-- ITALICS -->
  <xsl:when test="@rend='italic'">
    <i><xsl:apply-templates /></i>   
  </xsl:when>
  <!-- BOLD -->
  <xsl:when test="@rend='bold'">
    <b><xsl:apply-templates /></b>    
  </xsl:when>
  <!-- BOLD AND ITALICS -->
  <xsl:when test="@rend='bolditalic'">
    <b><i><xsl:apply-templates /></i></b>    
  </xsl:when>
  <!-- SUPERSCRIPT -->
  <xsl:when test="@rend='sup'">
    <sup><xsl:apply-templates /></sup>   
  </xsl:when>
  <!-- CURRENT DEFAULT: italics -->
  <xsl:otherwise>
     <i><xsl:apply-templates /></i>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>

</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->
