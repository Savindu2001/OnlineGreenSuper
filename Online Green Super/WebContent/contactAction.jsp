<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%

String email =request.getParameter("email");
String subject = request.getParameter("subject");
String messageBody = request.getParameter("messageBody");

try{
	
	Connection con = DBConnect.getConn();
    PreparedStatement ps =con.prepareStatement("insert into message(email,subject,messageBody) values(?,?,?)");	
    ps.setString(1,email);
    ps.setString(2,subject);
    ps.setString(3,messageBody);
	ps.executeUpdate();
	
	response.sendRedirect("contact.jsp?msg=valid");
}

catch(Exception e){
	System.out.println(e);
	response.sendRedirect("contact.jsp?msg=invalid");
	
}




%>