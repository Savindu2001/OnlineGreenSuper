<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="com.Mail.GmailSender" %>


<%

String id =request.getParameter("id");
String email = request.getParameter("email");
String status ="Cancel";

try{
	
	Connection con = DBConnect.getConn();
    Statement st =con.createStatement();	
    st.executeUpdate("update cart set status='"+status+"'where product_id='"+id+"' and email='"+email+"' and address is not null");
    
    // Sending Welcome Email using GmailSender servlet
    String subject = "Order Cancellation: Important Information Regarding Your Recent Order";
    String message = "Hello Valued Customer,\n\n" +
    	    "We regret to inform you that your recent order has been canceled. We apologize for any inconvenience this may have caused.\n\n" +
    	    "If you have any questions or concerns regarding the cancellation, please reach out to our customer support. We are here to assist you and address any issues you may have.\n\n" +
    	    "We appreciate your understanding and look forward to serving you in the future.\n\n" +
    	    "Best regards,\n" +
    	    "Green Super Team";
    	    		
    	    		
    // Call the sendEmail method from GmailSender servlet
    GmailSender.sendEmail(email, subject, message);
	
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
}

catch(Exception e){
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=invalid");
	
}




%>