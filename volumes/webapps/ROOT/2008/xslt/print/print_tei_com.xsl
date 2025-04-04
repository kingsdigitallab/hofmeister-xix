<?xml version="1.0"?>
<!-- ============================================================= -->
<!--  MODULE:           print_tei_com.xsl                                    -->
<!--  VERSION DATE:     1.0                                        -->
<!--  VERSION:          2003-09-05 @ 15:56                                -->
<!--  VERSION CONTROL:                                             -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!-- ORIGINAL CREATION DATE:    2003-09-05 @ 15:56                         -->
<!-- PURPOSE:   XSL stylesheet for common TEI elements      -->
<!-- CREATED FOR:  CCH  www.kcl.ac.uk/cch                          -->
<!-- CREATED BY:   PJS  spencepj@yahoo.com                         -->
<!-- COPYRIGHT:   CCH/PJS                                          -->
<!-- ============================================================= -->

<!--    ***********************************************       -->
<!--    *************   ZAK sorted up to here  *****************       -->
<!--    ***********************************************       -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.1"
                xmlns:filename="filename.uri"
                xmlns:ex="ex.uri"
                xmlns:vp="vp.uri"
                xmlns:tm="tm.uri"
                xmlns:pr="pr.uri"
                exclude-result-prefixes="filename ex vp tm pr">

<xsl:output method="html" indent="yes" />


<!--    ***********************************************       -->
<!--    *************   ROOT ELEMENT  *****************       -->
<!--    ***********************************************       -->

<xsl:template match="/">
      <xsl:apply-templates />
</xsl:template>

<!--    ***********************************************       -->
<!--    *************   WEBSITEHEADER  ***********************       -->
<!--    ***********************************************       -->

<xsl:template match="teiHeader">
</xsl:template>


<!--    ###############################################       -->
<!--    #############   INFORMATION BLOCKS  ###########       -->
<!--    ###############################################       -->

<!-- ================================================== -->
<!--    *****************************************       -->
<!--    *************   PAGE HEADINGS  ***********       -->
<!--    *****************************************       -->
<!-- ================================================== -->

<!-- This is the only information block managed from here, the rest are in the relevant key file -->

<xsl:template match="body/head">
</xsl:template>

<xsl:template match="body/head" mode="pagehead">
  <xsl:apply-templates mode="pagehead" />
</xsl:template>

<xsl:template match="/TEI.2/teiHeader/fileDesc/titleStmt/title" mode="pagehead">
  <xsl:apply-templates mode="pagehead" />
</xsl:template>

<xsl:template match="/TEI.2/teiHeader/fileDesc/titleStmt/*[self::author|self::editor|self::respStmt]" mode="pagehead">
  <xsl:apply-templates mode="pagehead" />
  <xsl:if test="position() != last()">
    <xsl:text>, </xsl:text>
  </xsl:if>
</xsl:template>

<!-- ALTERNATIVELY, YOU CAN CALL THEM INDIVIDUALLY:
<xsl:template match="/TEI.2/teiHeader/fileDesc/titleStmt/author" mode="pagehead">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="/TEI.2/teiHeader/fileDesc/titleStmt/editor" mode="pagehead">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="/TEI.2/teiHeader/fileDesc/titleStmt/respStmt" mode="pagehead">
  <xsl:apply-templates />
</xsl:template>
 -->

<xsl:template match="/TEI.2/teiHeader/fileDesc/titleStmt/respStmt/resp" mode="pagehead">
  <xsl:apply-templates />
  <xsl:if test="following-sibling::name">
    <xsl:text> </xsl:text>
  </xsl:if>
</xsl:template>

<!-- ================================================== -->
<!-- ================================================== -->
<!-- ================================================== -->

<!--    ***********************************************       -->
<!--    *************   DIVISIONS  *********************       -->
<!--    ***********************************************       -->

<xsl:template match="div">
    <xsl:choose>
      <xsl:when test="@type='box'">
                 <!--CONTACT DETAILS BOX-->
                 
                <table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}toplc.gif" width="14" height="14" /></td>
                    <td background="{$imgroot}{$genimgswitch}top14.gif"><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}top14.gif" width="14" height="14" /></td>
                    <td><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}toprc.gif" width="14" height="14" /></td>
                  </tr>
                  <tr>
                    <td background="{$imgroot}{$genimgswitch}left.gif"><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}left.gif" width="14" height="14" /></td>
                    <td>
                        <xsl:apply-templates />
                    </td>
                    <td background="{$imgroot}{$genimgswitch}right.gif"><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}right.gif" width="14" height="14" /></td>
                  </tr>
                  <tr>
                    <td><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}bottomlc.gif" width="14" height="14" /></td>
                    <td background="{$imgroot}{$genimgswitch}bottom.gif"><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}bottom.gif" width="14" height="14" /></td>
                    <td><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}bottomrc.gif" width="14" height="14" /></td>
                  </tr>
                </table>

                <br clear="all" />
                <!--END-->
      </xsl:when>
      <xsl:otherwise>
     <!-- ################################ -->
     <!-- ########  DEFAULT ###### -->
     <!-- ################################ -->  
       <xsl:apply-templates/>
       <!-- ================= -->
      </xsl:otherwise>
</xsl:choose>


</xsl:template>


<!--    ***********************************************       -->
<!--    *************   HEADINGS  *********************       -->
<!--    ***********************************************       -->

<xsl:template match="body/div/head">
       <h2><xsl:apply-templates/></h2>
</xsl:template>

<xsl:template match="body/div/div/head">
       <h3><xsl:apply-templates/></h3>
</xsl:template>

<xsl:template match="body/div/div/div/head">
       <h4><xsl:apply-templates/></h4>
</xsl:template>

<xsl:template match="body/div/div/div/div/head">
       <h5><xsl:apply-templates/></h5>
</xsl:template>

<xsl:template match="body/div/div/div/div/div/head">
       <h6><xsl:apply-templates/></h6>
</xsl:template>

<xsl:template match="body/div/div/div/div/div/div/head">
       <h6><xsl:apply-templates/></h6>
</xsl:template>

<!--    ***********************************************       -->
<!--    *************   FRONT AND BACK  *********************       -->
<!--    ***********************************************       -->

<xsl:template match="front/div/head">
       <h2><xsl:apply-templates/></h2>
</xsl:template>

<xsl:template match="front/div/div/head">
       <h3><xsl:apply-templates/></h3>
</xsl:template>

<xsl:template match="front/div/div/div/head">
       <h4><xsl:apply-templates/></h4>
</xsl:template>

<xsl:template match="front/div/div/div/div/head">
       <h5><xsl:apply-templates/></h5>
</xsl:template>

<xsl:template match="front/div/div/div/div/div/head">
       <h6><xsl:apply-templates/></h6>
</xsl:template>

<xsl:template match="front/div/div/div/div/div/div/head">
       <h6><xsl:apply-templates/></h6>
</xsl:template>

<!-- back -->

<xsl:template match="back/div/head">
       <h2><xsl:apply-templates/></h2>
</xsl:template>

<xsl:template match="back/div/div/head">
       <h3><xsl:apply-templates/></h3>
</xsl:template>

<xsl:template match="back/div/div/div/head">
       <h4><xsl:apply-templates/></h4>
</xsl:template>

<xsl:template match="back/div/div/div/div/head">
       <h5><xsl:apply-templates/></h5>
</xsl:template>

<xsl:template match="back/div/div/div/div/div/head">
       <h6><xsl:apply-templates/></h6>
</xsl:template>

<xsl:template match="back/div/div/div/div/div/div/head">
       <h6><xsl:apply-templates/></h6>
</xsl:template>

<!--    ***********************************************       -->
<!--    *************   TOC  *********************       -->
<!--    ***********************************************       -->

<xsl:template match="body/head" mode="toc">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="note" mode="toc">
</xsl:template>

<xsl:template match="term" mode="toc">
</xsl:template>

<xsl:template match="hi" mode="toc">
  <xsl:apply-templates select="." />
</xsl:template>

<!--    ***********************************************       -->
<!--    *************   TOC FOR FRONT AND BACK TOO?  *********************       -->
<!--    ***********************************************       -->

<xsl:template match="front/head" mode="toc">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="back/head" mode="toc">
  <xsl:apply-templates />
</xsl:template>

<!--    ***********************************************       -->
<!--    *************   SUBMENU EXTRAS *********************       -->
<!--    ***********************************************       -->

<xsl:template match="head" mode="submenu">
  <xsl:apply-templates mode="submenu" />
</xsl:template>

<xsl:template match="note" mode="submenu">
</xsl:template>

<xsl:template match="hi" mode="submenu">
  <xsl:apply-templates select="." />
</xsl:template>

<!--    ###############################################       -->
<!--    #############   BLOCK LEVEL  #################       -->
<!--    ###############################################       -->

<!--    ***********************************************       -->
<!--    *************   PARAS  ***********************       -->
<!--    ***********************************************       -->

<xsl:template match="p">
 <xsl:choose>
   <!-- ######################## -->
   <!-- CASE 1: special case where it is in a list -->
   <!-- ######################## -->
   <xsl:when test="parent::item">
      <p><xsl:apply-templates /></p>  
   </xsl:when>
   <xsl:otherwise>
   <!-- ######################## -->
   <!-- OTHER CASES -->
   <!-- ######################## -->
      <p><xsl:apply-templates /></p>
   </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<!--    ***********************************************       -->
<!--    *************   LISTS  ***********************       -->
<!--    ***********************************************       -->

<!--    *******  LISTS  *********      -->
<xsl:template match="list">
             <xsl:if test="head">
                <h4><xsl:apply-templates select="head" /></h4>
              </xsl:if> 
  <xsl:choose>
 <!-- ############################### -->
 <!--  CASE 1: Test for nested lists -->
 <!-- ############################### -->
  <xsl:when test="parent::item">
     <xsl:call-template name="list-models" />
  </xsl:when>

 <!-- ############################### -->
 <!--  CASE 2: Test for lists within tables -->
 <!-- ############################### -->
  <xsl:when test="ancestor::table">
     <xsl:call-template name="list-models" />
  </xsl:when>

 <!-- ############################### -->
 <!--  CASE 3: Test for lists within blockquotes -->
 <!-- ############################### -->
 <xsl:when test="ancestor::quote">
     <xsl:call-template name="list-models" />
 </xsl:when>

 <!-- ############################### -->
 <!--  CASE 4: Normal lists -->
 <!-- ############################### -->
  <xsl:otherwise>
     <xsl:call-template name="list-models" />
  </xsl:otherwise>
 <!--  END OF ALL CASES -->
 </xsl:choose> 
</xsl:template>

<xsl:template name="list-models">
        <!-- Basic list formatting starts -->
        <xsl:choose>

         <!-- ######## ORDERED LIST ######## -->
          <xsl:when test="@type='ordered'">
            <ol>
              <xsl:apply-templates select="item" />
            </ol>
          </xsl:when>

         <!-- ######## BULLETED LIST ######## -->
          <xsl:when test="@type='bulleted'">
            <ul>
              <xsl:apply-templates select="item" />
            </ul>
          </xsl:when>

         <!-- ######## SIMPLE ######## -->
          <xsl:when test="@type='simple'">
                 <xsl:choose>
                   <xsl:when test="ancestor::p">
                                   <xsl:apply-templates select="item" />
                   </xsl:when>
                   <xsl:otherwise>
                     <p>              <xsl:apply-templates select="item" /></p>
                   </xsl:otherwise>
                 </xsl:choose>
          </xsl:when>

         <!-- ######## GLOSS ######## -->
          <xsl:when test="@type='gloss'">
            <table border="0" cellspacing="0" cellpadding="0" width="80%">
                            <xsl:apply-templates select="label" />
                            <xsl:apply-templates select="item" />
            </table>
          </xsl:when>

         <!-- ######## DEFAULT ######## -->
          <xsl:otherwise>
             <ul>
                            <xsl:apply-templates select="item" />
             </ul>
          </xsl:otherwise>
        </xsl:choose>
        <!-- Basic list formatting ends -->
</xsl:template>

<xsl:template match="item[parent::list]">
<xsl:choose>
 <!-- ############################### -->
 <!--  CASE 1: Simple list items -->
 <!-- ############################### -->
  <xsl:when test="../@type='simple'">
      <xsl:apply-templates />
  </xsl:when>
 <!-- ############################### -->
 <!--  CASE 2: Glossary items -->
 <!-- ############################### -->
  <xsl:when test="../@type='gloss'">
    <tr>
      <!-- item HERE -->
      <td>
        <xsl:apply-templates select="preceding-sibling::label[1]" mode="glossary" />
      </td>
      <!-- divider HERE -->
      <td width="9" background="{$imgroot}{$genimgswitch}table_div.gif">
               <img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}shim.gif" width="9" height="18" />
      </td>
      <!-- label HERE -->
      <td>
        <xsl:apply-templates />
      </td>
    </tr>
    <tr>
         <td background="{$imgroot}{$genimgswitch}h_div.gif" colspan="3" height="1"><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}shim.gif" width="1" height="1" /></td>
    </tr>
  </xsl:when>
 <!-- ############################### -->
 <!--  CASE 3: Items with their own numbers -->
 <!-- ############################### -->
  <xsl:when test="parent::list//@n">
      <li>
         <xsl:apply-templates select="@n" />
         <xsl:text>. </xsl:text>
         <xsl:apply-templates />
      </li>
  </xsl:when>
 <!-- ############################### -->
 <!--  CASE 4: All other list items -->
 <!-- ############################### -->
  <xsl:otherwise>

<!-- ######### START BASIC LIST ITEM FORMATTING ########### -->
     <li>
      <xsl:apply-templates />
     </li>
<!-- ######### END BASIC LIST ITEM FORMATTING ########### -->

  </xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="label[parent::list]">
</xsl:template>

<xsl:template match="label" mode="glossary">
      <xsl:apply-templates />
</xsl:template>

<xsl:template match="headLabel">
    <tr>
         <td background="{$imgroot}{$genimgswitch}h_div.gif" colspan="3" height="1"><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}shim.gif" width="1" height="1" /></td>
    </tr>
                <tr>
                  <th>
                    <xsl:apply-templates />
                  </th>
                  <th width="9" background="{$imgroot}{$genimgswitch}table_div.gif">
                    <img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}shim.gif" width="9" height="18" />
                  </th>
                  <th>
                    <xsl:apply-templates select="following-sibling::headItem[1]" mode="glossary" />
                  </th>
                </tr>
    <tr>
         <td background="{$imgroot}{$genimgswitch}h_div.gif" colspan="3" height="1"><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}shim.gif" width="1" height="1" /></td>
    </tr>
</xsl:template>

<xsl:template match="headItem">
</xsl:template>

<xsl:template match="headItem" mode="glossary">
      <xsl:apply-templates />
</xsl:template>



<!--    ***********************************************       -->
<!--    *************   TABLE  ************************       -->
<!--    ***********************************************       -->

<!-- ########## TABLES ############### -->
<xsl:template match="table">
 <!-- Variables for special tables -->

 <xsl:choose>
  <xsl:when test="@rend='linkbib' or @rend='linkBib' or @rend='projlist' or @rend='projList' or @rend='special'">
  <!-- START special tables -->

      <tr>
        <td>        
        <!--Begin Index in Separate Table-->        
        <div align="center">        
            <table border="1" cellpadding="0" cellspacing="0" width="100%">
             <xsl:if test="head">
                <tr>
                  <th><xsl:apply-templates select="head" /></th>
                </tr>
              </xsl:if>    
               <tr>
                  <td background="{$imgroot}/images/line_mauve_dots.gif"><img border="0" src="{$imgroot}/images/line_mauve_dots.gif" width="9" height="5" /></td>
               </tr>
                  <!-- ************** -->
                  <xsl:apply-templates />
                  <!-- ************** -->
           </table>        
        </div>         
      </td>
    </tr>

  <!-- START special tables -->
  </xsl:when>
  <xsl:otherwise>
  <!-- START normal tables -->
 <br clear="all" />
<br/>

             <xsl:if test="head">
                <h4><xsl:apply-templates select="head" /></h4>
              </xsl:if> 

 <table cellspacing="0" cellpadding="3">
<!-- Alignment -->
 <xsl:choose>
  <xsl:when test="align">
   <xsl:value-of select="@align" />
  </xsl:when>
  <xsl:otherwise>
   <xsl:attribute name="align">left</xsl:attribute>
  </xsl:otherwise>
 </xsl:choose>

<!-- Borders -->
 <xsl:choose>
  <xsl:when test="border">
   <xsl:value-of select="@border" />
  </xsl:when>
  <xsl:otherwise>
   <xsl:attribute name="border">1</xsl:attribute>
  </xsl:otherwise>
 </xsl:choose>

<xsl:apply-templates select="row" />
 </table>

<br clear="all"/>
<br/>

  </xsl:otherwise>
  <!-- END normal tables -->
 </xsl:choose>
</xsl:template>

<!-- ########## CAPTIONS ############### -->
<xsl:template match="caption">
 <h3>
  <xsl:apply-templates />
 </h3>
</xsl:template>

<!-- ########## ROWS ############### -->
<xsl:template match="row">

  <xsl:choose>

     <!-- #### OPTION 1: LINKBIB #### -->
     <xsl:when test="../@rend='linkbib' or ../@rend='linkBib'">

     <!-- ************************************** -->
     <!-- ************************************** -->
       <xsl:choose>
         <xsl:when test="position() mod 2 = 0">
         <!-- ============================ -->
         <!-- ========= EVEN CASE ======== -->
         <!-- ============================ -->
                <tr>
                  <td> 
                     <xsl:apply-templates select="cell[@role='linkTitle']" />
                  </td>
               </tr>
               <tr>
                  <td>
                     <xsl:apply-templates select="cell[@role='linkUrl']" />
                    <!-- next item -->
                    <xsl:if test="cell[@role='linkDesc']">
                       <xsl:apply-templates select="cell[@role='linkDesc']" />
                         <xsl:if test="cell/following-sibling::cell">
                            <br/>
                         </xsl:if>                
                    </xsl:if>
                  </td>
               </tr>
               <tr>
                   <td background="{$imgroot}/images/line_mauve_dots.gif"><img border="0" src="{$imgroot}/images/line_mauve_dots.gif" width="9" height="5" /></td>
               </tr>
         <!-- ============================ -->
         </xsl:when>
         <xsl:otherwise>
         <!-- ============================ -->
         <!-- ========= ODD CASE ========= -->
         <!-- ============================ -->
                <tr>
                  <td>
                     <xsl:apply-templates select="cell[@role='linkTitle']" />
                  </td>
               </tr>
               <tr>
                  <td>
                     <xsl:apply-templates select="cell[@role='linkUrl']" />
                    <!-- next item -->
                    <xsl:if test="cell[@role='linkDesc']">
                       <xsl:apply-templates select="cell[@role='linkDesc']" />
                         <xsl:if test="cell/following-sibling::cell">
                            <br/>
                         </xsl:if>                
                    </xsl:if>
                  </td>
               </tr>
               <tr>
                   <td background="{$imgroot}/images/line_mauve_dots.gif"><img border="0" src="{$imgroot}/images/line_mauve_dots.gif" width="9" height="5" /></td>
               </tr>
         <!-- ============================ -->
         </xsl:otherwise>
       </xsl:choose>
     <!-- ************************************** -->
     <!-- ************************************** -->
     </xsl:when>

     <!-- #### OPTION 2: SPECIAL #### -->
     <xsl:when test="../@rend='special'">

     <!-- ************************************** -->
     <!-- ************************************** -->
       <xsl:choose>
         <xsl:when test="position() mod 2 = 0">
         <!-- ============================ -->
         <!-- ========= EVEN CASE ======== -->
         <!-- ============================ -->
                <tr>
                  <td>
                     <xsl:apply-templates select="cell[@role='itemTitle']" />
                  </td>
               </tr>
               <tr>
                  <td>
                    <!-- next item -->
                    <xsl:if test="cell[@role='itemSubtit']">
                       <xsl:apply-templates select="cell[@role='itemSubtit']" />
                         <xsl:if test="cell/following-sibling::cell">
                            <br/>
                         </xsl:if>                
                    </xsl:if>
                    <!-- next item -->
                    <xsl:if test="cell[@role='itemDesc']">
                       <xsl:apply-templates select="cell[@role='itemDesc']" />
                         <xsl:if test="cell/following-sibling::cell">
                            <br/>
                         </xsl:if>                
                    </xsl:if>
                    <!-- next item -->
                    <xsl:if test="cell[@role='contactInfo']">
                       <xsl:apply-templates select="cell[@role='contactInfo']" />
                         <xsl:if test="cell/following-sibling::cell">
                            <br/>
                         </xsl:if>                
                    </xsl:if>
                    <!-- next item -->
                    <xsl:if test="cell[@role='linkUrl']">
                       <xsl:apply-templates select="cell[@role='linkUrl']" />
                         <xsl:if test="cell/following-sibling::cell">
                            <br/>
                         </xsl:if>                
                    </xsl:if>
                  </td>
               </tr>
               <tr>
                   <td background="{$imgroot}/images/line_mauve_dots.gif"><img border="0" src="{$imgroot}/images/line_mauve_dots.gif" width="9" height="5" /></td>
               </tr>
         <!-- ============================ -->
         </xsl:when>
         <xsl:otherwise>
         <!-- ============================ -->
         <!-- ========= ODD CASE ========= -->
         <!-- ============================ -->
                <tr>
                  <td>
                     <xsl:apply-templates select="cell[@role='itemTitle']" />
                  </td>
               </tr>
               <tr>
                  <td>
                    <!-- next item -->
                    <xsl:if test="cell[@role='itemSubtit']">
                       <xsl:apply-templates select="cell[@role='itemSubtit']" />
              
                    </xsl:if>
                    <!-- next item -->
                    <xsl:if test="cell[@role='itemDesc']">
                       <xsl:apply-templates select="cell[@role='itemDesc']" />
              
                    </xsl:if>
                    <!-- next item -->
                    <xsl:if test="cell[@role='contactInfo']">
                       <xsl:apply-templates select="cell[@role='contactInfo']" />
              
                    </xsl:if>
                    <!-- next item -->
                    <xsl:if test="cell[@role='linkUrl']">
                       <xsl:apply-templates select="cell[@role='linkUrl']" />
              
                    </xsl:if>
                  </td>
               </tr>
               <tr>
                   <td background="{$imgroot}/images/line_mauve_dots.gif"><img border="0" src="{$imgroot}/images/line_mauve_dots.gif" width="9" height="5" /></td>
               </tr>
         <!-- ============================ -->
         </xsl:otherwise>
       </xsl:choose>
     <!-- ************************************** -->
     <!-- ************************************** -->
     </xsl:when>

     <!-- #### OPTION 3: PROJLIST #### -->
     <xsl:when test="../@rend='projlist' or ../@rend='projList' ">

     <!-- ************************************** -->
     <!-- ************************************** -->
       <xsl:choose>
         <xsl:when test="position() mod 2 = 0">
         <!-- ============================ -->
         <!-- ========= EVEN CASE ======== -->
         <!-- ============================ -->
                <tr>
                  <td>
                     <xsl:apply-templates select="cell[@role='projTitle']" />
                  </td>
               </tr>
               <tr>
                  <td>
                    <!-- next item -->
                    <xsl:if test="cell[@role='projSubtit']">
                       <xsl:apply-templates select="cell[@role='projSubtit']" />
              
                    </xsl:if>
                    <!-- next item -->
                    <xsl:if test="cell[@role='projDesc']">
                       <xsl:apply-templates select="cell[@role='projDesc']" />
              
                    </xsl:if>
                    <!-- next item -->
                    <xsl:if test="cell[@role='contactInfo']">
                       <xsl:apply-templates select="cell[@role='contactInfo']" />
              
                    </xsl:if>
                    <!-- next item -->
                    <xsl:if test="cell[@role='linkUrl']">
                       <xsl:apply-templates select="cell[@role='linkUrl']" />
              
                    </xsl:if>
                  </td>
               </tr>
               <tr>
                   <td background="{$imgroot}/images/line_mauve_dots.gif"><img border="0" src="{$imgroot}/images/line_mauve_dots.gif" width="9" height="5" /></td>
               </tr>
         <!-- ============================ -->
         </xsl:when>
         <xsl:otherwise>
         <!-- ============================ -->
         <!-- ========= ODD CASE ========= -->
         <!-- ============================ -->
                <tr>
                  <td>
                     <xsl:apply-templates select="cell[@role='projTitle']" />
                  </td>
               </tr>
               <tr>
                  <td>
                    <!-- next item -->
                    <xsl:if test="cell[@role='projSubtit']">
                       <xsl:apply-templates select="cell[@role='projSubtit']" />
              
                    </xsl:if>
                    <!-- next item -->
                    <xsl:if test="cell[@role='projDesc']">
                       <xsl:apply-templates select="cell[@role='projDesc']" />
              
                    </xsl:if>
                    <!-- next item -->
                    <xsl:if test="cell[@role='contactInfo']">
                       <xsl:apply-templates select="cell[@role='contactInfo']" />
              
                    </xsl:if>
                    <!-- next item -->
                    <xsl:if test="cell[@role='linkUrl']">
                       <xsl:apply-templates select="cell[@role='linkUrl']" />
              
                    </xsl:if>
                  </td>
               </tr>
               <tr>
                   <td background="{$imgroot}/images/line_mauve_dots.gif"><img border="0" src="{$imgroot}/images/line_mauve_dots.gif" width="9" height="5" /></td>
               </tr>
         <!-- ============================ -->
         </xsl:otherwise>
       </xsl:choose>
     <!-- ************************************** -->
     <!-- ************************************** -->
     </xsl:when>

     <!-- #### OPTION Z: NORMAL TABLES #### -->
     <xsl:otherwise>
         <tr>
             <xsl:apply-templates />
         </tr>
     </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<!-- ########## CELLS ############### -->
<xsl:template match="cell">
 <xsl:choose>
  <xsl:when test="../../@rend='linkbib' or ../../@rend='linkBib' or ../../@rend='projlist' or ../../@rend='projList' or ../../@rend='special'">
       <xsl:apply-templates />
                         <xsl:if test="string(following-sibling::cell)">
                            <br/>
                         </xsl:if>  
  </xsl:when>
  <xsl:when test="@role='label'">
     <th>
       <xsl:call-template name="table-cell-atts" />
       <xsl:apply-templates />
     </th>
  </xsl:when>
 <xsl:otherwise>
   <td>
    <xsl:call-template name="table-cell-atts" />
    <xsl:apply-templates />
   </td>
 </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<!-- ########## SPECIAL TABLE ATTRIBUTES ############### -->
<xsl:template name="table-cell-atts">
    <xsl:attribute name="rowspan"><xsl:value-of select="@rows" /></xsl:attribute>  
    <xsl:attribute name="colspan"><xsl:value-of select="@cols" /></xsl:attribute>  
</xsl:template>


<!--    ***********************************************       -->
<!--    *************   NEW BIB SECTION  *************       -->
<!--    ***********************************************       -->

<xsl:template match="listBibl">
   <ul>
     <xsl:apply-templates />
   </ul>
</xsl:template>

<xsl:template match="bibl[parent::listBibl]">
 <li>
  <xsl:apply-templates />
 </li>
</xsl:template>

<xsl:template match="listBibl/head">
 <caption>
  <b>
   <xsl:apply-templates />
  </b>
 </caption>
</xsl:template>

<xsl:template match="title">
 <i>
  <xsl:apply-templates />
 </i>
</xsl:template>

<xsl:template match="author">
 <b>
  <xsl:apply-templates />
 </b>
</xsl:template>


<!--    ***********************************************       -->
<!--    *************   BLOCKQUOTES  **********************       -->
<!--    ***********************************************       -->

<xsl:template match="quote">
<xsl:choose>
  <!-- ### special cases #### -->
  <xsl:when test="parent::item">
     <blockquote>
        <xsl:apply-templates />
     </blockquote> 
  </xsl:when>
  <!-- ### others #### -->
  <xsl:otherwise>
     <blockquote>
       <xsl:apply-templates />
     </blockquote> 
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- The 'q' element is no longer used, but template kept for legacy reasons -->
<xsl:template match="q">
<xsl:choose>
  <!-- ### special cases #### -->
  <xsl:when test="parent::item">
     <blockquote>
        <xsl:apply-templates />
     </blockquote> 
  </xsl:when>
  <!-- ### others #### -->
  <xsl:otherwise>
     <blockquote>
       <xsl:apply-templates />
     </blockquote> 
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

<!--    ***********************************************       -->
<!--    *************   ADDRESSES  **********************       -->
<!--    ***********************************************       -->

<xsl:template match="address">
                 <!--CONTACT DETAILS BOX-->
                 
                <table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}toplc.gif" width="14" height="14" /></td>
                    <td background="{$imgroot}{$genimgswitch}top14.gif"><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}top14.gif" width="14" height="14" /></td>
                    <td><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}toprc.gif" width="14" height="14" /></td>
                  </tr>
                  <tr>
                    <td background="{$imgroot}{$genimgswitch}left.gif"><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}left.gif" width="14" height="14" /></td>
                    <td>
                      <table border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <th>Contact Details</th>
                            </tr>
                        <xsl:apply-templates />
                      </table>
                    </td>
                    <td background="{$imgroot}{$genimgswitch}right.gif"><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}right.gif" width="14" height="14" /></td>
                  </tr>
                  <tr>
                    <td><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}bottomlc.gif" width="14" height="14" /></td>
                    <td background="{$imgroot}{$genimgswitch}bottom.gif"><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}bottom.gif" width="14" height="14" /></td>
                    <td><img alt="{$alt_text}" src="{$imgroot}{$genimgswitch}bottomrc.gif" width="14" height="14" /></td>
                  </tr>
                </table>
                <!--END-->
    <xsl:if test="following-sibling::address">
      <br />
    </xsl:if>
</xsl:template>

<xsl:template match="addrLine">
      <tr>
        <td>
<!-- START automatic links or email addresses -->
   <xsl:choose>
     <xsl:when test="@type='email'">
       <u><xsl:apply-templates /></u>
     </xsl:when>
     <xsl:when test="@type='url'">
    <u><xsl:apply-templates /></u>  
     </xsl:when>
     <xsl:otherwise>
       <xsl:apply-templates />
     </xsl:otherwise>
   </xsl:choose>
<!-- END automatic links or email addresses -->
        </td>
      </tr>
</xsl:template>


<!--    ***********************************************       -->
<!--    *************   FIGURES  **********************       -->
<!--    ***********************************************       -->

<xsl:template match="figure">
<!-- =========  Find info for publication images =========== -->
<!-- e.g. abc.gif -->
<xsl:variable name="img-id" select="//imagebase//image[@id=current()/@url]/@id" />
<xsl:variable name="img-ext" select="//imagebase//image[@id=current()/@url]/ext/@n" />

<xsl:variable name="img-caption" select="//imagebase//image[@id=current()/@url]/caption" />
<xsl:variable name="img-desc" select="//imagebase//image[@id=current()/@url]/desc" />
<xsl:variable name="img-width" select="//imagebase//image[@id=current()/@url]/width" />
<xsl:variable name="img-height" select="//imagebase//image[@id=current()/@url]/height" />

  <xsl:if test="string(@url)">  
    <xsl:text>[Image</xsl:text>
    <xsl:choose>
      <xsl:when test="string($img-desc)">
        <xsl:text>: </xsl:text>
        <xsl:value-of select="$img-desc" />
      </xsl:when>
      <xsl:when test="string($img-caption)">
        <xsl:text>: </xsl:text>
        <xsl:value-of select="$img-caption" />
      </xsl:when>
      <xsl:otherwise>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>]</xsl:text>
  </xsl:if> 
</xsl:template>
<!-- 
           <xsl:attribute name="src"><xsl:value-of select="$linkroot" />/<xsl:value-of select="$linkswitch" /><xsl:value-of select="$pubimgswitch" />/<xsl:value-of select="@url" />.<xsl:value-of select="//imagebase//image[@id=current()/@url]/ext/@n" /></xsl:attribute>
 -->

<!--    ###############################################       -->
<!--    #############   PHRASE LEVEL  #################       -->
<!--    ###############################################       -->

<!--    ***********************************************       -->
<!--    *************   LINKS: xref  ******************       -->
<!--    ***********************************************       -->

<xsl:template match="xref">

<!-- NOTE: the main types of links are now specified using @type. Any reference to @rend is legacy only, and kept in the code just in case, but @rend should not be used. -->

<!-- VARIABLES FOR NORMAL INTERNAL LINKS -->

  <xsl:variable name="internal-link-path" select="//filebase//item[@id=current()/@from]/parent::*/groupHead/groupFolder" />
  <xsl:variable name="internal-link-filename" select="//filebase//item[@id=current()/@from]/fileName" />
  <xsl:variable name="internal-link-anchor" select="@n" />       

<!-- VARIABLES FOR GROUP INTERNAL LINKS -->

  <xsl:variable name="internal-link-group-path-1" select="//filebase//group[@id=current()/@from]/groupHead/groupFolder" />
  <xsl:variable name="internal-link-group-path-2" select="substring-before(@url, '-')" />
  <xsl:variable name="internal-link-group-path" select="concat($internal-link-group-path-1, '/', $internal-link-group-path-2)" />
  <xsl:variable name="internal-link-group-filename" select="@url" />
  <xsl:variable name="internal-link-group-anchor" select="@n" /> 

<!--START MAIN THREE CASES -->
 <xsl:choose>

   <!-- ################################# -->
   <!-- START First option: external urls -->
   <!-- ################################# -->
  <xsl:when test="@type='external' or @rend='external'">
    <u><xsl:apply-templates /></u>      
  </xsl:when>
   <!-- END First option: external urls -->

   <!-- ################################# -->
   <!-- START Second option: emails -->
   <!-- ################################# -->
  <xsl:when test="@type='email' or @rend='email'">
    <u><xsl:apply-templates /></u>
  </xsl:when>
   <!-- END Second option: emails -->

   <!-- ################################# -->
   <!-- START Third option: internal pointer -->
   <!-- ################################# -->
  <xsl:when test="@type='internal' or @rend='internal'">
                  <xsl:apply-templates />
  </xsl:when>

   <!-- ################################# -->
   <!-- DEFAULT option: external urls -->
   <!-- ################################# -->
<!-- For some reason XMetal doesn't output default attributes, so treat all others as external links -->
  <xsl:otherwise>
    <u><xsl:apply-templates /></u>      
  </xsl:otherwise>
   <!-- END DEFAULT option: external urls -->

 </xsl:choose>
</xsl:template>

<!--    ***********************************************       -->
<!--    *************   LINKS: other models  *******************       -->
<!--    ***********************************************       -->


<xsl:template match="ref">
    <xsl:apply-templates />
</xsl:template>

<xsl:template match="anchor">
    <xsl:apply-templates /> 
</xsl:template>

<xsl:template match="xptr">
  <u>
    <xsl:apply-templates select="@from" /> 
  </u>
</xsl:template>


<!--    ***********************************************       -->
<!--    *************  UBI  ***********************       -->
<!--    ***********************************************       -->

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
  <!-- CURRENT DEFAULT: italics -->
  <xsl:otherwise>
     <i><xsl:apply-templates /></i>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>


<!--    ***********************************************       -->
<!--    *************   FOOTNOTES  ***********************       -->
<!--    ***********************************************       -->

<xsl:template match="note">
              <sup class="numsup"><xsl:number
                           level="any" />
             </sup>     
</xsl:template>

<!--    ***********************************************       -->
<!--    *************   VARIOUS TERMS  ****************       -->
<!--    ***********************************************       -->

<xsl:template match="foreign">
   <i><xsl:apply-templates /></i>
</xsl:template>

<xsl:template match="rs">
 <xsl:if test="@type='keyconcept'">
   <a>
      <xsl:attribute name="name"><xsl:value-of select="ancestor::TEI.2/@id" />-<xsl:text>kc</xsl:text><xsl:number
                                      level="any" /></xsl:attribute>
   </a>
 </xsl:if>
   <b><xsl:apply-templates /></b>
</xsl:template>

<xsl:template match="date[not(ancestor::bibl)]">
   <b><xsl:apply-templates /></b>
</xsl:template>

<xsl:template match="emph">
   <i><xsl:apply-templates /></i>
</xsl:template>

<!--    ***********************************************       -->
<!--    *************   SEARCHABLE TESTS  ****************       -->
<!--    ***********************************************       -->




</xsl:stylesheet>

<!--    ***********************************************       -->
<!--    *************   END OF STYLESHEET  ************       -->
<!--    ***********************************************       -->
