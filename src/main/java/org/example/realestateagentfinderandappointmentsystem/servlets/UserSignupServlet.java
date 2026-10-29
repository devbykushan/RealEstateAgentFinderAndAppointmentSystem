package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.RegistrationHandler;
import org.example.realestateagentfinderandappointmentsystem.models.User;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "UserSignup", urlPatterns = "/user-signup")
public class UserSignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String cNumber = request.getParameter("contact");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        LocalDate date = LocalDate.now();

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match !");

            request.setAttribute("name", name);
            request.setAttribute("contact", cNumber);
            request.setAttribute("email", email);

            request.getRequestDispatcher("/UserSignup.jsp").forward(request, response);
        }

        User user = new User();
        user.setUserId();
        user.setName(name);
        user.setContactNumber(cNumber);
        user.setEmail(email);
        user.setPassword(password);
        user.setDate(date);

        RegistrationHandler reg = new RegistrationHandler();
        boolean isAccCreated = reg.userRegistrationFileHandler(user);

        if (isAccCreated) {
            request.setAttribute("success", "Account Created Successfully. Please Login !!");
            request.getRequestDispatcher("/UserLogin.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        getServletContext().getRequestDispatcher("/UserSignup.jsp").forward(request, response);
    }
}
