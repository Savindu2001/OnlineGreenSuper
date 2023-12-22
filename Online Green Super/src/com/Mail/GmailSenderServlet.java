package com.Mail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GmailSenderServlet")
public class GmailSenderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String toEmail = request.getParameter("email");
        String subject = request.getParameter("subject");
        String messageText = request.getParameter("message");

        // Send email using GmailSender class
        GmailSender.sendEmail(toEmail, subject, messageText);

        // Redirect to a success page or handle as needed
        response.sendRedirect("home.jsp");
    }
}
