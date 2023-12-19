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
<body >
<%@include file="header.jsp" %>

<div class="flex items-center justify-center min-h-screen bg-gray-100">
  <div
          class="relative flex flex-col m-6 space-y-8 bg-white shadow-2xl rounded-2xl md:flex-row md:space-y-0"
  >
    <!-- left side -->
    <div class="flex flex-col justify-center p-8 md:p-14">
      <span class="mb-3 text-4xl font-bold text-green-500">Register Now!</span>
      <span class="font-light text-black-400 mb-8">
            Register Now! Get 50% Discount as a New Member
          </span>

      <form action="signupAction.jsp" method="post">
      <div class="py-4">
        <span class="mb-2 text-md">Name</span>
        <input
                type="text"
                class="w-full p-2 border border-gray-300 rounded-md placeholder:font-light placeholder:text-gray-500"
                name="name"
                id="name"
                required
        />
      </div>
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
        <span class="mb-2 text-md">Phone</span>
        <input
                type="number"
                class="w-full p-2 border border-gray-300 rounded-md placeholder:font-light placeholder:text-gray-500"
                name="mobileNumber"
                id="mobileNumber"
                required
        />
      </div>
      <div class="py-4">
        <span class="mb-2 text-md">Delivery Address</span>
        <input
                type="text"
                class="w-full p-2 border border-gray-300 rounded-md placeholder:font-light placeholder:text-gray-500"
                name="address"
                id="address"
                required
        />
      </div>
      <div class="py-4">
        <span class="mb-2 text-md">Password</span>
        <input
                type="password"
                name="password"
                id="password"
                class="w-full p-2 border border-gray-300 rounded-md placeholder:font-light placeholder:text-gray-500"
                required
        />
      </div>

       
      <input type="submit" value="signup" class="w-full bg-green-500 text-white p-2 rounded-lg mb-6 hover:bg-black hover:text-green-500 black hover:border hover:border-gray-300">
        

      <div class="text-center text-gray-400">
        I have already an account?
        <a href="login.jsp"><span class="font-bold text-green-500">Sign in</span></a>
      </div>
    </div>
    <!-- {/* right side */} -->

    <div class="relative">
      <img
              src="assets/register.jpg"
              alt="img"
              class="w-[400px] h-full hidden rounded-r-2xl md:block object-cover"
      />
      <!-- text on image  -->
      <div
              class="absolute hidden bottom-10 right-6 p-6 bg-white bg-opacity-30 backdrop-blur-sm rounded drop-shadow-lg md:block"
      >
            <span class="text-white text-xl"
            >"Create an Account in<br />Your Eco-Friendly
              Shopping Haven!<br />Happy shopping!"
            </span>
      </div>
    </div>
  </div>
</div>
<div class="bg-gray-800 py-8 flex items-center justify-center mx-auto">
  <% String msg = request.getParameter("msg"); if("valid".equals(msg)) { %>
    <h1 class="font-sans text-2xl font-bold text-white">Successfully Registered!</h1>
  <% } %> 
  <% if("invalid".equals(msg)) { %>
    <h1 class="font-sans text-2xl font-bold text-red-500">Something Went Wrong! Try Again!</h1>
  <% } %>
</div>


<%@include file="footer.jsp" %>
</body>
</html>