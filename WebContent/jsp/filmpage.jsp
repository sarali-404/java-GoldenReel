<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.movie" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONException" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sawarabi+Mincho&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/filmpage.css"> 
<title>Golden Reel - <%= request.getAttribute("title") %></title>
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

<div class="movie-page-container">
    <!-- Movie Banner -->
    <div class="movie-banner">
        <img src="<%= request.getAttribute("image_url") %>" alt="Movie Poster" class="movie-poster">
        <div class="movie-info">
            <h1 class="movie-title"><%= request.getAttribute("title") %></h1>
            <p><strong>Duration:</strong> <%= request.getAttribute("duration") %> | 
   			<strong>Release Date:</strong> <%= request.getAttribute("releaseDate") %> | 
   			<strong>Language:</strong> <%= request.getAttribute("language") %></p>
			<p><strong>Cast:</strong> <%= request.getAttribute("cast") %></p>
			<p><strong>Description:</strong> <%= request.getAttribute("description") %></p>
        </div>
    </div>

    <!-- Showtimes and Availability -->
    <div class="showtime-section">
        <div class="filters">
            <div class="price-range">Price: <%= request.getAttribute("price") %></div>
        </div>

        <div class="availability-status">
            <span class="available">✅ Available</span>
            <span class="filling-fast">⚡ Filling Fast</span>
        </div>

        <div class="cinema-list">
            <p><strong>Experience:</strong> 3D & 2D | <%= request.getAttribute("movieFormat") %></p>
            <div class="showtimes">
                <% 
                    String showtimesJson = (String) request.getAttribute("showtimes");
                    if (showtimesJson != null && !showtimesJson.isEmpty()) {
                        try {
                            JSONArray showtimesArray = new JSONArray(showtimesJson);
                            for (int i = 0; i < showtimesArray.length(); i++) {
                                String showtime = showtimesArray.getString(i);
                %>
                    <button class="time-btn"><%= showtime %></button>
                <%  
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>

<div class="seat-selection-container">
    <h3>Select Your Seats</h3>
    <div class="seat-section">
        <div class="row">
        <% 
            for (char row = 'A'; row <= 'J'; row++) {
        %>
            <div class="row">
                <% 
                    for (int seatNumber = 1; seatNumber <= 12; seatNumber++) { 
                %>
                    <div class="seat available" data-seat-id="<%= row %><%= seatNumber %>"><%= row %><%= seatNumber %></div>
                <% 
                    } 
                %>
            </div>
        <% 
            } 
        %>
        </div>
    </div>

    <!-- Screen -->
    <div class="screen"><b>Screen</b></div>

    <!-- Legend -->
    <div class="legend">
        <div class="legend-item"><span class="legend-available"></span>Available</div>
        <div class="legend-item"><span class="legend-reserved"></span>Reserved</div>
        <div class="legend-item"><span class="legend-selected"></span>Selected</div>
    </div>

    <button class="Booknow-btn">Book Now</button>
</div>

<script>
const seats = document.querySelectorAll('.seat');
let selectedSeats = [];

seats.forEach(seat => {
    seat.addEventListener('click', () => {
        // If the seat is already reserved, do nothing
        if (seat.classList.contains('reserved')) return;

        // Toggle the 'selected' class for the clicked seat
        seat.classList.toggle('selected');
        
        // Update the selectedSeats array
        const seatId = seat.getAttribute('data-seat-id'); // Use the data-seat-id attribute
        if (seat.classList.contains('selected')) {
            selectedSeats.push(seatId); // Add to selected seats
        } else {
            selectedSeats = selectedSeats.filter(seat => seat !== seatId); // Remove from selected seats
        }
        
        // Update the Book Now button with the selected seats
        document.querySelector('.Booknow-btn').textContent = `Book Now (${selectedSeats.length} Seat${selectedSeats.length > 1 ? 's' : ''})`;
    });
});

document.querySelectorAll('.time-btn').forEach(button => {
    button.addEventListener('click', () => {
        button.classList.toggle('red'); 
    });
});


function confirmBooking() {
    selectedSeats.forEach(seatId => {
        const seat = document.querySelector(`.seat[data-seat-id="${seatId}"]`);
        if (seat) {
            seat.classList.remove('selected');
            seat.classList.add('reserved');
            seat.style.backgroundColor = "red";  // Change the color to red
        }
    });

    // Get the seat count and total price
    const seatCount = selectedSeats.length;
    const totalPrice = seatCount * 500;  

    // Redirect to the payment page with seat count and price as parameters
    window.location.href = `payment.jsp?seats=${seatCount}&price=${totalPrice}`;

   
    selectedSeats = [];
    document.querySelector('.Booknow-btn').textContent = 'Booking Confirmed';
}


document.querySelector('.Booknow-btn').addEventListener('click', confirmBooking);

</script>

<footer class="footer">
    <div class="footer-content">
        <div class="footer-section about">
            <h3>About ABC Cinema</h3>
            <p>ABC Cinema offers a premier movie experience with the latest releases, comfortable seating, and a range of snacks. Join us for a fantastic viewing experience!</p>
        </div>
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
        <div class="footer-section contact">
            <h3>Contact Us</h3>
            <p>Address: 123 Movie Lane, Film City, FC 12345</p>
            <p>Phone: +1 (555) 123-4567</p>
            <p>Email: support@abccinema.com</p>
        </div>
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
