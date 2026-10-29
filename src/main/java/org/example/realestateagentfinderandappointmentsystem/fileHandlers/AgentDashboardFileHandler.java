package org.example.realestateagentfinderandappointmentsystem.fileHandlers;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;

public class AgentDashboardFileHandler {
    public static HashMap<String, String> agentSession(String email, String password) {
        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\agents.txt");
        HashMap<String, String> agentDetails = new HashMap<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts[2].equals(email) && parts[3].equals(password)) {
                    String agentId = parts[0];
                    String name = parts[1];
                    String licenseNumber = parts[4];
                    String agency = parts[5];
                    String location = parts[6];
                    String propertiesSold = parts[7];
                    String experience = parts[8];
                    String bio = parts[9];
                    String rating = parts[10];
                    String contactNumber = parts[11];
                    String languages = parts[12];
                    String specialties = parts[13];
                    String image = parts[14];


                    agentDetails.put("id", agentId);
                    agentDetails.put("name", name);
                    agentDetails.put("email", email);
                    agentDetails.put("password", password);
                    agentDetails.put("licenseNumber", licenseNumber);
                    agentDetails.put("agency", agency);
                    agentDetails.put("location", location);
                    agentDetails.put("propertiesSold", propertiesSold);
                    agentDetails.put("experience", experience);
                    agentDetails.put("bio", bio);
                    agentDetails.put("rating", rating);
                    agentDetails.put("contact", contactNumber);
                    agentDetails.put("languages", languages);
                    agentDetails.put("specialties", specialties);
                    agentDetails.put("image", image);
                    break;
                }
            }
        } catch (IOException e) {
            System.out.println("Error : " + e.getMessage());
        }
        return agentDetails;
    }

    //me
    public static HashMap<String, Integer> agentDashboardStats(String name) {
        HashMap<String, Integer> stats = new HashMap<>();

        File appointments = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\appointments.txt");
        File reviews = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\reviews.txt");
        File properties = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\properties.txt");

        int appointmentsCount = 0;
        int reviewsCount = 0;
        int propertiesCount = 0;

        try (BufferedReader reader = new BufferedReader(new FileReader(appointments))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts[1].equals(name)) {
                    appointmentsCount ++;
                }
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(reviews))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts[3].equals(name)) {
                    reviewsCount ++;
                }
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(properties))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts[2].equals(name)) {
                    propertiesCount++;
                }
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }

        stats.put("appointmentsCount", appointmentsCount);
        stats.put("reviewsCount", reviewsCount);
        stats.put("propertiesCount", propertiesCount);

        return stats;
    }

    public static void agentRatingUpdater(String agentName) {
        File reviewsFile = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\reviews.txt");
        File agentsFile = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\agents.txt");

        int allStarsCount = 0;
        int allReviewsCount = 0;

        try (BufferedReader reader = new BufferedReader(new FileReader(reviewsFile))) {
            String line;
            while((line = reader.readLine()) != null) {
                String[] details = line.split("\\|");
                if (details[3].equals(agentName)) {
                    allReviewsCount++;
                    allStarsCount += Integer.parseInt(details[6]);
                }
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }

        ArrayList<String> updatedLines = new ArrayList<>();
        float ratingValue = (float) allStarsCount / allReviewsCount;
        String rating = String.format("%.2f", ratingValue);
        try (BufferedReader reader = new BufferedReader(new FileReader(agentsFile))) {
            String line;
            while((line = reader.readLine()) != null) {
                String[] details = line.split("\\|");
                if (details[1].equals(agentName)) {
                    details[10] = rating;
                }
                String updatedLine = String.join("|", details);
                updatedLines.add(updatedLine);
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(agentsFile, false))) {
            for (String line : updatedLines) {
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
    }
}
