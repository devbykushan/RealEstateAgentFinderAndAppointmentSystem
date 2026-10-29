package org.example.realestateagentfinderandappointmentsystem.fileHandlers;

import org.example.realestateagentfinderandappointmentsystem.models.Property;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;

public class PropertiesFileHandler {

    public static boolean addProperty(Property property) {
        boolean isPropertyAdded = false;

        String title = property.getPropertyTitle();
        String type = property.getPropertyType();
        String addedBy = property.getAddedByAgent();
        String price = String.valueOf(property.getPrice());
        String status = property.getStatus();
        String address = property.getAddress();
        String city = property.getCity();
        String province = property.getProvince();
        String bedroomCount = String.valueOf(property.getBedroomCount());
        String bathroomCount = String.valueOf(property.getBathroomCount());
        String builtYear = property.getBuiltYear();
        String size = String.valueOf(property.getSize());
        String[] amenitiesList = property.getAmenities();
        String image = property.getPropertyImage();

        String amenities = String.join("," , amenitiesList);

        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\properties.txt");

        try (BufferedWriter writer =  new BufferedWriter(new FileWriter(file, true))) {
            String details = String.join("|", title, type, addedBy, price, status, address, city, province, bedroomCount, bathroomCount, size, builtYear, amenities, image);
            writer.write(details);
            writer.newLine();
            isPropertyAdded = true;

        } catch (IOException e) {
            System.out.println("Error : " +e.getMessage());
        }

        return isPropertyAdded;
    }

    public static boolean deleteProperty(String name) {
        boolean isDeleted = false;
        ArrayList<String> updatedLines = new ArrayList<>();
        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\properties.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts[0].equals(name)) {
                    isDeleted = true;
                    continue;
                }
                String restOfLine = String.join("|", parts);
                updatedLines.add(restOfLine);
            }
        } catch (IOException e) {
            System.out.println("Error : " + e.getMessage());
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, false))) {
            for (String line: updatedLines) {
                writer.write(line);
                writer.newLine();
            }

        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
        return isDeleted;
    }

    public static ArrayList<HashMap<String, String>> getPropertiesListForAgent(String agentName) {
        ArrayList<HashMap<String, String>> propertiesDetails = new ArrayList<>();

        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\properties.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while((line = reader.readLine()) != null) {
                HashMap<String, String> Details = new HashMap<>();
                String[] parts = line.split("\\|");

                if (parts[2].equals(agentName)) {
                    Details.put("title", parts[0]);
                    Details.put("type", parts[1]);
                    Details.put("addedBy", parts[2]);
                    Details.put("price", parts[3]);
                    Details.put("status", parts[4]);
                    Details.put("address", parts[5]);
                    Details.put("city", parts[6]);
                    Details.put("province", parts[7]);
                    Details.put("bedrooms", parts[8]);
                    Details.put("bathrooms", parts[9]);
                    Details.put("size", parts[10]);
                    Details.put("builtYear", parts[11]);
                    Details.put("amenities", parts[12]);
                    Details.put("image", parts[13]);

                    propertiesDetails.add(Details);
                }
            }
        } catch(IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
        return propertiesDetails;
    }

    public static ArrayList<HashMap<String, String>> getPropertiesList() {
        ArrayList<HashMap<String, String>> propertiesDetails = new ArrayList<>();

        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\properties.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while((line = reader.readLine()) != null) {
                HashMap<String, String> Details = new HashMap<>();
                String[] parts = line.split("\\|");

                Details.put("title", parts[0]);
                Details.put("type", parts[1]);
                Details.put("addedBy", parts[2]);
                Details.put("price", parts[3]);
                Details.put("status", parts[4]);
                Details.put("address", parts[5]);
                Details.put("city", parts[6]);
                Details.put("province", parts[7]);
                Details.put("bedrooms", parts[8]);
                Details.put("bathrooms", parts[9]);
                Details.put("size", parts[10]);
                Details.put("builtYear", parts[11]);
                Details.put("amenities", parts[12]);
                Details.put("image", parts[13]);

                propertiesDetails.add(Details);
            }
        } catch(IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
        return propertiesDetails;
    }
}
