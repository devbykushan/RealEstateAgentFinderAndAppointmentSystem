package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AgentDashboardFileHandler;

import java.io.IOException;
import java.util.HashMap;

@WebServlet(name="AgentDashboard", urlPatterns = "/agent-dashboard")
public class AgentDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");

        HashMap<String, String> agentDetails = AgentDashboardFileHandler.agentSession(email, password);
        HashMap<String, Integer> stats = AgentDashboardFileHandler.agentDashboardStats(agentDetails.get("name"));
        request.setAttribute("agent", agentDetails);
        request.setAttribute("count", stats);
        getServletContext().getRequestDispatcher("/AgentDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
