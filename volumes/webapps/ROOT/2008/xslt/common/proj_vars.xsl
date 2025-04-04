<?xml version="1.0"?>
<!--
    SVN: $Id: proj_vars.xsl 1041 2018-05-23 11:16:54Z jvieira $
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1"
  xmlns:ex="ex.uri"
  xmlns:vp="vp.uri"
  xmlns:tm="tm.uri"
  xmlns:pr="pr.uri" exclude-result-prefixes="ex vp tm pr">

  <!--    Parameters passed by the Cocoon sitemap used for publication website  -->
  <xsl:param name="hofmeister-preprocess"/>
  <xsl:param name="hofmeister-db-index"/>
  <xsl:param name="hofmeister-stats"/>
  <xsl:param name="hofmeister-alist"/>
  <xsl:param name="hofmeister-thesaurus"/>
  <xsl:param name="hofmeister-materials"/>
  <xsl:param name="context-path"/>
  <xsl:param name="context-id"/>
  <xsl:param name="hofclass"/>
  <xsl:param name="monat-pb"/>
  <xsl:param name="index"/>
  <xsl:param name="view"/>
  <xsl:param name="item-id"/>
  <xsl:param name="site-id"/>

  <xsl:param name="home"/>


  <!-- For old checking pages - needs to be redone -->
  <xsl:param name="group"/>
  <xsl:param name="file"/>
  <xsl:param name="filename"/>
  <xsl:param name="contextPath"/>


  <!--    Extra Parameters passed by the Cocoon sitemap used in the checking pages -->
  <xsl:param name="hofmeister-xml"/>
  <!-- Taken from the request-name in the request-path -->
  <xsl:param name="master-id"/>
  <xsl:param name="xslt-type" select="01"/>

  <!-- Created here so that both result.xsl and indices.xsl can use it -->
  <xsl:variable name="index-display-name">
    <xsl:choose>
      <xsl:when test="$index = 'pubPlaces'">
        <xsl:text>Publication </xsl:text>
        <xsl:value-of select="substring-after($index, 'pub')"/>
      </xsl:when>
      <xsl:when test="$index = 'hofclasses'">
        <xsl:text>Classes </xsl:text>
        <xsl:value-of select="substring-after($index, 'pub')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="translate(substring($index, 1, 1), $lower, $upper)"/>
        <xsl:value-of select="substring($index, 2)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- BREADCRUMBS LINK VARIABLES -->
  <!-- breadcrumbs title for pages not in filebase/navbar -->
  <xsl:variable name="bread-title">
    <xsl:choose>
      <!-- type02 files -->
      <xsl:when test="starts-with($global-tei-id, 'hofm_')">
        <xsl:value-of select="//TEI.2/teiHeader/fileDesc/titleStmt/title[1]"/>
      </xsl:when>
      <!-- search results -->
      <xsl:when test="$global-tei-id = 'search_results'">
        <xsl:text>Search results</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>

  <!-- Link to go back to the search page with sessions -->
  <xsl:variable name="bread-search-link" select="//search-results/search-link"/>

  <!-- Label for the link back to the search page -->
  <xsl:variable name="bread-search">
    <xsl:variable name="bread-pre">
      <xsl:value-of select="substring-before(//search-results/search-link, '?')"/>
    </xsl:variable>
    <xsl:value-of select="translate(substring($bread-pre, 1, 1), $lower, $upper)"/>
    <xsl:value-of select="translate(substring($bread-pre, 2), '-', ' ')"/>
    <xsl:text> search</xsl:text>
  </xsl:variable>



  <!-- Global variable with the id of the current TEI document being transformed -->
  <xsl:variable name="global-tei-id">
    <xsl:choose>
      <xsl:when test="//TEI.2/@id and not($context-id)">
        <xsl:value-of select="//TEI.2/@id"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$context-id"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!--  GLOBAL VARIABLES  -->

  <!-- Useful translate variables -->
  <xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
  <xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>
  <xsl:variable name="dash" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ-abcdefghijklmnopqrstuvwxyz_0123456789'"/>
  <!-- Translate non-latin1 letters to latin1 for sort -->
  <xsl:variable name="regNameBefore">
    <xsl:text>ąǎäàáâÁćčçČėęéèêëěœÉíĭíïłňńñōǒôóòöøÖřšśŚŠùúüůÜÛýźżžŻŽŹ'’</xsl:text>
  </xsl:variable>

  <xsl:variable name="regNameAfter">
    <xsl:text>aaaaaaAcccCeeeeeeeeEiiiilnnnoooooooOrssSSuuuuUUyzzzZZZ</xsl:text>
  </xsl:variable>

  <!-- Authority List paths -->
  <xsl:variable name="xml-decade">
    <xsl:value-of select="$hofmeister-preprocess"/>
    <xsl:text>/decade.xml</xsl:text>
  </xsl:variable>
  <xsl:variable name="ALprocess">
    <xsl:value-of select="$hofmeister-alist"/>
    <xsl:text>/AL_process.xml</xsl:text>
  </xsl:variable>
  <xsl:variable name="filebase">
    <xsl:value-of select="$hofmeister-alist"/>
    <xsl:text>/AL_fileBase.xml</xsl:text>
  </xsl:variable>
  <xsl:variable name="navbar">
    <xsl:value-of select="$hofmeister-alist"/>
    <xsl:text>/AL_navbar.xml</xsl:text>
  </xsl:variable>
  <xsl:variable name="imagebase">
    <xsl:value-of select="$hofmeister-alist"/>
    <xsl:text>/AL_imageBase.xml</xsl:text>
  </xsl:variable>
  <xsl:variable name="docsite">
    <xsl:value-of select="$hofmeister-alist"/>
    <xsl:text>/AL_docsite.xml</xsl:text>
  </xsl:variable>
  <xsl:variable name="ALhofclass">
    <xsl:value-of select="$hofmeister-thesaurus"/>
    <xsl:text>/AL_hofclasses.xml</xsl:text>
  </xsl:variable>
  <xsl:variable name="ALcomposers">
    <xsl:value-of select="$hofmeister-thesaurus"/>
    <xsl:text>/AL_composers.xml</xsl:text>
  </xsl:variable>
  <xsl:variable name="ALpublishers">
    <xsl:value-of select="$hofmeister-thesaurus"/>
    <xsl:text>/AL_publishers.xml</xsl:text>
  </xsl:variable>
  <xsl:variable name="ALpubPlaces">
    <xsl:value-of select="$hofmeister-thesaurus"/>
    <xsl:text>/AL_pubPlaces.xml</xsl:text>
  </xsl:variable>
  <xsl:variable name="ALcountries">
    <xsl:value-of select="$hofmeister-alist"/>
    <xsl:text>/AL_countries.xml</xsl:text>
  </xsl:variable>
  <!-- Special case where $index decides which authority list is used -->
  <xsl:variable name="alist-index">
    <xsl:value-of select="$hofmeister-thesaurus"/>
    <xsl:text>/AL_</xsl:text>
    <xsl:value-of select="$index"/>
    <xsl:text>.xml</xsl:text>
  </xsl:variable>


  <!-- Group type02 and type03 ids -->
  <xsl:variable name="file-type02-pre" select="'hofm_'"/>
  <xsl:variable name="group-type02-id" select="'monatshefte'"/>
  <xsl:variable name="group-type03-id" select="'CHANGEME'"/>

  <!-- Group type02 and type03 paths -->
  <xsl:variable name="group-type02-path" select="//filebase//group[@id=$group-type02-id]/groupHead/groupFolder"/>
  <xsl:variable name="group-type03-path" select="//filebase//group[@id=$group-type03-id]/groupHead/groupFolder"/>



  <!--       KEY PROJECT VARIABLES       -->

  <!-- Basic output routing for documentation site -->
  <!-- e.g. c:\user\myProjectName\01_process\output -->
  <xsl:variable name="docsiteroot" select="//ALprocess//item[@id='docsiteroot']/param"/>



  <!--   LINKROOT   -->
  <xsl:variable name="linkroot" select="$context-path"/>


  <!--   IMAGES   -->
  <!-- Pointer to root for all images -->
  <!-- Now relative -->
  <xsl:variable name="imgroot" select="$locroot"/>

  <!-- Pointer to switch for general design images -->
  <!-- e.g. final\images\ -->
  <xsl:variable name="genimgswitch" select="//ALprocess//item[@id='genimgswitch']/param"/>

  <!-- Pointer to switch for specific publication images -->
  <!-- e.g. final\images\pubimgs\ -->
  <xsl:variable name="pubimgswitch" select="//ALprocess//item[@id='pubimgswitch']/param"/>



  <!--  SCRIPTS -->
  <!-- Pointer to root for all scripts -->
  <!-- Now relative -->
  <xsl:variable name="scriptroot" select="$locroot"/>

  <!-- Pointer to switch for scripts -->
  <!-- e.g. /Assets/g -->
  <xsl:variable name="scriptswitch" select="//ALprocess//item[@id='scriptswitch']/param"/>
  <!-- e.g. /Assets/p/04 -->
  <xsl:variable name="scriptpers" select="//ALprocess//item[@id='scriptpers']/param"/>



  <!-- BASIC CSS FOR CHECKING PAGES -->
  <!--<xsl:variable name="chqroot" select="//ALprocess//item[@id='chqroot']/param"/>-->
  <!-- Now relative -->
  <xsl:variable name="chqroot" select="$locroot"/>

  <!-- Pointer to switch for css -->
  <!-- e.g. final\css\ -->
  <xsl:variable name="chqswitchcss" select="//ALprocess//item[@id='chqswitch']/param"/>




  <!-- CALCULATING THE RELATIVE PATH -->
  <!-- context @id -->
  <xsl:variable name="loc-id">
    <xsl:choose>
      <!-- Test for checking pages -->
      <xsl:when test="/authorityList[@id='AL_docsite']">
        <xsl:text>iAL_docsite</xsl:text>
      </xsl:when>
      <xsl:when test="/authorityList">
        <xsl:value-of select="/authorityList/@id"/>
      </xsl:when>
      <xsl:when test="/projectList">
        <xsl:value-of select="/authorityList/@id"/>
      </xsl:when>
      <xsl:when test="/root">
        <xsl:value-of select="/root/@id"/>
      </xsl:when>
      <!-- XML Processing -->
      <xsl:otherwise>
        <xsl:value-of select="/TEI.2/@id"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- context type - special case for type03 -->
  <xsl:variable name="loc-type" select="/TEI.2/@rend"/>

  <xsl:variable name="loc-grp">
    <xsl:choose>
      <!-- Test for checking pages -->
      <xsl:when test="/authorityList">
        <xsl:value-of select="document($docsite)//group[item/@id=$loc-id]/groupHead/groupFolder"/>
      </xsl:when>
      <xsl:when test="/projectList">
        <xsl:value-of select="document($docsite)//group[item/@id=$loc-id]/groupHead/groupFolder"/>
      </xsl:when>
      <xsl:when test="/root">
        <xsl:value-of select="document($docsite)//group[item/@id=$loc-id]/groupHead/groupFolder"/>
      </xsl:when>
      <!-- context group - different test for each type02 and type03 -->
      <xsl:when test="/TEI.2[starts-with(@id, $file-type02-pre)]">
        <xsl:value-of select="//filebase//group[@id=$group-type02-id]/groupHead/groupFolder"/>
      </xsl:when>
      <xsl:when test="/TEI.2[starts-with(@id, $group-type03-id)]">
        <xsl:value-of select="//filebase//group[@id=$group-type03-id]/groupHead/groupFolder"/>
      </xsl:when>
      <!-- Normal type01 files -->
      <xsl:otherwise>
        <xsl:value-of select="//filebase//group[item/@id=$loc-id]/groupHead/groupFolder"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- removes everything but the forward slashes and counts that -->
  <xsl:variable name="loc-num">
    <xsl:value-of select="string-length(translate($loc-grp, $dash, ''))"/>
  </xsl:variable>

  <!-- creates the context or calls the recursive template -->
  <xsl:variable name="locroot01">
    <xsl:choose>
      <xsl:when test="$loc-num=0">
        <xsl:text>./</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dotdotslash"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- extra step for type03 where a new folder is created for each file -->
  <xsl:variable name="locroot">
    <xsl:choose>
      <xsl:when test="/TEI.2[starts-with(@id, $group-type03-id)]">
        <xsl:text>../</xsl:text>
        <xsl:value-of select="$locroot01"/>
      </xsl:when>
      <!--
            <xsl:when test="$loc-type='type03'">
                <xsl:text>../</xsl:text>
                <xsl:value-of select="$locroot01"/>
            </xsl:when>
            -->
      <xsl:otherwise>
        <xsl:value-of select="$locroot01"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- creates the relative ../ needed -->
  <xsl:template name="dotdotslash">
    <xsl:param name="ploc-num" select="$loc-num"/>
    <xsl:variable name="remainder">
      <xsl:value-of select="$ploc-num - 1"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$ploc-num = 0"></xsl:when>
      <xsl:when test="$ploc-num = 1">
        <xsl:text>../</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>../</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="not($remainder=0)">
      <xsl:call-template name="dotdotslash">
        <xsl:with-param name="ploc-num" select="$remainder"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>



  <!-- DEFINE RIGHTHAND CONTENT -->
  <xsl:template name="tpl_rhcontent">
    <xsl:variable name="rhc-site" select="//filebase//body/rhcontent/@value"/>
    <xsl:variable name="rhc-type01" select="//filebase//body/rhcontent/@type01"/>
    <xsl:variable name="rhc-type02-val" select="//filebase//group[@id=$group-type02-id]/groupHead/rhcontent/@value"/>
    <xsl:variable name="rhc-type02">
      <xsl:choose>
        <xsl:when test="string($rhc-type02-val)">
          <xsl:value-of select="$rhc-type02-val"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="//filebase//group[@id=$group-type02-id]/ancestor::group[groupHead/rhcontent[string(@value)]][1]/groupHead/rhcontent/@value" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="rhc-type03-val" select="//filebase//group[@id=$group-type03-id]/groupHead/rhcontent/@value"/>
    <xsl:variable name="rhc-type03">
      <xsl:choose>
        <xsl:when test="string($rhc-type03-val)">
          <xsl:value-of select="$rhc-type03-val"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="//filebase//group[@id=$group-type03-id]/ancestor::group[groupHead/rhcontent[string(@value)]][1]/groupHead/rhcontent/@value" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="rhc-group-val" select="//filebase//group[item[@id=current()/@id]]/groupHead/rhcontent/@value"/>
    <xsl:variable name="rhc-group">
      <xsl:choose>
        <xsl:when test="string($rhc-group-val)">
          <xsl:value-of select="$rhc-group-val"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="//filebase//group[item[@id=current()/@id]]/ancestor::group[groupHead/rhcontent[string(@value)]][1]/groupHead/rhcontent/@value" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="rhc-item" select="//filebase//item[@id=$loc-id]/rhcontent/@value"/>

    <xsl:choose>
      <!-- Type02 and Type03 file specific -->
      <xsl:when test="string(@rend) and contains('on-off', normalize-space(@rend))">
        <xsl:value-of select="normalize-space(@rend)"/>
      </xsl:when>
      <!-- Type01 file specific -->
      <xsl:when test="string($rhc-item)">
        <xsl:value-of select="$rhc-item"/>
      </xsl:when>
      <!-- Filebase output group specific (type01) -->
      <xsl:when test="string($rhc-group)">
        <xsl:value-of select="$rhc-group"/>
      </xsl:when>
      <!-- Type01 specific -->
      <xsl:when test="string($rhc-type01)">
        <xsl:value-of select="$rhc-type01"/>
      </xsl:when>
      <!-- Type02 specific -->
      <xsl:when test="/TEI.2[starts-with($loc-id, $file-type02-pre)] and string($rhc-type02)">
        <xsl:value-of select="$rhc-type02"/>
      </xsl:when>
      <!-- Type03 specific -->
      <xsl:when test="/TEI.2[starts-with($loc-id, $group-type03-id)] and string($rhc-type03)">
        <xsl:value-of select="$rhc-type03"/>
      </xsl:when>
      <!-- Site specific -->
      <xsl:when test="string($rhc-site)">
        <xsl:value-of select="$rhc-site"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>off</xsl:text>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>




  <!--  Temporary fixes   -->

  <!-- Alternative text for general images -->
  <!-- e.g. 'layout image' -->
  <xsl:variable name="alt_text" select="'layout text'"/>

  <!-- Navbar column width -->
  <!-- e.g. '150' -->
  <xsl:variable name="tab1_1_width_left" select="'150'"/>

  <!-- Navbar column width minus 20 pixels -->
  <!-- e.g. '130' -->
  <xsl:variable name="tab1_1_1_width_center" select="'130'"/>




  <!--  Specific to an area of the site, e.g. NGs   -->
  <!--     SPECIAL MONTH CODES     -->

  <tm:time>
    <tm:mth code="jan">January</tm:mth>
    <tm:mth code="feb">February</tm:mth>
    <tm:mth code="mar">March</tm:mth>
    <tm:mth code="apr">April</tm:mth>
    <tm:mth code="may">May</tm:mth>
    <tm:mth code="jun">June</tm:mth>
    <tm:mth code="jul">July</tm:mth>
    <tm:mth code="aug">August</tm:mth>
    <tm:mth code="sep">September</tm:mth>
    <tm:mth code="oct">October</tm:mth>
    <tm:mth code="nov">November</tm:mth>
    <tm:mth code="dec">December</tm:mth>
    <tm:mth code="_unknown"/>
    <tm:mth code="_unspecified"/>
  </tm:time>

  <vp:viewpoints>
    <vp:point code="author">Author(s)</vp:point>
    <vp:point code="author-org">Author organisation</vp:point>
    <vp:point code="funder">Funder</vp:point>
    <vp:point code="commissioning-body">Commissioning body</vp:point>
    <vp:point code="_unknown">n/a</vp:point>
    <vp:point code="_unspecified">n/a</vp:point>
  </vp:viewpoints>

  <ex:langs>
    <ex:lang code="eng">English</ex:lang>
    <ex:lang code="esp">Spanish</ex:lang>
    <ex:lang code="fre">French</ex:lang>
    <ex:lang code="ita">Italian</ex:lang>
    <ex:lang code="ger">German</ex:lang>
  </ex:langs>

  <pr:currencies>
    <pr:curr code="xeu">&#x20AC;</pr:curr>
    <pr:curr code="gbp">&#x00A3;</pr:curr>
    <pr:curr code="usd">&#x0024;</pr:curr>
    <pr:curr code="free">Free</pr:curr>
  </pr:currencies>

</xsl:stylesheet>
