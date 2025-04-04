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
	<h1 class="content">Navbar Structure</h1>
	<xsl:apply-templates select=".//layout" />
</xsl:template>

<!--####################################
	 ######### END CTPL_CONTENT #########
    ####################################-->

<!--    ***********************************************       -->

<!--##############################
	 ######## CTPL_ACTIVE #########
    ##############################-->
<xsl:template name="ctpl_active">
	<table cellspacing="0" cellpadding="5" class="detail">
		<tr>
			<th class="subsid" width="40%" rowspan="2">active</th>
			<xsl:if test="./active/file/@ref">
				<th class="subsid">@ref</th>
			</xsl:if>
			<xsl:if test="./active/file/@start">
				<th class="subsid">@start</th>
			</xsl:if>
			<xsl:if test="not(./active/file[@start or @ref])">
				<td rowspan="2" class="warning">no @ref or @start</td>
			</xsl:if>
		</tr>
		<tr>
			<xsl:if test="./active/file/@ref">
				<td valign="top" align="center">
					<xsl:for-each select="./active/file/@ref">
						<xsl:apply-templates select="."/><br />
					</xsl:for-each>
				</td>
			</xsl:if>
			<xsl:if test="./active/file/@start">
				<td valign="top" align="center">
					<xsl:for-each select="./active/file/@start">
						<xsl:apply-templates select="."/><br />
					</xsl:for-each>
				</td>
			</xsl:if>
		</tr>
	</table>
</xsl:template>


<!--    ***********************************************       -->
<!--    ******   OTHER   *******       -->
<!--    ***********************************************       -->

<xsl:template match="line">
  	<hr style="height: 10px; border: 0; color: #000; background-color: #000;" />
</xsl:template>

<xsl:template match="heading">
	<table cellspacing="0" cellpadding="5" class="head">
		<tr>
			<th class="head" valign="bottom">Heading:</th>
			<td width="60%">
		  	<b><xsl:apply-templates /></b>
			</td>
		</tr>
	</table>
</xsl:template>

<xsl:template match="break">
	<table cellspacing="0" cellpadding="5" class="detail">
		<tr>
			<th class="subsid" valign="bottom">Break: </th>
			<td valign="bottom">
				<xsl:apply-templates select="@height" />
			</td>
		</tr>
	</table>
	<br />

<!--  	<hr>
  	<xsl:attribute name="style">
  		<xsl:text>height: </xsl:text>
			<xsl:apply-templates select="@height" />
			<xsl:text>px; background-color: #eee; color: #eee; border: 0;</xsl:text>
		</xsl:attribute>
		</hr>
--></xsl:template>

<xsl:template match="level01">
		<div class="level1">
  		<table cellspacing="3" cellpadding="6" class="group">
  			<tr>
  				<th valign="center">
  					<h3>1</h3>
  				</th>
  				<td width="60%">
  					<p>
  						<xsl:choose>
  							<xsl:when test="not(label)">
	  							<span class="warning2">no label</span><br />
								</xsl:when>
  							<xsl:when test="not(string(label))">
	  							<span class="warning2">no label</span><br />
								</xsl:when>
								<xsl:otherwise>
									[label] <b><xsl:apply-templates select="label"/></b><br />
								</xsl:otherwise>
							</xsl:choose> 						
  						[default] <xsl:apply-templates select="default/@ref"/>
  					</p>
  				</td>
  			</tr>
  		</table>
  	</div>
  	<xsl:if test="./active">
			<div class="level2">
				<xsl:call-template name="ctpl_active" />
	  	</div>
		</xsl:if>
		<xsl:if test="./sub02">
			<xsl:apply-templates select=".//level02"/>
		</xsl:if>
</xsl:template>


<xsl:template match="level02">
		<div class="level2">
  		<table cellspacing="3" cellpadding="6" class="group">
  			<tr>
  				<th valign="center">
  					<h3>2</h3>
  				</th>
  				<td width="60%">
  					<p>
  						<xsl:choose>
  							<xsl:when test="not(label)">
	  							<span class="warning2">no label</span><br />
								</xsl:when>
  							<xsl:when test="not(string(label))">
	  							<span class="warning2">no label</span><br />
								</xsl:when>
								<xsl:otherwise>
									[label] <b><xsl:apply-templates select="label"/></b><br />
								</xsl:otherwise>
							</xsl:choose> 						
  						[default] <xsl:apply-templates select="default/@ref"/>
  					</p>
  				</td>
  			</tr>
  		</table>
  	</div>
  	<xsl:if test="./active">
			<div class="level3">
				<xsl:call-template name="ctpl_active" />
	  	</div>
		</xsl:if>
		<xsl:if test="./sub03">
			<xsl:apply-templates select=".//level03"/>
		</xsl:if>
</xsl:template>

<xsl:template match="level03">
		<div class="level3">
  		<table cellspacing="3" cellpadding="6" class="group">
  			<tr>
  				<th valign="center">
  					<h3>3</h3>
  				</th>
  				<td width="60%">
  					<p>
  						<xsl:choose>
  							<xsl:when test="not(label)">
	  							<span class="warning2">no label</span><br />
								</xsl:when>
  							<xsl:when test="not(string(label))">
	  							<span class="warning2">no label</span><br />
								</xsl:when>
								<xsl:otherwise>
									[label] <b><xsl:apply-templates select="label"/></b><br />
								</xsl:otherwise>
							</xsl:choose> 						
  						[default] <xsl:apply-templates select="default/@ref"/>
  					</p>
  				</td>
  			</tr>
  		</table>
  	</div>
  	<xsl:if test="./active">
			<div class="level4">
				<xsl:call-template name="ctpl_active" />
	  	</div>
		</xsl:if>
		<xsl:if test="./sub04">
			<xsl:apply-templates select=".//level04"/>
		</xsl:if>
</xsl:template>

<xsl:template match="level04">
		<div class="level4">
  		<table cellspacing="3" cellpadding="6" class="group">
  			<tr>
  				<th valign="center">
  					<h3>4</h3>
  				</th>
  				<td width="60%">
  					<p>
  						<xsl:choose>
  							<xsl:when test="not(label)">
	  							<span class="warning2">no label</span><br />
								</xsl:when>
  							<xsl:when test="not(string(label))">
	  							<span class="warning2">no label</span><br />
								</xsl:when>
								<xsl:otherwise>
									[label] <b><xsl:apply-templates select="label"/></b><br />
								</xsl:otherwise>
							</xsl:choose> 						
  						[default] <xsl:apply-templates select="default/@ref"/>
  					</p>
  				</td>
  			</tr>
  		</table>
  	</div>
  	<xsl:if test="./active">
			<div class="level5">
				<xsl:call-template name="ctpl_active" />
	  	</div>
		</xsl:if>
</xsl:template>

<xsl:template match="p">
  	<xsl:apply-templates /><br />
</xsl:template>

<xsl:template match="url">
  	<p><a href="{text()}" target="_blank"><xsl:apply-templates /></a></p>
</xsl:template>

<xsl:template match="i">
  	<i><xsl:apply-templates /></i>
</xsl:template>

<xsl:template match="b">
  	<b><xsl:apply-templates /></b>
</xsl:template>

<xsl:template match="u">
  	<u><xsl:apply-templates /></u>
</xsl:template>


<!--    ***********************************************       -->
<!--    ***********************************************       -->


</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->
