package org.example.realestateagentfinderandappointmentsystem.fileHandlers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

public class StatsHandler {
    public static HashMap<String, Integer> statsHandler() {
        HashMap<String, Integer> stats = new HashMap<>();
        int usersCount = getUsersCount();
        int agentsCount = getAgentsCount();
        int appointmentsCount = getAppointmentsCount();
        int activeAgentsCount = getActiveAgentsCount();
        stats.put("usersCount", usersCount);
        stats.put("agentsCount", agentsCount);
        stats.put("activeAgentsCount", activeAgentsCount);
        stats.put("appointmentsCount", appointmentsCount);
        return stats;
    }

    public static int getUsersCount() {
        return StatsCounter("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\users.txt");
    }

    public static int getAgentsCount() {
        return StatsCounter("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\agents.txt");
    }

    public static int getAppointmentsCount() {
        return StatsCounter("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\appointments.txt");
    }

    public static int StatsCounter(String path) {
        File file = new File(path);
        int count = 0;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            while ((reader.readLine()) != null) {
                count++;
            }

        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
        return count;
    }
    public static int getActiveAgentsCount() {
        int activeCount = 0;
        try (BufferedReader br = new BufferedReader(new FileReader("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\agents.txt"))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts =  line.split("\\|");
                if (parts[16].equals("Online")){
                    activeCount++;
                }
            }
        } catch (IOException e) {
            System.out.println("Error : " + e.getMessage());
        }
        return activeCount;
    }
}

