<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
Connection con = null;
Statement st = null;

try {
    con = DBConnect.getConn();
    st = con.createStatement();
    
    // SQL query to create the "users" table
    String q1 = "CREATE TABLE users (" +
                 "name VARCHAR(50), " +
                 "email VARCHAR(50) PRIMARY KEY, " +
                 "mobileNumber VARCHAR(10), " +
                 "address VARCHAR(60), " +
                 "password VARCHAR(15))";
    
    // SQL query to create the "products" table
    String q2 = "CREATE TABLE products (" +
            "id INT, " +
            "name VARCHAR(500), " +
            "category VARCHAR(50), " +
            "price INT, " +
            "active VARCHAR(10), " +
           "image_url VARCHAR(255))";
    
    String q3 = "CREATE TABLE cart (email varchar(100),product_id int,quantity int,price int,total int,address varchar(500),city varchar(50),mobileNumber bigint, orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100), paypalTransactionId varchar(100), status varchar(100))";

    String q4 = "Create Table message(id int AUTO_INCREMENT, email varchar(100),subject varchar(200),messageBody varchar(1000), PRIMARY KEY(id))";
    // Execute the SQL queries
    
    //st.executeUpdate(q1);
    //st.executeUpdate(q2);
    //st.executeUpdate(q3);
    //st.executeUpdate(q4);
    
    
    
} catch (SQLException e) {
    // Handle SQL exceptions (print or log the exception details)
    e.printStackTrace();
} catch (Exception e) {
    // Handle other exceptions (print or log the exception details)
    e.printStackTrace();
} finally {
    // Close the Statement and Connection in a finally block to ensure they are closed
    try {
        if (st != null) {
            st.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    try {
        if (con != null) {
            con.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
