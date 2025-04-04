<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="uk.ac.kcl.cch.hofmeister.*, uk.ac.kcl.cch.HtmlDb.*,java.lang.*,java.util.*,java.sql.*,java.text.*"%>
<%
//Create connection
DBObjectFactory dbObjects = new DBObjectFactory(session);
dbObjects.openConnection();

//Variable definitions
DateFormat df = DateFormat.getDateInstance(DateFormat.LONG, Locale.UK);
Statement stmt = null, stmtUniq = null, stmtThes = null;
ResultSet rs = null, rsUniq = null, rsThes = null;
Connection con = DBObjectFactory.getConnection();
String uniq = "";
String thes = "";

//Array of XML element names
String Elements[] = new String [] {
    "album", "artist", "author", "bibl", "composer", "edition", "format", "key",
    "opus", "pb", "publisher", "pubPlace", "regNumber", "subject", "title", "wip", "hofclass"
};

//Array of MySQL field names that store the count of each element
String DBFields[] = new String [] {
    "album", "artist", "author", "bibl", "composer", "edition", "format", "musickey",
    "opus", "pb", "publisher", "pubplace", "regnumber", "subject", "title", "wip", "hofclass"
};

//Elements that have a unique count
String Uniques[] = new String [] {
    "", "artist", "author", "", "composer", "edition",
    "format", "key", "opus", "", "publisher", "pubPlace", "regNumber", "subject", "", "", ""
};

//Thesaurus elements
String thesaurus[] = new String [] {
    "", "", "", "", "TSComposers", "",
    "", "TSMusicKeys", "TSOpus", "", "TSPublishers", "TSPubPlaces", "TSRegisNum", "", "", "", "TSHofClasses"
};


//Collect the total counts for each element
stmt = con.createStatement();
rs = stmt.executeQuery("SELECT * FROM Stats;");

if (!rs.first()) {
%>
<statistics>
    <error>No data in DB Stats table</error>
</statistics>
<% 
return;
}

//For each field display the element name and the corresponding counts
%>
<statistics>
    <%
    stmtUniq = con.createStatement();
    stmtThes = con.createStatement();
    
    for (int idx = 0; idx < DBFields.length; idx++) {
   		uniq = "-";
      thes = "-";
      
      if (Elements[idx].equals(Uniques[idx])) {
        rsUniq = stmtUniq.executeQuery("SELECT COUNT(*) FROM Uniq_" +
      			Elements[idx] + ";");

          if (rsUniq != null && rsUniq.first()) {
	          uniq = "" + rsUniq.getInt(1);
	        }
      }
        
      if (!thesaurus[idx].equals("")) {
	    	rsThes = stmtThes.executeQuery("SELECT COUNT(*) FROM " +
  		  		thesaurus[idx] + " WHERE xmlKey != ''");
            			
        if (rsThes != null && rsThes.first()) {
        	thes = "" + rsThes.getInt(1);
        }
      }
    %>
    <item name="<%=Elements[idx]%>" total="<%=rs.getInt(DBFields[idx])%>" unique="<%=uniq%>" thesaurus="<%=thes%>" />
    <%
    }
    
    rsThes = stmtThes.executeQuery("SELECT COUNT(*) FROM Countries WHERE countryCode != ''");
    
    if (rsThes != null && rsThes.first()) {
	   	thes = "" + rsThes.getInt(1);
    }
    %>
    <item name="countries" total="NA" unique="NA" thesaurus="<%=thes%>" />
</statistics>
<%
// Close connections
rs.close();
rsUniq.close();
rsThes.close();

stmt.close();
stmtUniq.close();
stmtThes.close();

DBObjectFactory.returnConnection(con);
dbObjects.closeConnection();
%>
