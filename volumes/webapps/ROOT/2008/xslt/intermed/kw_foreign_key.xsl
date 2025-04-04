<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:saxon="http://icl.com/saxon"
	version="1.1">

  <xsl:output method="xml" indent="yes"/>
  
	<!-- ============================================================= -->
	<!--  MODULE:           intermed.xsl                               -->
	<!--  VERSION DATE:     1.0                                        -->
	<!--  VERSION:          $Id: kw_foreign_key.xsl 236 2007-03-02 16:26:36Z zau $   -->
	<!--  VERSION CONTROL:                                                                                                       -->
	<!-- ============================================================= -->

	<!-- ============================================================= -->
	<!-- ORIGINAL CREATION DATE:    2006-08-16                         -->
	<!-- PURPOSE:   Keyword index                                      -->
	<!-- CREATED FOR:  CCH  www.kcl.ac.uk/cch                          -->
	<!-- CREATED BY:   ZA                                              -->
	<!-- COPYRIGHT:   CCH/ZA                                           -->
	<!-- ============================================================= -->

	<xsl:key name="kwForeign" match="foreign" use="normalize-space(@n)"/>

	<xsl:template match="/">
		<TEI.2 id="foreign">
			<xsl:for-each
				select="//foreign[generate-id()=generate-id(key('kwForeign', normalize-space(@n))[1])]">
				<row>
					<head>
						<xsl:value-of
							select="document('../../xml/03_alist/AL_testForeign.xml')//item[@id=current()/@n]/full"
						/>
					</head>
					<xsl:for-each select="key('kwForeign', normalize-space(@n))">
						<xsl:sort select="ancestor::TEI.2//titleStmt/title[1]"/>
						<file id="{ancestor::TEI.2/@id}" href="{@id}">
							<xsl:if test="ancestor::TEI.2[@rend='type03']">
								<xsl:attribute name="rend">
									<xsl:value-of select="ancestor::TEI.2/@rend"/>
								</xsl:attribute>
								<xsl:attribute name="n">
									<xsl:value-of select="ancestor::TEI.2/@n"/>
								</xsl:attribute>
								<xsl:attribute name="pg">
									<xsl:value-of select="count(ancestor::text/preceding-sibling::text[body]) + 1"/>
								</xsl:attribute>
							</xsl:if>
							<xsl:apply-templates select="ancestor::TEI.2//titleStmt/title[1]"/>
						</file>
					</xsl:for-each>
				</row>
			</xsl:for-each>
		</TEI.2>
	</xsl:template>

	<xsl:template match="note"/>

</xsl:stylesheet>
