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

<!--    ***********************************************       -->
<!--    *************   ZAK sorted up to here  *****************       -->
<!--    ***********************************************       -->

<xsl:param name="keyterm" select="'keyterm'" />




<xsl:strip-space elements="div" />

<!--    ***********************************************       -->
<!--    *************   MAIN TEMPLATE STARTS **********       -->
<!--    ***********************************************       -->
<xsl:template name="html_tpl">
  <xsl:param name="ahead" />
  <xsl:param name="letter" />




<!-- START HTML -->

<html>
	<head>
		<!-- ############################## -->	
		<!-- #### CTPL_HTMLTITLE STARTS ##### -->
		<!-- ############################## -->
		<xsl:comment>CTPL_HTMLTITLE STARTS</xsl:comment>
  			<xsl:call-template name="ctpl_htmltitle" />
		<xsl:comment>CTPL_HTMLTITLE ENDS</xsl:comment>
		<!-- ############################## -->
		<!-- #### CTPL_HTMLTITLE ENDS ##### -->
		<!-- ############################## -->
	</head>
	<body>

		<!-- ############################## -->
		<!-- #### CTPL_LOGO STARTS ##### -->
		<!-- ############################## -->
		<xsl:comment>CTPL_LOGO STARTS</xsl:comment>
			<xsl:call-template name="ctpl_logo" />
		<xsl:comment>CTPL_LOGO ENDS</xsl:comment>                    
		<!-- ############################## -->
		<!-- #### CTPL_LOGO ENDS ##### -->
		<!-- ############################## -->


		<!-- ############################## -->
		<!-- #### CTPL_PAGEHEAD STARTS ##### -->
		<!-- ############################## -->
		<xsl:comment>CTPL_PAGEHEAD STARTS</xsl:comment>
			<xsl:call-template name="ctpl_pagehead" />
		<xsl:comment>CTPL_PAGEHEAD ENDS</xsl:comment>                    
		<!-- ############################## -->
		<!-- #### CTPL_PAGEHEAD ENDS ##### -->
		<!-- ############################## -->


		<!-- ############################## -->
		<!-- #### CTPL_NAV STARTS ##### -->
		<!-- ############################## -->
		<xsl:comment>CTPL_NAV STARTS</xsl:comment>
			<xsl:call-template name="ctpl_nav" />
		<xsl:comment>CTPL_NAV ENDS</xsl:comment>                    
		<!-- ############################## -->
		<!-- #### CTPL_NAV ENDS ##### -->
		<!-- ############################## -->


		<!-- ############################## -->
		<!-- #### CTPL_SUBMENU STARTS ##### -->
		<!-- ############################## -->
		<xsl:comment>CTPL_SUBMENU STARTS</xsl:comment>
			<xsl:call-template name="ctpl_submenu" />
		<xsl:comment>CTPL_SUBMENU ENDS</xsl:comment>                    
		<!-- ############################## -->
		<!-- #### CTPL_SUBMENU ENDS ##### -->
		<!-- ############################## -->


		<!-- ############################## -->
		<!-- #### CTPL_CONTENT STARTS ##### -->
		<!-- ############################## -->
		<xsl:comment>CTPL_CONTENT STARTS</xsl:comment>
			<xsl:call-template name="ctpl_content">
        <xsl:with-param name="ahead" select="$ahead" />
        <xsl:with-param name="letter" select="$letter" />
      </xsl:call-template>
		<xsl:comment>CTPL_CONTENT ENDS</xsl:comment>                    
		<!-- ############################## -->
		<!-- #### CTPL_CONTENT ENDS ##### -->
		<!-- ############################## -->
		

		<!-- ############################## -->
		<!-- #### CTPL_FOOTER STARTS ##### -->
		<!-- ############################## -->
		<xsl:comment>CTPL_FOOTER STARTS</xsl:comment>
			<xsl:call-template name="ctpl_footer" />
		<xsl:comment>CTPL_FOOTER ENDS</xsl:comment>                    
		<!-- ############################## -->
		<!-- #### CTPL_FOOTER ENDS ##### -->
		<!-- ############################## -->
	</body>
</html>

<!-- END OF HTML -->
</xsl:template>

<!--    ***********************************************       -->
<!--    *************   MAIN TEMPLATE ENDS ************       -->
<!--    ***********************************************       -->

</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->