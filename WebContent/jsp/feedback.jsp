<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="css/feedback.css">
    <link rel="stylesheet" href="css/style.css">


    <title>ABC Cinema</title>
</head>

<body>
    <header>
        <nav>
            <ul>
                <li class="logo">Golden Reel</li>
                <div class="items">
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="aboutus.html">About Us</a></li>
                    <li><a href="Feedbacks.jsp">Feedbacks</a></li>
                    <li><a href="login.jsp">Login</a></li>
                </div>

                
          </section>            
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
          
           
        </div>
      </section>
      <main>
        <section class="feedback-section">
        <h2>Customer Feedback</h2>
        <p>Please share your thoughts below.</p>

        
        <!-- Feedback form -->
        <!-- Display success message -->
<% String successMessage = (String) request.getAttribute("successMessage"); %>
<% if (successMessage != null) { %>
    <div class="alert alert-success" role="alert">
        <%= successMessage %>
    </div>
<% } %>

<!-- Display error message -->
<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% if (errorMessage != null) { %>
    <div class="alert alert-danger" role="alert">
        <%= errorMessage %>
    </div>
<% } %>
        <form action="getFeedback" method="post" class="feedback-form">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Your Name" required value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>">
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Your Email" required value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
            </div>

            <div class="form-group">
                <label for="rating">Rating</label>
                <select id="rating" name="rating" required>
                    <option value="" disabled selected>Select Rating</option>
                    <option value="1" <%= "1".equals(request.getParameter("rating")) ? "selected" : "" %>>1 - Poor</option>
                    <option value="2" <%= "2".equals(request.getParameter("rating")) ? "selected" : "" %>>2 - Fair</option>
                    <option value="3" <%= "3".equals(request.getParameter("rating")) ? "selected" : "" %>>3 - Good</option>
                    <option value="4" <%= "4".equals(request.getParameter("rating")) ? "selected" : "" %>>4 - Very Good</option>
                    <option value="5" <%= "5".equals(request.getParameter("rating")) ? "selected" : "" %>>5 - Excellent</option>
                </select>
            </div>

            <div class="form-group">
                <label for="message">Feedback</label>
                <textarea id="message" name="message" rows="5" placeholder="Your Feedback" required><%= request.getParameter("message") != null ? request.getParameter("message") : "" %></textarea>
            </div>

            <button type="submit" class="submit-button">Submit</button>
        </form>
        
        
    </section>
      </main>
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
   
    
    <script src="Feedbacks.html"></script>
</body>
</html>