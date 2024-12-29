<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="services.showtimeService" %>
<%@ page import="model.showtimes" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Showtimes</title>
    <link rel="stylesheet" href="css/adminstyles.css">
    <link href="https://fonts.googleapis.com/css2?family=Sawarabi+Mincho&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Header Section -->
    <header class="navbar navbar-dark bg-dark">
        <div class="nav">
            <span class="navbar-brand">Golden Reel</span>
        </div>
        <nav class="navbar-nav">
            <a href="adminDashboard.html" class="nav-link">Dashboard</a>
            <a href="manageMovies.jsp" class="nav-link">Manage Movies</a>
            <a href="manageShowtimes.jsp" class="nav-link active">Manage Showtimes</a>
            <a href="viewFeedbacks.jsp" class="nav-link">View Feedbacks</a>
             <button class="btn btn-warning btn-sm ms-auto" onclick="location.href='admin_login.jsp'">Login</button>
        </nav>
    </header>

    <!-- Content Section -->
    <div class="container">
        <h1>Manage Showtimes</h1>
        <button class="btn add-new-btn" onclick="location.href='addshowtime.html'">Add New Showtime</button>

        <!-- Showtime Table -->
        <table class="movie-table">
            <thead>
                <tr>
                    <th>Showtime ID</th>
                    <th>Movie ID</th>
                    <th>Showtimes</th>
                    <th>Action</th>
                    
                </tr>
            </thead>
            <tbody>
               <%
                    showtimeService service = new showtimeService();
                    List<showtimes> showtimeList = service.getAllShowtimes();

                    for (showtimes st : showtimeList) {
                %>
                     <tr>
                    <td><%= st.getShowtimeId() %></td>
                    <td><%= st.getMovieId() %></td>
                    <td>
                        <% for (String time : st.getShowtimes()) { %>
                            <%= time %><br>
                <% } %>
                    </td>
                    <td>
                        <form action="deleteShowtime" method="post">
                            <input type="hidden" name="showtimeId" value="<%= st.getShowtimeId() %>" />
                            <button type="submit" class="btn delete-btn">Delete</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
    </div>

    <script>
    function confirmDelete(showtimeId) {
        // Display a confirmation popup
        if (confirm("Are you sure you want to delete this showtime?")) {
            // Find the form by ID and submit it
            const form = document.getElementById("form-" + showtimeId);
            if (form) {
                form.submit();
            } else {
                alert("Form not found. Please check if the form ID matches.");
            }
        } else {
            // Action canceled by the user
            alert("Action canceled.");
        }
    }
</script>


</body>
</html>

