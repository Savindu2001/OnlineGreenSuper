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
      
 
 
 		            <div class="flex mt-5 pt-3 justify-center items-center mx-auto">
                <div class=" mx-auto   ">
                    <table class="w-full text-left text-sm text-gray-500 rtl:text-right dark:text-gray-400">
                        <thead class="bg-gray-50 text-xs uppercase text-gray-700 dark:bg-gray-700 dark:text-gray-400">
						    <tr>
						        <th scope="col" class="px-6 py-3">ID</th>
						        <th scope="col" class="px-6 py-3">Email</th>
						        <th scope="col" class="px-6 py-3">Subject</th>
						        <th scope="col" class="px-6 py-3">Message</th>
						        
						    </tr>
						</thead>

                        <tbody>

<%

try{
	
	Connection con = DBConnect.getConn();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from message");
	while(rs.next())
	{
%>
                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                               
                                    <td class="px-6 py-4"><%=rs.getString(1) %></td>
									<td class="px-6 py-4"><%=rs.getString(2) %></td>
									<td class="px-6 py-4"><%=rs.getString(3) %></td>
									<td class="px-6 py-4"><%=rs.getString(4) %></td>
									

                            </tr>

<%
}}
catch(Exception e)
{
	System.out.println(e);
}
                            
                            
 %>
                         
                            
                        </tbody>
                    </table>
                </div>
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
