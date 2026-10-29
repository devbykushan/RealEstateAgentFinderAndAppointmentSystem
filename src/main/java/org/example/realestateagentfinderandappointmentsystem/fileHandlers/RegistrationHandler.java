package org.example.realestateagentfinderandappointmentsystem.fileHandlers;
import org.example.realestateagentfinderandappointmentsystem.models.User;
import org.example.realestateagentfinderandappointmentsystem.models.Agent;
import org.example.realestateagentfinderandappointmentsystem.models.Admin;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;

public class RegistrationHandler {

    public boolean userRegistrationFileHandler(User user) {
        String userId = user.getUserId();
        String name = user.getName();
        String contactNumber = user.getContactNumber();
        String email = user.getEmail();
        String password = user.getPassword();
        LocalDate date = user.getDate();

        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\users.txt");

        boolean isAccountCreated = false;

        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file, true))){
            String details = String.join("|", userId, name, email, password, contactNumber, date.toString());
            bufferedWriter.write(details+"\n");
            isAccountCreated = true;

        } catch (IOException e) {
            System.out.println("Error : "+e);
        }
        return isAccountCreated;
    }
    public static boolean adminRegistrationFileHandler(Admin admin) {
        String adminId = admin.generateUserId();
        String adminName = admin.getName();
        String contactNumber = admin.getContactNumber();
        String email = admin.getEmail();
        String password = admin.getPassword();
        LocalDate date = admin.getDate();
        String role = admin.getRole();

        File file = new File("D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\app-data\\admins.txt");

        boolean isAccountCreated = false;

        try(BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            String details = String.join("|", adminId, adminName, email, password, contactNumber, role, date.toString());
            writer.write(details+"\n");
            isAccountCreated = true;

        } catch (IOException e) {
            System.out.println("Error : "+e.getMessage());
        }
        return isAccountCreated;
    }
}
