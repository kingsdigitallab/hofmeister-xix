<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="uk.ac.kcl.cch.hofmeister.*, uk.ac.kcl.cch.HtmlDb.*, java.util.*, java.sql.*"%>
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
        <link rel="stylesheet" type="text/css" media="screen, projection" href="../../../g/c/default_uncompressed.css" />
        <link rel="stylesheet" type="text/css" media="screen, projection" href="../c/personality.css" />
        <link rel="stylesheet" type="text/css" media="print" href="../../../g/c/print.css" />
        <!--[if LTE IE 6]>
 <link rel="stylesheet" type="text/css" href="../c/compat.css" />
 <![endif]--> 
        <!--[if GTE IE 7]>
 <link rel="stylesheet" type="text/css" href="../c/compat.css" />
 <![endif]-->  
    </head>
    <body id="xmd" class="v1 r3 pu">
        <script language="JavaScript">
// Needs a parameter to add the value to the correct term field
// Need to be able to add multiple selections
function addTerms(termNum) {
    var start = document.ThesaurusForm.$select3ID.selectedIndex;
    var end = document.ThesaurusForm.$select3ID.length;
    var termObj = new Object();
    var thesObj = new Object();
    var termvalue, theskey;

    switch (termNum) { 
        case 1:
            termObj = window.opener.document.basicSearch.term1;
            thesObj = window.opener.document.basicSearch.theskey1;
            break;

        case 2:
            termObj = opener.document.basicSearch.term2;
            thesObj = opener.document.basicSearch.theskey2;
            break;

        case 3:
            termObj = opener.document.basicSearch.term3;
            thesObj = opener.document.basicSearch.theskey3;
            break;
    }

    for (var i = start; i < end; i++) {
        if (document.ThesaurusForm.$select3ID.options[i].selected) {
            termvalue = document.ThesaurusForm.$select3ID.options[i].text;
            termObj.value = termObj.value + termvalue + " " ;
            theskey = document.ThesaurusForm.$select3ID.options[i].value;
            thesObj.value = thesObj.value + theskey + " " ;
        }
    }

    switch (termNum) { 
        case 1:
            opener.document.cookie = "bsterm1=" + termObj.value;
            opener.document.cookie = "bstheskey1=" + thesObj.value;
            break;

        case 2:
            opener.document.cookie = "bsterm2=" + termObj.value;
            opener.document.cookie = "bstheskey2=" + thesObj.value;
            break;

        case 3:
            opener.document.cookie = "xxterm1=" + termObj.value;
            opener.document.cookie = "xxtheskey1=" + thesObj.value;
            break;
    }
}
        </script>
        
        <%
        DBObjectFactory dbObjects = new DBObjectFactory(session);
        dbObjects.openConnection();
        
        int fieldNum = Integer.parseInt(request.getParameter("fieldNum"));
        int termNum = Integer.parseInt(request.getParameter("termNum"));
        
        String initialChs="";
        String isoInitials = request.getParameter("initialChs").trim();
        
        if (isoInitials == null) {
            initialChs="";
        } else {
            initialChs = new String(isoInitials.getBytes("ISO-8859-1"),"UTF-8");
        }
        
        // For composer display all those starting with A if nothing else is specified
        if (fieldNum == COMPOSER && initialChs.equals("")) {
            initialChs = "A";
        }
        
        String SQL = "", winTitle = "";
        
        switch (fieldNum) {
            case COMPOSER:
                SQL = "SELECT TSComposers.xmlKey,TSComposers.tscomposerName FROM TSComposers WHERE TSComposers.tscomposerName LIKE '"+initialChs+"%' AND TSComposers.tscomposerKey > 1 ORDER BY TSComposers.tscomposerSORT;";
                winTitle = "Composer";
                break;
            case PUBLISHER:
                SQL = "SELECT TSPublishers.xmlKey,TSPublishers.tspublisherName FROM TSPublishers WHERE TSPublishers.tspublisherName LIKE '"+initialChs+"%' AND TSPublishers.tspublisherKey > 1 ORDER BY TSPublishers.tspublisherSort;";
                winTitle = "Publisher";
                break;
            case PUBPLACE:
                SQL = "SELECT TSPubPlaces.xmlKey,TSPubPlaces.tspubplaceName FROM TSPubPlaces WHERE TSPubPlaces.tspubplaceName LIKE '"+initialChs+"%' AND TSPubPlaces.tspubplaceKey > 1  ORDER BY TSPubPlaces.tspubplaceSort;";
                winTitle = "Publication Place";
                break;
            case KEY:
                SQL = "SELECT TSMusicKeys.tsmusickeyKey,TSMusicKeys.tsmusickeyName FROM TSMusicKeys ORDER BY TSMusicKeys.tsmusickeySort;";
                winTitle = "Key";
                break;
            case OPUS:
                SQL = "SELECT TSOpus.tsopusKey,TSOpus.tsopusName FROM TSOpus ORDER BY TSOpus.tsopusSort;";
                winTitle = "Opus";
                break;
            case COUNTRY:
                SQL = "SELECT Countries.countryCode,Countries.countryName FROM Countries WHERE Countries.countryName LIKE '"+initialChs+"%' AND Countries.countryKey > 1 ORDER BY Countries.countryName;";
                winTitle = "Country";
                break;
            case CLASS:
                SQL = "SELECT TSHofClasses.xmlKey,TSHofClasses.tshofclassName FROM TSHofClasses WHERE TSHofClasses.tshofclassName LIKE '"+initialChs+"%' AND TSHofClasses.tshofclassKey > 1 ORDER BY TSHofClasses.tshofclassSort;";
                winTitle = "Class";
                break;
                
            default:
                System.out.println("Invalid field number="+fieldNum+" in displayThesaurus.jsp switch statement");
                break;
        }
        %>
        
        <div id="wrapper">
            <div id="mainContent">
                <!-- ## FORM ELEMENTS: MULTI-FIELD ## -->
                <div class="form">
                    <div class="t04">
                        <!--form name="ThesaurusForm" method="GET"-->
                        <fieldset class="s02">
                            <legend><%=winTitle%>&nbsp;Thesaurus</legend> 
                            <ol>
                                <li class="clfx-b">
                                    <fieldset class="f05 n01">
                                        <legend>Alphabetical Index</legend>
                                        <div class="alphaNav">
                                            <div class="t01">
                                                <ul>
                                                    <li><a href="displayThesaurus.jsp?initialChs=A&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">A</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=B&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">B</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=C&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">C</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=D&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">D</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=E&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">E</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=F&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">F</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=G&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">G</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=H&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">H</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=I&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">I</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=J&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">J</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=K&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">K</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=L&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">L</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=M&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">M</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=N&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">N</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=O&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">O</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=P&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">P</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=Q&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">Q</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=R&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">R</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=S&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">S</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=T&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">T</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=U&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">U</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=V&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">V</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=W&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">W</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=X&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">X</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=Y&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">Y</a></li>
                                                    <li><a href="displayThesaurus.jsp?initialChs=Z&amp;termNum=<%=termNum%>&amp;fieldNum=<%=fieldNum%>" target="_top">Z</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </fieldset>
                                </li>
                                <li class="clfx-b">
                                    <fieldset class="f05 n02">
                                        <legend>Partial Match</legend>
                                        
                                        <label for="$select2ID">Starting with:</label> 
                                        
                                        <input type="hidden" name="fieldNum" value="<%=fieldNum%>" size="20"/>
                                        <input type="hidden" name="termNum" value="<%=termNum%>" size="20"/>
                                        <input  name="initialChs" type="text" class="f01"/>
                                        <button type="submit">View</button>
                                        
                                        
                                        
                                    </fieldset>
                                </li>
                                <li class="clfx-b">
                                    <fieldset class="f06 n03">
                                        <legend>Date Range</legend> 
                                        <select multiple="multiple" class="f03" id="$select3ID">
                                        <%
                                        Connection con = DBObjectFactory.getConnection();
                                        Statement stmtThesaurus = con.createStatement();
                                        ResultSet rsThesaurus = stmtThesaurus.executeQuery(SQL);
                                        %>    
                                        <select multiple="multiple" class="f03" id="$select3ID">
                                            <%
                                            while (rsThesaurus.next()) {
                                            DBString FullTerm = new DBString(rsThesaurus.getBytes(2),"UTF-8");
                                            DBString xmlTerm = new DBString(rsThesaurus.getBytes(1),"UTF-8");
                                            %>
                                            <option value='<%=xmlTerm.getHTMLString()%>'><%=FullTerm.getHTMLString()%></option>
                                            <%
                                            }
                                        if (!rsThesaurus.first()) {
                                            %>
                                            <option>No Terms Found</option>
                                            <%
                                            }
                                        rsThesaurus.close();
                                        stmtThesaurus.close();
                                        DBObjectFactory.returnConnection(con);
                                        dbObjects.closeConnection();
                                            %>
                                        </select>
                                    </fieldset>
                                </li>
                                <li class="clfx-b">
                                    <fieldset class="f06 n04">
                                        <legend>Submit Search</legend> 
                                        <div>
                                            <button onclick="addTerms(<%=termNum%>);">Insert</button>
                                            <button type="reset">Reset</button>
                                            <button type="" onclick="javascript:window.close();">Close</button>
                                        </div>
                                    </fieldset>
                                </li>   
                            </ol>
                        </fieldset>
                        <!--/form-->
                    </div>
                </div>
                
            </div>
        </div>
    </body>
</html>