package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.feedback;
import services.feedbackService;


import java.io.IOException;


@WebServlet("/getFeedback")
public class getFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public getFeedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Retrieve the form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String rating = request.getParameter("rating");
        String feedback_text = request.getParameter("message");
        
        
        // Create a new Feedback object
        feedback fb = new feedback();  
        fb.setName(name);
        fb.setEmail(email);
        fb.setRating(rating);
        fb.setFeedback_text(feedback_text);
        
        try {
        	
        	 feedbackService service = new feedbackService();
             service.saveFeedback(fb);
             request.setAttribute("successMessage", "Thank you for your feedback!");
             
		} catch (Exception e) {
			
			 e.printStackTrace();

		     request.setAttribute("errorMessage", "Something went wrong. Please try again.");
			
		}

     // Forward back to the feedback page
        request.getRequestDispatcher("feedback.jsp").forward(request, response);
        
    }
}


