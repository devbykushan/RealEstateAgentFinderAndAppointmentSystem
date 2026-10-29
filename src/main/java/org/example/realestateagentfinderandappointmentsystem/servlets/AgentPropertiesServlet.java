package org.example.realestateagentfinderandappointmentsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.AgentDashboardFileHandler;
import org.example.realestateagentfinderandappointmentsystem.fileHandlers.PropertiesFileHandler;
import org.example.realestateagentfinderandappointmentsystem.models.Property;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(name = "AgentProperties", urlPatterns = "/agent-properties")
@MultipartConfig
public class AgentPropertiesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        reloadSession(request);
        request.getRequestDispatcher("/AgentProperties.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String modalMessage = "";
        String action = request.getParameter("action");

        if (action.equals("create")) {
            String title =  request.getParameter("title");
            String type = request.getParameter("type");
            double price = Double.parseDouble(request.getParameter("price"));
            String status = request.getParameter("status");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String province = request.getParameter("province");
            int bedrooms = Integer.parseInt(request.getParameter("bedrooms"));
            int bathrooms = Integer.parseInt(request.getParameter("bathrooms"));
            double size = Double.parseDouble(request.getParameter("sqft"));
            String builtYear = request.getParameter("builtYear");
            String[] amenities = request.getParameterValues("amenities");
            String agentName = request.getParameter("agent");

            Property property = new Property(title,type, agentName, price, status, address, city, province, bedrooms, bathrooms, size, builtYear, amenities);

            //Saving the image in the src/image/agents directory
            Part file = request.getPart("propertyImage");
            String fileExtension = "";
            if ("image/png".equals(file.getContentType())) {
                fileExtension = ".png";
            } else if ("image/jpeg".equals(file.getContentType())) {
                fileExtension =".jpg";
            }
            String filename = property.getPropertyTitle()+fileExtension;
            String uploadPath = "D:\\Lab Submissions\\Y1S2\\OOP Projects\\RealEstateAgentFinderAndAppointmentSystem\\src\\main\\webapp\\images\\properties";
            file.write(uploadPath+ File.separator+filename);

            property.setPropertyImage(filename);

            boolean isPropertyAdded = PropertiesFileHandler.addProperty(property);

            if (isPropertyAdded) {
                modalMessage = "Property Added Successfully ✅";
            } else {
                modalMessage = "Failed to Add Property ❌";
            }

        } else if (action.equals("delete")) {
            String propertyName = request.getParameter("propertyTitle");
            boolean isDeleted = PropertiesFileHandler.deleteProperty(propertyName);

            if (isDeleted) {
                modalMessage = "Property Deleted Successfully ✅";
            } else {
                modalMessage = "Failed to Delete Property ❌";
            }
        }
        request.setAttribute("modalMessage", modalMessage);
        reloadSession(request);
        request.getRequestDispatcher("/AgentProperties.jsp").forward(request, response);
    }

    protected void reloadSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");

        HashMap<String, String> agent = AgentDashboardFileHandler.agentSession(email, password);
        ArrayList<HashMap<String, String>> propertiesList = PropertiesFileHandler.getPropertiesListForAgent(agent.get("name"));
        request.setAttribute("agent", agent);
        request.setAttribute("properties", propertiesList);
    }
}

