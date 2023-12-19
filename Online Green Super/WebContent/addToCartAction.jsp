<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>

<%
try {
    String email = (String) session.getAttribute("email");

    if (email == null || email.isEmpty()) {
        response.sendRedirect("login.jsp"); // Redirect to login page if the user is not logged in
    } else {
        String product_id = request.getParameter("id");
        int quantity = 1;
        int product_price = 0;
        int product_total = 0;
        int cart_total = 0;

        int z = 0;

        try (Connection con = DBConnect.getConn()) {
            // Use prepared statements to prevent SQL injection
            try (PreparedStatement psProducts = con.prepareStatement("SELECT * FROM products WHERE id=?")) {
                psProducts.setString(1, product_id);
                try (ResultSet rs = psProducts.executeQuery()) {
                    while (rs.next()) {
                        product_price = rs.getInt(4);
                        product_total = product_price;
                    }
                }
            }

            try (PreparedStatement psCart = con.prepareStatement("SELECT * FROM cart WHERE product_id=? AND email=? AND address IS NULL")) {
                psCart.setString(1, product_id);
                psCart.setString(2, email);
                try (ResultSet rs1 = psCart.executeQuery()) {
                    while (rs1.next()) {
                        cart_total = rs1.getInt(5);
                        cart_total = cart_total + product_total;
                        quantity = rs1.getInt(3);
                        quantity = quantity + 1;
                        z = 1;
                    }
                }
            }

            if (z == 1) {
                try (PreparedStatement psUpdate = con.prepareStatement("UPDATE cart SET total=?, quantity=? WHERE product_id=? AND email=? AND address IS NULL")) {
                    psUpdate.setInt(1, cart_total);
                    psUpdate.setInt(2, quantity);
                    psUpdate.setString(3, product_id);
                    psUpdate.setString(4, email);
                    psUpdate.executeUpdate();
                }
                response.sendRedirect("home.jsp?msg=exist");
            }

            if (z == 0) {
                try (PreparedStatement psInsert = con.prepareStatement("INSERT INTO cart(email, product_id, quantity, price, total) VALUES (?, ?, ?, ?, ?)")) {
                    psInsert.setString(1, email);
                    psInsert.setString(2, product_id);
                    psInsert.setInt(3, quantity);
                    psInsert.setInt(4, product_price);
                    psInsert.setInt(5, product_total);
                    psInsert.executeUpdate();
                }
                response.sendRedirect("home.jsp?msg=added");
            }
        } catch (Exception e) {
            // Log or print the stack trace for debugging
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            System.out.println(sw.toString());

            response.sendRedirect("home.jsp?msg=invalid");
        }
    }
} catch (Exception e) {
    // Handle any unexpected exceptions
    e.printStackTrace();
}
%>
