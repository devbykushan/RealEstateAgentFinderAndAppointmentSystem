package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AdminDashboardFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AgentDashboardFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AppointmentsFileHandler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(name="AgentAppointment", urlPatterns = "/agent-appointments")
public class AgentAppointmentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        reloadSession(request);
        request.getRequestDispatcher("/AgentAppointments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String modalMessage = "";
        String action = request.getParameter("action");
        if (action.equals("delete")) {
            String appointmentId = request.getParameter("appointmentId");
            boolean isDeleted = AdminDashboardFileHandler.remove(appointmentId);

            if (isDeleted) {
                modalMessage = "Appointment Deleted Successfully ✅";
            } else {
                modalMessage = "Failed to Create Appointment ❌";
            }
        } else if (action.equals("update")) {
            String appointmentId = request.getParameter("appointmentId");
            String updatedStatus = request.getParameter("newStatus");
            boolean isUpdated  = AppointmentsFileHandler.appointmentStatusUpdater(appointmentId, updatedStatus);

            if (isUpdated) {
                modalMessage = "Appointment Status Updated to "+updatedStatus+" Successfully ✅";
            } else {
                modalMessage = "Failed to Update Appointment ❌";
            }
        }
        request.setAttribute("modalMessage", modalMessage);
        reloadSession(request);
        request.getRequestDispatcher("/AgentAppointments.jsp").forward(request, response);
    }

    protected void reloadSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");

        HashMap<String, String> agent = AgentDashboardFileHandler.agentSession(email, password);
        String agentName = agent.get("name");

        ArrayList<HashMap<String, String>> appointmentsDetails = AppointmentsFileHandler.getAppointmentsListForAgent(agentName);
        request.setAttribute("appointments", appointmentsDetails);
    }
}
