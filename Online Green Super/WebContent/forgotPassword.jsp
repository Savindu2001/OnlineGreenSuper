<!DOCTYPE html>
<html>
<head>

    <title>Green Supermarket</title>
    <%--Add Style CSS--%>
    <link rel="stylesheet" href="./assets/css/style.css">
    <%--Add Tailwind CDN Link--%>
    <script src="https://cdn.tailwindcss.com"></script>
    <%-- Add Iconic,io CDN  ( This is for icons )  --%>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

</head>
<body>
<%@include file="header.jsp" %>

<div class="flex items-center justify-center min-h-screen bg-gray-100">
  <form action="forgotPasswordAction.jsp" method="post" class="relative flex flex-col m-6 space-y-8 bg-white shadow-2xl rounded-2xl md:flex-row md:space-y-0">
    <!-- left side -->
    <div class="flex flex-col justify-center p-8 md:p-14">
      <span class="mb-3 text-4xl font-bold text-green-500">Get New Password</span>
      <span class="font-light text-black-400 mb-8">
        Change Your Password Now!
      </span>
      <!-- Existing input fields for email and password -->
      <div class="py-4">
        <span class="mb-2 text-md">Email</span>
        <input
          type="email"
          class="w-full p-2 border border-gray-300 rounded-md placeholder:font-light placeholder:text-gray-500"
          name="email"
          id="email"
          required
        />
      </div>
      <div class="py-4">
        <span class="mb-2 text-md">Mobile Number</span>
        <input
          type="number"
          name="mobileNumber"
          id="mobileNumber"
          required
          class="w-full p-2 border border-gray-300 rounded-md placeholder:font-light placeholder:text-gray-500"
        />
      </div>
      <div class="py-4">
        <span class="mb-2 text-md">New Password</span>
        <input
          type="password"
          name="newPassword"
          id="newPassword"
          required
          class="w-full p-2 border border-gray-300 rounded-md placeholder:font-light placeholder:text-gray-500"
        />
      </div>
      
      <!-- Existing sign-in button -->
      <input type="submit" value="save"  class="w-full bg-green-500 text-white p-2 rounded-lg mb-6 hover:bg-black hover:text-green-500 black hover:border hover:border-gray-300">
      

      <div class="text-center text-gray-400">
        Don't have an account?<a href="signup.jsp">
        <span class="font-bold text-green-500">Sign up for free</span></a>
      </div>
      
    </div>
    <!-- right side -->
    <div class="relative">
      <img
        src="assets/login.jpg"
        alt="img"
        class="w-[400px] h-full hidden rounded-r-2xl md:block object-cover"
      />
      <!-- text on image -->
      <div
        class="absolute hidden bottom-10 right-6 p-6 bg-white bg-opacity-30 backdrop-blur-sm rounded drop-shadow-lg md:block"
      >
        <span class="text-white text-xl">
          "Welcome to Green Supermarket<br />Your Eco-Friendly
          Shopping Haven!<br />Happy shopping!"
        </span>
      </div>
    </div>
  </form>
</div>



<div class="bg-gray-800 py-8 flex items-center justify-center mx-auto">
  <% String msg = request.getParameter("msg"); if("done".equals(msg)) { %>
    <h1 class="font-sans text-2xl font-bold text-white">Password Changed Successfully!</h1>
  <% } %> 
  <% if("invalid".equals(msg)) { %>
    <h1 class="font-sans text-2xl font-bold text-red-500">Something Went Wrong! Try Again!</h1>
  <% } %>
</div>


<%@include file="footer.jsp" %>
</body>
</html>