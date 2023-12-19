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

<body class="mx-auto">
<%@include file="header.jsp" %>

<% 
String msg = request.getParameter("msg");

if ("added".equals(msg)) {
%>
    <script>
        alert("Product added successfully!");
    </script>
<%
} else if ("exist".equals(msg)) {
%>
    <script>
        alert("Product already exists in your cart! Quantity increased!");
    </script>
<%
}
%>


<% 

if("invalid".equals(msg))
{
%>
<h3 class="alert">Something went Wrong!</h3>
<% } %>



 <!-- banner -->
<div class="bg-cover bg-no-repeat bg-center py-36 " style="background-image: url('assets/bg.jpg');">
    <div class="container px-8">
        <h1 class="text-6xl text-white font-medium font-sans mb-4 capitalize">
            Good Products <br> Good Helth
        </h1>
        <p class="px-2 mb-4 text-lg text-white">
            Going green means you have made the conscious decision to not steal<br/> from your children.
        </p>
        <div class="mt-12">
            <a href="shop.jsp" class="bg-primary border border-primary text-white px-8 py-3 font-medium 
                rounded-md hover:bg-transparent hover:text-primary">Shop Now</a>
        </div>
    </div>
</div>
<!-- ./banner -->

    <!-- features -->
    <div class="container py-16">
        <div class="w-10/12 grid grid-cols-1 md:grid-cols-3 gap-6 mx-auto justify-center">
            <div class="border border-primary rounded-sm px-3 py-6 flex justify-center items-center gap-5">
                <i class="bi bi-truck text-5xl"></i>
                <div>
                    <h4 class="font-medium capitalize text-lg">Free Shipping</h4>
                    <p class="text-gray-500 text-sm">Order over LKR 5000</p>
                </div>
            </div>
            <div class="border border-primary rounded-sm px-3 py-6 flex justify-center items-center gap-5">
                <i class="bi bi-check2-circle text-5xl"></i>
                <div>
                    <h4 class="font-medium capitalize text-lg">Money Rturns</h4>
                    <p class="text-gray-500 text-sm">30 days money returs</p>
                </div>
            </div>
            <div class="border border-primary rounded-sm px-3 py-6 flex justify-center items-center gap-5">
                <i class="bi bi-person-raised-hand text-5xl"></i>
                <div>
                    <h4 class="font-medium capitalize text-lg">24/7 Support</h4>
                    <p class="text-gray-500 text-sm">Customer support</p>
                </div>
            </div>
        </div>
    </div>
    <!-- ./features -->

    <!-- categories -->
    <div class="container mx-auto py-16">
        <h2 class="text-2xl font-medium text-gray-800 uppercase mb-6">shop by category</h2>
        <div class="grid grid-col-1 md:grid-cols-3 gap-3">
            <div class="relative rounded-sm overflow-hidden group">
                <img src="assets/cat1.jpg" alt="category 1" class="w-full">
                <a href="meats.jsp"
                    class="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center text-2xl text-white font-roboto font-medium group-hover:bg-opacity-60 transition">Fresh Meats</a>
            </div>
            <div class="relative rounded-sm overflow-hidden group">
                <img src="assets/cat2.jpg" alt="category 1" class="w-full">
                <a href="vegitables.jsp"
                    class="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center text-2xl text-white font-roboto font-medium group-hover:bg-opacity-60 transition">Fresh Vegitables</a>
            </div>
            <div class="relative rounded-sm overflow-hidden group">
                <img src="assets/cat3.jpg" alt="category 1" class="w-full">
                <a href="fruits.jsp"
                    class="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center text-2xl text-white font-roboto font-medium group-hover:bg-opacity-60 transition">Fresh Fruits
                </a>
            </div>
            
        </div>
    </div>
    <!-- ./categories -->

    <!-- new arrival -->

<div class="bg-green-400 bg-[url('assets/ads1.png')] bg-cover p-10 h-[80vh] bg-no-repeat font-semibold     mx-auto text-center  flex-auto  ">
<!--   <h1 class="xl:mt-24 mt-16    text-white text-3xl">"Eat Fruits,It is good for your health."</h1> -->
</div>

<div class="px-16 py-8">
  <h1 class="text-black my-2 py-4 underline text-5xl font-bold text-center">Best Selling Products</h1>

  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-5 mx-auto mt-8">

            
<%
try
{
     Connection con = DBConnect.getConn();
     Statement st = con.createStatement();
     ResultSet rs=st.executeQuery("select * from products where active='Yes' LIMIT 12");
  while(rs.next())
  { 
%>
            <!-- Product Card Start  -->
            
     <div class="w-full max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
      <a href="#">
        <img class="p-8 rounded-t-lg w-64 h-64 " src="<%=rs.getString(6) %>" alt="product image" />
      </a>
      <div class="px-5 pb-5">
        <a href="#">
          <h1 class="text-sm font-semibold tracking-tight text-gray-900 dark:text-white">Product Code :<%=rs.getString(1) %></h1>
        </a>
        
        <div class="flex items-center justify-between">
          <span class="text-3xl font-bold text-gray-900 dark:text-white"><%=rs.getString(2) %></span>
        </div>
        <div class="flex items-center justify-between">
          <span class="text-sm font-bold text-gray-900 dark:text-white">Category: <%=rs.getString(3) %></span>
        </div>
        <div class="flex items-center justify-between ">
          <span class="text-2xl font-semibold text-gray-900 dark:text-white">Rs:<%=rs.getString(4) %>/=</span>
        </div>

        <div class="flex items-center justify-between">
          <a href="addToCartAction.jsp?id=<%=rs.getString(1) %>" class="text-white bg-green-400 hover:bg-green-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium  my-2 rounded-lg text-sm px-8 w-full py-2.5 text-center dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">Add to cart</a>
        </div>


      </div>
    </div>
  <%
  }
  }
  catch(Exception e)
{
	  System.out.println(e);
}
  %>  
            <!-- Product Card End  -->

                

               

            
        </div>
    </div>

  
    <!-- footer -->

<%@include file="footer.jsp" %>

</body>

</html>