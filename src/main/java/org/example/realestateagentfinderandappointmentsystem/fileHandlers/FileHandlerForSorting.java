package org.example.realestateagentfinderandappointmentsystem.fileHandlers;

import org.example.realestateagentfinderandappointmentsystem.dataStructures.SelectionSort;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class FileHandlerForSorting {
    public static String[] getAgentList() {
        int agentsCount = StatsHandler.getAgentsCount();
        String[] agentsList = new String[agentsCount];

        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealStateAgentFinderSystem\\src\\app-data\\agents.txt");
        int count = 0;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                agentsList[count++] = line;
            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
        return agentsList;
    }

    public static String[] getLowestOrder() {
        String[] agentsList = getAgentList();
        SelectionSort.sortByLowestOrder(agentsList);

        return agentsList;
    }

    public static String[] getHighestOrder() {
        String[] agentsList = getAgentList();
        SelectionSort.sortByHighestOrder(agentsList);

        return agentsList;
    }
}

