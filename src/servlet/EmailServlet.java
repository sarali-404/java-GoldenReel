package servlet;

import java.io.IOException;
import java.util.Properties;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch parameters from the request
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        int seatsCount = 2;
        int totalPrice = 500 * seatsCount;
        
        

        // Email configuration
        String fromEmail = "malithashen50904@gmail.com"; 
        String emailPassword = "lmqi ddtx kapl tmfo"; 
        String smtpHost = "smtp.gmail.com";
        int smtpPort = 587;

        String subject = "Golden Reel Cinema Booking Confirmation";
        String messageContent = "Dear " + fullName + ",\n\n"
                + "Thank you for booking with Golden Reel Cinema!\n\n"
                + "Seats Booked: " + seatsCount + "\n"
                + "Total Price: ₹" + totalPrice + "\n\n"
                + "We look forward to welcoming you.\n\n"
                + "Best regards,\nGolden Reel Cinema Team";

        response.setContentType("text/html;charset=UTF-8");
        
        try {
            // Set email properties
            Properties props = new Properties();
            props.put("mail.smtp.host", smtpHost);
            props.put("mail.smtp.port", String.valueOf(smtpPort));
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            // Authenticate and start session
            Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, emailPassword);
                }
            });

            // Create the email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, "Golden Reel Cinema"));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject(subject);
            message.setText(messageContent);

            // Send the email
            Transport.send(message);

            // Success response
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('Payment confirmed! A confirmation email has been sent to " + email + "');");
            response.getWriter().println("window.location.href = 'payment.jsp';");
            response.getWriter().println("</script>");
} catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<div class='alert alert-danger'>Unexpected error: " + e.getMessage() + "</div>");
        }
    }
}
