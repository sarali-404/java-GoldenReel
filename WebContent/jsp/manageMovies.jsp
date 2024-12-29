<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="services.filmpageservices" %>
<%@ page import="model.movie" %>

    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Movies</title>
    <link rel="stylesheet" href="css/adminstyles.css">
    <link href="https://fonts.googleapis.com/css2?family=Sawarabi+Mincho&display=swap" rel="stylesheet">

</head>
<body>
    <header class="navbar navbar-dark bg-dark">
        <div class="nav">
            <span class="navbar-brand">Golden Reel</span>
        </div>
        <nav class="navbar-nav">
            <a href="adminDashboard.html" class="nav-link">Dashboard</a>
            <a href="manageMovies.jsp" class="nav-link active">Manage Movies</a>
            <a href="manageShowtimes.jsp" class="nav-link">Manage Showtimes</a>
            <a href="viewFeedbacks.jsp" class="nav-link">View Feedbacks</a>
             <button class="btn btn-warning btn-sm ms-auto" onclick="location.href='admin_login.jsp'">Login</button>
        </nav>
    </header>

   <!-- Table Section -->
    <div class="container">
        <h1>Manage Movies</h1>
        <button class="btn add-new-btn" onclick="location.href='addMovie.html'">Add New Movie</button>

        <!-- Table for Movie Data -->
        <table class="movie-table">
            <thead>
                <tr>
                    <th>Movie ID</th>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Format</th>
                    <th>Language</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Trailer URL</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    filmpageservices service = new filmpageservices();
                    List<movie> movies = service.getAllMovies();
                    for (movie m : movies) {
                %>
                    <tr>
                        <td><%= m.getMovieId() %></td>
                        <td><%= m.getTitle() %></td>
                        <td><%= m.getGenre() %></td>
                        <td><%= m.getFormat() %></td>
                        <td><%= m.getLanguage() %></td>
                        <td><%= m.getDescription() %></td>
                        <td><img src="<%= m.getImageUrl() %>" alt="<%= m.getTitle() %> Image" width="100" height="150"></td>
                        <td><%= m.getTrailerUrl() %></td>
                        <td><%= m.getStatus() %></td>
                        <td>
						<form action="deleteMovies" method="post" id="form-<%= m.getMovieId() %>">
						    <input type="hidden" name="movieId" value="<%= m.getMovieId() %>" />
						    <button type="button" class="btn delete-btn" onclick="confirmDelete(<%= m.getMovieId() %>)">Delete</button>
						</form>

						</td>

                    </tr>
                <% } %>
            </tbody>
        </table>
        
        
    </div>
   <script>
   function confirmDelete(movieId) {
	    console.log("Confirm delete called for movie ID: " + movieId);

	    if (confirm("Are you sure you want to delete this movie?")) {
	        // Look for the form by ID, e.g., form-11
	        const form = document.getElementById("form-" + movieId);
	        console.log("Form found: ", form);  // Debugging

	        if (form) {
	            // Now we get the movieId from the hidden input field within the form
	            const movieIdInput = form.querySelector('input[name="movieId"]'); // Get the hidden input field
	            const movieIdValue = movieIdInput.value;  // Get the value of the hidden input
	            console.log("movieId from form: ", movieIdValue);  // Debugging

	            if (movieIdValue) {
	                form.submit();  // Submit the form if movieId is valid
	            } else {
	                alert("Movie ID not found in the form.");
	            }
	        } else {
	            alert("Form not found. Please check if the form ID matches.");
	        }
	    } else {
	        alert("Action canceled.");
	    }
	}

</script>

</body>
</html>