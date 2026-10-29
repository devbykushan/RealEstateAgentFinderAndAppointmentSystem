package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.LoginHandler;

import java.io.*;

@WebServlet(name="UserLogin", urlPatterns = "/user-login")
public class

UserLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginHandler login = new LoginHandler();
        boolean isLoginSuccessfull = login.isLoginSuccesfull(email, password, "user");

        if (isLoginSuccessfull) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            response.sendRedirect("user-dashboard");
        } else {
            request.setAttribute("error", "Email or Password is Incorrect !");
            request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/UserLogin.jsp").forward(request, response);
    }

}
