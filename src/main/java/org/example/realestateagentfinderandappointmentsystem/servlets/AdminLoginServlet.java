package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.LoginHandler;

import java.io.IOException;

@WebServlet(name = "AdminLogin", urlPatterns = "/admin-login")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        getServletContext().getRequestDispatcher("/AdminLogin.jsp").forward(request, response);
    }

    @Override
    protected  void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginHandler login = new LoginHandler();
        boolean isLoggingSuccessfull = login.isLoginSuccesfull(email, password, "admin");

        if (isLoggingSuccessfull) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            response.sendRedirect("admin-dashboard");
        } else {
            request.setAttribute("error", "Email or Password is Incorrect !");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
        }
    }
}
