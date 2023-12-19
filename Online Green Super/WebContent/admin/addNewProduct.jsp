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
    <!-- <script src="./tailwind3.js"></script> -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" />
  </head>

  <body class="bg-gray-600 font-[Poppins]">

<% 
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>

<h3 class="text-2xl mt-12 font-bold text-green-600 md:ml-80 md:mt-5">Product Added Successfully!</h3>

<%} %>

<% 

if("wrong".equals(msg))
{
%>
<h3 class="text-2xl mt-12 font-bold text-red-600 md:ml-80 md:mt-5">Some thing went wrong! Try Again!</h3>

<%} %>

<%
int id=1;
try
{
    Connection con = DBConnect.getConn();
    Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select max(id) from products");
    while(rs.next())
    {
      
      id = rs.getInt(1);
      id=id+1;
    }
}
catch(Exception e)
{
  
}
%>
    
    <span class="absolute left-4 top-5 cursor-pointer text-4xl text-white" onclick="Openbar()">
      <i class="bi bi-filter-left rounded-md bg-green-600 px-2"></i>
    </span>
    <% String email=session.getAttribute("email").toString(); %>
    <div class="sidebar fixed bottom-0 left-[-300px] top-0 h-screen w-[300px] overflow-y-auto bg-gray-800 p-2 text-center shadow duration-1000 lg:left-0">
      <div class="text-xl text-gray-100">
        <div class="mt-1 flex items-center rounded-md p-2.5">
          <i class="bi bi-shop rounded-md bg-green-600 px-2 py-1"></i>
          <h1 class="ml-3 text-[15px] text-xl font-bold text-gray-200">Green Super</h1>
          <i class="bi bi-x ml-20 cursor-pointer lg:hidden" onclick="Openbar()"></i>
        </div>
        <hr class="my-2 text-gray-600" />

        <div>
          <div class="mt-2 flex cursor-pointer items-center rounded-md p-2.5 px-4 duration-300 hover:bg-green-600">
            <i class="bi bi-house-door-fill"></i>
           <a href="adminHome.jsp"> <span class="ml-4 text-[15px] text-gray-200">Dashboard</span></a>
          </div>
          <div class="mt-2 flex cursor-pointer items-center rounded-md p-2.5 px-4 duration-300 hover:bg-green-600">
            <i class="bi bi-patch-exclamation-fill"></i>
            <a href="ordersReceived.jsp"><span class="ml-4 text-[15px] text-gray-200">Orders</span></a>
          </div>
          <hr class="my-4 text-gray-600" />
          <div class="mt-2 flex cursor-pointer items-center rounded-md p-2.5 px-4 duration-300 hover:bg-green-600">
            <i class="bi bi-envelope-fill"></i>
           <a href="messagesReceived.jsp"> <span class="ml-4 text-[15px] text-gray-200">Messages</span></a>
          </div>

          <div class="mt-2 flex cursor-pointer items-center rounded-md p-2.5 px-4 duration-300 hover:bg-green-600">
            <i class="bi bi-chat-left-text-fill"></i>
            <div class="flex w-full items-center justify-between" onclick="dropDown()">
              <span class="ml-4 text-[15px] text-gray-200">Products</span>
              <span class="rotate-180 text-sm" id="arrow">
                <i class="bi bi-chevron-up"></i>
              </span>
            </div>
          </div>
          <div class="mx-auto mt-2 w-4/5 text-left text-sm font-thin leading-7" id="submenu">
            <a href="addNewProduct.jsp"><h1 class="mt-1 cursor-pointer rounded-md p-2 hover:bg-gray-700">Add Products</a></h1>
           <a href="allProductEditProduct.jsp"> <h1 class="mt-1 cursor-pointer rounded-md p-2 hover:bg-gray-700">View Products</h1></a>
            <a href="allProductEditProduct.jsp"><h1 class="mt-1 cursor-pointer rounded-md p-2 hover:bg-gray-700">Edit Products</h1></a>
          </div>
          <div class="mt-3 flex cursor-pointer items-center rounded-md p-2.5 px-4 duration-300 hover:bg-green-600">
            <i class="bi bi-box-arrow-in-right"></i>
            <a href="../logout.jsp">
            <span class="ml-4 text-[15px] text-gray-200">Logout</span></a>
          </div>
        </div>
      </div>
    </div>
    <div class="mt-10 p-10 text-black md:ml-80 md:mt-5">
      <div>
      
  <div class="flex items-center justify-center font-bold text-white text-4xl mb-5">Add New Products</div>

   <form action="addNewProductAction.jsp" method="post">
  <h3 class="text-3xl font-bold text-white ">Product ID:<%out.println(id); %></h3>
  <input type="hidden" name="id" value="<%out.println(id); %>" />

  <div>
    <h3 class="mb-2 text-white mt-2 block text-sm font-medium text-gray-900 dark:text-white">Product Name :</h3>
    <input type="text" name="name" class="dark:shadow-sm-light block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 shadow-sm focus:border-blue-500 focus:ring-blue-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400 dark:focus:border-blue-500 dark:focus:ring-blue-500" placeholder="Set Product Name" required />
  </div>

  <div>
    <h3 class="mb-2 text-white mt-2  block text-sm font-medium text-gray-900 dark:text-white">Product Category :</h3>
    <input type="text" name="category" class="dark:shadow-sm-light block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 shadow-sm focus:border-blue-500 focus:ring-blue-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400 dark:focus:border-blue-500 dark:focus:ring-blue-500" placeholder="Set Product Category" required />
  </div>

  <div>
    <h3 class="mb-2  text-white mt-2  block text-sm font-medium text-gray-900 dark:text-white">Product Price :</h3>
    <input type="text" name="price" class="dark:shadow-sm-light block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 shadow-sm focus:border-blue-500 focus:ring-blue-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400 dark:focus:border-blue-500 dark:focus:ring-blue-500" placeholder="Set Product Price (Rs:)" required />
  </div>
  
  <div>
    <h3 class="mb-2 text-white mt-2  block text-sm font-medium text-gray-900 dark:text-white">Product Image :</h3>
    <input type="text" name="image_url" class="dark:shadow-sm-light block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 shadow-sm focus:border-blue-500 focus:ring-blue-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400 dark:focus:border-blue-500 dark:focus:ring-blue-500" placeholder="Set Product Image URL" required />
  </div>

  <div>
    <h3 class="mb-2 text-white mt-2  block text-sm font-medium text-gray-900 dark:text-white">Product Status :</h3>
    <select class="block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 focus:border-blue-500 focus:ring-blue-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400 dark:focus:border-blue-500 dark:focus:ring-blue-500" name="active">
      <option selected>Choose a Product Status</option>
      <option value="Yes">Yes</option>
      <option value="No">No</option>
    </select>
  </div>
  <button class="m-2 mx-auto flex rounded-sm bg-green-500 px-4 py-2 font-sans text-lg font-bold text-white hover:bg-green-700">
    Add Product
    
  </button>
</form>



      </div>
    </div>

<%@include file="adminFooter.jsp" %>

    <script>
      function dropDown() {
        document.querySelector('#submenu').classList.toggle('hidden')
        document.querySelector('#arrow').classList.toggle('rotate-0')
      }
      dropDown()

      function Openbar() {
        document.querySelector('.sidebar').classList.toggle('left-[-300px]')
      }
    </script>

  </body>
</html>
