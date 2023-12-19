<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>My Orders GSM</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%@include file="header.jsp" %>



    


<div class="bg-gray-100">
    <div class="bg-white p-6 md:mx-auto">
    
    <div class="text-center">
        
	       <div class="flex items-center justify-center">
			  <img alt="logo" src="assets/G-logo.png" class="w-16 h-16">
			  <h3 class="text-2xl font-bold text-gray-900 md:text-2xl">Green Super Market</h3>
			</div>

            
            <h3 class="text-center mt-5  text-xl font-bold text-gray-900 md:text-2xl">My Orders</h3>
        
        
            
            
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
                                <th scope="col" class="px-6 py-3">Order Date</th>
                                <th scope="col" class="px-6 py-3">Delivery date</th>
                                <th scope="col" class="px-6 py-3">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                        
					 <%
								    String email=session.getAttribute("email").toString();
								
								int total=0;
								int sno=0;
								
								   try{
									   
									   
									   Connection con = DBConnect.getConn();
									   Statement st=con.createStatement();
									   ResultSet rs=st.executeQuery("select * from cart inner join products where cart.product_id=products.id and cart.email='"+email+"' and cart.orderDate is not NULL");
									   while(rs.next())
									   {
										  sno=sno+1;
									    
	
                     %>

                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                <td scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white"><%out.println(sno); %></td>
                                <td class="px-6 py-4"><%=rs.getString(15) %></td>
                                <td scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white"><%=rs.getString(16) %></td>
                                <td class="px-6 py-4"><%=rs.getString(17) %></td>
                                <td scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white"><%=rs.getString(3) %></td>
                                 <td class="px-6 py-4"><%=rs.getString(9) %></td>
                                 <td scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white"><%=rs.getString(10) %></td>
                                 <td class="px-6 py-4"><%=rs.getString(13) %></td>
                            </tr>
                          <%
								   }
							   }
							   catch(Exception e)
							   {
								   System.out.println(e);
							   }
							
							%>   
							                              
                        </tbody>
                    </table>
                </div>
            </div>
            
             <a href="shop.jsp"><button type="submit" class="bg-green-600 text-lg font-semibold px-4 py-2 text-white mt-6
			        ">Shop Now</button></a>

        </div>
        </div>

						 

                          
        
        
            
           
            

            
			        
			        
            

</div>



<%@include file="footer.jsp" %>
</body>
</html>
