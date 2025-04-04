<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="uk.ac.kcl.cch.hofmeister.*, java.util.*,java.sql.*, java.util.regex.*"%>
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
//Displays a page of the XML by reading the records for the page from the MySQL DB
//Output is formatted via XSLT

DBObjectFactory dbObjects = new DBObjectFactory(session);
   dbObjects.openConnection();

//The XSL file
String XSLTfile="/data/hofmeister/webapps/checking/displaypage.xsl";

int year = Integer.parseInt(request.getParameter("year"));
int month = Integer.parseInt(request.getParameter("month"));
int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
int hitPosition = Integer.parseInt(request.getParameter("pagePosition"));

String SQL="",WorkDate="",pageBreak="<pb +n=",tempStr="",pbXML="<pb/>";
String XMLInputStr="";
Matcher matcher;

Connection con = DBObjectFactory.getConnection();
Statement stmtPage = con.createStatement(),stmtHead = con.createStatement(),stmtTail = con.createStatement();
ResultSet rsPage=null,rsHead=null,rsTail=null;

//Get all the works on this page - return if nothing is found
SQL="SELECT Works.workXML,WorkDates.workdateName,Works.pagePosition FROM Works,WorkDates"+
" WHERE Works.workdateKey=WorkDates.workdateKey AND year ="+year+" AND month="+month+" AND pageNumber="+pageNumber+" ORDER BY pagePosition;";
rsPage = stmtPage.executeQuery(SQL);
if (!rsPage.first())  {%>
<br/>
<font size="4" color="#990000">No data found for Year=<%=year%> Month=<%=month%> Page=<%=pageNumber%>.</font><br/>
<font size="4" color="#990000">Please report this error.</font><br/>
<%
return;
} else { WorkDate = new String(rsPage.getBytes(2),"UTF-8");}

//Get the previous and next pages as we need to display the end of the previous page and the
//start of the next page
SQL="SELECT Works.workXML FROM Works"+
" WHERE year ="+year+" AND month="+month+" AND pageNumber="+(pageNumber-1)+" ORDER BY pagePosition;";
rsHead = stmtHead.executeQuery(SQL);

SQL="SELECT Works.workXML FROM Works"+
" WHERE year ="+year+" AND month="+month+" AND pageNumber="+(pageNumber+1)+" ORDER BY pagePosition;";
rsTail = stmtTail.executeQuery(SQL);

//Process page break for start of main page ...
XMLInputStr = new String(rsPage.getBytes(1),"UTF-8");
if (hitPosition == 0) XMLInputStr="<hit>" + XMLInputStr + "</hit>";
matcher= Pattern.compile(pageBreak).matcher(XMLInputStr);
if (matcher.find()) {XMLInputStr= "<body>" +  XMLInputStr;} //pb in first rec of page
else {
if (rsHead.last()) {
tempStr=new String(rsHead.getBytes(1),"UTF-8");
matcher= Pattern.compile(pageBreak).matcher(tempStr);
if (matcher.find()) {
 XMLInputStr = "<body>" + tempStr + XMLInputStr;//pb in last rec of previous page
} else {XMLInputStr = "<body>" + pbXML + XMLInputStr;} //no pb in last rec of previous page
}
else {XMLInputStr = "<body>" + pbXML + XMLInputStr;}// no pb in first rec and no previous page
}

//Add the XML for the main display page to XMLInputStr - if the page position is the same as 
//retrieved record then add a hit tag to highlight it.
while (rsPage.next()) {
if (hitPosition == rsPage.getInt(3)) {
XMLInputStr = XMLInputStr + "<hit>" + new String(rsPage.getBytes(1),"UTF-8") + "</hit>";
} else {XMLInputStr = XMLInputStr + new String(rsPage.getBytes(1),"UTF-8");}
}

//Process page break for end of main page ...
rsPage.last();
tempStr=new String(rsPage.getBytes(1),"UTF-8");
matcher= Pattern.compile(pageBreak).matcher(tempStr);
if (matcher.find()) {XMLInputStr=XMLInputStr + "</body>";}
else {
if (rsTail.first()) {
tempStr=new String(rsTail.getBytes(1),"UTF-8");
matcher= Pattern.compile(pageBreak).matcher(tempStr);
if (matcher.find()) {
 XMLInputStr = XMLInputStr + tempStr + "</body>";//pb in first rec of next page
} else {XMLInputStr = XMLInputStr + pbXML + "</body>";} //no pb in first rec of next page
}
else {XMLInputStr = XMLInputStr + pbXML + "</body>";}// no pb in next rec and no next page
}

//Apply the stylesheet to the XML in XMLInputStr
StringReader XMLInputSR = new StringReader(XMLInputStr);
StringWriter writer = new StringWriter();        
TransformerFactory factory = TransformerFactory.newInstance();
Transformer transformer = factory.newTransformer(new StreamSource(XSLTfile));
StreamSource xmlsource = new StreamSource (XMLInputSR);
StreamResult output=new StreamResult(writer);
transformer.transform(xmlsource,output);
StringBuffer strBuf = writer.getBuffer();

%> 
<font size="4" color="#990000"><%=WorkDate%> Page <%=pageNumber%></font><br/>
<font size="3" color="#000000"><%=strBuf.toString()%></font><br/>

<%rsPage.close();stmtPage.close();
rsHead.close();stmtHead.close();
rsTail.close();stmtTail.close();
DBObjectFactory.returnConnection(con);
dbObjects.closeConnection();
%>
</body>
</html>