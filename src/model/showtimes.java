package model;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;

public class showtimes {
    private int showtimeId;
    private int movieId;
    private List<String> showtimes;

    public int getShowtimeId() {
        return showtimeId;
    }

    public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public List<String> getShowtimes() {
        return showtimes;
    }

    public void setShowtimes(String showtimesJson) {
        List<String> parsedShowtimes = new ArrayList<>();
        if (showtimesJson != null && !showtimesJson.isEmpty()) {
            try {
                JSONArray jsonArray = new JSONArray(showtimesJson);
                for (int i = 0; i < jsonArray.length(); i++) {
                    parsedShowtimes.add(jsonArray.getString(i));
                }
            } catch (Exception e) {
                System.out.println("Error parsing showtimes JSON: " + e.getMessage());
            }
        }
        this.showtimes = parsedShowtimes;
    }
}
