package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AdminDashboardFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AgentRegistrationFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.RegistrationHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.StatsHandler;
import org.example.realestateagentfinderandappointmentsystem.models.Admin;
import org.example.realestateagentfinderandappointmentsystem.models.Agent;
import org.example.realestateagentfinderandappointmentsystem.models.User;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;

@WebServlet(name="AdminDashboard", urlPatterns = "/admin-dashboard")
@MultipartConfig
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        reloadCurrentSession(request);
        getServletContext().getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String formSource = request.getParameter("formSource");
        if (formSource.equals("addUser")) {
            String name = request.getParameter("name");
            String cNumber = request.getParameter("contact");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            LocalDate date = LocalDate.now();

            if (!password.equals(confirmPassword)) {
                request.setAttribute("modalMessage", "Passwords do not match !");
                reloadCurrentSession(request);
                request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
            }

            User user = new User(name, cNumber, email, password, date);
            user.setUserId();

            RegistrationHandler reg = new RegistrationHandler();
            boolean isAccCreated = reg.userRegistrationFileHandler(user);

            if (isAccCreated) {
                request.setAttribute("modalMessage", "Account Created Successfully ✅");
                reloadCurrentSession(request);
                request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
            }
        } else if (formSource.equals("addAgent")) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String licenseNumber = request.getParameter("licenseNumber");
            String agency = request.getParameter("agency");
            String location = request.getParameter("location");
            String propertiesSold = request.getParameter("properties");
            String experience = request.getParameter("experience");
            String bio = request.getParameter("bio");
            String[] languages = request.getParameterValues("languages");
            String[] specialties = request.getParameterValues("specialties");
            LocalDate date = LocalDate.now();

            if (!password.equals(confirmPassword)) {
                reloadCurrentSession(request);
                request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
            }

            Agent agent = new Agent(name, contact, email, password, date, licenseNumber, agency, location, propertiesSold, experience, bio, 0, languages, specialties);

            //Saving the image in the src/image/agents directory
            Part file = request.getPart("profileImage");
            String fileExtension = "";
            if ("image/png".equals(file.getContentType())) {
                fileExtension = ".png";
            } else if ("image/jpeg".equals(file.getContentType())) {
                fileExtension =".jpg";
            }
            String filename = agent.getUserId()+fileExtension;
            String uploadPath = "D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealStateAgentFinderSystem\\src\\main\\webapp\\images\\agents";
            file.write(uploadPath+ File.separator+filename);
            agent.setAgentImage(filename);

            AgentRegistrationFileHandler reg = new AgentRegistrationFileHandler();
            boolean isAccCreated = reg.agentRegistration(agent);

            if (isAccCreated) {
                request.setAttribute("modalMessage", "Account Created Successfully ✅");
                reloadCurrentSession(request);
                request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
            }

        } else if (formSource.equals("addAdmin")) {
            String adminName = request.getParameter("name");
            String adminEmail = request.getParameter("email");
            String adminPassword = request.getParameter("password");
            String confirmAdminPassword = request.getParameter("confirmPassword");
            String adminContact = request.getParameter("contact");
            LocalDate date = LocalDate.now();
            String adminRole = request.getParameter("role");

            if (!adminPassword.equals(confirmAdminPassword)) {
                request.setAttribute("modalMessage", "Passwords do not match !");
                reloadCurrentSession(request);
                request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
            }

            Admin newAdmin = new Admin(adminName, adminContact, adminEmail, adminPassword, date, adminRole);
            boolean isAdminAccCreated = RegistrationHandler.adminRegistrationFileHandler(newAdmin);

            if (isAdminAccCreated) {
                request.setAttribute("modalMessage", "Admin Added Successfully ✅");
            } else {
                request.setAttribute("modalMessage", "Error Occurred ❗");
            }

            reloadCurrentSession(request);
            request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);

        } else if (formSource.equals("removeUser")) {
            String userId = request.getParameter("userid");
            boolean isRemoved = false;
            try {
                isRemoved = AdminDashboardFileHandler.remove(userId);

            } catch (Exception e) {
                System.out.println("Error : "+e.getMessage());
            }
            if (isRemoved) {
                request.setAttribute("modalMessage", "User : " + userId + " Deleted Successfully ✅");
            } else {
                request.setAttribute("modalMessage", "User ID Invalid ❗");
            }

            reloadCurrentSession(request);
            request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);

        }  else if (formSource.equals("removeAgent")) {
            String agentId = request.getParameter("agentId");
            boolean isRemoved = false;
            try {
                isRemoved = AdminDashboardFileHandler.remove(agentId);

            } catch (Exception e) {
                System.out.println("Error : " + e.getMessage());
            }
            if (isRemoved) {
                request.setAttribute("modalMessage", "Agent : " + agentId + " Deleted Successfully ✅");
            } else {
                request.setAttribute("modalMessage", "Agent ID Invalid ❗");
            }

            reloadCurrentSession(request);
            request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);

        } else if (formSource.equals("removeAppointment")) {
            String appointmentId = request.getParameter("appointmentId");
            boolean isRemoved = false;
            try {
                isRemoved = AdminDashboardFileHandler.remove(appointmentId);

            } catch (Exception e) {
                System.out.println("Error : " + e.getMessage());
            }
            if (isRemoved) {
                request.setAttribute("modalMessage", "Appointment : " + appointmentId + " Deleted Successfully ✅");
            } else {
                request.setAttribute("modalMessage", "Appointment ID Invalid ❗");
            }

            reloadCurrentSession(request);
            request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
        }
    }

    protected static void reloadCurrentSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");

        HashMap<String, String> admin = AdminDashboardFileHandler.adminSession(email, password);
        HashMap<String,Integer> stats = StatsHandler.statsHandler();
        request.setAttribute("admin", admin);
        request.setAttribute("stats", stats);
    }
}
