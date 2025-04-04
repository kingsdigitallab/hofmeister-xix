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
        <title>Basic Search</title>
        <link rel="shortcut icon" href="../i/favicon.ico" /> 
        <link rel="stylesheet" type="text/css" media="screen, projection" href="http://curlew.cch.kcl.ac.uk/hofmeister/cocoon/Assets/g/c/default.css" />
        <link rel="stylesheet" type="text/css" media="screen, projection" href="http://curlew.cch.kcl.ac.uk/hofmeister/cocoon/Assets/p/06/c/personality.css" />
        <link rel="stylesheet" type="text/css" media="print" href="http://curlew.cch.kcl.ac.uk/hofmeister/cocoon/Assets/g/c/print.css" />
    </head>
    <body id="xmd" class="v1 r3 rc0">
        <%
        DBObjectFactory dbObjects = new DBObjectFactory(session);
        dbObjects.openConnection();
        //Note - this form is meant to lock the input fields when a thesaurus value is selected.
        //Sorry but I have not had time to do this.
        %>
        
        <script language="JavaScript">
// If the session cookie contains any form settings then restore them - after the form items are first used.
// You will have to update the cookie every time they change a form element - are existing values overwritten?
// Make each cookie var unique to each form otherwise a form will get the setting from another form?

// Open thesaurus window - may need to set the window size depending on the thesaurus?
function openThesaurus(termNum, fieldNum) {
    if (fieldNum == 99 ) return;

    var xsize = 0, ysize = 400;
    var file = 'displayThesaurus.jsp?initialChs=&termNum=' + termNum + '&fieldNum=' + fieldNum;

    if (termNum == 1) { 
        document.cookie = "bsfield1=" + document.basicSearch.field1.value;
        document.basicSearch.term1.value = "";
        document.basicSearch.theskey1.value = "";
    } else {
        document.cookie= "bsfield2=" + document.basicSearch.field2.value;
        document.basicSearch.term2.value = "";
        document.basicSearch.theskey2.value = "";
    }

    // for title just update the cookie
    if (fieldNum == 0) return;

    // Use the field number to determine the size of the thesaurus window - will the CSS allow this?
    if (fieldNum == 1) {
        xsize = 550;
        ysize = 500;
    } else if (fieldNum == 2) {
        xsize = 550;
        ysize = 500;
    } else if (fieldNum == 3) {
        xsize = 450;
        ysize = 500;
    } else if (fieldNum == 4) {
        xsize = 450;
        ysize = 500;
    } else if (fieldNum == 5) {
        xsize = 400;
    } else if (fieldNum == 6) {
        xsize = 450;
        ysize = 500;
    } else if (fieldNum == 7) {
        xsize = 700;
        ysize = 500;
    } else if (fieldNum == 8) {
        xsize = 1000;
        ysize = 500;
    } else {
        xsize = 500;
    }
 
    msgWindow = open(file, 'window2', 'resizable=yes,width=' + xsize + ',height=' + ysize);
    if (msgWindow.opener == null)
        msgWindow.opener = self;
}

// Get cookie routine by Shelley Powers 
function get_cookie(Name) {
    var search = Name + "="
    var returnvalue = "";

    if (document.cookie.length > 0) {
        offset = document.cookie.indexOf(search)
        // if cookie exists
        if (offset != -1) { 
            offset += search.length;
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset);
            // set index of end of cookie value
            if (end == -1) 
                end = document.cookie.length;
            returnvalue = unescape(document.cookie.substring(offset, end));
        }
    }
    
    return returnvalue;
}

// Reset form and cookie - do not delete the cookie as it may contain information needed by other sites
function resetForm() {
    document.cookie = "bstheskey1=";
    document.cookie = "bstheskey2=";
    document.cookie = "bsfield1=99";
    document.cookie = "bsfield2=99";
    document.cookie = "bsterm1=";
    document.cookie = "bsterm2=";
    document.cookie = "bsstartYear=0000";
    document.cookie = "bsendYear=0000";
    document.basicSearch.theskey1.value = '';
    document.basicSearch.theskey2.value = '';
    document.basicSearch.field1.value = '99';
    document.basicSearch.field2.value = '99';
    document.basicSearch.term1.value = '';
    document.basicSearch.term2.value = '';
    document.basicSearch.startYear.value = '0000';
    document.basicSearch.endYear.value = '0000';
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
                <div id="decalRight">
                    <span class="printOnly">Right Hand Decal</span>
                </div>   
                <div id="decalLeft">
                    <span class="printOnly">Left Hand Decal</span>  
                </div>
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
                            
                            <!-- ## END RIGHTCONTENT, BEGIN MAINCONTENT ## -->
                        </div>
                        <div id="mainContent">
                            
                            <!-- ## PAGE HEADING ## -->
                            <div class="pageHeader">
                                <div class="t01">
                                    <h1>Basic Search</h1>
                                    <h2><!--Subheading--></h2>
                                    <p><!--Author--></p>
                                </div>
                            </div>
                            
                            <!-- ## FORM ELEMENTS: MULTI-FIELD ## -->
                            <div class="form">
                                <div class="t02">
                                    <form name="basicSearch" method="GET" action="dobasicSearch.jsp" target="" enctype="multipart/form-data">
                                        <input type="hidden" name="theskey1"/>
                                        <input type="hidden" name="theskey2"/> 
                                        
                                        <fieldset class="s01">
                                            <legend>Basic Search</legend> 
                                            <ol>
                                                <li class="clfx-b">
                                                    <fieldset class="f05 n01">
                                                        <legend>Primary Search Criteria</legend>
                                                        <label for="$select1ID">Search for:</label>
                                                        <select name="field1" onChange="openThesaurus(1, document.basicSearch.field1.value);" id="$select1ID">
                                                            <option value="99" selected> </option> 
                                                            <option value="1" >Composer</option>
                                                            <option value="0">Title</option>
                                                            <option value="2">Publisher</option>
                                                            <option value="3">Place</option>
                                                            <option value="6">Country</option>
                                                        </select> 
                                                        <input name="term1" id="$select1IDa" type="text" class="f01" onChange="document.cookie = 'bsterm1=' + document.basicSearch.term1.value"/>
                                                    </fieldset>
                                                </li>
                                                <li class="clfx-b">
                                                    <fieldset class="f05 n02">
                                                        <legend>Secondary Search Criteria</legend>
                                                        <label for="$select2ID">and</label>
                                                        <select name="field2" onChange="openThesaurus(2,document.basicSearch.field2.value);" id="$select2ID">
                                                            <option value="99" > </option> 
                                                            <option value="1" >Composer</option>
                                                            <option value="0" selected>Title</option>
                                                            <option value="2" >Publisher</option>
                                                            <option value="3" >Place</option>
                                                            <option value="6" >Country</option>
                                                        </select>
                                                        <input name="term2" id="" type="text" class="f01" onChange="document.cookie = 'bsterm2=' + document.basicSearch.term2.value"/>
                                                        <label for="$select2ID" class="s02">(optional)</label>
                                                    </fieldset>
                                                </li>
                                                <li class="clfx-b">
                                                    <fieldset class="f06 n03">
                                                        <legend>Date Range</legend> 
                                                        <label for="$select3ID" class="s01">from</label>
                                                        <select name="startYear" id="$select3ID" onChange="document.cookie = 'bsstartYear=' + document.basicSearch.startYear.value">  
                                                            <option value="0000" selected="selected">Year...</option>    
                                                            <%
                                                            // May need to adjust date range - set this dynamically ?
                                                            for (int year = 1829; year < 1901; year++) {
                                                            %> 
                                                            <option value="<%=year%>"><%=year%></option>
                                                            <%}%>
                                                        </select>
                                                        <label for="$select4ID" class="s01">to</label>
                                                        <select name="endYear" id="$select4ID" onChange="document.cookie = 'bsendYear=' + document.basicSearch.endYear.value">
                                                            <option value="0000" selected="selected">Year...</option>
                                                            <%
                                                            // May need to adjust date range - set this dynamically ?
                                                            for (int year=1829;year<1901;year++) {
                                                            %> 
                                                            <option value="<%=year%>"><%=year%></option>
                                                            <%}%>
                                                        </select>
                                                        <label for="$select2ID" class="s02">(optional)</label>
                                                    </fieldset>
                                                </li>
                                                <li class="clfx-b">
                                                    <fieldset class="f06 n04">
                                                        <legend>Submit Search</legend> 
                                                        <div>
                                                            <button type="submit">Search</button>
                                                            <input type="Button" value="Reset Form" onClick="resetForm();"> 
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
            
            <script language="JavaScript">
// Reload form settings from cookie when page is reloaded
if (get_cookie("bstheskey1") != "") 
    document.basicSearch.theskey1.value = get_cookie("bstheskey1");

if (get_cookie("bstheskey2") != "") 
    document.basicSearch.theskey2.value = get_cookie("bstheskey2");
    
if (get_cookie("bsfield1") != "")
    document.basicSearch.field1.value = get_cookie("bsfield1");
    
if (get_cookie("bsfield2") != "")
    document.basicSearch.field2.value = get_cookie("bsfield2");
    
if (get_cookie("bsterm1") != "")
    document.basicSearch.term1.value = get_cookie("bsterm1");
    
if (get_cookie("bsterm2") != "")
    document.basicSearch.term2.value = get_cookie("bsterm2");
    
if (get_cookie("bsstartYear") != "")
    document.basicSearch.startYear.value = get_cookie("bsstartYear");

if (get_cookie("bsendYear") != "")
    document.basicSearch.endYear.value = get_cookie("bsendYear");
            </script>
            
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
                        © <strong>2005</strong>  King's College London, Strand, London WC2R 2LS, England, United Kingdom. Tel +44 (0)20 7836 5454
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>