<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
    <%@ page import="services.feedbackService" %>
<%@ page import="model.feedback" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Sawarabi+Mincho&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/feedbacks.css">
    <title>View Feedback</title>
</head>
<body>
    <!-- Header -->
    <header class="navbar navbar-dark bg-dark fixed-top">
        <div class="nav">
            <span class="navbar-brand">Golden Reel</span>
        </div>
        <div class="d-flex align-items-center">
            <!-- Right Side: Navigation Links -->
            <nav class="navbar-nav d-flex flex-row" >
                <a href="adminDashboard.html" class="nav-link">Dashboard</a>
                <a href="manageMovies.jsp" class="nav-link">Manage Movies</a>
                <a href="manageShowtimes.jsp" class="nav-link">Manage Showtimes</a>
                <a href="viewFeedbacks.jsp" class="nav-link">View Feedbacks</a>
            </nav>
            
           <!-- Right Side: Logout Button -->
  <button class="btn btn-warning btn-sm ms-auto" onclick="location.href='admin_login.jsp'">Login</button>
    </div>
    </header>
    
   <div class="feedbacks-container">
        <h1>Feedbacks</h1>
     
        <table class="feedbacks-table">
            <thead>
                <tr>
                    <th>Feedback_ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Rating</th>
                    <th>Created_at</th>
                    <th>Feedback Text</th>
                </tr>
            </thead>
            <tbody id="feedbacks-body">
                <%
                    // Fetch feedbacks using feedbackService
                    feedbackService service = new feedbackService();
                    List<feedback> feedbacks = service.getAllFeedback();
                    
                    // Loop through the feedback list and display each feedback in the table
                    for (feedback fb : feedbacks) {
                %>
                    <tr>
                    	<td><%= fb.getFeedback_id() %></td>
                        <td><%= fb.getName() %></td>
                        <td><%= fb.getEmail() %></td>
                        <td><%= fb.getRating() %></td>
                        <td><%= new java.util.Date().toString() %></td> 
                        <td><%= fb.getFeedback_text() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        
    </div>

    
</body>
</html>
