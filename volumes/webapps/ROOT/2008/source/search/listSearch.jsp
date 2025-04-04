<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="uk.ac.kcl.cch.hofmeister.*, uk.ac.kcl.cch.HtmlDb.*, java.util.*,java.sql.*"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="hofConstants.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
 <meta http-equiv="imagetoolbar" content="no" />
    <meta name="abstract" content="" />
 <meta name="author" content="" />
 <meta name="copyright" content="Copyright (c) 2006" />
 <meta name="date" content="2005-11-26" />
 <meta name="description" content="" />
 <meta name="keywords" content="" />
 <meta name="robots" content="index,follow,archive" />
 <meta name="generator" content="xMod 1.3" /> 
    <title>Untitled Document</title>
 <link rel="shortcut icon" href="../i/favicon.ico" /> 
 <link rel="stylesheet" type="text/css" media="screen, projection" href="../../../g/c/default.css" />
 <link rel="stylesheet" type="text/css" media="screen, projection" href="../c/personality.css" />
 <link rel="stylesheet" type="text/css" media="print" href="../../../g/c/print.css" />
 <!--[if LTE IE 6]>
 <link rel="stylesheet" type="text/css" href="../c/compat.css" />
 <![endif]--> 
 <!--[if GTE IE 7]>
 <link rel="stylesheet" type="text/css" href="../c/compat.css" />
 <![endif]-->  
  </head>
  <body id="xmd" class="v1 r3 rc0">
<%
DBObjectFactory dbObjects = new DBObjectFactory(session);
 dbObjects.openConnection();
 %>

<script language="JavaScript">
//Open thesaurus window

//Open thesaurus window - may need to set the window size depending on the thesaurus ?
function openThesaurus(termNum,fieldNum) {

if (fieldNum == 99 ) return;

var xsize=0,ysize=400;
var file = 'displayThesaurus.jsp?initialChs=&termNum='+termNum+'&fieldNum='+fieldNum;

if (termNum == 1) { 
document.cookie="bsfield1="+document.basicSearch.field1.value;
document.basicSearch.term1.value="";
document.basicSearch.theskey1.value="";
} else {
document.cookie="bsfield2="+document.basicSearch.field2.value;
document.basicSearch.term2.value="";
document.basicSearch.theskey2.value="";
}

if (fieldNum == 0 ) return; //for title just update the cookie

//Use the field number to determine the size of the thesaurus window - will the CSS allow this ?
if (fieldNum == 1)
 {xsize=550;ysize=500;}
else if (fieldNum == 2)
 {xsize=550;ysize=500;}
else if (fieldNum == 3)
 {xsize=450;ysize=500;}
else if (fieldNum == 4)
 {xsize=450;ysize=500;}
else if (fieldNum == 5)
 xsize=400;
 else if (fieldNum == 6)
 {xsize=450;ysize=500;}
 else if (fieldNum == 7)
 {xsize=700;ysize=500;}
 else if (fieldNum == 8)
 {xsize=1000;ysize=500;}
else
 xsize=500;
 
msgWindow=open(file,'window2','resizable=yes,width='+xsize+',height='+ysize);
if (msgWindow.opener == null) msgWindow.opener = self;
}

</script>
  <div id="wrapper">
    <div id="banner">
<!-- ## BANNER UTILLINKS ## --> 
 
  <div class="utilLinks">
   <div class="s01">
  </div>
   <div class="s02">
  <a href=""><span>Text Only</span></a>
  <a href="#content"><span>Skip Navigation</span></a>   
  <a href="http://www.kcl.ac.uk/contact/index.html" title="Link to contact information" accesskey="c"><span>Contact Info</span></a>
  <form action="">
  <fieldset>
  <label for="siteSearch">Search</label>
  <input type="hidden" name="sitesearch" value="kcl.ac.uk" />
  <input type="hidden" name="domains" value="kcl.ac.uk" />
  <input id="siteSearch" type="text" name="siteSearch" tabindex="3" accesskey="s" class="s01" />
  <button type="submit"><span>Search</span></button>
  </fieldset>
  </form>  
   </div>   
  </div>


   
<!-- ## DECALS ## -->   
   
  <div id="decalRight"><span class="printOnly">
   Right Hand Decal
  </span>  </div>   
  <div id="decalLeft"><span class="printOnly">
    Left Hand Decal
  </span>  </div>
    </div>
 
<!-- ## STRUCTURAL TABLE ## --> 
 
    <table id="xlt" summary="" cellpadding="0" cellspacing="0">

<!-- ## BREADCRUMB TABLE ROW ## -->

  <tr class="r01">
    <td id="breadcrumb" colspan="2">
  <div class="s01">
  <ul>
  <li><span class="s01">You are here:</span></li>
  <li><a href="#" title="#"><span>Folder 1</span></a></li>
  <li><a href="#" title="#" class="s02"><span>Folder 2</span></a></li>
  </ul> 
  
<!-- ## BREADCRUMB UTILLINKS ## -->
 
  <div class="utilLinks">
    <a href=""><span>Print this page</span></a>
  <!--form action="">
  <fieldset>
  <label for="siteSearch">Search</label>
  <input type="hidden" name="sitesearch" value="kcl.ac.uk" />
  <input type="hidden" name="domains" value="kcl.ac.uk" />
  <input id="siteSearch" type="text" name="siteSearch" tabindex="3" accesskey="s" class="s01" />
  <input type="submit" class="s02" value="Go" />
  </fieldset>
  </form-->  
  </div>
    </div>
    
    
    </td>
  </tr>
   
<!-- ## MAIN TABLE ROW ## -->   
   
  <tr class="r02">
    <td id="sidenav">
  <div id="pn">
    <h3><span>Search</span></h3>
    <ul class="pn1">
  
  <li><a href="./basicSearch.jsp"><span>Basic Search</span></a></li>
  <li><a href="./advSearch.jsp"><span>Advanced Search</span></a></li>
  <li><a href="./ftSearch.jsp"><span>Free Text Search</span></a></li>
  <li><a href="./listSearch.jsp"><span>List Search</span></a></li>
    </ul>
  </div>
    </td>
    <td id="content">
<div id="rightContent">

<!-- ## TOC ## -->
    
    <div class="toc">
   <div class="t01">
 <h3>Table of Contents</h3>
 <ul>
   <li><a href=""><span>List Item</span></a></li>
   <li><a href=""><span>List Item</span></a></li>
 </ul>
 </div>
   </div>

<!-- ## QUICKLINKS (KCL) ## -->

  <div class="quickLinks">
  <div class="t01">
  <h3>Quicklinks</h3>
   <ul>
  <li><a href=""><span>Quicklink</span></a></li>
 <li><a href=""><span>Quicklink</span></a></li>
 <li><a href=""><span>Quicklink</span></a></li>
 <li><a href=""><span>Quicklink</span></a></li>
 <li><a href=""><span>Quicklink with some additional text</span></a></li>
  <li><a href=""><span>Quicklink</span></a></li>
  <li><a href=""><span>Quicklink</span></a></li>
  <li><a href=""><span>Quicklink</span></a></li>
  <li><a href=""><span>Quicklink</span></a></li>   
  <li><a href=""><span>Quicklink with some additional text</span></a></li>
  </ul>
  </div>
  </div>

<!-- ## PROMOTIONAL ARTICLE (KCL) ## -->

  <div class="promoArticle">
  <div class="t01">
  <h3>Promo Article</h3>
  <dl>
  <dt><img title="" src="../../../../images/pubimg/Trees-2.jpg" alt="" width="150" /></dt>
  <dd><p>Photo by Don McPhee, The Guardian</p></dd>  
  </dl>
  </div>
  </div>


<!-- ## SUBMENU ## -->
  <div class="submenu">
   <div class="t01">
   <h3>Submenu</h3>
    <ul>
  <li><a href=""><span>Link within this page</span></a></li>
  <li><a href=""><span>Link within this page</span></a></li>
  <li><a href=""><span>Link within this page</span></a></li>    
    </ul>
  </div>  
   </div> 


<!-- ## END RIGHTCONTENT, BEGIN MAINCONTENT ## -->

</div>
<div id="mainContent">

<!-- ## PAGE HEADING ## -->
  
  <div class="pageHeader">
  <div class="t01">
    <h1>List Search</h1>
    <h2><!--Subheading--></h2>
    <p><!--Author--></p>
  </div>
    </div>
  


<!-- ## FORM ELEMENTS: MULTI-FIELD ## -->
  <div class="form">
  <div class="t03">
  <form action="dolistSearch.jsp" enctype="multipart/form-data" method="GET" name="Search" id="">
  <input type="text" name="theskey1"/><input type="text" name="theskey2"/> 
  
    <fieldset class="s03">
  <legend>List Search</legend> 
  <ol>
   
   
    <li class="clfx-b">
  <fieldset class="f12 n01">
  <legend>Search Criteria</legend> 
    <label for="$select1ID">List all:</label> <select name="field1" id="$select1ID">
  <option value="composer" selected="selected">Composer</option>
  <option value="title">Title</option>
  <option value="opus">Opus</option>
  <option value="musickey">Key</option>
  <option value="publisher">Publisher</option>
  <option value="pubPlace">Place of Publication</option>
  <option value="country">Country</option>
  <option value="hofClass">Classification</option>
  <option value="regNumber">Registration Number</option>
    </select> 
  </fieldset>
    </li>
  
  
    <li class="clfx-b">
  <fieldset class="f12 n02">
  <legend>Moderator</legend> 
    <label for="$select1ID">Where:</label> <select name="field2" id="$select1ID">
  <option value="1" selected="selected">Composer</option>
  <option value="0">Title</option>
  <option value="5">Opus</option>
  <option value="4">Key</option>
  <option value="2">Publisher</option>
  <option value="3">Place of Publication</option>
  <option value="6">Country</option>
  <option value="7">Classification</option>
  <option value="8">Registration Number</option> <!-- we need to call the thesaurus via the javascript function not a href ? --!>
    </select> <a class="s01" title="Look up a search term in the thesaurus" target="_blank" href="javascript:void openThesaurus(2,1)">
<span>Thesaurus...</span></a> <label for="$select1IDa" class="s01">is:</label><input name="term1" id="$select1IDa" type="text" class="f01" /> 
  </fieldset>
    </li>
 
    <li class="clfx-b">
  <fieldset class="f12 n03">
  <legend>Qualifier</legend> 
    <label for="$select1ID">Except where:</label> <select name="field3" id="$select1ID">
  <option value="1" selected="selected">Composer</option>
  <option value="0">Title</option>
  <option value="5">Opus</option>
  <option value="4">Key</option>
  <option value="2">Publisher</option>
  <option value="3">Place of Publication</option>
  <option value="6">Country</option>
  <option value="7">Classification</option>
  <option value="8">Registration Number</option> <!-- we need to call the thesaurus via the javascript function not a href ? --!>
    </select> <a class="s01" title="Look up a search term in the thesaurus" href="displayThesaurus.jsp?fieldNum=3&amp;termNum=document.listSearch.field3.value"><span>Thesaurus...</span></a> <label for="$select1IDa" class="s01">is:</label><input name="term2" id="$select1IDa" type="text" class="f01" />
  </fieldset>
    </li>
  

    <li class="clfx-b">
 <fieldset class="f11 n02">
  <legend>Date Selection</legend> 
   <fieldset class="s01">
    <legend>Date Mode</legend> 
  <ol>
  <li><input class="f02" type="radio" name="dateMode" value="all" style="border: 0px none;" /><label for="all">All Dates</label></li>
  <li><input class="f02" type="radio" name="dateMode" value="range" /><label for="any">Select a range</label>
 <ol>
    <li><fieldset>
  <legend>Date Range</legend>
    <label for="$select3ID" class="s01">from</label> <select name="startMonth" id="$select3ID">
  <option value="00" selected >Month...</option>
<option value="01" >Januar</option>
<option value="02" >Februar</option>
<option value="03" >März</option>
<option value="04" >April</option>
<option value="05" >Mai</option>
<option value="06" >Juni</option>
<option value="07" >Juli</option>
<option value="08" >August</option>
<option value="09" >September</option>
<option value="10" >October</option>
<option value="11" >November</option>
<option value="12" >December</option>
   </select> <select name="startYear" id="$select3IDa">
  <option value="0000" selected="selected">Year...</option> 
  <%//May need to adjust date range - set this dynamically ?
    for (int year=1829;year<1901;year++) {%> 
 <option value="<%=year%>"><%=year%></option><%}%>
    </select> <label for="$select4ID" class="s01">to</label> <select name="endMonth" id="$select3ID">
  <option value="00" selected >Month...</option>
<option value="01" >Januar</option>
<option value="02" >Februar</option>
<option value="03" >März</option>
<option value="04" >April</option>
<option value="05" >Mai</option>
<option value="06" >Juni</option>
<option value="07" >Juli</option>
<option value="08" >August</option>
<option value="09" >September</option>
<option value="10" >October</option>
<option value="11" >November</option>
<option value="12" >December</option>
    </select> <select name="endYear" id="$select3IDa">
  <option value="0000" selected="selected">Year...</option> 
  <%//May need to adjust date range - set this dynamically ?
    for (int year=1829;year<1901;year++) {%> 
 <option value="<%=year%>"><%=year%></option><%}%>
    </select>
  </fieldset>
  </li>
  </ol>
 </li>
    </ol>
    </fieldset>
    </fieldset>
 </li>
 <li class="clfx-b">
    <fieldset class="f10 n03">
  <legend>Result Sorting</legend> 
  <label for="$select3ID" class="s01">Sort results by</label> <select name="sortKey1" id="$select3ID">
    <option value=""></option>
<option value="composerSort">Composer</option>
<option value="date" selected>Date</option>
<option value="opusSort">Opus</option>
<option value="pubPlaceSort">Publication Place</option>
<option value="publisherSort">Publisher</option>
<option value="titleSort">Title</option>
  </select> <label for="$select4ID" class="s01">then by</label> <select name="sortKey2" id="$select3IDa">
    <option value=""></option>
<option value="composerSort">Composer</option>
<option value="date">Date</option>
<option value="opusSort">Opus</option>
<option value="pubPlaceSort">Publication Place</option>
<option value="publisherSort">Publisher</option>
<option value="titleSort">Title</option>
  </select> <label for="$select4ID" class="s01">then by</label> <select name="sortKey3" id="$select4ID">
    <option value=""></option>
<option value="composerSort">Composer</option>
<option value="date">Date</option>
<option value="opusSort">Opus</option>
<option value="pubPlaceSort">Publication Place</option>
<option value="publisherSort">Publisher</option>
<option value="titleSort">Title</option>
  </select>
    </fieldset>
 </li>
 <li class="clfx-b">
    <fieldset class="f10 n04">
  <legend>Result Display</legend> 
    <label for="$select4ID" class="s01">Total results to return</label> <select name="maxResults" id="$select4ID">
  <option value="0" >All</option>
  <option value="250">250</option>
  <option value="500">500</option>
  <option value="1000" selected>1000</option>
    </select> <label for="$select4ID" class="s01">Maximum results per page</label> <select name="resperPage" id="$select4ID">
  <option value="10" selected="selected">10</option>
  <option value="25">25</option>
  <option value="50">50</option>
  <option value="100">100</option>
    </select>
    </fieldset>
 </li>
 <li class="clfx-b">
    <fieldset class="f13 n07">
  <legend>Submit Search</legend> 
   <div>
   <button type="submit">Search</button> <button type="reset">Reset Form</button>
   </div>
    </fieldset>
 </li>
 </ol>
</fieldset>





  </form>
    </div>
  </div>
 
  <br />
 <br />
 <br />
 <br />
 <br />
 



  
    </div>
  </td>
    </tr>
  </table>





 

 
<!-- ## FOOTER ## --> 
 
    <div id="footer">
   <div class="utilLinks">
   <div class="s01">
   <ul>
   <li>Last Updated:</li>
   <li>&copy; 2005</li>
   <li>Resp: <a href="mailto:me"></a></li>
   <li class="s01">Powered by <a href="http://www.cch.kcl.ac.uk/xmod/" title="link to the xMod home page"><span>xMod 1.3</span></a></li>
   </ul>
   </div>
   <div class="s02">
   Â© <strong>2005</strong>  King's College London, Strand, London WC2R 2LS, England, United Kingdom. Tel +44 (0)20 7836 5454
   </div>
   </div>
    </div>
  </div>
  </body>
</html>