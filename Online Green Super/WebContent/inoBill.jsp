<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>


<html>
<head>
    <title>Invoice GSM</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>


    
<%
    String email=session.getAttribute("email").toString();

   try{
	   
	   int total=0;
	   int sno=0;
	   Connection con = DBConnect.getConn();
	   Statement st=con.createStatement();
	   ResultSet rs=st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
	   while(rs.next())
	   {
		   total=rs.getInt(1);
	   }
	   
	   ResultSet rs1=st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
	   while(rs1.next())
	   {
		   
	
%>

<div class="h-screen bg-gray-100">
    <div class="bg-white p-6 md:mx-auto">
        
        <div class="text-center">
        
	       <div class="flex items-center justify-center">
			  <img alt="logo" src="assets/G-logo.png" class="w-16 h-16">
			  <h3 class="text-2xl font-bold text-gray-900 md:text-2xl">Green Super Market</h3>
			</div>

            
            <h3 class="text-center mt-5 border-b text-xl font-bold text-gray-900 md:text-2xl">Invoice</h3>
            
            
             <div class="flex mt-5 pt-3 justify-center items-center mx-auto">
                <div class=" mx-auto   ">
                    <table class="w-full text-left text-sm text-gray-500 rtl:text-right dark:text-gray-400">
                        <thead class="bg-gray-50 text-xs uppercase text-gray-700 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                                <th scope="col" class="px-6 py-3">Invoice</th>
                                <th scope="col" class="px-6 py-3">Details</th>
                                <th scope="col" class="px-6 py-3">Invoice</th>
                                <th scope="col" class="px-6 py-3">Details</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Name : </th>
                                <td class="px-6 py-4"><%= rs1.getString(1) %></td>
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Email:</th>
                                <td class="px-6 py-4"><%out.println(email); %></td>
                            </tr>

                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Mobile Number:</th>
                                <td class="px-6 py-4"><%= rs1.getString(3) %></td>
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Address:</th>
                                <td class="px-6 py-4"><%= rs1.getString(4) %></td>
                            </tr>

                            
                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Order Date:</th>
                                <td class="px-6 py-4"><%= rs1.getString(14) %></td>
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Expected Delivery Date:</th>
                                <td class="px-6 py-4"><%= rs1.getString(15) %></td>
                            </tr>
                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Payment Method:</th>
                                <td class="px-6 py-4"><%= rs1.getString(16) %></td>
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Transaction Id:</th>
                                <td class="px-6 py-4"><%= rs1.getString(17) %></td>
                            </tr>
							  <% break;} %>

                            
                        </tbody>
                    </table>
           
        
      
            
            <div class="flex mt-5 pt-3 justify-center items-center mx-auto">
                <div class=" mx-auto   ">
                    <table class="w-full text-left text-sm text-gray-500 rtl:text-right dark:text-gray-400">
                        <thead class="bg-gray-50 text-xs uppercase text-gray-700 dark:bg-gray-700 dark:text-gray-400">
						    <tr>
						        <th scope="col" class="px-6 py-3">ID</th>
						        <th scope="col" class="px-6 py-3">Product Name</th>
						        <th scope="col" class="px-6 py-3">Category</th>
						        <th scope="col" class="px-6 py-3">Price</th>
						        <th scope="col" class="px-6 py-3">Quantity</th>
						        <th scope="col" class="px-6 py-3">Sub Total</th>
						    </tr>
						</thead>

                        <tbody>
                        
                         <%
       
						       ResultSet rs2 = st.executeQuery("SELECT * FROM cart INNER JOIN products where cart.product_id=products.id and cart.email='"+email+"' AND cart.status='bill'");
						       while(rs2.next())
						       {
						    	   sno=sno+1;
						       
						       
						       %> 

                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                               
                                    <td class="px-6 py-4"><%=rs2.getString(2) %></td>
									<td class="px-6 py-4"><%=rs2.getString(15) %></td>
									<td class="px-6 py-4"><%=rs2.getString(16) %></td>
									<td class="px-6 py-4"><%=rs2.getString(17) %></td>
									<td class="px-6 py-4"><%=rs2.getString(3) %></td>
									<td class="px-6 py-4"><%=rs2.getString(5) %></td>

                            </tr>
<%} %>
                            
                         
                            
                        </tbody>
                    </table>
                </div>
            </div>
               </div>
            </div>  

             <a href="proccessing.jsp"><button type="submit" class="bg-green-600 text-lg font-semibold px-4 py-2 text-white mt-6
			        ">Go to My Account</button></a>
			        
			         <button type="submit" class="bg-green-600 text-lg font-semibold px-4 py-2 text-white mt-6
			        " onClick="window.print();">Print Invoice</button>
            

        </div>
    </div>
</div>


<%
   }
   catch(Exception e)
   {
	   System.out.println(e);
   }
   
%>

</body>
</html>
