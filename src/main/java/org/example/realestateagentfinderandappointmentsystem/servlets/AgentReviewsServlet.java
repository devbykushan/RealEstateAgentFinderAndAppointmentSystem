package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AgentDashboardFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.ReviewsFileHandler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(name = "AgentReviews", urlPatterns = "/agent-reviews")
public class AgentReviewsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");

        HashMap<String, String> agentDetails = AgentDashboardFileHandler.agentSession(email, password);
        HashMap<String, Integer> stats = ReviewsFileHandler.reviewsStats(agentDetails.get("name"));
        ArrayList<HashMap<String, String>> reviewsList = ReviewsFileHandler.getAgentReviewsList(agentDetails.get("name"));

        request.setAttribute("agent", agentDetails);
        request.setAttribute("count", stats);
        request.setAttribute("reviews", reviewsList);

        request.getRequestDispatcher("/AgentReviews.jsp").forward(request, response);
    }
}
