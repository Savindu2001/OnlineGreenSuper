<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>


<html>
<head>
    <title>THANK YOU!</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

    
<%
    String paypalTransactionId = request.getParameter("paypalTransactionId");

    if (paypalTransactionId != null && !paypalTransactionId.isEmpty()) {
        try {
            Connection con = DBConnect.getConn();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM cart WHERE paypalTransactionId = ?");
            ps.setString(1, paypalTransactionId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
%>

<div class="h-screen bg-white">
    <div class="bg-white pt-28 p-6 md:mx-auto">
    <div class="flex items-center justify-center py-4 mb-2">
			  <img alt="logo" src="assets/G-logo.png" class="w-32 h-32">
			  
			</div>
        <div class="text-center">
            <h1 class="font-serif text-2xl font-bold text-green-600">Thank you for your order!</h1>
        </div>
        <svg viewBox="0 0 24 24" class="mx-auto my-6 h-16 w-16 text-green-600">
            <path fill="currentColor"
                d="M12,0A12,12,0,1,0,24,12,12.014,12.014,0,0,0,12,0Zm6.927,8.2-6.845,9.289a1.011,1.011,0,0,1-1.43.188L5.764,13.769a1,1,0,1,1,1.25-1.562l4.076,3.261,6.227-8.451A1,1,0,1,1,18.927,8.2Z">
            </path>
        </svg>
        <div class="text-center">
            <h3 class="text-center text-2xl font-bold text-gray-900 md:text-2xl">Payment Done!</h3>
            
                
			        <a href="inoBill.jsp">
			        <button type="submit" class="bg-green-600 text-lg font-semibold px-4 py-2 text-white mt-6
			        ">View Invoice</button></a>
			    



            <div class="hidden flex mt-5 pt-3 justify-center items-center mx-auto">
                <div class=" mx-auto   ">
                    <table class="w-full text-left text-sm text-gray-500 rtl:text-right dark:text-gray-400">
                        <thead class="bg-gray-50 text-xs uppercase text-gray-700 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                                <th scope="col" class="px-6 py-3">Order Items</th>
                                <th scope="col" class="px-6 py-3">Order Details</th>
                                <th scope="col" class="px-6 py-3">Order Items</th>
                                <th scope="col" class="px-6 py-3">Order Details</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Paypal Transaction Id:</th>
                                <td class="px-6 py-4"><%= paypalTransactionId %></td>
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Payment Method:</th>
                                <td class="px-6 py-4"><%= rs.getString("paymentMethod") %></td>
                            </tr>

                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Email:</th>
                                <td class="px-6 py-4"><%= rs.getString("email") %></td>
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Address:</th>
                                <td class="px-6 py-4"><%= rs.getString("address") %></td>
                            </tr>

                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">City:</th>
                                <td class="px-6 py-4"> <%= rs.getString("City") %></td>
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Mobile Number:</th>
                                <td class="px-6 py-4"><%= rs.getString("mobileNumber") %></td>
                            </tr>

                           

                            

                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Quantity:</th>
                                <td class="px-6 py-4"><%= rs.getInt("quantity") %></td>
                                 <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Total Amount:</th>
                                <td class="px-6 py-4 font-bold">Rs:<%= rs.getString("total") %></td>
                            </tr>

                            

                            <tr class="border-b bg-white dark:border-gray-700 dark:bg-gray-800">
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Order Date:</th>
                                <td class="px-6 py-4"><%= rs.getString("orderDate") %></td>
                                <th scope="row" class="whitespace-nowrap px-6 py-4 font-medium text-gray-900 dark:text-white">Expected Delivery Date:</th>
                                <td class="px-6 py-4"><%= rs.getString("deliveryDate") %></td>
                            </tr>

                            
                            
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>

<%
            } else {
%>

<p>No order found for PayPal Transaction ID: <%= paypalTransactionId %></p>

<%
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
    } else {
%>

<p>Invalid PayPal transaction ID</p>

<%
    }
%>

</body>
</html>
