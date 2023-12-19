<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<% 
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String address = request.getParameter("address");
String password = request.getParameter("password");


try
{
	Connection con = DBConnect.getConn();
    PreparedStatement ps =con.prepareStatement("insert into users values(?,?,?,?,?)");	
    ps.setString(1,name);
    ps.setString(2,email);
    ps.setString(3,mobileNumber);
    ps.setString(4,address);
    ps.setString(5,password);
    ps.executeUpdate();
    
    response.sendRedirect("signup.jsp?msg=valid");
}
catch(Exception e)
{
 	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
	
}



%>