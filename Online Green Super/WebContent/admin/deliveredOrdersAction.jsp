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
String status ="Delivered";

try{
	
	Connection con = DBConnect.getConn();
    Statement st =con.createStatement();	
    st.executeUpdate("update cart set status='"+status+"'where product_id='"+id+"' and email='"+email+"' and address is not null");
    
    // Sending Welcome Email using GmailSender servlet
    String subject = "Order Delivered: Your Green Super Market Order is Complete!";
    String message = "Hello Valued Customer,\n\n" +
    	    "We are delighted to inform you that your recent order has been successfully delivered. Your items have reached their destination, and we hope they meet your expectations.\n\n" +
    	    "If you have any questions about your delivered order or if there are any issues, please don't hesitate to contact our customer support. We value your satisfaction and are here to assist you.\n\n" +
    	    "Thank you for choosing Green Super Market. We appreciate your business!\n\n" +
    	    "Best regards,\n" +
    	    "Green Super Team";
    	    		
    	    		
    // Call the sendEmail method from GmailSender servlet
    GmailSender.sendEmail(email, subject, message);
	
	response.sendRedirect("ordersReceived.jsp?msg=delivered");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=invalid");
	
}




%>