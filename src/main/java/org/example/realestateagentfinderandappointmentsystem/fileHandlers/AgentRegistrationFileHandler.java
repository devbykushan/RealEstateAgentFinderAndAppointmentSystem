package org.example.realestateagentfinderandappointmentsystem.fileHandlers;

import org.example.realstateagentfindersystem.dataStructures.AgentTree;
import org.example.realestateagentfinderandappointmentsystem.models.Agent;

import java.io.*;
import java.time.LocalDate;

public class AgentRegistrationFileHandler {
    private AgentTree tree;

    public AgentRegistrationFileHandler() {
        this.tree = new AgentTree();
        loadAgentsToTree();
    }

    public boolean agentRegistration(Agent agent) {
        tree.insertNewAgent(agent);
        deleteAllLines();
        tree.InOrder(tree.root);
        return true;
    }

    public void loadAgentsToTree() {
        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealStateAgentFinderSystem\\src\\app-data\\agents.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(file))){
            String line;
            while ((line = reader.readLine()) != null) {
                String[] details = line.split("\\|");
                Agent agent = new Agent();
                agent.setUserId(details[0]);
                agent.setName(details[1]);
                agent.setEmail(details[2]);
                agent.setPassword(details[3]);
                agent.setLicenseNumber(details[4]);
                agent.setAgency(details[5]);
                agent.setLocation(details[6]);
                agent.setPropertiesSold(details[7]);
                agent.setExperience(details[8]);
                agent.setBio(details[9]);
                agent.setRating(Double.parseDouble(details[10]));
                agent.setContactNumber(details[11]);

                String[] languages = details[12].split(",");
                String[] specializations = details[13].split(",");
                agent.setLanguages(languages);
                agent.setSpecialization(specializations);
                agent.setAgentImage(details[14]);
                agent.setDate(LocalDate.parse(details[15]));
                agent.setStatus(details[16]);

                tree.insertNewAgent(agent);

            }
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
    }

    public void writeToFile(Agent agent) {
        String agentId = agent.getUserId();
        String name = agent.getName();
        String email = agent.getEmail();
        String contactNumber = agent.getContactNumber();
        String licenseNumber = agent.getLicenseNumber();
        String agency = agent.getAgency();
        String location = agent.getLocation();
        String propertiesSold = agent.getPropertiesSold();
        String experience = agent.getExperience();
        String bio = agent.getBio();
        String reviewsCount = Double.toString(agent.getRating());
        String[] languages = agent.getLanguages();
        String[] specialties = agent.getSpecialization();
        String password = agent.getPassword();
        String image = agent.getAgentImage();
        String status = agent.getStatus();
        LocalDate date = agent.getDate();

        String languagesList = String.join(",", languages);
        String specializations = String.join(",", specialties);

        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealStateAgentFinderSystem\\src\\app-data\\agents.txt");

        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file, true))){
            String details = String.join("|", agentId, name, email, password, licenseNumber, agency, location, propertiesSold, experience, bio, reviewsCount, contactNumber, languagesList, specializations, image, date.toString(), status);
            bufferedWriter.write(details+"\n");

        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
    }

    //this code is for delete all the lines before writing in new InOrder Traversing
    public void deleteAllLines() {
        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealStateAgentFinderSystem\\src\\app-data\\agents.txt");
        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file, false))){
            System.out.println("All the lines are cleared..");
        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }

    }
}
