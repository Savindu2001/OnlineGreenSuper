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
  
  
<header class="bg-white text-gray py-4  top-0 w-full z-50">


  <nav class="flex justify-between items-center w-[92%] mx-auto">
    <div>
      <img class="w-16" src="assets/G-logo.png" alt="logo" />
    </div>
    <div class="nav-links md:static absolute bg-white mt-12 md:mt-1  md:min-h-fit min-h-[60vh] left-0 top-[-200%] md:w-auto w-full flex item-center px-5 ">
      <ul class="flex md:flex-row flex-col md:items-center md:gap-[4vh] gap-6 py-2">
        <li>
          <a class="hover:text-green-500" href="home.jsp">Home</a>
        </li>
        
        <li>
          <a class="hover:text-green-500" href="shop.jsp">Shop</a>
        </li>
        <li class="md:hidden">
          <a class="hover:text-green-500" href="fruits.jsp">Fruits</a>
        </li>
        <li class="md:hidden">
          <a class="hover:text-green-500" href="vegitables.jsp">Vegetables</a>
        </li>
        <li class="md:hidden">
          <a class="hover:text-green-500" href="meats.jsp">Meats</a>
        </li>
        
        <li class="md:hidden">
          <a class="hover:text-green-500" href="contact.jsp">Contact Us</a>
        </li>
        <li class="md:hidden">
          <a class="hover:text-green-500" href="about.jsp">About Us</a>
        </li>
        <li class="md:hidden">
          <a class="hover:text-green-500" href="myOrders.jsp"><i class="bi bi-box-fill"></i>My Orders</a>
        </li>
        <li class="md:hidden">
         <a class="hover:text-green-500" href="logout.jsp"><i class="bi bi-box-arrow-right"></i>Logout</a>
        </li>
       
      </ul>
    </div>
 
 	 <!-- Search button with search icon -->
      <div class="relative">
      <form action="searchHome.jsp" method="post">
        <input type="text" placeholder="Search" name="search" class="w md:w-[450px] px-4 py-2 rounded-md border focus:outline-none focus:border-green-500">
        <button type="submit" class="absolute  right-0 top-0 mt-2 mr-2">
          <i class="bi bi-search text-2xl text-black"></i>
        </button></form>
      </div>
      <!-- End of search button with search icon -->
      <div class="hidden sm:block">
      <ul>
         <li>
          <a class="hover:text-green-500" href="myOrders.jsp"><i class="bi bi-box-fill"></i>My Orders</a>
        </li>
        
        
      </ul>
    </div>
    
    <div class="hidden sm:block">
      <ul>
         
        
        <li>
          <a class="hover:text-green-500" href="logout.jsp"><i class="bi bi-box-arrow-right"></i>Logout</a>
        </li>
      </ul>
    </div>
      
    
 
    <div class=" flex items-center gap-6">
    <a href="myCartTest.jsp">
      <button class="rounded-sm bg-green-600 py-2 px-4 text-white  "><i class="bi bi-cart3 text-2sxl"></i></button></a>
      
      <i class="bi bi-filter-right text-3xl cursor-pointer md:hidden" onclick="onToggleMenu(this)"></i>
    </div>

  </nav>
  
  <!-- Logged users can see  -->
    <div class="bg-green-600   hidden sm:block">
        <div class="container flex mx-auto">
            

            <div class="flex items-center justify-between flex-grow md:pl-12 py-5">
                <div class="flex items-center space-x-6 capitalize">
                    <a href="fruits.jsp" class="text-gray-200 hover:text-white transition">Fruits</a>
                    <a href="vegitables.jsp" class="text-gray-200 hover:text-white transition">Vegitables</a>
                    <a href="about.jsp" class="text-gray-200 hover:text-white transition">About us</a>
                    <a href="contact.jsp" class="text-gray-200 hover:text-white transition">Contact us</a>
                </div>
                <div class="space-x-3">
                <a href="login.jsp" class="text-gray-200 hover:text-white transition">Login</a>
                <a href="signup.jsp" class="text-gray-200 hover:text-white transition">Register</a>
                <a  class="text-gray-200 hover:text-white transition"><i class="bi bi-telephone-plus text-lg px-2"></i>076-1794522</a>
                </div>
            </div>
        </div>
    </div>
 
    
</header>

<script>
  <%--Mobile Menu Script Start--%>
  const navLinks = document.querySelector('.nav-links')
  function onToggleMenu(m){
    m.name = m.name === 'menu' ? 'menu' : 'menu'
    navLinks.classList.toggle('top-[12%]')
  }
  <%--Mobile Menu Script End--%>
</script>