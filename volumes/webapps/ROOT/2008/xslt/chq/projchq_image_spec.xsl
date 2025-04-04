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

<p>The following table is for checking purposes. There is further explanation <a href="#bottom">below</a></p>

	<h2>Quick links to groups</h2>

<!-- ****************************** -->
	<table class="links" >
	
		<xsl:for-each select="//group">

  			<xsl:if test="position() mod 6 = 1">
    			<tr>
        			<td class="links">
           				<a href="#{@id}">[<xsl:value-of select="@id" />]</a>
        			</td>
        			<td class="links">
          			<xsl:if test="following::group[1]">
           				<a href="#{following::group[1]/@id}">[<xsl:value-of select="following::group[1]/@id" />]</a>
          			</xsl:if>
        			</td>
        			<td class="links">
          			<xsl:if test="following::group[2]">
           				<a href="#{following::group[2]/@id}">[<xsl:value-of select="following::group[2]/@id" />]</a>
          			</xsl:if>
        			</td>
        			<td class="links">
          			<xsl:if test="following::group[3]">
           				<a href="#{following::group[3]/@id}">[<xsl:value-of select="following::group[3]/@id" />]</a>
          			</xsl:if>
        			</td>
        			<td class="links">
          			<xsl:if test="following::group[4]">
           				<a href="#{following::group[4]/@id}">[<xsl:value-of select="following::group[4]/@id" />]</a>
          			</xsl:if>
        			</td>		
        			<td class="links">
          			<xsl:if test="following::group[5]">
           				<a href="#{following::group[5]/@id}">[<xsl:value-of select="following::group[5]/@id" />]</a>
          			</xsl:if>
        			</td>
    			</tr>	
  			</xsl:if>

		</xsl:for-each>
	</table>

<!-- ****************************** -->

<!-- ****************************** -->

<h2>List of images used</h2>


	<table class="list" >

		<xsl:for-each select="//image">

  			<xsl:if test="position() mod 9 = 1">
    			<tr>
        			<td class="list">
           				<a href="#{@id}">[<xsl:value-of select="@id" />]</a>
        			</td>
        			<td class="list">
          			<xsl:if test="following::image[1]">
           				<a href="#{following::image[1]/@id}">[<xsl:value-of select="following::image[1]/@id" />]</a>
          			</xsl:if>
        			</td>
        			<td class="list">
          			<xsl:if test="following::image[2]">
           				<a href="#{following::image[2]/@id}">[<xsl:value-of select="following::image[2]/@id" />]</a>
          			</xsl:if>
        			</td>
        			<td class="list">
          			<xsl:if test="following::image[3]">
           				<a href="#{following::image[3]/@id}">[<xsl:value-of select="following::image[3]/@id" />]</a>
          			</xsl:if>
        			</td>
        			<td class="list">
          			<xsl:if test="following::image[4]">
           				<a href="#{following::image[4]/@id}">[<xsl:value-of select="following::image[4]/@id" />]</a>
          			</xsl:if>
        			</td>		
        			<td class="list">
          			<xsl:if test="following::image[5]">
           				<a href="#{following::image[5]/@id}">[<xsl:value-of select="following::image[5]/@id" />]</a>
          			</xsl:if>
        			</td>
        			<td class="list">
          			<xsl:if test="following::image[6]">
           				<a href="#{following::image[6]/@id}">[<xsl:value-of select="following::image[6]/@id" />]</a>
          			</xsl:if>
        			</td>
        			<td class="list">
          			<xsl:if test="following::image[7]">
           				<a href="#{following::image[7]/@id}">[<xsl:value-of select="following::image[7]/@id" />]</a>
          			</xsl:if>
        			</td>
        			<td class="list">
          			<xsl:if test="following::image[8]">
           				<a href="#{following::image[8]/@id}">[<xsl:value-of select="following::image[8]/@id" />]</a>
          			</xsl:if>
        			</td>
    			</tr>	
  			</xsl:if>

	</xsl:for-each>

</table>

<h2>Main tables</h2>


       <xsl:apply-templates select="//group" />

<a name="bottom" id="bottom"></a>

<h2>Explanation of table headings</h2>



<h2>Warnings</h2>

<p>The following warnings are possible:</p>

<ul>
  <li><b>CONTENT MISSING</b>: if there is no content for an essential attribute, e.g. an 'id' attribute.</li>
  <li><b>TOO SHORT?</b>: If some attributes or elements have just one character then a warning message appears.</li>
  <li>Many elements or attributes can be empty, these have been shown with a plain grey backround.</li>
</ul>

<h2>Full &lt;header&gt; information</h2>

<p>The authority list contains a header element with information. Here is the content of that:</p>

<table class="tablenormal" width="60%">
  <tr>
    <th class="tablenormal">Title: 
       <xsl:apply-templates select="header/title" />
    </th>
  </tr>
  <tr>
    <td class="tablenormal"><b>changeNotes: </b>
       <xsl:apply-templates select="header/changeNotes" />
    </td>
  </tr>
  <tr>
    <td class="tablenormal"><b>comments: </b>
       <xsl:apply-templates select="header/comments" />       
    </td>
  </tr>
</table>


<h2>List of @id's used</h2>

<xsl:for-each select="//image">
  <xsl:sort select="@id" order="ascending" />
  <a href="#{generate-id()}"><xsl:value-of select="@id" /></a>
  <xsl:if test="position() != last()"> | </xsl:if>
</xsl:for-each>

</xsl:template>

<!-- ======================================================================== -->
<!-- ======================================================================== -->
<!-- ======================================================================== -->

<xsl:template match="group">
<xsl:choose>
  <xsl:when test="child::image">
            <!-- GROUP TEXT -->

    		<table cellspacing="3" cellpadding="6" class="group">
      		<tr>
      			<th>
        				<h3>Group:</h3>

      			</th>
        			<td>
        				<p>
                		[@id] <span class="keyid"><strong><xsl:value-of select="@id" /></strong></span>
                		<br />
                		[groupTitle] <strong><xsl:value-of select="groupHead/groupTitle" /></strong>
                		<br />
                		[groupFolder] <span class="ftype"><xsl:value-of select="groupHead/groupFolder" /></span>
        				</p>
        			</td>
        		</tr>
    		</table>
   	 <br clear="all" />

<!-- ######### MAIN TABLE STARTS ########### -->

<table border="1" cellpadding="6" cellspacing="0" class="detail">
        <!-- headings -->
            <tr>
              <th valign="top" class="id">@id</th>
              <th valign="top" class="main">&lt;imgTitle&gt;</th>
              <th valign="top" class="main">&lt;caption&gt;</th>
              <th valign="top" class="main">&lt;path&gt;</th>
              <th valign="top" class="main">&lt;desc&gt;</th>
              <th valign="top" class="main">&lt;width&gt;</th>
              <th valign="top" class="main">&lt;height&gt;</th>
              <th valign="top" class="main">&lt;ext&gt;/@n</th>
              <th valign="top" class="main">&lt;creator&gt;</th>
              <th valign="top" class="main">&lt;copyright&gt;</th>
              <th valign="top" class="main">&lt;notes&gt;</th>
              <th valign="top" class="main">&lt;internal&gt;</th>
            </tr>

  <xsl:apply-templates select="image">
           <xsl:sort select="@id" order="ascending" />
  </xsl:apply-templates>

</table>
<br clear="all" />
<br clear="all" />
  </xsl:when>
  <xsl:otherwise>
            <!-- GROUP GROUP -->

    		<table cellspacing="3" cellpadding="6" class="group">
      		<tr>
      			<th>
        				<h3>Group:</h3>

      			</th>
        			<td>
        				<p>
                		[@id] <span class="keyid"><strong><xsl:value-of select="@id" /></strong></span>
                		<br />
                		[groupTitle] <strong><xsl:value-of select="groupHead/groupTitle" /></strong>
                		<br />
                		[groupFolder] <span class="ftype"><xsl:value-of select="groupHead/groupFolder" /></span>
        				</p>
        			</td>
        		</tr>
    		</table>
   	 <br clear="all" />

</xsl:otherwise>
</xsl:choose>

</xsl:template>

<xsl:template match="image">

        <!-- a row for each image -->

            <tr>

             <!-- #### ID #### -->

             <xsl:choose>
               <xsl:when test="not(string(@id))">
                <td valign="top" class="warning">
                    CONTENT MISSING
                </td>  
               </xsl:when>
               <xsl:when test="string-length(@id) &lt; 2">
                <td valign="top" class="warning">
                    <xsl:apply-templates select="@id" />
                    TOO SHORT?
                </td>  
               </xsl:when>
<!--               <xsl:when test="not(starts-with(@id, 'a')) and not(starts-with(@id, 'c'))">
                <td valign="top" class="warning2">
                    <xsl:apply-templates select="@id" />: correct prefix?
                </td>  
               </xsl:when>-->
               <xsl:otherwise>
                <td valign="top" class="keyid">
                    <a name="{generate-id()}" id="{generate-id()}"></a>
                    <xsl:apply-templates select="@id" />
                </td>     
               </xsl:otherwise>
             </xsl:choose>



             <!-- #### TITLE #### -->

             <xsl:choose>
               <xsl:when test="not(string(imgTitle))">
                <td valign="top" class="warning2">
                    CONTENT MISSING
                </td>  
               </xsl:when>
<!--               <xsl:when test="string-length(imgTitle) &lt; 2">
                <td valign="top" class="warning">
                    TOO SHORT?:
                    <xsl:apply-templates select="imgTitle" />
                </td>  
               </xsl:when>-->
               <xsl:otherwise>
                <td valign="top" class="authList3">
                    <xsl:apply-templates select="imgTitle" />
                </td>    
               </xsl:otherwise>
             </xsl:choose>



             <!-- #### CAPTION #### -->

             <xsl:choose>
               <xsl:when test="not(string(caption))">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
<!--               <xsl:when test="not(caption)">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>-->
               <xsl:otherwise>
                <td valign="top">
                    <xsl:apply-templates select="caption" />
                </td>    
               </xsl:otherwise>
             </xsl:choose>

             <!-- #### PATH #### -->

             <xsl:choose>
<!--               <xsl:when test="not(path)">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>-->
               <xsl:when test="not(string(path))">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
               <xsl:otherwise>
                <td valign="top">
                    <xsl:apply-templates select="path" />
                </td>    
               </xsl:otherwise>
             </xsl:choose>

             <!-- #### DESC #### -->

             <xsl:choose>
<!--               <xsl:when test="not(desc)">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>-->
               <xsl:when test="not(string(desc))">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
               <xsl:otherwise>
                <td valign="top">
<!--                   <xsl:if test="contains(desc, ' ')">
                     <span class="warning">SHOULD NOT CONTAIN SPACES:</span><br />
                   </xsl:if>-->
                    <xsl:apply-templates select="desc" />
<!--                    .<span class="att"><xsl:apply-templates select="fileName/@ext" /></span>   -->
                </td> 
               </xsl:otherwise>
             </xsl:choose>


             <!-- #### WIDTH #### -->

             <xsl:choose>
<!--               <xsl:when test="not(width)">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>-->
               <xsl:when test="not(string(width))">
                <td valign="top" align="center" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
               <xsl:otherwise>
                <td align="center" valign="top">
                    <xsl:apply-templates select="width" />
                </td>    
               </xsl:otherwise>
             </xsl:choose>


             <!-- #### HEIGHT #### -->

             <xsl:choose>
<!--               <xsl:when test="not(height)">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>-->
               <xsl:when test="not(string(height))">
                <td valign="top" align="center" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
               <xsl:otherwise>
                <td align="center" valign="top">
                    <xsl:apply-templates select="height" />
                </td>    
               </xsl:otherwise>
             </xsl:choose>


             <!-- #### EXT #### -->

             <xsl:choose>
<!--               <xsl:when test="not(ext/@n)">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>-->
               <xsl:when test="not(string(ext/@n))">
                <td valign="top" align="center" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
               <xsl:otherwise>
                <td align="center" valign="top">
                    <xsl:apply-templates select="ext/@n" />
                </td>    
               </xsl:otherwise>
             </xsl:choose>

             <!-- #### CREATOR #### -->

             <xsl:choose>
<!--               <xsl:when test="not(creator)">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>-->
               <xsl:when test="not (string(creator/name) and not(creator/p))">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
          
               <xsl:otherwise>
                <td valign="top">
                    <xsl:apply-templates select="creator" />
                </td>    
               </xsl:otherwise>
             </xsl:choose>

             <!-- #### COPYRIGHT #### -->

             <xsl:choose>
               <xsl:when test="not(copyright)">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
               <xsl:when test="not(string(copyright/p))">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
               <xsl:otherwise>
                <td valign="top">
                    <xsl:apply-templates select="copyright" />
                </td>    
               </xsl:otherwise>
             </xsl:choose>

             <!-- #### NOTES #### -->

             <xsl:choose>
               <xsl:when test="not(notes)">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
               <xsl:when test="not(string(notes/p))">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
               <xsl:otherwise>
                <td valign="top">
                    <xsl:apply-templates select="notes" />
                </td>    
               </xsl:otherwise>
             </xsl:choose>

             <!-- #### INTERNAL #### -->

             <xsl:choose>
               <xsl:when test="not(internal)">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
               <xsl:when test="not(string(internal/p))">
                <td valign="top" class="blank">
                    &#xa0;
                </td>  
               </xsl:when>
               <xsl:otherwise>
                <td valign="top">
                    <xsl:apply-templates select="internal" />
                </td>    
               </xsl:otherwise>
             </xsl:choose>
 
            </tr>

</xsl:template>

<!--    ***********************************************       -->
<!--    ******   OTHER   *******       -->
<!--    ***********************************************       -->

<xsl:template match="p">
  <p><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="url">
  <p><a href="{text()}" target="_blank"><xsl:apply-templates /></a></p>
</xsl:template>

<xsl:template match="list">
  <ul><xsl:apply-templates /></ul>
</xsl:template>

<xsl:template match="li">
  <li><xsl:apply-templates /></li>
</xsl:template>

<xsl:template match="label">
  <b><xsl:apply-templates /></b><br/>
</xsl:template>

<xsl:template match="con">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="changeNotes">
  <ul><xsl:apply-templates /></ul>
</xsl:template>

<xsl:template match="changeItem">
  <li><xsl:apply-templates /></li>
</xsl:template>

<xsl:template match="name">
  <b><xsl:apply-templates /></b>
</xsl:template>






<!--    ***********************************************       -->

</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->
