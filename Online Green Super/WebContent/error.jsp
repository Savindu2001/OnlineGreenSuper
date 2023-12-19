<%@page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div class="bg-gray-700 bg-[url('assets/bg.jpg')] bg-center bg-no-repeat bg-blend-multiply">
  <div class="mx-auto max-w-screen-xl px-4 py-24 text-center lg:py-56">
    <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-white md:text-5xl lg:text-6xl">Something Went Wrong! Try Again!</h1>
    <p class="mb-8 text-lg font-normal text-gray-300 sm:px-16 lg:px-48 lg:text-xl">If you have any Problem please Contact Us.</p>
    <div class="flex flex-col space-y-4 sm:flex-row sm:justify-center sm:space-y-0">
      <a href="login.jsp" class="inline-flex items-center justify-center rounded-lg bg-green-500 px-5 py-3 text-center text-base font-medium text-white hover:bg-green-600 focus:ring-4 focus:ring-blue-300 dark:focus:ring-blue-900">
        Log Again
        <svg class="ms-2 h-3.5 w-3.5 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
        </svg>
      </a>
      <a href="contact.jsp" class="inline-flex items-center justify-center rounded-lg border border-white px-5 py-3 text-center text-base font-medium text-white hover:bg-gray-100 hover:text-gray-900 focus:ring-4 focus:ring-gray-400 sm:ms-4"> Contact Us </a>
    </div>
  </div>
</div>


<%@include file="footer.jsp" %>
</body>
</html>