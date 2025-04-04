<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="uk.ac.kcl.cch.hofmeister.*, uk.ac.kcl.cch.HtmlDb.*, java.util.*, java.sql.*, java.util.regex.*"%>
<%@page import="org.apache.lucene.search.*, org.apache.lucene.queryParser.*, org.apache.lucene.index.*, org.apache.lucene.search.*, org.apache.lucene.analysis.*"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="hofConstants.jsp"%>
<%
// Called to generate hofmeister index pages
DBObjectFactory dbObjects = new DBObjectFactory(session);
dbObjects.openConnection();

// Collect parameter - note that the codes are case sensitive
String id = request.getParameter("id").trim();
if (id == null || id.length() == 0) {
%>
<index>
    <error>Id is 0 length or null</error>
</index>
<%
return;
}

Matcher matcher;

String indexDir = "/data/hofmeister/lucene/hofDB";
PublicForms pfMethods = dbObjects.makePublicForms();
RangeQuery rquery = null;
BooleanQuery mainQry = new BooleanQuery();
IndexSearcher searcher = new IndexSearcher(indexDir);
Analyzer analyzer = new WhitespaceAnalyzer();

Connection con = DBObjectFactory.getConnection();
Statement stmt = con.createStatement();
ResultSet rs = null;

matcher = Pattern.compile("[0-9]").matcher(id);
String code = matcher.replaceAll("");
String fieldName="",heading="",SQL="";


// Based on the code part of the id set the lucene fieldname and the
// SQL to find the regularised thesaurus name
if (code.equals("publ_")) {
    fieldName = "publisherKey";
    SQL = "SELECT tspublisherName as heading FROM TSPublishers WHERE xmlKey like '" + id + "';";
} else if (code.equals("place_")) {
    fieldName = "pubPlaceKey";
    SQL = "SELECT tspubplaceName as heading FROM TSPubPlaces WHERE xmlKey like '" + id + "';";
} else if (code.equals("compo_")) {
    fieldName = "composerKey";
    SQL = "SELECT tscomposerName as heading FROM TSComposers WHERE xmlKey like '" + id + "';";
} else if (code.equals("hofCl_")) {
    fieldName = "hofclassKey";
    SQL = "SELECT tshofclassName as heading FROM TSHofClasses WHERE xmlKey like '" + id + "';";
} else if (Pattern.matches("[A-Z][A-Z]",code)) {
    fieldName = "countryKey";
    SQL = "SELECT countryName as heading FROM Countries WHERE countryCode like '" + id + "';";
} else {
%>
<index>
    <error>Invalid id</error>
</index>
<%
return;
}

// Get the heading
rs = stmt.executeQuery(SQL);
if (!rs.first()) {
%>
<index>
    <error>Cannot find heading</error>
</index>
<%
return;
}

// TODO: Remove heading from the results
heading = new String(rs.getBytes(1),"UTF-8");

// Use default sort on date for this form
Sort sort = pfMethods.getSort("date", "", "");

// Add the search terms to mainQry
mainQry.add(pfMethods.textQry(fieldName,id,3), BooleanClause.Occur.MUST);

// Run the Lucene search
Hits hits = searcher.search(mainQry,sort);
// System.out.println("Hofmeister lucene query= " + mainQry.toString() + " Sort Keys= " + sort);

// Review number of hits
if (hits.length() == 0) {
%>
<index>
    <error>No records found</error>
</index>
<%
return;
}
%>
<index>
    <%
    for (int key=0; key < hits.length(); key++) {
    SQL = "SELECT w.workXML, w.month, w.year, w.pageNumber, wd.workdateName, w.pagePosition " +
            "FROM Works w, WorkDates wd WHERE w.workKey = " +
            hits.doc(key).get("workKey") +
            " AND w.workdateKey = wd.workdateKey;";
    
    rs = stmt.executeQuery(SQL);
    rs.first();
    String XMLRecord = new String(rs.getBytes(1), "UTF-8") +
            "<date>" +
            new String(rs.getBytes("workdateName"), "UTF-8") +
            "</date>";
    %>
    <%=XMLRecord%>
    <%
    }

rs.close();
stmt.close();
DBObjectFactory.returnConnection(con);
dbObjects.closeConnection();
    %>
</index>