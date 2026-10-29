package org.example.realestateagentfinderandappointmentsystem.fileHandlers;

import org.example.realestateagentfinderandappointmentsystem.models.Review;

import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

public class ReviewsFileHandler {
    public static boolean addReview(Review review) {
        boolean isReviewAdded = false;

        String title = review.getReviewTitle();
        String content = review.getReviewContent();
        String reviewCreatedUser = review.getReviewCreatedUser();
        String reviewForAgent = review.getReviewForAgent();
        String transactionType = review.getTransactionType();
        LocalDate date = review.getDate();
        String starsCount = String.valueOf(review.getStarsCount());

        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\reviews.txt");

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            String details = String.join("|", title, content, reviewCreatedUser, reviewForAgent, transactionType, date.toString(), starsCount);
            writer.write(details);
            writer.newLine();
            isReviewAdded = true;

        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }

        return isReviewAdded;
    }

    public static ArrayList<HashMap<String, String>> getAgentReviewsList(String agentName) {
        ArrayList<HashMap<String, String>> reviewsList = new ArrayList<>();
        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\reviews.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                HashMap<String, String> reviewDetails = new HashMap<>();
                String[] parts = line.split("\\|");
                if (parts[3].equals(agentName)) {
                    reviewDetails.put("title", parts[0]);
                    reviewDetails.put("content", parts[1]);
                    reviewDetails.put("createdUser", parts[2]);
                    reviewDetails.put("transactionType", parts[4]);
                    reviewDetails.put("date", parts[5]);
                    reviewDetails.put("starsCount", parts[6]);

                    reviewsList.add(reviewDetails);
                }
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }

        return reviewsList;
    }

    public static HashMap<String, Integer> reviewsStats(String agentName) {
        HashMap<String, Integer> stats = new HashMap<>();
        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\reviews.txt");

        int stars5Count = 0;
        int stars4Count = 0;
        int stars3Count = 0;
        int stars2_1Count = 0;
        int allReviewsCount = 0;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {

                String[] parts = line.split("\\|");
                if (parts[3].equals(agentName)) {
                    allReviewsCount++;

                    if (parts[6].equals("5")) {
                        stars5Count++;
                    } else if (parts[6].equals("4")) {
                        stars4Count++;
                    } else if (parts[6].equals("3")) {
                        stars3Count++;
                    } else if (parts[6].equals("2")) {
                        stars2_1Count++;
                    } else if (parts[6].equals("1")) {
                        stars2_1Count++;
                    }
                }
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
        stats.put("stars5", stars5Count);
        stats.put("stars4", stars4Count);
        stats.put("stars3", stars3Count);
        stats.put("stars2_1", stars2_1Count);
        stats.put("all", allReviewsCount);
        return stats;
    }
}
