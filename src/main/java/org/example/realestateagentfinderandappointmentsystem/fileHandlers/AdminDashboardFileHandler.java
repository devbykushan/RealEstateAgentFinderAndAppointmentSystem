package org.example.realestateagentfinderandappointmentsystem.fileHandlers;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;

public class AdminDashboardFileHandler {
    public static HashMap<String, String> adminSession(String email, String password) {
        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\admins.txt");
        HashMap<String, String> adminDetails = new HashMap<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");

                if (parts[2].equals(email) && parts[3].equals(password)) {
                    adminDetails.put("id", parts[0]);
                    adminDetails.put("name", parts[1]);
                    adminDetails.put("role", parts[5]);
                    break;
                }
            }
        } catch (IOException e) {
            System.out.println("Error : " + e.getMessage());
        }
        return adminDetails;
    }

    public static boolean remove(String id) {
        String path = "";
        boolean isRemoved = false;
        if (id.startsWith("USR")) {
            path = "D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\users.txt";
        } else if (id.startsWith("AG")) {
            path = "D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\agents.txt";
        } else if (id.startsWith("APP")) {
            path = "D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\appointments.txt";
        }
        File file = new File(path);
        ArrayList<String> restOfLines = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(("\\|"));
                if (parts[0].equals(id)) {
                    isRemoved = true;
                    continue;
                }
                String restOfLine = String.join("|", parts);
                restOfLines.add(restOfLine);
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, false))) {
            for (String line : restOfLines) {
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }

        return isRemoved;
    }
}

