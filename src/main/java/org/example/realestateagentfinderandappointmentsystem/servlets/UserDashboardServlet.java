package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AgentDashboardFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AppointmentsFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.ReviewsFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.UserDashboardSessionHandler;
import org.example.realestateagentfinderandappointmentsystem.models.Appointment;
import org.example.realestateagentfinderandappointmentsystem.models.Review;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;


@WebServlet(name = "UserDashboard", urlPatterns = "/user-dashboard")
public class UserDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        reloadSession(request);
        request.getRequestDispatcher("/UserDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String modalMessage = "";
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");

        HashMap<String, String> user = UserDashboardSessionHandler.userSession(email, password);
        String userName = user.get("name");

        if (action.equals("createAppointment")) {
            String agentName = request.getParameter("agentName");
            String type = request.getParameter("appointmentType");
            String priority = request.getParameter("priority");
            String date = request.getParameter("appointmentDate");
            String time = request.getParameter("appointmentTime");
            String notes = request.getParameter("notes");

            Appointment appointment = new Appointment();
            appointment.setAppointmentId();
            appointment.setAppointmentAgentName(agentName);
            appointment.setAppointmentCreatedUserName(userName);
            appointment.setAppointmentType(type);
            appointment.setPriority(priority);
            appointment.setAppointmentDate(date);
            appointment.setAppointmentTime(time);
            appointment.setSpecialNotes(notes);
            appointment.setStatus("Pending");

            boolean isAppointmentCreated = AppointmentsFileHandler.createAppointment(appointment);

            if (isAppointmentCreated) {
                modalMessage = "Appointment Created Successfully ✅";
            } else {
                modalMessage = "Failed to Create Appointment ❌";
            }

        } else if (action.equals("addReview")) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String reviewForAgent = request.getParameter("agentName");
            String transactionType = request.getParameter("transactionType");
            int starsCount = Integer.parseInt(request.getParameter("rating"));
            LocalDate date = LocalDate.now();

            Review review = new Review(title, content, userName, reviewForAgent, transactionType, date, starsCount);

            boolean isReviewCreated = ReviewsFileHandler.addReview(review);

            if (isReviewCreated) {
                AgentDashboardFileHandler.agentRatingUpdater(reviewForAgent);
                modalMessage = "Review Added to " + reviewForAgent + " Successfully ✅";
            } else {
                modalMessage = "Failed to add Review ❌";
            }
        }
        request.setAttribute("modalMessage", modalMessage);
        reloadSession(request);
        request.getRequestDispatcher("/UserDashboard.jsp").forward(request, response);
    }

    protected void reloadSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");

        HashMap<String, String> user = UserDashboardSessionHandler.userSession(email, password);
        ArrayList<HashMap<String, String>> agentsList = UserDashboardSessionHandler.agentsList();

        String sortOption = request.getParameter("agentSort");

        if (sortOption == null) {
            sortOption = "default";
        }

        if (!sortOption.equals("default")) {
            switch (sortOption) {
                case "highest":
                    agentsList = UserDashboardSessionHandler.agentsListInHighestRatingOrder();
                    break;
                case "lowest":
                    agentsList = UserDashboardSessionHandler.agentsListInLowestRatingOrder();
                    break;
            }
        }

        request.setAttribute("user", user);
        request.setAttribute("agents", agentsList);
    }
}

