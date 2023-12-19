<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@page errorPage="../error.jsp" %>

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
  
  
<header class="bg-gray-900 text-white py-4  top-0 w-full z-50">


  <nav class="flex justify-between items-center w-[92%] mx-auto">
    <div>
    <a class="hover:text-green-500" href="adminHome.jsp"><i class="bi bi-box-arrow-in-up-left"></i>Back To Dashboard</a>
      
    </div>
   
 
 	 
    
    <div class="hidden sm:block">
      <ul>
         
        
        <li>
          <h1 class="text-2xl font-bold"> Green Super Market All Orders Panel</h1>
        </li>
      </ul>
    </div>
      
    
 
    <div class=" flex items-center gap-6">
    <a href="logout.jsp">
      <button class="rounded-sm bg-green-600 py-2 px-4 text-white  "><i class="bi bi-box-arrow-right"></i>Logout</button></a>
      
      
    </div>

  </nav>
  
  
    
</header>

