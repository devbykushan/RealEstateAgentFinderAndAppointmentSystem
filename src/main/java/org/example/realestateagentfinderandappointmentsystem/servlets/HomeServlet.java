package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.StatsHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.UserDashboardSessionHandler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(name="HomeServlet", urlPatterns = "/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HashMap<String, Integer> stats = StatsHandler.statsHandler();
        ArrayList<HashMap<String, String>> agents = UserDashboardSessionHandler.agentsList();
        request.setAttribute("agents", agents);
        request.setAttribute("stats", stats);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
