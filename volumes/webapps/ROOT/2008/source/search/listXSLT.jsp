<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="uk.ac.kcl.cch.hofmeister.*, java.util.*,java.sql.*"%>
<%@page import="javax.xml.transform.*,javax.xml.transform.stream.*,java.lang.StringBuffer.*,java.io.*"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<title>Search Results</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<link type="text/css" rel="stylesheet" href="../css/ie5win.css" />
<body>
<%
//Does a search using workKey values passed as paramenters
//Output is formatted via XSLT

DBObjectFactory dbObjects = new DBObjectFactory(session);
   dbObjects.openConnection();

//The XSL file
String xslfile = request.getParameter("xslfile");
String XSLTfile="/data/hofmeister/webapps/checking/"+xslfile;

//List of 20 Works table keys in format key1,key2,key3...
String workKeys = request.getParameter("workKeys");

int first = Integer.parseInt(request.getParameter("first"));
int last = Integer.parseInt(request.getParameter("last"));

String strPageNum="",Month="",WorkDate="",SQL="";
int Year=0,intPageNum=0;
%>
<font color="#990000" size="3"><b>Displaying from <%=first%> to <%=last%> </b></font>
<A HREF="javascript:window.history.back()"><font size="2" color="#000099">Return to search  results.</font></A></b><br/>
<%
Connection con = DBObjectFactory.getConnection();
Statement stmtWorks = con.createStatement();
ResultSet rsWorks=null;
String KeyList[]=workKeys.split(",");

//Will need to store the XML in lucene as MySQL query optimiser sorts lists of keys > 10 - a SELECT for
//each work key is very inefficient
for (int key = 0;key < KeyList.length;key++) {
SQL="SELECT Works.workXML,Works.month,Works.year,Works.pageNumber,WorkDates.workdateName,Works.pagePosition"+ 
" FROM Works,WorkDates WHERE Works.workKey ="+KeyList[key]+" AND Works.workdateKey=WorkDates.workdateKey;";

rsWorks = stmtWorks.executeQuery(SQL);
rsWorks.first();
String XMLInputStr = new String(rsWorks.getBytes(1),"UTF-8");
StringReader XMLInputSR = new StringReader(XMLInputStr);

StringWriter writer = new StringWriter();        
TransformerFactory factory = TransformerFactory.newInstance();
Transformer transformer = factory.newTransformer(new StreamSource(XSLTfile));
StreamSource xmlsource = new StreamSource (XMLInputSR);
StreamResult output=new StreamResult(writer);
transformer.transform(xmlsource,output);
StringBuffer strBuf = writer.getBuffer();

//Define page number, year and month for ONB and CCH content links
intPageNum=rsWorks.getInt(4);
Year=rsWorks.getInt(3);
WorkDate = new String(rsWorks.getBytes(5),"UTF-8");

strPageNum="00000000"+intPageNum;
strPageNum=strPageNum.substring(strPageNum.length()-8,strPageNum.length());
Month="0"+rsWorks.getInt(2);
Month=Month.substring(Month.length()-2,Month.length());

%> 
<font size="2" color="#000000"><%=strBuf.toString()%></font>
<font size="2" color="#990000"><%=WorkDate%>&nbsp;Page&nbsp;<%=intPageNum%>&nbsp;</font>
<a href="http://anno.onb.ac.at/cgi-content/anno-buch?apm=0&aid=1000001&bd=000<%=Year%>&teil=0203&seite=<%=strPageNum%>&zoom=5" target="_blank">
<font size="2" color="#000099">View ONB Page</font></a>&nbsp;
<a href="PageXSLT.jsp?year=<%=Year%>&amp;month=<%=Month%>&amp;pageNumber=<%=intPageNum%>&amp;pagePosition=<%=rsWorks.getInt(6)%>" target="_blank">
<font size="2" color="#000099">View Content Page</font></a><br/><br/>
<%}%>

<A HREF="javascript:window.history.back()"><font size="2" color="#000099">Return to search  results.</font></A></b><br/>

<%rsWorks.close();
stmtWorks.close();
DBObjectFactory.returnConnection(con);
dbObjects.closeConnection();
%>
</body>
</html>