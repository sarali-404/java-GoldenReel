package model;

public class movie {
    private int movieId;
    private String title;
    private String genre;
    private String format;
    private String language;
    private String description;
    private String imageUrl;
    private String trailerUrl;
    private String status; 
    private double price;
    private String duration;
    private String releaseDate;
    private String cast;
    private String showtimes;  // Store showtimes as a JSON string

   



	// Constructor
    public movie(int movieId, String title, String genre, String format, String language,
                 String description, String imageUrl, String trailerUrl, String status, double price,String duration, String releaseDate,String cast,String showtimes) {
        this.movieId = movieId;
        this.title = title;
        this.genre = genre;
        this.format = format;
        this.language = language;
        this.description = description;
        this.imageUrl = imageUrl;
        this.trailerUrl = trailerUrl;
        this.status = status; // Initialize status
        this.price = price;
        }


	

	public movie() {
		// TODO Auto-generated constructor stub
	}


	// Getters and setters
    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getTrailerUrl() {
        return trailerUrl;
    }

    public void setTrailerUrl(String trailerUrl) {
        this.trailerUrl = trailerUrl;
    }

    public String getStatus() {
        return status; // Getter for status
    }

    public void setStatus(String status) {
        this.status = status; // Setter for status
    }
    
    public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}
	
	public String getDuration() {
		return duration;
	}


	public void setDuration(String duration) {
		this.duration = duration;
	}


	public String getReleaseDate() {
		return releaseDate;
	}


	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}


	public String getCast() {
		return cast;
	}


	public void setCast(String cast) {
		this.cast = cast;
	}
	


	public String getShowtimes() {
		return showtimes;
	}




	public void setShowtimes(String showtimes) {
		this.showtimes = showtimes;
	}



}
