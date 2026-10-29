package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AdminDashboardFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AppointmentsFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.UserDashboardSessionHandler;
import org.example.realestateagentfinderandappointmentsystem.models.Appointment;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(name="UserAppointments", urlPatterns = "/user-appointments")
public class UserAppointmentsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        reloadSession(request);
        request.getRequestDispatcher("/UserAppointments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException {
        String method = request.getParameter("action");
        String modalMessage = "";

        //delete an appointment in user appointment form
        if (method.equals("CREATE")) {
            String agentName = request.getParameter("agentName");
            String type = request.getParameter("appointmentType");
            String priority = request.getParameter("priority");
            String date = request.getParameter("appointmentDate");
            String time = request.getParameter("appointmentTime");
            String notes = request.getParameter("notes");

            HttpSession session = request.getSession(false);
            String email = (String) session.getAttribute("email");
            String password = (String) session.getAttribute("password");

            HashMap<String, String> user = UserDashboardSessionHandler.userSession(email, password);
            String userName = user.get("name");

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

            //delete an appointment in user appointment form
        } else if (method.equals("DELETE")) {
            String appointmentId = request.getParameter("appointmentId");
            boolean isDeleted = AdminDashboardFileHandler.remove(appointmentId);

            if (isDeleted) {
                modalMessage = "Appointment Deleted Successfully ✅";
            } else {
                modalMessage = "Failed to Delete Appointment ❌";
            }
        } else {
            modalMessage = "Error !!";
        }
        request.setAttribute("modalMessage", modalMessage);
        reloadSession(request);
        request.getRequestDispatcher("/UserAppointments.jsp").forward(request, response);
    }

    public void reloadSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");
        HashMap<String, String> user = UserDashboardSessionHandler.userSession(email, password);

        String userName = user.get("name");
        ArrayList<HashMap<String, String>> appointments = AppointmentsFileHandler.getAppointmentsListForUser(userName);
        request.setAttribute("appointments", appointments);

        ArrayList<HashMap<String, String>> agents = UserDashboardSessionHandler.agentsList();
        request.setAttribute("agents", agents);
    }

}
