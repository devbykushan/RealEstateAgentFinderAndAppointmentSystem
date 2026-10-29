package org.example.realestateagentfinderandappointmentsystem.models;

import java.time.LocalDate;
import java.util.UUID;

public class Admin extends User {
    private String role;

    public Admin(String name, String contactNumber, String email, String password, LocalDate date, String role) {
        super(name, contactNumber, email, password, date);
        super.userId = generateUserId();
        this.role = role;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String generateUserId() {
        return "ADM - "+ UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}
