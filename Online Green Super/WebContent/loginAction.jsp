<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%

String email = request.getParameter("email");
String password = request.getParameter("password");

if("admin@savindu.com".equals(email) && "adminsaviya".equals(password))
{
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
}

else 
{
  int z=0;
  try 
  {
	  Connection con = DBConnect.getConn();
	  Statement st = con.createStatement();
	  ResultSet rs = st.executeQuery("select * from users where email='"+ email +"' and password='"+ password +"'");
	  while(rs.next())
	  {
		  z=1;
		  session.setAttribute("email", email);
		  response.sendRedirect("home.jsp");
	  }
	  if(z==0)
		  response.sendRedirect("login.jsp?msg=notexist");
  }
  catch(Exception e)
  {
	  System.out.println(e);
	  response.sendRedirect("login.jsp?msg=invalid");
	  
  }
}
%>