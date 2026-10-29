package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.LoginHandler;

import java.io.*;

@WebServlet(name="AgentLogin", urlPatterns = "/agent-login")
public class AgentLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginHandler login = new LoginHandler();
        boolean isLoginSuccessfull = login.isLoginSuccesfull(email, password, "agent");

        if (isLoginSuccessfull) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            response.sendRedirect("agent-dashboard");
            LoginHandler.agentStatusUpdater(email, password, "Online");
        } else {
            request.setAttribute("error", "Email or Password is Incorrect !");
            request.getRequestDispatcher("AgentLogin.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");
        LoginHandler.agentStatusUpdater(email, password, "Offline");
        getServletContext().getRequestDispatcher("/AgentLogin.jsp").forward(request, response);
        session.invalidate();
    }

}
