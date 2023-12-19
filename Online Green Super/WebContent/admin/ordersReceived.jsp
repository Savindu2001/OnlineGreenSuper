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
  <%@include file="adminheader.jsp" %>
  
  <% 
String msg = request.getParameter("msg");

if ("cancel".equals(msg)) {
%>
    <script>
        alert("Order Cancel successfully!");
    </script>
<%
} 
if ("delivered".equals(msg)) {
%>
    <script>
        alert("Successfully Updated!");
    </script>
<%
}if ("invalid".equals(msg)) {
%>

 <script>
        alert("Something Went Wrong!");
    </script>
<%
}
%>

    
  
    <% String email=session.getAttribute("email").toString(); %>
    
    

 		      <div class="flex mt-5 pt-3 justify-center items-center mx-auto">
                <div class=" mx-10 pb-5   ">
                    <table class="w-full text-left text-sm text-gray-500 rtl:text-right dark:text-gray-400">
                        <thead class="bg-gray-50 text-sm uppercase text-gray-700 dark:bg-gray-700 dark:text-gray-400">
						    <tr>
						        <th scope="col" class="py-3">Mobile </th>
						        <th scope="col" class="py-3">Product</th>
						        <th scope="col" class="px-2 py-3">Qty</th>
						        <th scope="col" class="px-4 py-3">Tot</th>
						        <th scope="col" class="py-3">Add</th>
						        <th scope="col" class="py-3">City</th>
						        <th scope="col" class="py-3">O- Date</th>
						        <th scope="col" class="py-3">D- Date</th>
						        <th scope="col" class="py-3">Pay T-ID</th>
						        <th scope="col" class="py-3">Status</th>
						        <th scope="col" class="py-3">Cancel Order<i class="bi bi-x-octagon"></i></th>
						        <th scope="col" class="py-3">Order Delivered <i class="bi bi-send-check"></i></th>
						        
						    </tr>
						</thead>

                        <tbody>

<%


try{
	
	Connection con = DBConnect.getConn();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart inner join products where cart.product_id=products.id and cart.orderDate is not null and cart.status='processing'");
	while(rs.next())
	{
%>
                            <tr class="border-b bg-white font-thin dark:border-gray-700 dark:bg-gray-800">
                               
                                    <td class="px-2 py-3"><%=rs.getString(8) %></td>
									<td class="px-2 py-3"><%=rs.getString(15) %></td>
									<td class="px-2 py-3"><%=rs.getString(3) %></td>
									<td class="px-6 py-4"><img src="../assets/rs.png" class="w-8 h-8"><%=rs.getString(5) %></td>
									<td class="px-2 py-3"><%=rs.getString(6) %></td>
									<td class="px-2 py-3"><%=rs.getString(7) %></td>
									<td class="px-2 py-3"><%=rs.getString(9) %></td>
									<td class="px-2 py-3"><%=rs.getString(10) %></td>
									<td class="px-2 py-3"><%=rs.getString(12) %></td>
									<td class="px-2 py-3"><%=rs.getString(13) %></td>
									<td class="px-2 py-3 font-bold text-red-600"><a href="cancelOrdersAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Cancel<i class="bi bi-x-octagon text-red-600"></i></a></td>
									<td class="px-2 py-3 font-bold text-green-600"><a href="deliveredOrdersAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Delivered <i class="bi bi-send-check text-green-600"></i></a></td>
									

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
 
 
 
 


 










  </body>
</html>
