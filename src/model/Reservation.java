package model;

import java.sql.Timestamp;

public class Reservation {
    private int reservationId;
    private int userId;
    private int showtimeId;
    private String seatNumbers;
    private Timestamp reservationDate;
    private double totalPrice;
    private String status;  // New field for status

    // Constructor
    public Reservation(int reservationId, int userId, int showtimeId, String seatNumbers, 
                       Timestamp reservationDate, double totalPrice, String status) {
        this.reservationId = reservationId;
        this.userId = userId;
        this.showtimeId = showtimeId;
        this.seatNumbers = seatNumbers;
        this.reservationDate = reservationDate;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    // Getters and Setters
    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getShowtimeId() {
        return showtimeId;
    }

    public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }

    public String getSeatNumbers() {
        return seatNumbers;
    }

    public void setSeatNumbers(String seatNumbers) {
        this.seatNumbers = seatNumbers;
    }

    public Timestamp getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Timestamp reservationDate) {
        this.reservationDate = reservationDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
