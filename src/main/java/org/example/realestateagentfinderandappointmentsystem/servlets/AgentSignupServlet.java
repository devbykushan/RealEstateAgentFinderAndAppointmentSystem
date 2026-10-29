package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AgentRegistrationFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.RegistrationHandler;
import org.example.realestateagentfinderandappointmentsystem.models.Agent;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "AgentSignup", urlPatterns = "/agent-signup")
@MultipartConfig
public class AgentSignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
            request.setAttribute("error", "Passwords do not match !");

            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("contact", contact);
            request.setAttribute("licenseNumber", licenseNumber);
            request.setAttribute("agency", agency);

            request.getRequestDispatcher("/AgentSignup.jsp").forward(request, response);
        }

        Agent agent = new Agent(name, contact, email, password, date, licenseNumber, agency, location, propertiesSold, experience, bio, 0.0, languages, specialties);

        //Saving the image in the src/image/agents directory
        Part file = request.getPart("profileImage");
        String fileExtension = "";
        if ("image/png".equals(file.getContentType())) {
            fileExtension = ".png";
        } else if ("image/jpeg".equals(file.getContentType())) {
            fileExtension =".jpg";
        }
        String filename = agent.getUserId()+fileExtension;
        String uploadPath = "D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\main\\webapp\\images\\agents";
        file.write(uploadPath+File.separator+filename);
        agent.setAgentImage(filename);

        AgentRegistrationFileHandler reg = new AgentRegistrationFileHandler();
        boolean isAccCreated = reg.agentRegistration(agent);

        if (isAccCreated) {
            request.setAttribute("success", "Account Created Successfully. Please Login !!");
            request.getRequestDispatcher("/AgentLogin.jsp").forward(request, response);
        }
    }

    @Override
    protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        getServletContext().getRequestDispatcher("/AgentSignup.jsp").forward(request, response);
    }
}
