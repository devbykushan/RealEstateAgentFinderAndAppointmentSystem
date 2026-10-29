package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AgentDashboardFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.ReviewsFileHandler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(name = "UserReviews", urlPatterns = "/user-reviews")
public class UserReviewsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String agentEmail = request.getParameter("agentEmail");
        String agentPassword = request.getParameter("agentPassword");

        HashMap<String, String> agentDetails = AgentDashboardFileHandler.agentSession(agentEmail, agentPassword);
        HashMap<String, Integer> stats = ReviewsFileHandler.reviewsStats(agentDetails.get("name"));
        ArrayList<HashMap<String, String>> reviewsList = ReviewsFileHandler.getAgentReviewsList(agentDetails.get("name"));


        request.setAttribute("agent", agentDetails);
        request.setAttribute("count", stats);
        request.setAttribute("reviews", reviewsList);

        request.getRequestDispatcher("/AgentReviews.jsp").forward(request, response);
    }
}
