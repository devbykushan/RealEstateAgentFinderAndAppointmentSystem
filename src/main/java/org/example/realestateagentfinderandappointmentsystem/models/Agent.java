package org.example.realestateagentfinderandappointmentsystem.models;

import java.time.LocalDate;
import java.util.UUID;

public class Agent extends User {
    private String licenseNumber;
    private String agency;
    private String location;
    private String propertiesSold;
    private String experience;
    private String bio;
    private double rating;
    private String[] languages;
    private String[] specialization;
    private String agentImage;

    public Agent() {}

    public Agent(String name, String contactNumber, String email, String password, LocalDate date, String licenseNumber, String agency, String location, String propertiesSold, String experience,String bio, double rating, String[] languages, String[] specialization) {
        super(name, contactNumber, email, password, date);
        super.userId = generateUserId();
        this.licenseNumber = licenseNumber;
        this.agency = agency;
        this.location = location;
        this.propertiesSold = propertiesSold;
        this.experience = experience;
        this.bio = bio;
        this.rating = rating;
        this.languages = languages;
        this.specialization = specialization;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public String getAgency() {
        return agency;
    }

    public void setAgency(String agency) {
        this.agency = agency;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPropertiesSold() {
        return propertiesSold;
    }

    public void setPropertiesSold(String propertiesSold) {
        this.propertiesSold = propertiesSold;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String[] getLanguages() {
        return languages;
    }

    public void setLanguages(String[] languages) {
        this.languages = languages;
    }

    public String[] getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String[] specialization) {
        this.specialization = specialization;
    }

    public String getAgentImage() {
        return agentImage;
    }

    public void setAgentImage(String agentImage) {
        this.agentImage = agentImage;
    }

    @Override
    public String generateUserId() {
        return "AG-"+ UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}
