<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");
String incdec = request.getParameter("quantity");
int price = 0;
int total = 0;
int quantity = 0;
int final_total = 0;

try {
    Connection con = DBConnect.getConn();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from cart where email='" + email + "'  and product_id='" + id + "' and address is NULL ");
    while (rs.next()) {
        price = rs.getInt(4);
        total = rs.getInt(5);
        quantity = rs.getInt(3);
    }

    if (quantity == 1 && incdec.equals("dec"))
        response.sendRedirect("myCartTest.jsp?msg=notPossible");
    else if (quantity != 1 && incdec.equals("dec")) {
        total = total - price;
        quantity = quantity - 1;
        st.executeUpdate("update cart set total='" + total + "', quantity='" + quantity + "' where email='" + email + "' and product_id='" + id + "' and address is NULL");
        response.sendRedirect("myCartTest.jsp?msg=dec");
    } else {
        total = total + price;
        quantity = quantity + 1;
        st.executeUpdate("update cart set total='" + total + "', quantity='" + quantity + "' where email='" + email + "' and product_id='" + id + "' and address is NULL");
        response.sendRedirect("myCartTest.jsp?msg=inc");
    }
} catch (Exception e) {
    e.printStackTrace(); // Add this line for debugging
    response.sendRedirect("myCartTest.jsp?msg=error"); // Redirect with an error message
}
%>
