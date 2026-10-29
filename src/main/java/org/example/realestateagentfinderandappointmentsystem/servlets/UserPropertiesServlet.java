package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.PropertiesFileHandler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(name = "UserProperties", urlPatterns = {"/user-properties", "/admin-properties"})
public class UserPropertiesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<HashMap<String, String>> propertiesList = PropertiesFileHandler.getPropertiesList();
        request.setAttribute("properties", propertiesList);
        request.getRequestDispatcher("UserProperties.jsp").forward(request, response);

    }

}

