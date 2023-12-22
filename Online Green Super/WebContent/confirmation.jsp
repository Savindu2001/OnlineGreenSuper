<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="com.Mail.GmailSender" %>

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
    

    <% 
        // Update cart table with PayPal transaction ID
        try {
            
	        	try (Connection con = DBConnect.getConn();
	            PreparedStatement ps = con.prepareStatement("update cart set paypalTransactionId=? where email=? and status='bill'")){
	            ps.setString(1, paypalTransactionId);
	            ps.setString(2, email);
	            ps.executeUpdate();
	        	}
            
	        	// Sending Welcome Email using GmailSender servlet
	            String subject = "Payment Success: Your Order is Being Processed!";
	            String message = "Hello Valued Customer ,\n\n" +
	            	    "Thank you for your payment! We're excited to inform you that your payment was successful. Your order is now being processed, and we're working diligently to prepare it for delivery. You can expect your items to arrive soon.\n\n" +
	            	    "If you have any questions or need further assistance, please don't hesitate to reach out to our customer support. We appreciate your business and hope you enjoy your shopping experience with us.\n\n" +
	            	    "Best regards,\n" +
	            	    "Green Super Team";

	            // Call the sendEmail method from GmailSender servlet
	            GmailSender.sendEmail(email, subject, message);
            
            
            
            
            
            
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
