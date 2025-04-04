<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="uk.ac.kcl.cch.hofmeister.*, uk.ac.kcl.cch.HtmlDb.*, java.util.*, java.sql.*, java.util.regex.*"%>
<%@page import="org.apache.lucene.search.*, org.apache.lucene.queryParser.*, org.apache.lucene.index.*, org.apache.lucene.search.*, org.apache.lucene.analysis.*"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="hofConstants.jsp"%>
<%
DBObjectFactory dbObjects = new DBObjectFactory(session);
dbObjects.openConnection();

//Collect parameters
String isoterm1 = request.getParameter("term1").trim();
String term1 = new String(isoterm1.getBytes("ISO-8859-1"),"UTF-8");
String isoterm2 = request.getParameter("term2").trim();
String term2 = new String(isoterm2.getBytes("ISO-8859-1"),"UTF-8");
String theskey1 = request.getParameter("theskey1").trim();
String theskey2 = request.getParameter("theskey2").trim();

String startYear = new String(request.getParameter("startYear"));
String endYear = new String(request.getParameter("endYear"));
String startMonth= "01";
String endMonth= "12";

int field1 = Integer.parseInt(request.getParameter("field1"));
int field2 = Integer.parseInt(request.getParameter("field2"));

// Return if there is nothing to process
if (theskey1.equals("") && theskey2.equals("") && term1.equals("") && term2.equals("") && startYear.equals("0000") && endYear.equals("0000")) {
    return;
}

int maxResults = 5000;

String indexDir = "/data/hofmeister/lucene/hofDB";
PublicForms pfMethods = dbObjects.makePublicForms();
RangeQuery rquery=null;
BooleanQuery mainQry = new BooleanQuery();
BooleanQuery bsubQry = new BooleanQuery();
IndexSearcher searcher = new IndexSearcher(indexDir);
Analyzer analyzer = new WhitespaceAnalyzer();

Connection con = DBObjectFactory.getConnection();
Statement stmt = con.createStatement();
ResultSet rs=null;
String SQL = "";

// Need to check all terms - some will be empty ? no need to check thesaurus terms ?

// Use default sort on date for this form
Sort sort=pfMethods.getSort("date","","");

//Add the search terms to mainQry - thesaurus searches get priority
if (!theskey1.equals("")) {
    bsubQry=pfMethods.textQry(pfMethods.thesField(field1),theskey1,AtLeastOneWord); //Should this be AllWords
    mainQry.add(bsubQry,BooleanClause.Occur.MUST);
} else if (!term1.equals("")) {
    term1=pfMethods.makeTerm(term1);
    bsubQry=pfMethods.textQry(pfMethods.textField(field1),term1,AllWords);
    mainQry.add(bsubQry,BooleanClause.Occur.MUST);
}

if (!theskey2.equals("")) {
    bsubQry=pfMethods.textQry(pfMethods.thesField(field2),theskey2,AtLeastOneWord); //Should this be AllWords
    mainQry.add(bsubQry,BooleanClause.Occur.MUST);
} else if (!term2.equals("")) {
    term1=pfMethods.makeTerm(term2);
    bsubQry=pfMethods.textQry(pfMethods.textField(field2),term2,AllWords);
    mainQry.add(bsubQry,BooleanClause.Occur.MUST);
}

//Process dates and add to mainQry
if (!startYear.equals("0000") || !endYear.equals("0000")) {
    rquery=pfMethods.getDateRange(startMonth, startYear, endMonth,endYear);
    mainQry.add(rquery, BooleanClause.Occur.MUST);
}

// Run the Lucene search
Hits hits = searcher.search(mainQry,sort);
// System.out.println("Hofmeister lucene query="+mainQry.toString()+" Sort Keys="+sort+" Hits length="+hits.length());

int numberOfHits = 0;

// Review number of hits
if (hits.length() > 0) {
    numberOfHits = hits.length();
}

%>
<search-results>
    <hits><%=numberOfHits%></hits>
    <%
    for (int key=0; key < hits.length(); key++) {
    SQL="SELECT Works.workXML,Works.month,Works.year,Works.pageNumber,WorkDates.workdateName,Works.pagePosition"+
            " FROM Works,WorkDates WHERE Works.workKey ="+hits.doc(key).get("workKey")+" AND Works.workdateKey=WorkDates.workdateKey;";
    rs = stmt.executeQuery(SQL);
    rs.first();
    String XMLRecord = new String(rs.getBytes(1),"UTF-8") + "<date>" + new String(rs.getBytes("workdateName"),"UTF-8") + "</date>";
    %>
    <%=XMLRecord%>
    <%
    }
    %>
</search-results>
<%
stmt.close();
DBObjectFactory.returnConnection(con);
dbObjects.closeConnection();%>
