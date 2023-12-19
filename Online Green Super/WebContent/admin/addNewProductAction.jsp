<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%

String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");

String active = request.getParameter("active");
String image_url = request.getParameter("image_url");

try
{
	
	  Connection con = DBConnect.getConn();
	  PreparedStatement ps =con.prepareStatement("insert into products values(?,?,?,?,?,?)");
	  ps.setString(1,id);
	  ps.setString(2,name);
	  ps.setString(3,category);
	  ps.setString(4,price);
	  ps.setString(5,active);
	  ps.setString(6,image_url);
	  ps.executeUpdate();
	  response.sendRedirect("addNewProduct.jsp?msg=done");

}

catch(Exception e)
{
	
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
}









%>