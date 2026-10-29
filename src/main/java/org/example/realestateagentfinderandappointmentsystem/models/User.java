package org.example.realestateagentfinderandappointmentsystem.models;
import java.time.LocalDate;
import java.util.UUID;

public class User {
    protected String userId;
    protected String name;
    protected String contactNumber;
    protected String email;
    protected String password;
    protected LocalDate date;

    public User() {}

    public User(String name, String contactNumber, String email, String password, LocalDate date) {
        this.name = name;
        this.contactNumber = contactNumber;
        this.email = email;
        this.password = password;
        this.date = date;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId() {
        this.userId = generateUserId();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        if (date != null) {
            this.date = date;
        } else {
            System.out.println("Date is null !");
        }

    }

    public String generateUserId() {
        return "USR-"+ UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}
