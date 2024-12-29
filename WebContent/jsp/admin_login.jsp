<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="css/adminstyles.css">
    <link href="https://fonts.googleapis.com/css2?family=Sawarabi+Mincho&display=swap" rel="stylesheet">

</head>
<body>
    <!--Header-->
    <header class="navbar navbar-dark bg-dark">
        <div class="nav">
            <span class="navbar-brand">Golden Reel</span>
        </div>
            <!-- Right Side: Navigation Links -->
            <nav class="navbar-nav" >
               
            </nav>
    </header>
    <!--Login Form-->
    <div class="login-container">
        <h1>ADMIN LOGIN</h1> 
           <!-- Display error message -->
        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= errorMessage %>
            </div>
        <% } %>         
        <form action="loginAdmin" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit" class="enter-btn">Enter</button>
            
         <div class="register-link">
            <p><a href="login.jsp">Login as a user</a></p>
        </div>
        </form>
    </div>
</body>
</html>
