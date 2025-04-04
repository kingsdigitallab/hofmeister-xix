<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="uk.ac.kcl.cch.hofmeister.*, uk.ac.kcl.cch.HtmlDb.*, java.util.*, java.sql.*, java.util.regex.*"%>
<%@page import="org.apache.lucene.search.*, org.apache.lucene.queryParser.*, org.apache.lucene.index.*, org.apache.lucene.search.*, org.apache.lucene.analysis.*"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="hofConstants.jsp"%>
<html>
<head>
<title>Search Results</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<%
DBObjectFactory dbObjects = new DBObjectFactory(session);
 dbObjects.openConnection();

//Collect parameters - see rest of form
String isoterm1 = request.getParameter("term1").trim();
String term1 = new String(isoterm1.getBytes("ISO-8859-1"),"UTF-8");

String startYear = new String(request.getParameter("startYear"));
String endYear = new String(request.getParameter("endYear"));
String startMonth = new String(request.getParameter("startMonth"));
String endMonth = new String(request.getParameter("endMonth"));

int searchMode = Integer.parseInt(request.getParameter("searchMode"));
int maxResults = Integer.parseInt(request.getParameter("maxResults"));
int resperPage = Integer.parseInt(request.getParameter("resperPage"));

String sortKey1 = new String(request.getParameter("sortKey1"));
String sortKey2 = new String(request.getParameter("sortKey2"));
String sortKey3 = new String(request.getParameter("sortKey3"));

//Return if there is nothing to process
if (term1.equals("")) return;

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
String SQL="",heading="";

//Need to check input term - minimal parsing used for testing
term1=pfMethods.makeTerm(term1);

//Process sort keys
Sort sort=pfMethods.getSort(sortKey1,sortKey2,sortKey3);

//Add the search terms to mainQry
bsubQry=pfMethods.freeTextSearch(term1,searchMode);
mainQry.add(bsubQry,BooleanClause.Occur.MUST);

//Process dates and add to mainQry
if (!startYear.equals("0000") || !endYear.equals("0000")) {
rquery=pfMethods.getDateRange(startMonth, startYear, endMonth,endYear);
mainQry.add(rquery, BooleanClause.Occur.MUST);
}

//Run the Lucene search 
Hits hits = searcher.search(mainQry,sort);
//System.out.println("Hofmeister lucene query="+mainQry.toString()+" Sort Keys="+sort);

//Review number of hits
if (hits.length() == 0)
    {heading="No records found";}
else if (hits.length() <= maxResults)
    {heading="Found "+ hits.length()+" record(s)";}
else {heading="More than "+maxResults+" items found ("+hits.length()+")";}

%><plaintext><body><heading><%=heading%></heading><%

for (int key=0; key < hits.length(); key++) {
SQL="SELECT Works.workXML,Works.month,Works.year,Works.pageNumber,WorkDates.workdateName,Works.pagePosition"+
 " FROM Works,WorkDates WHERE Works.workKey ="+hits.doc(key).get("workKey")+" AND Works.workdateKey=WorkDates.workdateKey;";
rs = stmt.executeQuery(SQL);
rs.first();
String XMLRecord = new String(rs.getBytes(1),"UTF-8") + "<date>" + new String(rs.getBytes("workdateName"),"UTF-8") + "</date>";
%>
<%=XMLRecord%>
<%}

if (rs != null ) rs.close();
stmt.close();
DBObjectFactory.returnConnection(con);
dbObjects.closeConnection();%>
</body>
</plaintext>
</body>
</html>



