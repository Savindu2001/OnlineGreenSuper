<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
try {
    String email = session.getAttribute("email").toString();
    String product_id = request.getParameter("id");

    Connection con = DBConnect.getConn();
    Statement st = con.createStatement();
    st.executeUpdate("DELETE FROM cart WHERE email='" + email + "' AND product_id='" + product_id + "' AND address IS NULL ");
    
    // Redirect to the cart page with a success message
    response.sendRedirect("myCartTest.jsp?msg=removed");
} catch (Exception e) {
    e.printStackTrace();
    
    // Redirect to the cart page with an error message
    response.sendRedirect("myCartTest.jsp?msg=error");
}
%>
