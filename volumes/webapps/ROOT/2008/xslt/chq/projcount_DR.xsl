<?xml version="1.0"?>
<!-- ============================================================= -->
<!--  MODULE:           projchq_master.xsl                -->
<!--  VERSION DATE:     1.0                                        -->
<!--  VERSION:          2004-02-06 @ 10:37                             -->
<!--  VERSION CONTROL:                                             -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!-- ORIGINAL CREATION DATE:    12:04 30/05/03                  -->
<!-- PURPOSE:   Creates summary for TEI-produced documents        -->
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

<!-- ============================================================= -->
<!--                    INCLUDES                             -->
<!-- ============================================================= -->

<xsl:include href="..\chq\enc-projchq_key.xsl" />
<xsl:include href="..\chq\projchq_tpl.xsl" />
<xsl:include href="..\common\proj_vars.xsl" />
<xsl:include href="..\chq\projcount_spec.xsl" />


<xsl:template match="/">
	<xsl:apply-templates />
</xsl:template>




<xsl:template match="/">
	<xsl:variable name="nameid" select="'stats'"></xsl:variable>
  <!-- ##################################################################### -->
  <!-- #### PATHCREATOR = CONSTRUCTS PATH FROM ROOT TO TARGET DIRECTORY ####  -->
  <!-- ##################################################################### -->

    <!-- GET IT FROM FILEBASE, USING THE TEI.2/@ID ATTRIBUTE -->

      <xsl:variable name="pathcreator" select="document('../../00_xml/AL_docsite.xml')//item[@id=$nameid]/parent::*/groupHead/groupFolder" />

  <!-- ############################################################## -->
  <!-- ####  FILECREATOR = CONSTRUCTS CORRECT FILENAME FOR AN ID ####  -->
  <!-- ############################################################## -->

    <!-- PASTE CURRENT OPTION HERE FROM ALTERNATIVES BELOW -->

      <xsl:variable name="filename" select="document('../../00_xml/AL_docsite.xml')//item[@id=$nameid]/fileName" />


  <!-- ############################################################## -->
  <!-- ####  CALLS TEMPLATE TO CREATE HTML FILE ####  -->
  <!-- ############################################################## -->
  <xsl:call-template name="html_tpl" />
</xsl:template>

</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->