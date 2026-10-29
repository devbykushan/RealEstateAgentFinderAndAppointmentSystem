package org.example.realestateagentfinderandappointmentsystem.fileHandlers;

import java.io.*;
import java.util.ArrayList;

public class LoginHandler {
    public boolean isLoginSuccesfull(String email, String password, String role) throws IOException {
        boolean loginSuccessfull = false;
        String path = "";
        if (role.equals("agent")) {
            path = "D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\agents.txt";
        } else if (role.equals("user")){
            path = "D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\users.txt";
        } else if (role.equals("admin")){
            path = "D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\admins.txt";
        }

        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] details = line.split("\\|");

                if (details[2].equals(email) && details[3].equals(password)) {
                    loginSuccessfull = true;
                    break;
                }
            }
        } catch (IOException e) {
            System.out.println("Error : " + e.getMessage());
        }
        return loginSuccessfull;
    }

    public static void agentStatusUpdater(String email, String password, String status) {
        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\agents.txt");
        ArrayList<String> updatedLines = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");

                if (parts[2].equals(email) && parts[3].equals(password)) {
                    parts[16] = status;
                    line = String.join("|", parts);
                }
                updatedLines.add(line);
            }
        } catch (IOException e) {
            System.out.println("Error : " + e);
            return;
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, false))) {
            for (String updatedLine : updatedLines) {
                writer.write(updatedLine);
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error : " + e);
        }
    }
}
