package org.example.realestateagentfinderandappointmentsystem.models;

import java.util.UUID;

public class Appointment {
    private String appointmentId;
    private String appointmentAgentName;
    private String appointmentCreatedUserName;
    private String appointmentType;
    private String priority;
    private String appointmentDate;
    private String appointmentTime;
    private String specialNotes;
    private String status;

    public Appointment() {

    }

    public Appointment(String appointmentAgentName, String appointmentCreatedUserName, String appointmentType, String priority, String appointmentDate, String appointmentTime, String specialNotes, String status) {
        this.appointmentId = generateAppointmentId() ;
        this.appointmentAgentName = appointmentAgentName;
        this.appointmentCreatedUserName = appointmentCreatedUserName;
        this.appointmentType = appointmentType;
        this.priority = priority;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.specialNotes = specialNotes;
        this.status = status;
    }

    public String getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId() {
        this.appointmentId = generateAppointmentId();
    }

    public String getAppointmentAgentName() {
        return appointmentAgentName;
    }

    public void setAppointmentAgentName(String appointmentAgentName) {
        this.appointmentAgentName = appointmentAgentName;
    }

    public String getAppointmentCreatedUserName() {
        return appointmentCreatedUserName;
    }

    public void setAppointmentCreatedUserName(String appointmentCreatedUserName) {
        this.appointmentCreatedUserName = appointmentCreatedUserName;
    }

    public String getAppointmentType() {
        return appointmentType;
    }

    public void setAppointmentType(String appointmentType) {
        this.appointmentType = appointmentType;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getSpecialNotes() {
        return specialNotes;
    }

    public void setSpecialNotes(String specialNotes) {
        this.specialNotes = specialNotes;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String generateAppointmentId() {
        return "APP-"+ UUID.randomUUID().toString().toUpperCase().substring(1, 8);
    }
}
