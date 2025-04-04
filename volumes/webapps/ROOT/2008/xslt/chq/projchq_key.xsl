<?xml version="1.0"?>
<!-- ============================================================= -->
<!--  MODULE:           proj_chq_key.xsl                            -->
<!--  VERSION DATE:     1.0                                        -->
<!--  VERSION:          2003-09-12 @ 13:37                         -->
<!--  VERSION CONTROL:                                             -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!-- ORIGINAL CREATION DATE:    12:04 30/05/03                  -->
<!-- PURPOSE:   Common templates etc used by all checking pages       -->
<!-- CREATED FOR:  CCH  www.kcl.ac.uk/cch                          -->
<!-- CREATED BY:   PJS  spencepj@yahoo.com                         -->
<!-- COPYRIGHT:   CCH/PJS                                          -->
<!-- ============================================================= -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.1">
<xsl:output method="html" indent="yes" />


<xsl:variable name="fileItem" select="document('../../00_xml/AL_docsite.xml')/authorityList//group[@id='filelist']/item" />
<xsl:variable name="authlistItem" select="document('../../00_xml/AL_docsite.xml')/authorityList//group[@id='authlist']/item" />
<xsl:variable name="checkpageItem" select="document('../../00_xml/AL_docsite.xml')/authorityList//group[@id='checkpage']/item" />
<xsl:variable name="processList" select="document('../../00_xml/AL_docsite.xml')/authorityList//group[@id='processlist']/item" />
<xsl:variable name="monatItem" select="document('../../00_xml/AL_docsite.xml')/authorityList//group[@id='monat']/item" />
<xsl:variable name="extra" select="document('../../00_xml/AL_docsite.xml')/authorityList//group[@id='extra']/item" />



<!--	*************************************************
		*************************************************
		****************   TEMPLATE NAMES   *************
		*************************************************
		*************************************************-->

<!--############################
    ###### CTPL_HTMLTITLE ######
    ############################-->
<xsl:template name="ctpl_htmltitle">
	<title>Checking Pages</title>
 
	<link rel="stylesheet" type="text/css" href="{$scriptroot}/00_css/projchq.css"/>
  <script type="text/javascript" src="{$scriptroot}{$scriptswitch}mod_utility.js">
  </script>
</xsl:template>

<!--############################
	 ######## CTPL_LOGO #########
    ############################-->
<xsl:template name="ctpl_logo">
	<p>THE BANNER GOES HERE</p>
</xsl:template>

<!--################################
	 ######## CTPL_PAGEHEAD #########
    ################################-->
<xsl:template name="ctpl_pagehead">
	<xsl:variable name="filename" select="document('../../00_xml/AL_docsite.xml')//item[@id=current()/@id]/fileName" />
	<a name="top"></a>
	<h1>Checking page for: <span class="new">&lt;<xsl:value-of select="$filename" />&gt;</span></h1>
</xsl:template>

<!--############################
	 ######### CTPL_NAV #########
    ############################-->
<xsl:template name="ctpl_nav">
	<p>[<a href="../ref/chq/AL_docsite.html">Back to documentation site</a>]</p>
</xsl:template>

<!--###############################
	 ######## CTPL_SUBMENU #########
    ###############################-->
<xsl:template name="ctpl_submenu">
	<table class="toc" cellspacing="0" cellpadding="5">
      <tr>
         <th colspan="2" class="head">Other checking pages</th>
      </tr>
		<tr>
			<th class="table4">File management:
			</th>
			<td class="table4">
				<!--Links--><xsl:call-template name="fileManage" />
			</td>
		</tr>
<!--
		<tr>
			<th class="table4">Content checking:
			</th>
			<td class="table4">
				<xsl:call-template name="checkpageList" />
			</td>
		</tr>
-->
		<tr>
			<th class="table4">Monatsberichte:
			</th>
			<td class="table4">
				<!--Links--><xsl:call-template name="monat" />
			</td>
		</tr>
<!--
		<tr>
			<th class="table4">Extra info:
			</th>
			<td class="table4">
				<xsl:call-template name="extra" />
			</td>
		</tr>
-->
  		<tr>
   		<th class="table4">Authority lists:
   		</th>
   		<td class="table4">
     			<!--Links--><xsl:call-template name="authlistList" />
   		</td>
  		</tr>
  		<tr>
   		<th class="table4">Processing:
   		</th>
   		<td class="table4">
     			<!--Links--><xsl:call-template name="processList" />
   		</td>
  		</tr>
 	</table>
 	<br />
</xsl:template>




    
    
<!--##############################
	 ######## CTPL_FOOTER #########
    ##############################-->
<xsl:template name="ctpl_footer">
	<h2>Last edited</h2>
   <p>This index was created using the XML file dated: 
   	[<span class="dateEdited">2003 - _unspecified - _unspecified</span>] and edited by: 
      [<span class="dateEdited">ADD HERE</span>]
      <sup>*</sup>
      
      <!--[<span class="dateEdited">
  			<xsl:value-of select="@year" /> - 
  			<xsl:value-of select="@month" /> - 
  			<xsl:value-of select="@day" />
		</span>] and edited by: 
		[<span class="dateEdited">
  			<xsl:value-of select="@resp" />
		</span>]-->
      
   </p>
   <p>* <i>This comes from the attributes on &lt;authorityList&gt;.</i></p>
</xsl:template>


<!--##########################################################################
	                         ######## OTHER TEMPLATES #########
    ##########################################################################-->


<!--    ***********************************************       -->
<!--    ******   LINKS TO CHECKING PAGES   *******       -->
<!--    ***********************************************       -->

<xsl:template name="checkpageList"> 
  <xsl:for-each select="$checkpageItem">
   <xsl:sort select="@id" order="ascending" />
   <a href="../master/{@id}.html"><xsl:value-of select="@id" />.xml</a>
   <xsl:if test="position() != last()"> | </xsl:if>
  </xsl:for-each>
</xsl:template>

<!--    ***********************************************       -->
<!--    ******   LINKS TO MONATSBERICHTE   *******       -->
<!--    ***********************************************       -->

<xsl:template name="monat"> 
  <xsl:for-each select="$monatItem">
   <a href="../monat/{@id}.html"><xsl:value-of select="fileTitle" /></a>
   <xsl:if test="position() != last()"> | </xsl:if>
  </xsl:for-each>
</xsl:template>

<!--    ***********************************************       -->
<!--    ******   LINKS TO EXTRA INFO   *******       -->
<!--    ***********************************************       -->

<xsl:template name="extra"> 
  <xsl:for-each select="$extra">
   <a href="../extra/{@id}.html"><xsl:value-of select="fileTitle" /></a>
   <xsl:if test="position() != last()"> | </xsl:if>
  </xsl:for-each>
</xsl:template>

<!--    ***********************************************       -->
<!--    ******   LINKS TO AUTHORITY LISTS   *******       -->
<!--    ***********************************************       -->

<xsl:template name="authlistList"> 
  <xsl:for-each select="$authlistItem">
   <xsl:sort select="@id" order="ascending" />
   <a href="../authlist/{@id}.html"><xsl:value-of select="@id" />.xml</a>
   <xsl:if test="position() != last()"> | </xsl:if>
  </xsl:for-each>
</xsl:template>

<!--    ***********************************************       -->
<!--    ******   LINKS TO FILEMANAGEMENT LISTS   *******       -->
<!--    ***********************************************       -->

<xsl:template name="fileManage"> 
  <xsl:for-each select="$fileItem">
   <xsl:sort select="@id" order="ascending" />
   <a href="../filelist/{@id}.html"><xsl:value-of select="@id" />.xml</a>
   <xsl:if test="position() != last()"> | </xsl:if>
  </xsl:for-each>
</xsl:template>

<!--    ***********************************************       -->
<!--    ******   LINKS TO FILEMANAGEMENT LISTS   *******       -->
<!--    ***********************************************       -->

<xsl:template name="processList"> 
  <xsl:for-each select="$processList">
   <xsl:sort select="@id" order="ascending" />
   <a href="../process/{@id}.html"><xsl:value-of select="@id" />.xml</a>
   <xsl:if test="position() != last()"> | </xsl:if>
  </xsl:for-each>
</xsl:template>

    


<!--    ***********************************************       -->
</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->