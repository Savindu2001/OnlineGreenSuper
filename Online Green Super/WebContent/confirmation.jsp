<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Confirmation Page</title>
</head>
<body>
    

    <% 
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String mobileNumber = request.getParameter("mobileNumber");
        String paymentMethod = request.getParameter("paymentMethod");
        String total = request.getParameter("total");
        String paypalTransactionId = request.getParameter("paypalTransactionId");

        // Display order details
    %>
    <%-- <p>Email: <%= email %></p>
    <p>Address: <%= address %></p>
    <p>City: <%= city %></p>
    <p>Mobile Number: <%= mobileNumber %></p>
    <p>Payment Method: <%= paymentMethod %></p>
    <p>Total: <%= total %></p>
    <p>PayPal Transaction ID: <%= paypalTransactionId %></p> --%>

    <% 
        // Update cart table with PayPal transaction ID
        try {
            Connection con = DBConnect.getConn();
            PreparedStatement ps = con.prepareStatement("update cart set paypalTransactionId=? where email=? and status='bill'");
            ps.setString(1, paypalTransactionId);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }
    %>

    <!-- Redirect to thankYou.jsp with order details -->
    <script>
        window.location.href = 'thankYou.jsp?email=<%= email %>&address=<%= address %>&city=<%= city %>&mobileNumber=<%= mobileNumber %>&paymentMethod=<%= paymentMethod %>&total=<%= total %>&paypalTransactionId=<%= paypalTransactionId %>';
    </script>
</body>
</html>
