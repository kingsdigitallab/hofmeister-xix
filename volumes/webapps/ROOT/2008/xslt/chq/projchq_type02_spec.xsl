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

<!-- Start Filelist -->
<!--<xsl:call-template name="filelist" />-->
  <h2>Files processed</h2>

	<table class="list" >
	
	  <xsl:choose>
	    <xsl:when test="$view='summary' and $group='monatshefte'">
    		<xsl:for-each select="//dir:file">
    			<xsl:if test="position() mod 9 = 1">
      			<tr>
          			<td class="list">
             			<a href="#{substring(dir:xpath/text()[1], 1, 12)}">
             				<xsl:value-of select="substring(dir:xpath/text()[1], 1, 12)" />
             			</a>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[1]">
    							<a href="#{substring(following::dir:xpath[1]/text()[1], 1, 12)}">	
             				<xsl:value-of select="substring(following::dir:xpath[1]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[2]">
             			<a href="#{substring(following::dir:xpath[2]/text()[1], 1, 12)}">
             				<xsl:value-of select="substring(following::dir:xpath[2]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[3]">
             			<a href="#{substring(following::dir:xpath[3]/text()[1], 1, 12)}">
             				<xsl:value-of select="substring(following::dir:xpath[3]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[4]">
             			<a href="#{substring(following::dir:xpath[4]/text()[1], 1, 12)}">
             				<xsl:value-of select="substring(following::dir:xpath[4]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>		
          			<td class="list">
            			<xsl:if test="following::dir:xpath[5]">
             			<a href="#{substring(following::dir:xpath[5]/text()[1], 1, 12)}">
             				<xsl:value-of select="substring(following::dir:xpath[5]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[6]">
             			<a href="#{substring(following::dir:xpath[6]/text()[1], 1, 12)}">
             				<xsl:value-of select="substring(following::dir:xpath[6]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[7]">
             			<a href="#{substring(following::dir:xpath[7]/text()[1], 1, 12)}">
             				<xsl:value-of select="substring(following::dir:xpath[7]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[8]">
             			<a href="#{substring(following::dir:xpath[8]/text()[1], 1, 12)}">
             				<xsl:value-of select="substring(following::dir:xpath[8]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
      			</tr>	
    			</xsl:if>
    
    		</xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
    		<xsl:for-each select="//dir:file">
    			<xsl:if test="position() mod 9 = 1">
      			<tr>
          			<td class="list">
             			<a href="{substring(dir:xpath/text()[1], 1, 12)}.html">
             				<xsl:value-of select="substring(dir:xpath/text()[1], 1, 12)" />
             			</a>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[1]">
    							<a href="{substring(following::dir:xpath[1]/text()[1], 1, 12)}.html">	
             				<xsl:value-of select="substring(following::dir:xpath[1]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[2]">
             			<a href="{substring(following::dir:xpath[2]/text()[1], 1, 12)}.html">
             				<xsl:value-of select="substring(following::dir:xpath[2]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[3]">
             			<a href="{substring(following::dir:xpath[3]/text()[1], 1, 12)}.html">
             				<xsl:value-of select="substring(following::dir:xpath[3]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[4]">
             			<a href="{substring(following::dir:xpath[4]/text()[1], 1, 12)}.html">
             				<xsl:value-of select="substring(following::dir:xpath[4]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>		
          			<td class="list">
            			<xsl:if test="following::dir:xpath[5]">
             			<a href="{substring(following::dir:xpath[5]/text()[1], 1, 12)}.html">
             				<xsl:value-of select="substring(following::dir:xpath[5]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[6]">
             			<a href="{substring(following::dir:xpath[6]/text()[1], 1, 12)}.html">
             				<xsl:value-of select="substring(following::dir:xpath[6]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[7]">
             			<a href="{substring(following::dir:xpath[7]/text()[1], 1, 12)}.html">
             				<xsl:value-of select="substring(following::dir:xpath[7]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
          			<td class="list">
            			<xsl:if test="following::dir:xpath[8]">
             			<a href="{substring(following::dir:xpath[8]/text()[1], 1, 12)}.html">
             				<xsl:value-of select="substring(following::dir:xpath[8]/text()[1], 1, 12)" />
             			</a>
            			</xsl:if>
          			</td>
      			</tr>	
    			</xsl:if>
    
    		</xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>

	
	</table>

<xsl:if test="$view='summary' and $group='monatshefte'">
  <h2>Quick summary of publications</h2>
  
  
  <table width="100%" cellpadding="6" class="detail">
    <tr> 
      <th valign="top" class="main">autonum</th>
      <th valign="top" class="main">@n</th>
      <th valign="top" class="id">@id</th>
      <th valign="top" class="main">&lt;titleStmt/title&gt; &amp; &lt;author&gt;</th>
      <th valign="top" class="main">last &lt;change&gt;</th>
    </tr>
  
    <xsl:for-each select="//dir:file[starts-with(@name, '1')]" mode="maintable">
  
      <tr> 
         <td valign="top">
          <a name="{substring(dir:xpath/text()[1], 1, 12)}"></a>
          <a>
             <xsl:attribute name="href">
              <xsl:value-of select="substring(dir:xpath/text()[1], 1, 12)" />
              <xsl:text>.html</xsl:text>
             </xsl:attribute>
          <xsl:number
                format="01" />
          </a>
         </td>
         <td valign="top">
           <xsl:value-of select="substring(dir:xpath/text()[1], 13)" />
           <xsl:if test="not(substring(dir:xpath/text()[1], 13))">
           	<br />
           </xsl:if>
         </td>
         <td valign="top">
                 <xsl:choose>
                   <xsl:when test="not(dir:xpath/text()[1])">
                     <xsl:attribute name="class">warning</xsl:attribute>
                     <span class="warning">MISSING</span>
                   </xsl:when>
                   <xsl:when test="not(string(dir:xpath/text()[1]))">
                     <xsl:attribute name="class">warning</xsl:attribute>
                     <span class="warning"><b>EMPTY VALUE</b></span>
                   </xsl:when>
                   <xsl:when test="substring(dir:xpath/text()[1], 1, 12)=preceding::dir:xpath/text()[1]">
                     <xsl:attribute name="class">warning</xsl:attribute>
                     <span class="warning"><b>REPEATED VALUE</b></span>:<br/>
                      <xsl:apply-templates select="substring(dir:xpath/text()[1], 1, 12)" />&#xa0; 
                   </xsl:when>
  <!--                 <xsl:when test="not(starts-with(@id , 'g4_2_'))">
                     <xsl:attribute name="class">warning</xsl:attribute>
                      <xsl:apply-templates select="@id" />&#xa0; 
                   </xsl:when>
                   <xsl:when test="string-length (@id) != 10">
                     <xsl:attribute name="class">warning</xsl:attribute>
                      <xsl:apply-templates select="@id" />&#xa0; 
                   </xsl:when>-->
                   <xsl:otherwise>
           <span class="keyid"><xsl:value-of select="substring(dir:xpath/text()[1], 1, 12)" /></span>                    
                   </xsl:otherwise>
                 </xsl:choose>     
         </td>
         <td valign="top">
           <xsl:apply-templates select=".//teiHeader/fileDesc/titleStmt/title" /><br/>
           <xsl:apply-templates select=".//teiHeader/fileDesc/titleStmt/author" />
         </td>
         <td valign="top">
           <b><xsl:apply-templates select=".//teiHeader/revisionDesc/change[1]/date" /></b>
            <br/>
           <xsl:apply-templates select=".//teiHeader/revisionDesc/change[1]/respStmt/name" /><br/>
         </td>
      </tr>
    </xsl:for-each>
  
  </table>
  
  <br clear="all" />
  

</xsl:if>

<!-- End Filelist -->



</xsl:template>


<!--    ***********************************************       -->
<!--    ***********   MAIN TEMPLATES  ***********       -->
<!--    ***********************************************       -->

<xsl:template match="dir:file">
 <a name="{generate-id()}"></a> 
 <a name="{@id}"></a>
  <table width="100%" border="1" cellspacing="3" cellpadding="6">

   <tr>
    <th class="tablenormal" width="20%">Autonumber:
    </th>
    <td width="10%"><a><xsl:attribute name="name">summ-<xsl:number format="01" /></xsl:attribute></a><b><xsl:number
                                  format="01" /></b></td>
    <th class="id" width="15%">@id:
    </th>
    <td width="20%" class="keyid"><b><xsl:apply-templates select="@id" /></b></td>
    <th class="tablenormal" width="15%">@n:
    </th>
    <td width="20%">
    	<b><xsl:apply-templates select="@n" /></b>
    	<xsl:if test="not(string(@n))">
    		&#xa0;
    	</xsl:if>
    </td>
   </tr> 

      <xsl:apply-templates select="teiHeader/fileDesc/titleStmt/title" mode="main" />
      <xsl:apply-templates select="teiHeader/fileDesc/titleStmt/author" mode="main" />

<!--
    <xsl:apply-templates />
-->

   <tr>
    <th class="tablenormal" width="20%" valign="top">
    	Colour code:
    </th>
    <td class="table3" colspan="5">
			<span class="composer">
				<xsl:text>composer </xsl:text>
			</span>
			<span class="title">
				<xsl:text>title </xsl:text>
			</span>
			<span class="pubplace">
				<xsl:text>pubplace </xsl:text>
			</span>
			<span class="publisher">
				<xsl:text>publisher </xsl:text>
			</span>
			<span class="price">
				<xsl:text>price </xsl:text>
			</span>
    </td>
   </tr>
   <tr>
    <th class="tablenormal" width="20%" valign="top">
    	Colour coded:
    </th>
    <td class="table3" colspan="5">
	   <ul> 
	    <xsl:for-each select="//bibl">
				<li>
					<xsl:apply-templates />
				</li>
			</xsl:for-each>
		 </ul>	
    </td>
   </tr>

  </table>
  <br clear="all" />
  <br />
  <br />
</xsl:template>

<xsl:template match="teiHeader">
</xsl:template>

<xsl:template match="TEI.2/text">
</xsl:template>

<xsl:template match="note">
</xsl:template>

<xsl:template match="note" mode="main">
</xsl:template>

<xsl:template match="titleStmt/title" mode="main">
 <xsl:choose>
  <xsl:when test="@type='sub'">
   <tr>
    <th class="tablenormal" width="20%">Subtitle:
    </th>
    <td class="authList3" colspan="5"><i><xsl:apply-templates /></i></td>
   </tr>
  </xsl:when>
  <xsl:otherwise>
   <tr>
    <th class="tablenormal" width="20%">Main title:
    </th>
    <td class="authList1" colspan="5"><b><xsl:apply-templates /></b></td>
   </tr> 
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<xsl:template match="titleStmt/author" mode="main">
   <tr>
    <th class="tablenormal" width="20%">Author:
    </th>
    <td class="authList9" colspan="5"><b><xsl:apply-templates /></b></td>
   </tr> 
</xsl:template>
<!-- ============================================================= -->
<!--                    LINKS                             -->
<!-- ============================================================= -->

<xsl:template match="xref" mode="links">
 <xsl:variable name="fileBase-from" select="document('..\..\00_xml\03_alist\AL_fileBase.xml')//item[@id=current()/@from]/@id" />
 <xsl:variable name="fileBase-from-fileName" select="document('..\..\00_xml\03_alist\AL_fileBase.xml')//item[@id=current()/@from]/fileName" />
 <xsl:variable name="fileBase-from-folderName" select="document('..\..\00_xml\03_alist\AL_fileBase.xml')//item[@id=current()/@from]/parent::group/groupHead/groupFolder" />
 <xsl:variable name="fileBase-from-fileExtension" select="'html'" />

          <li>

<!-- TESTING FOR '@REND' STARTS -->
           <xsl:choose>

             <!-- EXTERNAL LINKS -->
             <xsl:when test="@rend='external'">
               <span class="authList3"><xsl:apply-templates /></span><br />

                 <xsl:choose>
                      <!-- inner test -->
                       <xsl:when test="not(starts-with(@url, 'http://'))">
                        <span class="warning">Shouldn't @url start with 'http://'?</span>
                       </xsl:when>  
                      <!-- inner test -->  
                       <xsl:when test="not(@url)">
                        <span class="warning">Missing @url</span>
                       </xsl:when> 
                      <!-- inner test -->
                       <xsl:otherwise>
                         <a href="{@url}" target="_blank"><xsl:apply-templates select="@url" /></a>
                       </xsl:otherwise>
                </xsl:choose>

             </xsl:when>

             <!-- EMAILS -->
             <xsl:when test="@rend='email'">
               <span class="authList9"><xsl:apply-templates /></span><br />

                 <xsl:choose>
                      <!-- inner test -->
                       <xsl:when test="not(contains(@url, '@'))">
                        <span class="warning">Shouldn't it contain an '@' somewhere?</span>
                       </xsl:when>  
                      <!-- inner test -->  
                       <xsl:when test="not(@url)">
                        <span class="warning">Missing @url</span>
                       </xsl:when> 
                      <!-- inner test -->
                       <xsl:otherwise>
                         <a href="{@url}" target="_blank"><xsl:apply-templates select="@url" /></a>
                       </xsl:otherwise>
                </xsl:choose>

             </xsl:when>

             <!-- INTERNAL -->
             <xsl:when test="@rend='internal'">
               <span class="authList10"><xsl:apply-templates /></span><br />

                 <xsl:choose>
                      <!-- inner test -->
                       <xsl:when test="@type='mapinternal'">

                          <!-- inner/inner tests start -->
                            <xsl:if test="@url">
                              <span class="warning">If it is an internal map link, it shouldn't contain a @url</span>
                                  <br />
                            </xsl:if>
                            <xsl:if test="not(@doc)">
                              <span class="warning">The @doc is missing</span>
                                  <br />
                            </xsl:if>
                            <xsl:if test="not(string(@doc))">
                              <span class="warning">There is no content for the @doc</span>
                                  <br />
                            </xsl:if>
                            <xsl:if test="not(contains(@doc, '.html'))">
                              <span class="warning">Unusually, this special kind of link needs a relative link to a real html file. See the notes.</span>
                                  <br />
                            </xsl:if>

                          <!-- inner/inner tests end -->
                        
                       </xsl:when> 
                      <!-- inner test1 ends -->
                      <!-- inner test2 -->
                       <xsl:otherwise>
                            <xsl:if test="not($fileBase-from)">
                              <span class="warning">@from="<xsl:apply-templates select="@from" />" doesn't match any file in the fileBase</span>
                            </xsl:if>
                            Path: <span class="authList11"><xsl:value-of select="$fileBase-from-folderName" />/</span><span class="att"><xsl:value-of select="$fileBase-from-fileName" />.<xsl:value-of select="$fileBase-from-fileExtension" /></span>
                       </xsl:otherwise> 
                      <!-- inner test2 ends -->

                </xsl:choose>

             </xsl:when>
             <!-- test -->

             <xsl:otherwise>
                <span class="warning">Missing or incorrect @rend value</span>
             </xsl:otherwise>
           </xsl:choose>

<!-- TESTING FOR '@REND' ENDS -->

                          <br />
               [<xsl:value-of select="@rend" />]
               <xsl:if test="@from!='ROOT'">
                    [@from="<span class="authList6"><xsl:apply-templates select="@from" /></span>"]
               </xsl:if>
          </li>         
</xsl:template>

<xsl:template name="ref" mode="links">
  <li><xsl:value-of select="@target" />: <xsl:apply-templates /></li>
</xsl:template>

<!--    ***********************************************       -->
<!--    ***********   FILELIST  ***********       -->
<!--    ***********************************************       -->

<xsl:template name="filelist">
  <h2>File list</h2>

  <p><b>Files processed:</b><xsl:text> </xsl:text>
    <xsl:apply-templates select="//dir:file" mode="filelist" />
  </p>  
</xsl:template>

<xsl:template match="dir:file" mode="filelist">


<!--

        <a>
           <xsl:attribute name="href">#summ-<xsl:number format="01" /></xsl:attribute>
           <xsl:apply-templates select="@id" />
        </a>
      <xsl:if test="position() != last()">
        |
      </xsl:if>
--></xsl:template>


<xsl:template match="composer">
	<span class="composer">
		<xsl:apply-templates />
	</span>
</xsl:template>

<xsl:template match="bibl/title">
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

<!--    ***********************************************       -->

</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->
