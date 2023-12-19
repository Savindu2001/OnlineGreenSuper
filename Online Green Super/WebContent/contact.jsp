<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@page errorPage="../error.jsp" %>
<%@include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Green Super</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" />
  </head>
  <body>
  
<% 
String msg = request.getParameter("msg");

if ("valid".equals(msg)) {
%>
    <script>
        alert("Message Sent successfully!");
    </script>
<%
} 
if ("invalid".equals(msg)) {
%>
    <script>
        alert("Try Again!");
    </script>
<%
}
%>

		<%--Content Section Start--%>

<div class="bg-white mx-auto p-10 sm:w-[700px] rounded-md  sm:mt-16 sm:mb-10  ">
  <h1 class="text-center font-mono text-4xl font-bold text-green-400 ">Contact Us.</h1>
  <p class="text-center my-4 font-mono"> Contact Us! We Happy to help you, Talk Now</p>

  <form class="max-w-sm mx-auto" action="contactAction.jsp" method="post">
    <div class="mb-5">
      <label for="username-success" class="block mb-2 text-sm font-medium text-green-700 dark:text-green-500">Subject</label>
      <input type="text" name="subject"  class="bg-green-50 border border-green-500 text-green-900 placeholder-green-700 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full p-2.5 dark:bg-green-100 dark:border-green-400" placeholder="Topic....">

	<label for="username-success" class="block mb-2 text-sm font-medium text-green-700 dark:text-green-500">Your Email</label>
      <input type="email" name="email"  class="bg-green-50 border border-green-500 text-green-900 placeholder-green-700 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full p-2.5 dark:bg-green-100 dark:border-green-400" placeholder="your@domain.com">
	
	
	
		
      <br>

      <label for="message" class="block mb-2 text-sm font-medium text-green-700 dark:text-green-500">Your message</label>
      <textarea id="message" name="messageBody" rows="4" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-green-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Leave a comment..."></textarea>

      

      <button type="submit" class="w-full text-white bg-green-600 font-mono font-medium rounded-lg px-2.5 py-2 my-3 me-2 mb-2 focus:outline-none hover:bg-gray-900 hover:text-green-500">Send Message!</button>

    </div>
  </form>


</div>


<%--Content Section End--%>



<%@include file="footer.jsp" %>
  </body>
  </html>