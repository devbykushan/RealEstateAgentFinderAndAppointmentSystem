package org.example.realestateagentfinderandappointmentsystem.fileHandlers;

import org.example.realestateagentfinderandappointmentsystem.models.Appointment;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;

public class AppointmentsFileHandler {

    public static boolean createAppointment(Appointment appointment) {
        boolean isAppointmentCreated = false;

        String id = appointment.generateAppointmentId();
        String appointmentAgent =  appointment.getAppointmentAgentName();
        String appointmentCreatedUser = appointment.getAppointmentCreatedUserName();
        String type = appointment.getAppointmentType();
        String priority = appointment.getPriority();
        String date = appointment.getAppointmentDate();
        String time = appointment.getAppointmentTime();
        String notes = appointment.getSpecialNotes();
        String status = appointment.getStatus();

        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\appointments.txt");

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))){
            String details = String.join("|", id, appointmentAgent,appointmentCreatedUser, type, priority, date, time, notes, status);
            writer.write(details);
            writer.newLine();
            isAppointmentCreated = true;

        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
        return isAppointmentCreated;
    }

    //this is for the appointments tab in user dashboard
    public static ArrayList<HashMap<String, String>> getAppointmentsListForUser(String userName) {
        ArrayList<HashMap<String, String>> appointmentDetails = new ArrayList<>();

        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\appointments.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while((line = reader.readLine()) != null) {
                HashMap<String, String> appDetails = new HashMap<>();
                String[] parts = line.split("\\|");

                if (parts[2].equals(userName)) {
                    appDetails.put("id", parts[0]);
                    appDetails.put("agent", parts[1]);
                    appDetails.put("user", parts[2]);
                    appDetails.put("type", parts[3]);
                    appDetails.put("priority", parts[4]);
                    appDetails.put("date", parts[5]);
                    appDetails.put("time", parts[6]);
                    appDetails.put("notes", parts[7]);
                    appDetails.put("status", parts[8]);

                    appointmentDetails.add(appDetails);
                }
            }
        } catch(IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
        return appointmentDetails;
    }

    //this is for the appointments tab in agent dashboard
    public static ArrayList<HashMap<String, String>> getAppointmentsListForAgent(String agentName) {
        ArrayList<HashMap<String, String>> appointmentDetails = new ArrayList<>();

        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\appointments.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while((line = reader.readLine()) != null) {
                HashMap<String, String> appDetails = new HashMap<>();
                String[] parts = line.split("\\|");

                if (parts[1].equals(agentName)) {
                    appDetails.put("id", parts[0]);
                    appDetails.put("agent", parts[1]);
                    appDetails.put("user", parts[2]);
                    appDetails.put("type", parts[3]);
                    appDetails.put("priority", parts[4]);
                    appDetails.put("date", parts[5]);
                    appDetails.put("time", parts[6]);
                    appDetails.put("notes", parts[7]);
                    appDetails.put("status", parts[8]);

                    appointmentDetails.add(appDetails);
                }
            }
        } catch(IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
        return appointmentDetails;
    }

    public static boolean appointmentStatusUpdater(String appointmentId, String status) {
        boolean isUpdated = false;
        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\appointments.txt");
        ArrayList<String> updatedLines = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");

                if (parts[0].equals(appointmentId)) {
                    parts[8] = status;
                    isUpdated = true;
                }
                String updatedLine = String.join("|", parts);
                updatedLines.add(updatedLine);
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, false))) {
            for (String line: updatedLines) {
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
        return isUpdated;
    }
}
