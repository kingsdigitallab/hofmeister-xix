<?xml version="1.0"?>
<!-- ============================================================= -->
<!--  MODULE:           proj_chq-AL_process.xsl                            -->
<!--  VERSION DATE:     1.0                                        -->
<!--  VERSION:          2003-09-12 @ 13:37                         -->
<!--  VERSION CONTROL:                                             -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!-- ORIGINAL CREATION DATE:    12:04 30/05/03                  -->
<!-- PURPOSE:   Checking page and output for authority list       -->
<!-- CREATED FOR:  CCH  www.kcl.ac.uk/cch                          -->
<!-- CREATED BY:   PJS  spencepj@yahoo.com                         -->
<!-- COPYRIGHT:   CCH/PJS                                          -->
<!-- ============================================================= -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.1">
<xsl:output method="html" indent="yes" />

<!-- ============================================================= -->
<!--                    INCLUDES                             -->
<!-- ============================================================= -->

<xsl:include href="..\chq\projchq_key.xsl" />
<xsl:include href="..\chq\projchq_tpl.xsl" />
<xsl:include href="..\common\proj_vars.xsl" />
<xsl:include href="..\chq\projchq_alist_spec.xsl" />


<!--    ***********************************************       -->
<!--    *************   ZAK sorted up to here  *****************       -->
<!--    ***********************************************       -->

<xsl:strip-space elements="div" />

<!--    ***********************************************       -->
<!--    *************   ROOT  ****************       -->
<!--    ***********************************************       -->

<xsl:template match="/">
	<xsl:apply-templates />
</xsl:template>


<xsl:template match="authorityList|projectList">
	<xsl:variable name="nameid" select="current()/@id"></xsl:variable>

  <!-- ##################################################################### -->
  <!-- #### PATHCREATOR = CONSTRUCTS PATH FROM ROOT TO TARGET DIRECTORY ####  -->
  <!-- ##################################################################### -->

    <!-- GET IT FROM FILEBASE, USING THE TEI.2/@ID ATTRIBUTE -->

      <xsl:variable name="pathcreator">
        <xsl:choose>
          <xsl:when test="@id='AL_docsite'">
            <xsl:value-of select="document('../../00_xml/AL_docsite.xml')//item[@id='iAL_docsite']/parent::*/groupHead/groupFolder" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="document('../../00_xml/AL_docsite.xml')//item[@id=current()/@id]/parent::*/groupHead/groupFolder" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

<!--
      <xsl:variable name="pathcreator" select="document('../../00_xml/AL_docsite.xml')//item[@id=current()/@id]/parent::*/groupHead/groupFolder" />
-->

  <!-- ############################################################## -->
  <!-- ####  FILECREATOR = CONSTRUCTS CORRECT FILENAME FOR AN ID ####  -->
  <!-- ############################################################## -->

    <!-- PASTE CURRENT OPTION HERE FROM ALTERNATIVES BELOW -->

      <xsl:variable name="filename">
        <xsl:choose>
          <xsl:when test="@id='AL_docsite'">
            <xsl:value-of select="document('../../00_xml/AL_docsite.xml')//item[@id='iAL_docsite']/fileName" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="document('../../00_xml/AL_docsite.xml')//item[@id=current()/@id]/fileName" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>


<!--
      <xsl:variable name="filename" select="document('../../00_xml/AL_docsite.xml')//item[@id=current()/@id]/fileName" />
-->


  <!-- ############################################################## -->
  <!-- ####  CALLS TEMPLATE TO CREATE HTML FILE ####  -->
  <!-- ############################################################## -->
  
 	 <xsl:call-template name="html_tpl" />


</xsl:template>


</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->