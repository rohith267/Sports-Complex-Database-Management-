<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	#suc{
		color: green;
		font-family: monospace;
		font-size: 300% ;
	}
	body{
		
		background: linear-gradient(to right,cyan,azure 60%);
	}
	table{
		font-size: 250%;
	}
	table,tr,th{
		
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
      String sport=request.getParameter("sport");
//response.setContentType("text/html;charset=UTF-8");
       //out.println("<br/><br/>");
       try{
       Connection con=null;
       ResultSet res=null;
       String url1 = "jdbc:mysql://localhost:3306/sportscomplex"; 
       String user = "root";
       String password = "hitpassword";
       con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sportscomplex","root","hitpassword");
       Statement myStmt=con.createStatement();
       Random rand=new Random();
       int id=0,count=0,fee=0;
       ResultSet res3=myStmt.executeQuery("SELECT PERSON_ID FROM SPORTS_PERSON WHERE USERNAME='"+name+"'");
       while(res3.next()){
    	   id=res3.getInt(1);
       }
       ResultSet res4=myStmt.executeQuery("select count(*) from plays where person_id="+id+" and sports_name='"+sport+"'");
    	while(res4.next()){
    		count=res4.getInt(1);
    	}
    	if(count==0){
    		out.println("<center><h1>YOUU ARE NOT REGISTERED TO THAT SPORT</h1></center>");
    	}
    	else{
    	
    		myStmt.executeUpdate("DELETE FROM PLAYS WHERE SPORTS_NAME='"+sport+"' AND PERSON_ID="+id);	
    	 out.println("<center><h1 id='suc'><center>Successfully updated your data</center></h1></center>");
    	}
    	
       }
       catch(SQLException s)
       {
         out.println("OOPS!");
         out.println(s.toString());
       }
%>

      
</body>
</html>