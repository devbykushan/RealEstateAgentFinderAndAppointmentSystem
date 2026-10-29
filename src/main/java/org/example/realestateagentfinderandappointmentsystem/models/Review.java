package org.example.realestateagentfinderandappointmentsystem.models;

import java.time.LocalDate;

public class Review {
    private String reviewTitle;
    private String reviewContent;
    private String reviewCreatedUser;
    private String reviewForAgent;
    private String transactionType;
    private LocalDate date;
    private int starsCount;


    public Review() {}

    public Review(String reviewTitle, String reviewContent, String reviewCreatedUser, String reviewForAgent, String transactionType, LocalDate date, int starsCount) {
        this.reviewTitle = reviewTitle;
        this.reviewContent = reviewContent;
        this.reviewCreatedUser = reviewCreatedUser;
        this.reviewForAgent = reviewForAgent;
        this.transactionType = transactionType;
        this.date = date;
        this.starsCount = starsCount;
    }

    public String getReviewTitle() {
        return reviewTitle;
    }

    public void setReviewTitle(String reviewTitle) {
        this.reviewTitle = reviewTitle;
    }

    public String getReviewContent() {
        return reviewContent;
    }

    public void setReviewContent(String reviewContent) {
        this.reviewContent = reviewContent;
    }

    public String getReviewCreatedUser() {
        return reviewCreatedUser;
    }

    public void setReviewCreatedUser(String reviewCreatedUser) {
        this.reviewCreatedUser = reviewCreatedUser;
    }

    public String getReviewForAgent() {
        return reviewForAgent;
    }

    public void setReviewForAgent(String reviewForAgent) {
        this.reviewForAgent = reviewForAgent;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getStarsCount() {
        return starsCount;
    }

    public void setStarsCount(int starsCount) {
        this.starsCount = starsCount;
    }
}
