package org.example.realestateagentfinderandappointmentsystem.dataStructures;

public class SelectionSort {
    public static void sortByLowestOrder(String[] agentsList) {
        int length = agentsList.length;

        for (int i = 0; i < length -1; i++) {
            int minIndex = i;

            for (int j = i; j < length; j++) {
                String[] details = agentsList[j].split("\\|");
                String[] detailsX = agentsList[minIndex].split("\\|");
                double jValue = Double.parseDouble(details[10]);
                double minIndexValue = Double.parseDouble(detailsX[10]);

                if (jValue < minIndexValue) {
                    minIndex = j;
                }
            }
            String temp = agentsList[minIndex];
            agentsList[minIndex] = agentsList[i];
            agentsList[i] = temp;
        }
    }

    public static void sortByHighestOrder(String[] agentsList) {
        int length = agentsList.length;

        for (int i = 0; i < length -1; i++) {
            int minIndex = i;

            for (int j = i; j < length; j++) {
                String[] details = agentsList[j].split("\\|");
                String[] detailsX = agentsList[minIndex].split("\\|");
                double jValue = Double.parseDouble(details[10]);
                double minIndexValue = Double.parseDouble(detailsX[10]);

                if (jValue > minIndexValue) {
                    minIndex = j;
                }
            }
            String temp = agentsList[minIndex];
            agentsList[minIndex] = agentsList[i];
            agentsList[i] = temp;
        }
    }
}

