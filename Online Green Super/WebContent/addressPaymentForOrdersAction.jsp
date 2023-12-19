<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>PayNow GSM</title>
     <script src="https://cdn.tailwindcss.com"></script>
    <!-- Include necessary styles or scripts for PayPal integration -->
    <script src="https://www.paypal.com/sdk/js?client-id=AZgp7P9PdekIm3JhXEGtkgSyW9q-q9-2FkC2STCJEPicxd1q-tD4_zkczpjl9hqlwJAouJImlUanV85o&currency=USD"></script>
</head>
<body>
    

    <!-- Extract data from the request -->
    <% 
        String email = session.getAttribute("email").toString();
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String mobileNumber = request.getParameter("mobileNumber");
        String paymentMethod = request.getParameter("paymentMethod");
        String status = "bill";

        // Retrieve the total from session or wherever it is stored
        int total = 0;
        try {
            Connection con = DBConnect.getConn();
            PreparedStatement ps = con.prepareStatement("SELECT SUM(total) FROM cart WHERE email=? AND address IS NULL");
            ps.setString(1, email);
            ResultSet rs1 = ps.executeQuery();
            while (rs1.next()) {
                total = rs1.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }
        
        try {
            Connection con = DBConnect.getConn();

            // Update user details
            PreparedStatement ps = con.prepareStatement("update users set address=?, mobileNumber=? where email=?");
            ps.setString(1, address);
        	ps.setString(2, mobileNumber);
            ps.setString(3, email);
            ps.executeUpdate();

            // Update cart details
            PreparedStatement ps1 = con.prepareStatement("update cart set address=?, City=?, mobileNumber=?, orderDate=now(), deliveryDate=Date_ADD(orderDate, INTERVAL 7 DAY), paymentMethod=?, status=? where email=? and address is NULL");
            ps1.setString(1, address);
            ps1.setString(2, city);
            ps1.setString(3, mobileNumber);
            ps1.setString(4, paymentMethod); 
            ps1.setString(5, status); 
            ps1.setString(6, email); 
            ps1.executeUpdate();

            // Set the total attribute in the session
            session.setAttribute("total", total);

            // Display confirmation details
            %>
            
            
            
               <div class="flex mt-5 pt-3 justify-center items-center mx-auto">
                <div class=" mx-auto   ">
                <div class="bg-green-600 mx-auto py-2 px-4 flex  items-center">
				  <h1 class="text-xl font-bold text-white mx-auto">Confirmation To Payments</h1>
				</div>
                    <table class="w-full text-left text-sm text-gray-500 rtl:text-right dark:text-gray-400">
                        <thead class="bg-gray-50 text-xs uppercase text-gray-700 dark:bg-gray-700 dark:text-gray-400">
						    <tr>
						        <th scope="col" class="px-6 py-3">ID</th>
						        <th scope="col" class="px-6 py-3">Product Name</th>
						       
						    </tr>
						</thead>

                        <tbody>

                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                    <th scope="col" class="px-6 py-3">Email:</th>
                                    <td class="px-6 py-4"> <%= email %></td>
                                   
							</tr>
							<tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                    
                                    <th scope="col" class="px-6 py-3">Address:</th>
                                    <td class="px-6 py-4"> <%= address %></td>
							</tr>
							<tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                    <th scope="col" class="px-6 py-3">City:</th>
                                    <td class="px-6 py-4"> <%= city %></td>
                                    
                                   
							</tr>
							<tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                  
                                    <th scope="col" class="px-6 py-3">Mobile Number:</th>
                                    <td class="px-6 py-4"> <%= mobileNumber %></td>
							</tr>
							<tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                    <th scope="col" class="px-6 py-3">Payment Method:</th>
                                    <td class="px-6 py-4"><%= paymentMethod %></td>
                                    
							</tr>
							<tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                   
                                    <th scope="col" class="px-6 py-3 font-bold">Total:</th>
                                    <td class="px-6 py-4 font-bold"> <%= total %></td>
							</tr>

                            
                         
                            
                        </tbody>
                         
                    </table>
                    <div id="paypal-button-container"></div>
                </div>
               
            </div>
            
            
            
            
            
            
            
            
            
            

            <!-- Add PayPal integration logic here -->
            
            <script>
                paypal.Buttons({
                    createOrder: function(data, actions) {
                        return actions.order.create({
                            purchase_units: [{
                                amount: {
                                    value: '<%= total %>',
                                    currency: 'USD'
                                }
                            }]
                        });
                    },
                    onApprove: function(data, actions) {
                        return actions.order.capture().then(function(details) {
                            // Handle the successful payment here
                            console.log(details);
                            // Redirect to thankYou.jsp with the transaction ID
                            window.location.href = 'confirmation.jsp?paypalTransactionId=' + details.id +
                                '&email=' + '<%= email %>' +
                                '&address=' + '<%= address %>' +
                                '&city=' + '<%= city %>' +
                                '&mobileNumber=' + '<%= mobileNumber %>' +
                                '&paymentMethod=' + '<%= paymentMethod %>' +
                                '&total=' + '<%= total %>';
                        });
                    }
                }).render('#paypal-button-container');
            </script>
            <%
        } catch (Exception e) {
            e.printStackTrace();
            // Log the exception or handle it appropriately
        }
    %>
</body>
</html>
