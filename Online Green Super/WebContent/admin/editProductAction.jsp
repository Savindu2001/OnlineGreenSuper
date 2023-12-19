<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");
String image_url = request.getParameter("image_url");


try {
    Connection con = DBConnect.getConn();
    Statement st=con.createStatement();
    st.executeUpdate("update products set name='"+ name +"' , category='"+ category +"', price='"+ price +"',active='"+ active +"',image_url='"+ image_url +"' where id='"+id+"'");
 
    if (active.equals("No")) 
    {
        st.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL");
    }

    response.sendRedirect("allProductEditProduct.jsp?msg=update");
} 

catch (Exception e) 
{
   System.out.println(e);
   response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>
