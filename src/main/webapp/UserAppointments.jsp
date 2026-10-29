<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointments | Real Estate Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-bg: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            --card-bg: rgba(255, 255, 255, 0.95);
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
        }

        body {
            background: var(--primary-bg);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .dashboard-card {
            background: var(--card-bg);
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            margin-bottom: 20px;
            border: none;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .status-confirmed {
            background-color: #d4edda;
            color: #155724;
        }

        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
        }

        .status-completed {
            background-color: #e2e3e5;
            color: #383d41;
        }

    </style>
</head>
<body>
<div class="container-fluid py-6">
    <div class="d-flex justify-content-center align-items-center mb-4 py-3">
        <h1 class="text-white"><i class="bi bi-house-heart"></i> FindMyAgent</h1>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="dashboard-card p-4 mb-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4 class="mb-0">
                        <i class="bi bi-calendar-check text-primary me-2"></i>My Appointments
                    </h4>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newAppointmentModal">
                        <i class="bi bi-plus-circle me-1"></i> New Appointment
                    </button>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                        <tr>
                            <th>Type</th>
                            <th>Agent</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${appointments}" var="appointment">
                            <tr>
                                <td>${appointment.type}</td>
                                <td>${appointment.agent}</td>
                                <td>${appointment.date}</td>
                                <td>${appointment.time}</td>
                                <td>
                    <span class="status-badge status-${appointment.status.toLowerCase()}">
                            ${appointment.status}
                    </span>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/user-appointments" method="post" class="d-inline">
                                        <input type="hidden" name="appointmentId" value="${appointment.id}">
                                        <button type="submit" name="action" value="DELETE" class="btn btn-sm btn-outline-danger">
                                            <i class="bi bi-trash"></i> Delete
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="newAppointmentModal" tabindex="-1" aria-labelledby="newAppointmentModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newAppointmentModalLabel">Schedule New Appointment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/user-appointments" method="post">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Agent</label>
                            <select class="form-select" name="agentName" required>
                                <option value="">Select Agent</option>
                                <c:forEach items="${agents}" var="agent">
                                    <option value="${agent.name}">${agent.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Appointment Type</label>
                            <select class="form-select" name="appointmentType" required>
                                <option value="">Select Type</option>
                                <option value="Virtual Tour">Virtual Tour</option>
                                <option value="In-Person Viewing">In-Person Viewing</option>
                                <option value="Consultation">Consultation</option>
                                <option value="Document Signing">Document Signing</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Priority</label>
                        <select class="form-select" name="priority">
                            <option value="Normal">Normal</option>
                            <option value="High">High</option>
                            <option value="Urgent">Urgent</option>
                        </select>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Date</label>
                            <input type="date" class="form-control" name="appointmentDate" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Time</label>
                            <input type="time" class="form-control" name="appointmentTime" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Notes (Optional)</label>
                        <textarea class="form-control" name="notes" rows="3"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" name="action" value="CREATE" class="btn btn-primary">Schedule Appointment</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="resultModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body text-center p-4">
                <div id="resultIcon" style="font-size: 3rem;"></div>
                <h4 id="resultMessage" class="my-3">${modalMessage}</h4>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<c:if test="${not empty modalMessage}">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var resultModal = new bootstrap.Modal(document.getElementById('resultModal'));
            resultModal.show();
        });
    </script>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>