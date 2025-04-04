<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="uk.ac.kcl.cch.hofmeister.*, uk.ac.kcl.cch.HtmlDb.*, java.util.*,java.sql.*"%>
<%@page pageEncoding="UTF-8"%>
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

function newWindow(file,window,fn) {
var xsize=0,ysize=400;

 //Use the field number to determine the size of the thesaurus window
if (fn == 1)
 {xsize=550;ysize=500;}
else if (fn == 2)
 {xsize=550;ysize=500;}
else if (fn == 3)
 {xsize=450;ysize=500;}
else if (fn == 4)
 {xsize=450;ysize=500;}
else if (fn == 5)
 xsize=400;
 else if (fn == 6)
 {xsize=450;ysize=500;}
 else if (fn == 7)
 {xsize=700;ysize=500;}
 else if (fn == 8)
 {xsize=1000;ysize=500;}
else
 xsize=500;

msgWindow=open(file,window,'resizable=yes,width='+xsize+',height='+ysize);
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
    </span> </div>    
 <div id="decalLeft"><span class="printOnly">
   Left Hand Decal
    </span> </div>
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
 <h1>Advanced Search</h1>
 <h2><!--Subheading--></h2>
 <p><!--Author--></p>
    </div>
   </div>
    


<!-- ## FORM ELEMENTS: MULTI-FIELD ## -->
    <div class="form">
     <div class="t03">
     <form action="" enctype="multipart/form-data" method="" name="" id="">
     <fieldset class="s03">
  <legend>Advanced Search</legend> 
  <ol>
    <li class="clfx-b">
 <fieldset class="f12 n01">
 <legend>Primary Search Criteria</legend> 
   <label for="$select1ID">Search for:</label> <select id="$select1ID">
     <option selected="selected">Composer</option>
     <option>Title</option>
     <option>Opus</option>
     <option>Key</option>
     <option>Publisher</option>
     <option>Place of Publication</option>
     <option>Country</option>
     <option>Classification</option>
     <option>Regularisation Number</option>
   </select> <a class="s01" title="Look up a search term in the thesaurus" href="#"><span>Thesaurus...</span></a> <input id="" type="text" class="f01" /> 
   <fieldset>
     <legend>Search Mode</legend> 
     <ol>
  <li class="clfx-b"><input class="f02" type="radio" name="searchMode" value="all" /><label for="all">All Words</label></li>
  <li class="clfx-b"><input class="f02" type="radio" name="searchMode" value="any" /><label for="any">At least one word</label></li>
  <li class="clfx-b"><input class="f02" type="radio" name="searchMode" value="exact" /><label for="exact">Exact Search</label></li>
     </ol>
   </fieldset>
 </fieldset>
    </li>
    <li class="clfx-b">
 <fieldset class="f12 n02">
 <legend>Secondary Search Criteria</legend> 
   <fieldset class="s01">
     <legend>Boolean Operators</legend> 
     <ol>
  <li><input class="f02" type="radio" name="boolean1" value="and" /><label for="and" style="float: left;">and</label></li>
  <li><input class="f02" type="radio" name="boolean1" value="or" /><label for="or">or</label></li>
  <li><input class="f02" type="radio" name="boolean1" value="not" /><label for="not">not</label></li>
     </ol>
   </fieldset>
   <label for="$select1ID">Search for:</label> <select id="$select1ID">
     <option>Composer</option>
     <option selected="selected">Title</option>
     <option>Opus</option>
     <option>Key</option>
     <option>Publisher</option>
     <option>Place of Publication</option>
     <option>Country</option>
     <option>Classification</option>
     <option>Regularisation Number</option>
   </select> 
    <a class="s01" title="Look up a search term in the thesaurus" href="#"><span>Thesaurus...</span></a> 
    <b class="s03"><a href="#">x</a><input id="" type="text" class="f01" value="Filled from Thesaurus" disabled="disabled" /></b>
   <fieldset>
     <legend>Search Mode</legend> 
     <ol>
  <li class="clfx-b"><input class="f02" type="radio" name="searchMode" value="all" /><label for="all">All Words</label></li>
  <li class="clfx-b"><input class="f02" type="radio" name="searchMode" value="any" /><label for="any">At least one word</label></li>
  <li class="clfx-b"><input class="f02" type="radio" name="searchMode" value="exact" /><label for="exact">Exact Search</label></li>
     </ol>
   </fieldset>
 </fieldset>
    </li>
    <li class="clfx-b">
    <fieldset class="f12 n03">
    <legend>Tertiary Search Criteria</legend> 
 <fieldset class="s01">
   <legend>Boolean Operators</legend> 
   <ol>
     <li><input class="f02" type="radio" name="boolean1" value="and" /><label for="and">and</label></li>
     <li><input class="f02" type="radio" name="boolean1" value="or" /><label for="or">or</label></li>
     <li><input class="f02" type="radio" name="boolean1" value="not" /><label for="not">not</label></li>
   </ol>
 </fieldset>
 <label for="$select1ID">Search for:</label> <select id="$select1ID">
   <option>Composer</option>
   <option>Title</option>
   <option selected="selected">Opus</option>
   <option>Key</option>
   <option>Publisher</option>
   <option>Place of Publication</option>
   <option>Country</option>
   <option>Classification</option>
   <option>Regularisation Number</option>
 </select> <a class="s01" title="Look up a search term in the thesaurus" href="#"><span>Thesaurus...</span></a> <input id="" type="text" class="f01" /> 
 <fieldset>
   <legend>Search Mode</legend> 
   <ol>
     <li class="clfx-b"><input class="f02" type="radio" name="searchMode" value="all" style="border: 0px none;" /><label for="all">All Words</label></li>
     <li class="clfx-b"><input class="f02" type="radio" name="searchMode" value="any" /><label for="any">At least one word</label></li>
     <li class="clfx-b"><input class="f02" type="radio" name="searchMode" value="exact" /><label for="exact">Exact Search</label></li>
   </ol>
 </fieldset>
    </fieldset>
    </li>
     <li class="clfx-b">
     <fieldset class="f11 n04">
  <legend>Date Selection</legend> 
 <fieldset class="s01">
    <legend>Date Mode</legend>  
 <ol>
     <li><input class="f02" type="radio" name="dateMode" value="all" style="border: 0px none;" /><label for="all">All Dates</label></li>
     <li><input class="f02" type="radio" name="dateMode" value="range" /><label for="any">Select a range</label>
 <ol>
 <li><fieldset>
   <legend>Date Range</legend>
     <label for="$select3ID" class="s01">from</label> <select id="$select3ID">
  <option selected="selected">Month...</option>
  <option>January</option>
  <option>February</option>
  <option>...</option>
    </select> <select id="$select3IDa">
   <option selected="selected">Year...</option>
    <option>1800</option>
  <option>1801</option>
    <option>...</option>
     </select> <label for="$select4ID" class="s01">to</label> <select id="$select3ID">
  <option selected="selected">Month...</option>
  <option>January</option>
  <option>February</option>
  <option>...</option>
     </select> <select id="$select3IDa">
  <option selected="selected">Year...</option>
  <option>1800</option>
  <option>1801</option>
  <option>...</option>
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
     <fieldset class="f10 n05">
  <legend>Result Sorting</legend> 
 <label for="$select3ID" class="s01">Sort results by</label> <select id="$select3ID">
   <option selected="selected">Composer</option>
   <option>Title</option>
   <option>Date</option>
   <option>Opus</option>
   <option>Key</option>
   <option>Publisher</option>
   <option>Place</option>
   <option>Country</option>
 </select> <label for="$select4ID" class="s01">then by</label> <select id="$select3IDa">
   <option>Composer</option>
   <option selected="selected">Title</option>
   <option>Date</option>
   <option>Opus</option>
   <option>Key</option>
   <option>Publisher</option>
   <option>Place</option>
   <option>Country</option>
 </select> <label for="$select4ID" class="s01">then by</label> <select id="$select4ID">
   <option>Composer</option>
   <option>Title</option>
   <option selected="selected">Date</option>
   <option>Opus</option>
   <option>Key</option>
   <option>Publisher</option>
   <option>Place</option>
   <option>Country</option>
 </select>
     </fieldset>
     </li>
     <li class="clfx-b">
     <fieldset class="f10 n06">
  <legend>Result Display</legend> 
   <label for="$select4ID" class="s01">Total results to return</label> <select id="$select4ID">
     <option value="all" selected="selected">All</option>
     <option value="250">250</option>
     <option value="500">500</option>
     <option value="1000">1000</option>
   </select> <label for="$select4ID" class="s01">Maximum results per page</label> <select id="$select4ID">
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