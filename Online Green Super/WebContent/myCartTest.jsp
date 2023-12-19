 <%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <title>My Cart</title>
    
</head>

<body>
    <%@include file="header.jsp" %>
    <div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>

    <%
    String msg = request.getParameter("msg");

    if ("notPossible".equals(msg)) {
    %>
    <script>
        alert("There is only One Quantity! So click on remove!");
    </script>
    <% } %>
    <% if ("inc".equals(msg)) { %>
    <script>
        alert("Product Increased Successfully!");
    </script>
    <% } %>

    <% if ("dec".equals(msg)) { %>
    <script>
        alert("Product Decreased Successfully!");
    </script>
    <% } %>

    <% if ("removed".equals(msg)) { %>
    <script>
        alert("Product  Successfully removed!");
    </script>
    <% } %>

    <section class="items-center lg:flex bg-gray-50 lg:h-screen font-poppins dark:bg-gray-800 ">
        <div class="justify-center flex-1 max-w-6xl px-4 py-4 mx-auto lg:py-8 md:px-6">
            <div class="pt-4 bg-white rounded shadow dark:bg-gray-900">
                <div class="flex px-6 pb-4 border-b dark:border-gray-700">
                    <h2 class="text-xl font-bold dark:text-gray-400">Cart</h2>
                </div>
                <div class="p-4 overflow-x-auto">
                    <table class="w-full table-auto">
                        <thead>
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
                                %>

                            <tr class="text-xs text-left text-gray-500 dark:text-gray-400">
                                <th class="px-6 pb-3 font-medium">Cart ID</th>
                                <th class="px-6 pb-3 font-medium ">Product Name </th>
                                <th class="px-6 pb-3 font-medium">Category </th>
                                <th class="px-6 pb-3 font-medium">Quantity </th>
                                <th class="px-6 pb-3 font-medium"> Sub Total</th>
                                <th class="px-6 pb-3 font-medium"> Remove</th>
                            </tr>
                        </thead>
                        <tbody>


                               <%
                                ResultSet rs = st.executeQuery(
                                    "SELECT * FROM products INNER JOIN cart ON products.id=cart.product_id AND cart.email='" +
                                    email + "' AND cart.address IS NULL ");
                                while (rs.next()) {
                                    sno = sno + 1;
                                %>


                            <tr class="text-xs bg-gray-100 dark:text-gray-400 dark:bg-gray-800">
                                <td class="px-6 py-5 font-medium"><%= sno %></td>
                                <td class="px-6 py-5 font-medium "><%= rs.getString(2) %></td>
                                
                                <td>
                                    <span
                                        class="inline-block px-2 py-1 text-center text-green-600 bg-green-100 rounded-full dark:text-green-700 dark:bg-green-200"><%= rs.getString(3) %></span>
                                </td>

                                

                                <td><a href="incDecQuantityAction.jsp?id=<%= rs.getString(1) %>&quantity=inc"><i class='bi bi-plus-circle-fill'></i></a> <%= rs.getString(8) %> <a
                                href="incDecQuantityAction.jsp?id=<%= rs.getString(1) %>&quantity=dec"><i class='bi bi-dash-circle-fill'></i></a></td>

                                <td class="px-6 py-5 font-medium "><%= rs.getString(10) %> </td>

                                <td class="px-6 py-5 ">
                                    <a href="removeFromCart.jsp?id=<%= rs.getString(1) %>"
                                        class="px-4 py-2 font-medium text-teal-500 border border-teal-500 rounded-md dark:text-teal-300 dark:border-teal-300 dark:hover:bg-teal-300 dark:hover:text-gray-700 hover:text-gray-100 hover:bg-teal-500">Remove
                                    </a>
                                </td>
                            </tr>

                            <%
                                }
                                } catch (Exception e) {
                                    e.printStackTrace(); // Log the exception for debugging
                                } finally {
                                    try {
                                        // Close resources in the reverse order of their creation
                                        if (st != null) {
                                            st.close();
                                        }
                                        if (con != null) {
                                            con.close();
                                        }
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                }
                                %>
                   
                       </tbody>
                    </table>
                    <div class=" justify-center items-center   bg-green-600 px-5 py-3 grid grid-cols-3 sm:justify-items-center">
		              <h1 class="text-2xl font-bold uppercase text-white">Total</h1>
		              <h1 class="text-2xl font-bold uppercase text-white"><%= total %></h1>
		              <a href="addressPaymentForOrder.jsp">
		              <button  class="rounded-lg bg-white px-2 py-2">Checkout -></button></a>
		            </div>
                </div>
            </div>
        </div>
    </section>


<%@include file="footer.jsp" %>
</body>

</html>
