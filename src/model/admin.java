package model;


public class admin {
    private int adminId;         // Admin ID (Primary Key)
    private String username;     // Admin Username
    private String password;     // Admin Password (Plain Text)

    // Constructor
    public admin(int adminId, String username, String password) {
        this.adminId = adminId;
        this.username = username;
        this.password = password;
    }

    // Default Constructor
    public admin() {}

    // Getters and Setters
    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}

