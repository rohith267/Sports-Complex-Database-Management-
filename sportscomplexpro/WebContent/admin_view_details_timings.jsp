<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table{
		font-size: 200%;
	}
	table,tr,th,td{
		
		border-color: darkblue;
		border-style: double;
		border-collapse: collapse;
	}
	td{
	color: purple;
	}
</style>
</head>
<body>
<%

String name=request.getParameter("uname");
String pass=request.getParameter("psw");
try{
    Connection con=null;
    ResultSet res=null;
    String url1 = "jdbc:mysql://localhost:3306/sportscomplex"; 
    String user = "root";
    String password = "hitpassword";
    
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sportscomplex","root","hitpassword");
    Statement myStmt=con.createStatement();
    Statement myStmt1=con.createStatement();
    Statement myStmt2=con.createStatement();
    Statement myStmt3=con.createStatement();
    Statement myStmt4=con.createStatement();
    res=myStmt.executeQuery("SELECT COUNT(username) FROM ADMINS WHERE username='"+name+"'and password='"+pass+"'");
    ResultSetMetaData metadata=res.getMetaData();
    int columnCount=metadata.getColumnCount();
    
    int count=0;
   while(res.next())
    {
      int i=1;  
     count=res.getInt(i);
    }  
//    out.println();
//    while(!res.next())
//    {
//     out.println("Hi<br/>");
//    }
    if(count==0)
    {  
       out.println("<br/><h3 style='color: red'>Wrong username/password </h3>");    
    } 
    
    else {
   // out.println("Welcome: "+name+" ");
    
    //out.println("<center><h2 style='color: green'>You have successfully logged into your account</h2></center>");
    //out.println("<a href='reset_password.jsp'")
    //out.println("<center><a href='SAMPLE.html'><button>LOGOUT</button></a><br><center>");
    out.println("<center><h3 style='color: blue'>The timing details are:</h3></center>");
    int batch_no=0;
    String start="none";
    String end="none";
    String coach="none";
    int staff_id=0;
    
    ResultSet res2=myStmt.executeQuery("SELECT * FROM BATCH_TIME");
    out.println("<center><table><tr><th>BATCH_NO</th><th>COACH</th><th>START_TIME</th><th>END_TIME</th></tr>");
    while(res2.next()){
    	batch_no=res2.getInt("BATCH_NO");
    	int coach_id=res2.getInt("STAFF_ID");
    	int tslot_id=res2.getInt("TIME_SLOT_ID");
    	
    	ResultSet res42=myStmt1.executeQuery("SELECT NAME FROM COACHING_STAFF WHERE STAFF_ID="+coach_id);
    	while(res42.next()){
    		coach=res42.getString(1);
    	}
    	ResultSet res41=myStmt1.executeQuery("SELECT * FROM TIME_SLOT WHERE TIME_SLOT_ID="+tslot_id);
    	while(res41.next()){
    		start=res41.getString("START_TIME");
    		end=res41.getString("END_TIME");
    	}
    		
        out.println("<tr><td>"+batch_no+"</td><td>"+coach+"</td><td>"+start+"</td><td>"+end+"</td></tr>");
        
    }
    out.println("</table></center>");
    /*String loc_name="0";
    ResultSet resLoc=myStmt.executeQuery("SELECT LOC_NAME FROM LOCATION WHERE LOC_ID="+loc_id);
    while(resLoc.next()){
    	loc_name=resLoc.getString(1);
    }
    int sal=0;
    ResultSet resSal=myStmt.executeQuery("SELECT SEC_SALARY FROM SECURITY_SALARY WHERE LOC_ID="+loc_id+" AND SHIFT='"+shift+"'");
    while(resSal.next()){
    	sal=resSal.getInt(1);
    }
        out.println("</center><br>");
    out.println("<form action='change_sec_details.jsp'><input type='text' name='sec_id' value='"+id+"' style='visibility: hidden; position:fixed' readonly>");
    out.println("<div class='container'><div class='clearfix'>");
    out.println("<a href='SAMPLE.html'><button type='button' class='cancelbtn' >Logout</button></a>");
    out.println("<button type='submit' class='signupbtn' id='next' style='float: right'>Change_details</button>");
    out.println("</form></div></div>");*/
    con.close();
    }}
    catch(SQLException s)
    {
      out.println("OOPS!");
      out.println(s.getMessage());
    }
    
   

%>


</body>
</html>