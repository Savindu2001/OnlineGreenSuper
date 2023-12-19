<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>

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

if("update".equals(msg))
{
%>
<h3 class="text-2xl mt-12 font-bold text-green-600 md:ml-80 md:mt-5">Product Updated Successfully!</h3>

<%} %>

<% 

if("wrong".equals(msg))
{
%>
<h3 class="text-2xl mt-12 font-bold text-red-600 md:ml-80 md:mt-5">Some thing went wrong! Try Again!</h3>

<%} %>


    
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
      
  <div class="flex items-center justify-center font-bold text-white text-4xl mb-5">All Products</div>



<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>

                <th scope="col" class="px-6 py-3">
                    <div class="flex items-center">
                        Id
                        <a href="#"><svg class="w-3 h-3 ms-1.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24">
    <path d="M8.574 11.024h6.852a2.075 2.075 0 0 0 1.847-1.086 1.9 1.9 0 0 0-.11-1.986L13.736 2.9a2.122 2.122 0 0 0-3.472 0L6.837 7.952a1.9 1.9 0 0 0-.11 1.986 2.074 2.074 0 0 0 1.847 1.086Zm6.852 1.952H8.574a2.072 2.072 0 0 0-1.847 1.087 1.9 1.9 0 0 0 .11 1.985l3.426 5.05a2.123 2.123 0 0 0 3.472 0l3.427-5.05a1.9 1.9 0 0 0 .11-1.985 2.074 2.074 0 0 0-1.846-1.087Z"/>
  </svg></a>
                    </div>
                </th>

                <th scope="col" class="px-6 py-3">
                    Product name
                </th>
                <th scope="col" class="px-6 py-3">
                    <div class="flex items-center">
                        Category
                        <a href="#"><svg class="w-3 h-3 ms-1.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24">
    <path d="M8.574 11.024h6.852a2.075 2.075 0 0 0 1.847-1.086 1.9 1.9 0 0 0-.11-1.986L13.736 2.9a2.122 2.122 0 0 0-3.472 0L6.837 7.952a1.9 1.9 0 0 0-.11 1.986 2.074 2.074 0 0 0 1.847 1.086Zm6.852 1.952H8.574a2.072 2.072 0 0 0-1.847 1.087 1.9 1.9 0 0 0 .11 1.985l3.426 5.05a2.123 2.123 0 0 0 3.472 0l3.427-5.05a1.9 1.9 0 0 0 .11-1.985 2.074 2.074 0 0 0-1.846-1.087Z"/>
  </svg></a>
                    </div>
                </th>
                <th scope="col" class="px-6 py-3">
                    <div class="flex items-center">
                        Price
                        <a href="#"><svg class="w-3 h-3 ms-1.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24">
    <path d="M8.574 11.024h6.852a2.075 2.075 0 0 0 1.847-1.086 1.9 1.9 0 0 0-.11-1.986L13.736 2.9a2.122 2.122 0 0 0-3.472 0L6.837 7.952a1.9 1.9 0 0 0-.11 1.986 2.074 2.074 0 0 0 1.847 1.086Zm6.852 1.952H8.574a2.072 2.072 0 0 0-1.847 1.087 1.9 1.9 0 0 0 .11 1.985l3.426 5.05a2.123 2.123 0 0 0 3.472 0l3.427-5.05a1.9 1.9 0 0 0 .11-1.985 2.074 2.074 0 0 0-1.846-1.087Z"/>
  </svg></a>
                    </div>
                </th>
                <th scope="col" class="px-6 py-3">
                    <div class="flex items-center">
                        Image Link
                        <a href="#"><svg class="w-3 h-3 ms-1.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24">
    <path d="M8.574 11.024h6.852a2.075 2.075 0 0 0 1.847-1.086 1.9 1.9 0 0 0-.11-1.986L13.736 2.9a2.122 2.122 0 0 0-3.472 0L6.837 7.952a1.9 1.9 0 0 0-.11 1.986 2.074 2.074 0 0 0 1.847 1.086Zm6.852 1.952H8.574a2.072 2.072 0 0 0-1.847 1.087 1.9 1.9 0 0 0 .11 1.985l3.426 5.05a2.123 2.123 0 0 0 3.472 0l3.427-5.05a1.9 1.9 0 0 0 .11-1.985 2.074 2.074 0 0 0-1.846-1.087Z"/>
  </svg></a>
                    </div>
                </th>
                <th scope="col" class="px-6 py-3">
                    <div class="flex items-center">
                        Active
                        <a href="#"><svg class="w-3 h-3 ms-1.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24">
    <path d="M8.574 11.024h6.852a2.075 2.075 0 0 0 1.847-1.086 1.9 1.9 0 0 0-.11-1.986L13.736 2.9a2.122 2.122 0 0 0-3.472 0L6.837 7.952a1.9 1.9 0 0 0-.11 1.986 2.074 2.074 0 0 0 1.847 1.086Zm6.852 1.952H8.574a2.072 2.072 0 0 0-1.847 1.087 1.9 1.9 0 0 0 .11 1.985l3.426 5.05a2.123 2.123 0 0 0 3.472 0l3.427-5.05a1.9 1.9 0 0 0 .11-1.985 2.074 2.074 0 0 0-1.846-1.087Z"/>
  </svg></a>
                    </div>
                </th>
                <th scope="col" class="px-6 py-3">
                    <span class="sr-only">Edit</span>
                </th>
            </tr>
        </thead>

        <tbody>

          <%
        try
        {
           Connection con = DBConnect.getConn();
             Statement st = con.createStatement();
             ResultSet rs=st.executeQuery("select * from products");
          while(rs.next())
          {
        %>

            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">

                <td class="px-6 py-4">
                    <%=rs.getString(1) %>
                </td>
                <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                   <%=rs.getString(2) %>
                </td>
                <td class="px-6 py-4">
                    <%=rs.getString(3) %>
                </td>
                <td class="px-6 py-4">
                   <%=rs.getString(4) %>
                </td>
                <td class="px-6 py-4">
                   <%=rs.getString(6) %>
                </td>
                <td class="px-6 py-4">
                   <%=rs.getString(5) %>
                </td>
                <td class="px-6 py-4 text-right">
                    <a href="editProduct.jsp?id=<%=rs.getString(1) %>" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                </td>
            </tr>

            <%
         }
          }
          catch (Exception e)
          {
            System.out.println(e);
          }
          %>
            
        </tbody>
    </table>
</div>




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
