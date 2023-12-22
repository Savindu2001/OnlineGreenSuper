<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="com.Mail.GmailSender" %>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String address = request.getParameter("address");
String password = request.getParameter("password");

try {
    // Database Connection and User Insertion
    try (Connection con = DBConnect.getConn();
         PreparedStatement ps = con.prepareStatement("INSERT INTO users VALUES(?,?,?,?,?)")) {
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, mobileNumber);
        ps.setString(4, address);
        ps.setString(5, password);
        ps.executeUpdate();
    }

    // Sending Welcome Email using GmailSender servlet
    String subject = "Welcome to Green Super Market";
    String message = "Dear " + name + ",\n\nThank you for creating an account with Green Super Market. Your account has been successfully created. Happy shopping!\n\nBest regards,\nGreen Super Team";

    // Call the sendEmail method from GmailSender servlet
    GmailSender.sendEmail(email, subject, message);

    response.sendRedirect("signup.jsp?msg=valid&emailSent=true");

} catch (Exception  e) {
    e.printStackTrace(); // Log the exception details

    Logger logger = Logger.getLogger(getClass().getName());
    logger.severe("Exception during user registration: " + e.getMessage());

    response.sendRedirect("signup.jsp?msg=invalid&error=" + java.net.URLEncoder.encode("Something went wrong.", "UTF-8"));
}
%>
