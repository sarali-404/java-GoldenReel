<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/signup.css">
    <title>ABC Cinema - Sign Up</title>
</head>
<body>
    <header>
        <nav>
            <ul>
                <li class="logo">Golden Reel</li>
                <div class="items">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Feedbacks</a></li>
                    <li><a href="login.html">Login</a></li>
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

    <section>
        <div class="signup-container">
            <form action="addUser" method="POST" class="signup-form">
                <h2>SIGN UP</h2>

           		<%-- Display error message if set --%>
				<% if (request.getAttribute("errorMessage") != null) { %>
    				<div class="alert alert-danger">
        		<%= request.getAttribute("errorMessage") %>
    				</div>
				<% } %>

                <div class="input-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" value="${name}" required>
                </div>

                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" value="${username}" required>
                </div>

                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${email}" required>
                </div>

                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <div class="input-group">
                    <label for="confirm-password">Re-enter Password</label>
                    <input type="password" id="confirm-password" name="confirm-password" required>
                </div>

                <button type="submit" class="signup-btn">Sign Up</button>
                
                
                

                <div class="login-link">
                    <p>Already have an account? <a href="login.html">Login</a></p>
                </div>
            </form>
        </div>
    </section>

                <div class="login-link">
                    <p>Already have an account? <a href="login.html">Login</a></p>
                </div>
            </form>
        </div>
    </section>
    
   
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
                <p><strong>Address:</strong> 123 Movie Lane, Film City, FC 12345</p>
                <p><strong>Phone:</strong> +1 (555) 123-4567</p>
                <p><strong>Email:</strong> support@abccinema.com</p>
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
