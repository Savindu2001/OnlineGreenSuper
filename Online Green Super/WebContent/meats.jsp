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

<body class="bg-gray-900" >
<%@include file="header.jsp" %>


<% 
String msg=request.getParameter("msg");
if("added".equals(msg))
{
%>
<h3 class="alert">Product added successfully!</h3>
<% } %>

<% 

if("exist".equals(msg))
{
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<% } %>

<% 

if("invalid".equals(msg))
{
%>
<h3 class="alert">Something went Wrong!</h3>
<% } %>


<div class="bg-green-400 bg-[url('assets/meat.png')] bg-cover p-10 h-[40vh] bg-no-repeat font-semibold     mx-auto text-center  flex-auto  ">
  <h1 class="xl:mt-24 mt-16    text-white text-3xl">Fresh Meats</h1>
</div>

<div class="px-16 py-8">
  <h4 class="text-white text-lg">Fresh Meats:</h4>

  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-5 mx-auto mt-8">

            
<%
try
{
     Connection con = DBConnect.getConn();
     Statement st = con.createStatement();
     ResultSet rs=st.executeQuery("select * from products where category='meats'");
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

