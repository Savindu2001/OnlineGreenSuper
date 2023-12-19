<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <title>Checkout</title>
    <script>
        if (window.history.forward(1) != null)
            window.history.forward(1);
    </script>


</head>

<body class="bg-gray-900">
    <div class="grid grid-cols-1 md:grid-cols-2">
        <!-- Left Side (Product Display) -->
        <div class="p-4">
            <section class="font-poppins items-center bg-gray-50 dark:bg-gray-800 lg:flex">
                <div class="mx-auto max-w-6xl flex-1 justify-center px-4 py-4 md:px-6 lg:py-8">
                    <div class="rounded bg-white pt-4 shadow dark:bg-gray-900">
                        <div class="flex border-b px-6 pb-4 dark:border-gray-700">
                            <h2 class="text-xl font-bold dark:text-gray-400">Your Full Cart</h2>
                        </div>
                        <div class="overflow-x-auto p-4">
                            <table class="w-full table-auto">
                                <thead>
                                    <!-- Add try-catch block for database operations -->
                                    <tr class="text-left text-xs text-gray-500 dark:text-gray-400">
                                        <th class="px-6 pb-3 font-medium">Cart ID</th>
                                        <th class="px-6 pb-3 font-medium">Product Name</th>
                                        <th class="px-6 pb-3 font-medium">Category</th>
                                        <th class="px-6 pb-3 font-medium">Quantity</th>
                                        <th class="px-6 pb-3 font-medium">Sub Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                    int total = 0; 
                                    int sno = 0; 
                                    Connection con = null; 
                                    Statement st = null; 
                                    try { 
                                        con = DBConnect.getConn(); 
                                        st = con.createStatement(); 
                                        String email = (String) session.getAttribute("email"); 
                                        PreparedStatement ps = con.prepareStatement("SELECT SUM(total) FROM cart WHERE email=? AND address IS NULL"); 
                                        ps.setString(1, email); 
                                        ResultSet rs1 = ps.executeQuery(); 
                                        while (rs1.next()) { 
                                            total = rs1.getInt(1); 
                                        } 
                                        ResultSet rs = st.executeQuery("SELECT * FROM products INNER JOIN cart ON products.id=cart.product_id AND cart.email='" + email + "' AND cart.address IS NULL "); 
                                        while (rs.next()) { 
                                            sno = sno + 1; 
                                    %>

                                    <tr class="bg-gray-100 text-xs dark:bg-gray-800 dark:text-gray-400">
                                        <td class="px-6 py-5 font-medium"><%= sno %></td>
                                        <td class="px-6 py-5 font-medium"><%= rs.getString(2) %></td>
                                        <td>
                                            <span class="inline-block rounded-full bg-green-100 px-2 py-1 text-center text-green-600 dark:bg-green-200 dark:text-green-700"><%= rs.getString(3) %></span>
                                        </td>
                                        <td><%= rs.getString(8) %></td>
                                        <td class="px-6 py-5 font-medium"><%= rs.getString(10) %></td>
                                    </tr>

                                    <%
                                        }
                                        
                                        ResultSet rs2=st.executeQuery("select * from users where email='"+email+"'");
                                        while(rs2.next())
                                        {
                                    %>
                                </tbody>
                            </table>

                            <!-- Add the PayPal button container -->
                            <div id="paypal-button-container"></div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- Right Side (Checkout Form) -->
        <div class="p-4">
            <form action="addressPaymentForOrdersAction.jsp" method="post" id="paymentForm">
                <div class="mx-auto rounded-md border bg-white p-8 shadow-md">
                    <h2 class="mb-6 text-3xl font-semibold">Checkout</h2>
                    <h2 class="mb-6 text-xl font-bold">Your Total : Rs : <%= total %> /=</h2>
                
                   <!-- User Name -->
                    <div class="mb-4">
                        <label for="address" class="mb-2 block text-sm font-medium text-gray-600">Email:  <%out.println(email); %></label>   
                    </div>

                    <!-- Address Input -->
                    <div class="mb-4">
                        <label for="address" class="mb-2 block text-sm font-medium text-gray-600">Enter Address</label>
                        <input type="text" id="address" name="address" class="form-input w-full rounded-lg bg-gray-300 py-2" value="<%=rs2.getString(4) %>" placeholder="Enter Address" />
                    </div>

                    <!-- City Input -->
                    <div class="mb-4">
                        <label for="city" class="mb-2 block text-sm font-medium text-gray-600">Enter City</label>
                        <input type="text" id="city" name="city"  class="form-input w-full rounded-lg bg-gray-300 py-2"  />
                    </div>
                    <!-- Mobile Number -->
                    <div class="mb-4">
                        <label for="mobileNumber" class="mb-2 block text-sm font-medium text-gray-600">Enter Mobile Number</label>
                        <input type="number" id="mobileNumber" name="mobileNumber"  class="form-input w-full rounded-lg bg-gray-300 py-2" value="<%=rs2.getString(3) %>" />
                    </div>

                    <!-- Payment Method -->
                    <div class="mb-4">
                        <label class="mb-2 block text-sm font-medium text-gray-600">Select Payment Method</label>
                        <select name="paymentMethod" class="form-select w-full rounded-lg bg-gray-300 py-2">
                            <option value="paypal">Online Payment</option>
                            <option value="bankCOD">Cash On Delivery </option>
                        </select>
                    </div>
                    
                    <input type="hidden" id="paypalTransactionId" name="paypalTransactionId" value="">
                    
                    
                    <!-- Pay Button -->
                    <div class="mb-4">
                        <button class="bg-green-600 py-4 px-6 w-full font-bold text-1xl text-white" type="submit"> Checkout Rs: <%= total %></button>
                    </div>
                    
                </div>
 
            </form>
        </div>
    </div>


    
    <%}}
          catch(Exception e){
        	  
          System.out.println(e);
          }
          
                                    %>
</body>

</html>
