<%@ page import="java.util.List" %>
<%@ page import="model.movie" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href= "css/payment.css">
    <title>Golden Reel - Payment</title>
    
    
    
</head>
<body>
    <div class="container">
        <h1 class="my-4">Payment Details</h1>

        <%
            String seatsCount = "2";
            String totalPrice = "1000";
        %>

        <div class="alert alert-info">
            <h3>Booking Summary</h3>
            <p><strong>Seats Booked:</strong> <%= seatsCount %></p>
            <p><strong>Total Price:</strong> LKR<%= totalPrice %></p>
        </div>

        <form action="EmailServlet" method="POST">
            
                <label for="fullName">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required>
            
            
                <label for="email">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            
            
            <button type="submit" class="btn btn-primary mt-3">Confirm Payment</button>
        </form>

        <div id="paypal-button-container" class="paypal-button-container mt-5"></div>
        <script src="https://www.paypal.com/sdk/js?client-id=AQ8VOkr9PXWHCA0A2-gqzX3DlqkHm0I0GwBnQF7Bymuqxi6XpaWQCKidRgjnVadpdOdLg7jlm7yq-IJN&currency=USD"></script>

        <script> 
            const totalPrice = "<%= totalPrice %>";

            // Initialize PayPal Buttons
            window.onload = function() {
                paypal.Buttons({
                    createOrder: function(data, actions) {
                        return actions.order.create({
                            purchase_units: [{
                                amount: {
                                    value: totalPrice 
                                }
                            }]
                        });
                    },
                    onApprove: function(data, actions) {
                        return actions.order.capture().then(function(details) {
                            alert('Payment Successful! Thank you for your purchase, ' + details.payer.name.given_name);
                            window.location.href = `confirmPayment.jsp?paymentId=${details.id}&status=success`;
                        });
                    },
                    onCancel: function(data) {
                        alert('Payment was cancelled.');
                    },
                    onError: function(err) {
                        console.error('Error during PayPal payment:', err);
                        alert('An error occurred. Please try again later.');
                    }
                }).render('#paypal-button-container');
            }
        </script>
    </div>
</body>
</html>
