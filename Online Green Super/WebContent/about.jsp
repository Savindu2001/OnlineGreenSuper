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
  
  
  <div class="sm:flex items-center max-w-screen-xl">
    <div class="sm:w-1/2 p-10">
        <div class="image object-center pt-10 text-center">
            <img src="assets/about.jpg">
        </div>
    </div>
    <div class="sm:w-1/2 p-5">
        <div class="text">
            <span class="text-gray-500 border-b-2 border-green-600 uppercase">About us</span>
            <h2 class="my-4 font-bold text-3xl  sm:text-4xl ">Green <span class="text-green-600">Super Market</span>
            </h2>
            <p class="text-gray-700">
                Welcome to Green Supermarket, your one-stop destination for fresh and affordable groceries! At Green Supermarket, we take pride in offering a diverse selection of high-quality vegetables, fruits, meats, and groceries to meet all your culinary needs.
            </p>
            
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
  </body>
  </html>