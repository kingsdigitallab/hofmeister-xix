<?xml version="1.0"?>
<!-- ============================================================= -->
<!--  MODULE:           print_tpl.xsl                               -->
<!--  VERSION DATE:     1.0                                        -->
<!--  VERSION:          $Id: print_tpl.xsl 234 2007-03-02 16:26:07Z zau $                        -->
<!--  VERSION CONTROL:                                             -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!-- ORIGINAL CREATION DATE:    2003-09-05 @ 14:12                 -->
<!-- PURPOSE:   Basic HTML shell for printable view                 -->
<!-- CREATED FOR:  CCH  www.kcl.ac.uk/cch                          -->
<!-- CREATED BY:   PJS  spencepj@yahoo.com                         -->
<!-- COPYRIGHT:   CCH/PJS                                          -->
<!-- ============================================================= -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.1"
                xmlns:filename="filename.uri"
                exclude-result-prefixes="filename">
<xsl:output method="html" indent="yes" />

<!--    ***********************************************       -->
<!--    *************   MAIN TEMPLATE STARTS **********       -->
<!--    ***********************************************       -->

<xsl:template name="html_tpl">

<!-- START HTML -->

<html>

<!-- ############################## -->
<!-- #### CTPL_HTMLTITLE STARTS ##### -->
<!-- ############################## -->
<xsl:comment>CTPL_HTMLTITLE STARTS</xsl:comment>
  <xsl:call-template name="ctpl_htmltitle" />
<xsl:comment>CTPL_HTMLTITLE ENDS</xsl:comment>
<!-- ############################## -->
<!-- #### CTPL_HTMLTITLE ENDS ##### -->
<!-- ############################## -->

<body>

<a name="top" id="top"/>
      
<!-- ############################## -->
<!-- #### CTPL_BANNER STARTS ##### -->
<!-- ############################## -->
<xsl:comment>CTPL_BANNER STARTS</xsl:comment>
  <xsl:call-template name="ctpl_banner" />
<xsl:comment>CTPL_BANNER ENDS</xsl:comment>                    
<!-- ############################## -->
<!-- #### CTPL_BANNER ENDS ##### -->
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
<!-- #### CTPL_BREAD STARTS ##### -->
<!-- ############################## -->
<xsl:comment>CTPL_BREAD STARTS</xsl:comment>
  <xsl:call-template name="ctpl_bread" />
<xsl:comment>CTPL_BREAD ENDS</xsl:comment>                    
<!-- ############################## -->
<!-- #### CTPL_BREAD ENDS ##### -->
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


<!-- ###################################### -->
<!-- #### CTPL_PAGEHEAD STARTS ############ -->
<!-- ###################################### -->
<xsl:comment>CTPL_PAGEHEAD STARTS</xsl:comment>
  <xsl:call-template name="ctpl_pagehead" />
<xsl:comment>CTPL_PAGEHEAD ENDS</xsl:comment>
<!-- ##################################### -->
<!-- #### CTPL_PAGEHEAD ENDS ############# -->
<!-- ##################################### -->


<!-- ##########################-->
<!-- #### CTPL_TOC STARTS ##### -->
<!-- ########################## -->
<xsl:comment>CTPL_TOC STARTS</xsl:comment>
  <xsl:call-template name="ctpl_toc" />
<xsl:comment>CTPL_TOC ENDS</xsl:comment>
<!-- ########################## -->
<!-- #### CTPL_TOC ENDS ####### -->
<!-- ########################## -->


<!-- ############################## -->
<!-- #### CTPL_CONTENT STARTS ##### -->
<!-- ############################## -->
<xsl:comment>CTPL_CONTENT STARTS</xsl:comment>
  <xsl:call-template name="ctpl_content" />
<xsl:comment>CTPL_CONTENT ENDS</xsl:comment>
<!-- ############################## -->
<!-- #### CTPL_CONTENT ENDS ####### -->
<!-- ############################## -->


<!-- ############################## -->
<!-- #### CTPL_TOC2 STARTS ##### -->
<!-- ############################## -->
<xsl:comment>CTPL_TOC2 STARTS</xsl:comment>
  <xsl:call-template name="ctpl_toc2" />
<xsl:comment>CTPL_TOC2 ENDS</xsl:comment>
<!-- ############################## -->
<!-- #### CTPL_TOC2 ENDS ####### -->
<!-- ############################## -->



<!-- ########################################## -->
<!-- #### CTPL_FOOTNOTES STARTS ############# -->
<!-- ########################################## -->
<xsl:comment>CTPL_FOOTNOTES STARTS</xsl:comment>
  <xsl:call-template name="ctpl_footnotes" />
<xsl:comment>CTPL_FOOTNOTES ENDS</xsl:comment>
<!-- ########################################## -->
<!-- #### CTPL_FOOTNOTES ENDS ############### -->
<!-- ########################################## -->


<!-- ############################## -->
<!-- #### CTPL_OPTIONS START ###### -->
<!-- ############################## -->
<xsl:comment>CTPL_OPTIONS STARTS</xsl:comment>
  <xsl:call-template name="ctpl_options" />
<xsl:comment>CTPL_OPTIONS END</xsl:comment>
<!-- ############################## -->
<!-- #### CTPL_OPTIONS END   ###### -->
<!-- ############################## -->


<!-- ############################## -->
<!-- #### CTPL_FOOTER STARTS ######  -->
<!-- ############################## -->
<xsl:comment>CTPL_FOOTER STARTS</xsl:comment>
  <xsl:call-template name="ctpl_footer" />
<xsl:comment>CTPL_FOOTER ENDS</xsl:comment>
<!-- ############################## -->
<!-- #### CTPL_FOOTER ENDS ########  -->
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

