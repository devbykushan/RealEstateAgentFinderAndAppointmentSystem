package org.example.realestateagentfinderandappointmentsystem.fileHandlers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class UserDashboardSessionHandler {
    public static HashMap<String, String> userSession(String email, String password) {
        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\users.txt");
        HashMap<String, String> userDetails = new HashMap<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts[2].equals(email) && parts[3].equals(password)) {
                    String userId = parts[0];
                    String name = parts[1];
                    String contactNumber = parts[4];

                    userDetails.put("id", userId);
                    userDetails.put("name", name);
                    userDetails.put("contact", contactNumber);
                    break;
                }
            }
        } catch (IOException e) {
            System.out.println("Error : " + e.getMessage());
        }
        return userDetails;
    }

    public static ArrayList<HashMap<String, String>> agentsList() {
        ArrayList<HashMap<String, String>> agentsList = new ArrayList<>();

        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\agents.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                HashMap<String, String> agentsDetails = new HashMap<>();

                agentsDetails.put("id", parts[0]);
                agentsDetails.put("name", parts[1]);
                agentsDetails.put("email", parts[2]);
                agentsDetails.put("password", parts[3]);
                agentsDetails.put("licenseNumber", parts[4]);
                agentsDetails.put("agency", parts[5]);
                agentsDetails.put("location", parts[6]);
                agentsDetails.put("propertiesSold", parts[7]);
                agentsDetails.put("experience", parts[8]);
                agentsDetails.put("bio", parts[9]);
                agentsDetails.put("rating", parts[10]);
                agentsDetails.put("contact", parts[11]);
                agentsDetails.put("languages", parts[12]);
                agentsDetails.put("specialties", parts[13]);
                agentsDetails.put("image", parts[14]);

                agentsList.add(agentsDetails);
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
        return agentsList;
    }

    public static ArrayList<HashMap<String, String>> agentsListInLowestRatingOrder() {
        ArrayList<HashMap<String, String>> agentsList = new ArrayList<>();
        String[] agents = FileHandlerForSorting.getLowestOrder();
        for (String agent: agents) {
            HashMap<String, String> agentDetails = new HashMap<>();
            String[] parts = agent.split("\\|");
            agentDetails.put("id", parts[0]);
            agentDetails.put("name", parts[1]);
            agentDetails.put("email", parts[2]);
            agentDetails.put("password", parts[3]);
            agentDetails.put("licenseNumber", parts[4]);
            agentDetails.put("agency", parts[5]);
            agentDetails.put("location", parts[6]);
            agentDetails.put("propertiesSold", parts[7]);
            agentDetails.put("experience", parts[8]);
            agentDetails.put("bio", parts[9]);
            agentDetails.put("rating", parts[10]);
            agentDetails.put("contact", parts[11]);
            agentDetails.put("languages", parts[12]);
            agentDetails.put("specialties", parts[13]);
            agentDetails.put("image", parts[14]);

            agentsList.add(agentDetails);
        }
        return agentsList;

    }

    public static ArrayList<HashMap<String, String>> agentsListInHighestRatingOrder() {
        ArrayList<HashMap<String, String>> agentsList = new ArrayList<>();
        String[] agents = FileHandlerForSorting.getHighestOrder();
        for (String agent: agents) {
            HashMap<String, String> agentDetails = new HashMap<>();
            String[] parts = agent.split("\\|");
            agentDetails.put("id", parts[0]);
            agentDetails.put("name", parts[1]);
            agentDetails.put("email", parts[2]);
            agentDetails.put("password", parts[3]);
            agentDetails.put("licenseNumber", parts[4]);
            agentDetails.put("agency", parts[5]);
            agentDetails.put("location", parts[6]);
            agentDetails.put("propertiesSold", parts[7]);
            agentDetails.put("experience", parts[8]);
            agentDetails.put("bio", parts[9]);
            agentDetails.put("rating", parts[10]);
            agentDetails.put("contact", parts[11]);
            agentDetails.put("languages", parts[12]);
            agentDetails.put("specialties", parts[13]);
            agentDetails.put("image", parts[14]);

            agentsList.add(agentDetails);

        }
        return agentsList;
    }
}
