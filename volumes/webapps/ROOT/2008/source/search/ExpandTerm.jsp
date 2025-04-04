<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="uk.ac.kcl.cch.hofmeister.*, uk.ac.kcl.cch.HtmlDb.*, java.util.*, java.sql.*, java.util.regex.*"%>
<%@page import="org.apache.lucene.search.*, org.apache.lucene.queryParser.*, org.apache.lucene.index.*, org.apache.lucene.search.*, org.apache.lucene.analysis.*"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<%

DBObjectFactory dbObjects = new DBObjectFactory(session);
 dbObjects.openConnection();
 if(dbObjects.getConnType() != DBObjectFactory.ACCOUNT) {
	pageContext.forward("../needlogin.html");
return;}

//It is the xmlKey value that is passed in NOT the actual term
String expandterm = request.getParameter("expandterm");
if (expandterm == null) expandterm="";
int fieldnumber = Integer.parseInt(request.getParameter("fieldnumber"));
String lucQuery="";%>

<title>Thesaurus Term Expansion</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%

//For the selected field define the SQL to expand the term
String SQL="";
switch (fieldnumber) {
case 1:
    SQL="SELECT Composers.composerKey,Composers.composerDisplay,count(WorksComposersLink.composerKey) FROM WorksComposersLink,Composers WHERE WorksComposersLink.composerKey=Composers.composerKey AND Composers.composerKey > 1 GROUP BY WorksComposersLink.composerKey ORDER BY Composers.composerSearch;";
    break;
case 2:
    SQL="SELECT TSPublishers.xmlKey,TSPublishers.tspublisherName FROM TSPublishers WHERE TSPublishers.xmlKey LIKE '"+expandterm+"%' AND TSPublishers.tspublisherKey > 1 ORDER BY TSPublishers.tspublisherName;";
break;
case 3:
    SQL="SELECT TSPubPlaces.xmlKey,TSPubPlaces.tspubplaceName FROM TSPubPlaces WHERE TSPubPlaces.xmlKey LIKE '"+expandterm+"%' AND TSPubPlaces.tspubplaceKey > 1  ORDER BY TSPubPlaces.tspubplaceName;";
    break;
case 4:
    SQL="SELECT MusicKeys.musicKey,MusicKeys.musickeyDisplay,count(WorksMusicKeysLink.musicKey) FROM WorksMusicKeysLink,MusicKeys WHERE WorksMusicKeysLink.musicKey=MusicKeys.musicKey AND MusicKeys.musicKey > 1 GROUP BY WorksMusicKeysLink.musicKey ORDER BY MusicKeys.musickeySearch;";
    break;
case 5:
    SQL="SELECT Opus.opusKey,Opus.opusDisplay,count(WorksOpusLink.opusKey) FROM WorksOpusLink,Opus WHERE WorksOpusLink.opusKey=Opus.opusKey AND Opus.opusKey > 1 GROUP BY WorksOpusLink.opusKey ORDER BY Opus.opusSearch;";
    break;
case 6:
    SQL="SELECT Countries.countryCode,Countries.countryName FROM Countries WHERE Countries.countryKey > 1 ORDER BY Countries.countryName;";
    break;
case 7:
    SQL="SELECT TSHofClasses.xmlKey,TSHofClasses.tshofclassName FROM TSHofClasses WHERE TSHofClasses.tshofclassKey > 1 ORDER BY TSHofClasses.tshofclassName;";
    break;
default:System.out.println("Invalid field number="+fieldnumber+" in DisplayThesaurus.jsp switch statement"); break;
}

String indexDir = "/data/hofmeister/lucene/hofDB";

IndexSearcher searcher = new IndexSearcher(indexDir);
Analyzer analyzer = new WhitespaceAnalyzer();
        
QueryParser parser = new QueryParser("title",analyzer);
Query query = parser.parse(lucQuery);
Hits hits = searcher.search(query,sort);

%>    
<form>
<select multiple size="20" name="Terms">
<%while (rsThesaurus.next()) {
DBString FullTerm = new DBString(rsThesaurus.getBytes(2),"UTF-8");
%>
<option value="<%=rsThesaurus.getString(1)%>"><%=FullTerm.getHTMLString()%></option>
<%}
if (!rsThesaurus.first()) {%><option>No Terms Found</option><%}
rsThesaurus.close();
stmtThesaurus.close();
DBObjectFactory.returnConnection(con);
dbObjects.closeConnection();
%>
</select>

</form>

</body>
</html>
