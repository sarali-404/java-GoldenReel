package model;

public class feedback {
    private String name;
    private String email;
    private String rating;
    private String feedback_text;
    private int feedback_id;
   
   
    public int getFeedback_id() {
		return feedback_id;
	}

	public void setFeedback_id(int feedback_id) {
		this.feedback_id = feedback_id;
	}

	// Getters and Setters
    public String getName() {
        return name;
    }

    public String getFeedback_text() {
		return feedback_text;
	}

	public void setFeedback_text(String feedback_text) {
		this.feedback_text = feedback_text;
	}

	public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

   
   
   

   
   
   

   
    
}
