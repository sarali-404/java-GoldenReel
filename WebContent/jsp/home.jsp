<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.movie" %>
<%@ page import="services.MovieService" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Sawarabi+Mincho&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="css/home.css?v=1.0">
    
    <link rel="stylesheet" href="css/style.css">


    <title>Golden Reel</title>
</head>

<body>
    <header>
        <nav>
            <ul>
                <li class="logo">Golden Reel</li>
                <div class="items">
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="aboutus.html">About Us</a></li>
                    <li><a href="feedback.jsp">Feedbacks</a></li>
                    <li><a href="login.jsp">Login</a></li>
                </div>
                <li class="search-icon">
                    <input type="search" placeholder="Search movies">
                    <label class="icon">
                        <span class="fas fa-search"></span>
                    </label>
                    
                </li>
            </ul>
        </nav>
    </header>
    
    <section class="hero-section">
        <div class="hero-content">
          
            <h1>Golden Reels</h1>
          <p> endless memories</p>
          <button class="book-now-btn">Book Now</button>
        </div>
      </section>
 
<%
    MovieService movieService = new MovieService();
    List<movie> nowShowingMovies = movieService.getMoviesByStatus("Now Showing");
    List<movie> comingSoonMovies = movieService.getMoviesByStatus("Coming Soon");
%>

<!-- Now Showing Movies -->
<section class="now-showing">
    <h2 class="section-heading">Now Showing</h2>
    <div class="movie-grid">
        <% 
            if (nowShowingMovies != null && !nowShowingMovies.isEmpty()) {
                for (movie m : nowShowingMovies) { 
        %>
                    <div class="movie-card">
                        <div class="movie-poster">
                            <img src="<%= m.getImageUrl() %>" alt="<%= m.getTitle() %>">
                        </div>
                        <div class="movie-info">
                            <h3 class="movie-title"><%= m.getTitle() %></h3>
                            <a href="Filmpageservlet?movieId=<%= m.getMovieId() %>" class="btn book-btn">Book Tickets</a>

                            
                        </div>
                    </div>
        <% 
                }
            } else { 
        %>
            <p class="no-movies">No movies currently showing.</p>
        <% 
            } 
        %>
    </div>
</section>

<!-- Coming Soon Movies -->
<section class="coming-soon">
    <h2 class="section-heading">Coming Soon</h2>
    <div class="movie-grid">
        <% 
            if (comingSoonMovies != null && !comingSoonMovies.isEmpty()) {
                for (movie m : comingSoonMovies) { 
        %>
                    <div class="movie-card">
                        <div class="movie-poster">
                              <img src="<%= m.getImageUrl() %>" alt="<%= m.getTitle() %>">
                        </div>
                        <div class="movie-info">
                            <h3 class="movie-title"><%= m.getTitle() %></h3>
                           <a href="<%= m.getTrailerUrl() %>" class="btn details-btn" target="_blank">Watch Trailer</a>

                        </div>
                    </div>
        <% 
                }
            } else { 
        %>
            <p class="no-movies">No upcoming movies at the moment.</p>
        <% 
            } 
        %>
    </div>
</section>

<footer class="footer">
    <div class="footer-content">
        <!-- About Section -->
        <div class="footer-section about">
            <h3>About ABC Cinema</h3>
            <p>ABC Cinema offers a premier movie experience with the latest releases, comfortable seating, and a range of snacks. Join us for a fantastic viewing experience!</p>
        </div>

        <!-- Links Section -->
        <div class="footer-section links">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Now Showing</a></li>
                <li><a href="#">Coming Soon</a></li>
                <li><a href="#">Your Tickets</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">Terms & Conditions</a></li>
                <li><a href="#">Privacy Policy</a></li>
            </ul>
        </div>

        <!-- Contact Section -->
        <div class="footer-section contact">
            <h3>Contact Us</h3>
            <p>Address: 123 Movie Lane, Film City, FC 12345</p>
            <p>Phone: +1 (555) 123-4567</p>
            <p>Email: support@abccinema.com</p>
        </div>

        <!-- Social Media Section -->
        <div class="footer-section social">
            <h3>Follow Us</h3>
            <a href="#"><img src="images/icons8-facebook-50.png" alt="Facebook"></a>
            <a href="#"><img src="images/x.png" alt="Twitter"></a>
            <a href="#"><img src="images/icons8-instagram-50.png" alt="Instagram"></a>
            <a href="#"><img src="images/icons8-youtube-50.png" alt="YouTube"></a>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 ABC Cinema. All Rights Reserved.</p>
    </div>
</footer>


</body>
</html>

            
