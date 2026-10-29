<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | FindMyAgent</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-color: #6a11cb;
            --secondary-color: #2575fc;
            --sidebar-bg: #2c3e50;
            --sidebar-width: 280px;
            --card-bg: rgba(255, 255, 255, 0.98);
            --text-dark: #2c3e50;
            --text-light: #7f8c8d;
            --active-item: rgba(255, 255, 255, 0.1);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            min-height: 100vh;
            color: var(--text-dark);
            overflow-x: hidden;
        }

        /* Sidebar Styles */
        .sidebar-container {
            width: var(--sidebar-width);
            min-height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background: var(--sidebar-bg);
            color: white;
            transition: all 0.3s;
            z-index: 1000;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar-header {
            padding: 1.5rem 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
        }

        .sidebar-profile {
            text-align: center;
            padding: 1.5rem 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .profile-img {
            width: 90px;
            height: 90px;
            object-fit: cover;
            border: 3px solid rgba(255, 255, 255, 0.2);
            margin-bottom: 1rem;
        }

        .admin-badge {
            background-color: var(--primary-color);
            color: white;
            font-size: 0.7rem;
            font-weight: 500;
            padding: 0.25rem 0.75rem;
            border-radius: 50px;
        }

        .sidebar-menu {
            padding: 1rem 0;
        }

        .nav-item {
            margin-bottom: 0.25rem;
        }

        .nav-link {
            color: rgba(255, 255, 255, 0.8);
            padding: 0.75rem 1.5rem;
            display: flex;
            align-items: center;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }

        .nav-link:hover, .nav-link.active {
            color: white;
            background: var(--active-item);
            border-left: 3px solid var(--primary-color);
        }

        .nav-link i {
            margin-right: 0.75rem;
            font-size: 1.1rem;
            width: 20px;
            text-align: center;
        }

        .sidebar-footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            padding: 1rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .logout-btn {
            width: 100%;
            color: rgba(255, 255, 255, 0.8);
            border-color: rgba(255, 255, 255, 0.2);
        }

        .logout-btn:hover {
            color: white;
            background-color: rgba(255, 255, 255, 0.1);
        }

        /* Main Content Styles */
        .main-content {
            margin-left: var(--sidebar-width);
            padding: 2rem;
            transition: all 0.3s;
        }

        .dashboard-card {
            background: var(--card-bg);
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            margin-bottom: 20px;
            border: none;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
        }

        .stat-card {
            border-left: 4px solid var(--primary-color);
        }

        .stat-icon {
            font-size: 1.75rem;
            color: var(--primary-color);
            opacity: 0.8;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            object-fit: cover;
        }

        /* Responsive adjustments */
        @media (max-width: 992px) {
            .sidebar-container {
                margin-left: -100%;
            }
            .sidebar-container.active {
                margin-left: 0;
            }
            .main-content {
                margin-left: 0;
            }
            .main-content.active {
                margin-left: var(--sidebar-width);
            }
        }

        /* Custom scrollbar for sidebar */
        .sidebar-menu::-webkit-scrollbar {
            width: 5px;
        }
        .sidebar-menu::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }
        .sidebar-menu::-webkit-scrollbar-track {
            background: transparent;
        }

        /* Badge styling */
        .badge {
            font-weight: 500;
            padding: 0.35em 0.65em;
        }

        /* Modal styling */
        .modal-header {
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }
        .modal-footer {
            border-top: 1px solid rgba(0, 0, 0, 0.1);
        }

        @keyframes bounceIn {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }
    </style>
</head>
<body>

<div class="sidebar-container">
    <div class="sidebar-header">
        <h4 class="text-white"><i class="bi bi-house-heart me-2"></i> FindMyAgent</h4>
    </div>

    <div class="sidebar-profile">
        <img src="${pageContext.request.contextPath}/images/admin.png" class="profile-img rounded-circle" alt="Profile">
        <h5 class="text-white mb-1">${admin.name}</h5>
        <p class="text-white small mb-2">ID: ${admin.id}</p>
        <span class="admin-badge">${admin.role}r</span>
    </div>

    <div class="sidebar-menu">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="${pageContext.request.contextPath}/AdminDashboard.jsp">
                    <i class="bi bi-speedometer2"></i>Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/AdminUsers.jsp">
                    <i class="bi bi-people"></i>Users
                    <span class="badge bg-primary ms-auto">${stats.usersCount}</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/AdminAgents.jsp">
                    <i class="bi bi-person-badge"></i>Agents
                    <span class="badge bg-success ms-auto">${stats.agentsCount}</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/AdminAppointments.jsp">
                    <i class="bi bi-calendar"></i>Appointments
                    <span class="badge bg-warning ms-auto">${stats.appointmentsCount}</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="sidebar-footer">
        <a class="btn btn-outline-danger logout-btn" href="${pageContext.request.contextPath}/AdminLogin.jsp">
            <i class="bi bi-box-arrow-right me-2"></i>Logout
        </a>
    </div>
</div>

<div class="main-content">
    <button class="btn btn-primary d-lg-none mb-3" type="button" id="sidebarToggle">
        <i class="bi bi-list"></i>
    </button>

    <div class="row mb-4">
        <div class="col-md-6 col-lg-3 mb-4">
            <div class="dashboard-card stat-card p-3 h-100">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-muted mb-2">Total Users</h6>
                        <h3 class="mb-0">${stats.usersCount}</h3>
                    </div>
                    <div class="stat-icon">
                        <i class="bi bi-people"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-3 mb-4">
            <div class="dashboard-card stat-card p-3 h-100">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-muted mb-2">Active Agents</h6>
                        <h3 class="mb-0">${stats.agentsCount}</h3>
                    </div>
                    <div class="stat-icon">
                        <i class="bi bi-person-badge"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-3 mb-4">
            <div class="dashboard-card stat-card p-3 h-100">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-muted mb-2">Appointments</h6>
                        <h3 class="mb-0">${stats.appointmentsCount}</h3>
                    </div>
                    <div class="stat-icon">
                        <i class="bi bi-calendar-check"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-15 mb-4">
            <div class="dashboard-card p-4 h-100">
                <h4 class="mb-4">
                    <i class="bi bi-plus-circle text-primary me-2"></i>Quick Actions
                </h4>

                <div class="row g-3">
                    <div class="col-md-6">
                        <button class="btn btn-outline-primary w-100 mb-2" data-bs-toggle="modal" data-bs-target="#addUserModal">
                            <i class="bi bi-person-plus me-1"></i> Add User
                        </button>
                    </div>
                    <div class="col-md-6">
                        <button class="btn btn-outline-success w-100 mb-2" data-bs-toggle="modal" data-bs-target="#addAgentModal">
                            <i class="bi bi-person-badge me-1"></i> Add Agent
                        </button>
                    </div>
                    <div class="col-md-6">
                        <button class="btn btn-outline-info w-100 mb-2" data-bs-toggle="modal" data-bs-target="#createAppointmentModal">
                            <i class="bi bi-calendar-plus me-1"></i> Create Appointment
                        </button>
                    </div>
                    <div class="col-md-6">
                        <button class="btn btn-outline-success w-100 mb-2" data-bs-toggle="modal" data-bs-target="#addAdminModal">
                            <i class="bi bi-person-plus me-1"></i> Add New Admin
                        </button>
                    </div>
                    <div class="col-md-6">
                        <button class="btn btn-outline-primary w-100 mb-2" data-bs-toggle="modal" data-bs-target="#removeUserModal">
                            <i class="bi bi-x"></i> Remove User
                        </button>
                    </div>
                    <div class="col-md-6">
                        <button class="btn btn-outline-info w-100 mb-2" data-bs-toggle="modal" data-bs-target="#removeAgentModal">
                            <i class="bi bi-x"></i> Remove Agent
                        </button>
                    </div>
                    <div class="col-md-6">
                        <button class="btn btn-outline-success w-100 mb-2" data-bs-toggle="modal" data-bs-target="#removeAppointmentModal">
                            <i class="bi bi-x"></i> Remove Appointment
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addUserModalLabel">Add New User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/admin-dashboard" method="post" id="addUserForm">
                    <input type="hidden" name="formSource" value="addUser">
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="tel" class="form-control" id="name" name="name" value="${param.name}" required>
                    </div>

                    <div class="mb-3">
                        <label for="contact" class="form-label">Contact Number</label>
                        <input type="number" class="form-control" id="contact" name="contact" value="${param.contact}" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${param.email}" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password"
                               minlength="8" required>
                        <div class="form-text">Minimum 8 characters</div>
                    </div>

                    <div class="mb-4">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" form="addUserForm" class="btn btn-primary">Add User</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addAgentModal" tabindex="-1" aria-labelledby="addAgentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAgentModalLabel">Add New Agent</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/admin-dashboard" method="post" id="addAgentForm" enctype="multipart/form-data">
                    <input type="hidden" name="formSource" value="addAgent">

                    <div class="d-flex flex-column align-items-center mb-4">
                        <label class="btn btn-outline-primary upload-btn">
                            <i class="bi bi-camera-fill me-2"></i>
                            <input type="file" id="profileImage" name="profileImage" accept="image/*">
                        </label>
                    </div>

                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="name" name="name" value="${param.name}" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${param.email}" required>
                    </div>

                    <div class="mb-3">
                        <label for="bio" class="form-label">Bio</label>
                        <textarea
                                class="form-control"
                                id="bio"
                                name="bio"
                                rows="4"
                                placeholder="Tell us about yourself..."
                        ></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="contact" class="form-label">Contact Number</label>
                        <input type="tel" class="form-control" id="contact" name="contact" value="${param.contact}" required>
                    </div>

                    <div class="mb-3">
                        <label for="licenseNumber" class="form-label">License Number</label>
                        <input type="text" class="form-control" id="licenseNumber" name="licenseNumber" value="${param.licenseNumber}" required>
                    </div>

                    <div class="mb-3">
                        <label for="agency" class="form-label">Agency</label>
                        <input type="text" class="form-control" id="agency" name="agency" value="${param.agency}">
                    </div>

                    <div class="mb-3">
                        <label for="location" class="form-label">Location</label>
                        <select class="form-select" aria-label="Default select example" name="location" id="location">
                            <option selected>Open this select menu</option>
                            <option value="Colombo">Colombo</option>
                            <option value="Kandy">Kandy</option>
                            <option value="Galle">Galle</option>
                            <option value="Jaffna">Jaffna</option>
                            <option value="Negombo">Negombo</option>
                            <option value="Trincomalee">Trincomalee</option>
                            <option value="Batticaloa">Batticaloa</option>
                            <option value="Anuradhapura">Anuradhapura</option>
                            <option value="Polonnaruwa">Polonnaruwa</option>
                            <option value="Matara">Matara</option>
                            <option value="Ratnapura">Ratnapura</option>
                            <option value="Kurunegala">Kurunegala</option>
                            <option value="Badulla">Badulla</option>
                            <option value="Nuwara Eliya">Nuwara Eliya</option>
                            <option value="Mannar">Mannar</option>
                            <option value="Hambantota">Hambantota</option>
                            <option value="Kalutara">Kalutara</option>
                            <option value="Ampara">Ampara</option>
                            <option value="Vavuniya">Vavuniya</option>
                            <option value="Dambulla">Dambulla</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="properties" class="form-label">Properties Sold</label>
                        <select class="form-select" aria-label="Default select example" name="properties" id="properties">
                            <option selected>Open this select menu</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5+">5+</option>
                            <option value="10+">10+</option>
                            <option value="20+">20+</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="experience" class="form-label">Experience</label>
                        <select class="form-select" aria-label="Default select example" name="experience" id="experience">
                            <option selected>Open this select menu</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5+">5+</option>
                            <option value="10+">10+</option>
                            <option value="20+">20+</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="languages" class="form-label">Languages You Can Speak</label>
                        <select class="form-select" multiple aria-label="multiple select example" name="languages" id="languages">
                            <option value="Sinhala">Sinhala</option>
                            <option value="English">English</option>
                            <option value="Tamil">Tamil</option>
                        </select>
                        <div class="form-text">Hold Ctrl/Cmd to select multiple</div>
                    </div>

                    <div class="mb-3">
                        <label for="specialties" class="form-label">Specialties</label>
                        <select class="form-select" id="specialties" name="specialties" multiple >
                            <option value="residential">Residential</option>
                            <option value="commercial">Commercial</option>
                            <option value="luxury">Luxury Homes</option>
                            <option value="rentals">Rentals</option>
                        </select>
                        <div class="form-text">Hold Ctrl/Cmd to select multiple</div>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" minlength="8" required>
                        <div class="form-text">Minimum 8 characters</div>
                    </div>

                    <div class="mb-4">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" form="addAgentForm" class="btn btn-primary">Add Agent</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="removeUserModal" tabindex="-1" aria-labelledby="removeUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="removeUserModalLabel">Remove User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/admin-dashboard" method="post" id="removeUserForm">
                    <input type="hidden" name="formSource" value="removeUser">

                    <div class="mb-3">
                        <label for="userid" class="form-label">User ID</label>
                        <input type="text" class="form-control" id="userid" name="userid" value="${param.userid}" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit"  form="removeUserForm" class="btn btn-primary">Remove User</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="removeAgentModal" tabindex="-1" aria-labelledby="removeAgentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="removeAgentModalLabel">Remove Agent</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/admin-dashboard" method="post" id="removeAgentForm">
                    <input type="hidden" name="formSource" value="removeAgent">

                    <div class="mb-3">
                        <label for="agentId" class="form-label">Agent ID</label>
                        <input type="text" class="form-control" id="agentId" name="agentId" value="${param.agentId}" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" form="removeAgentForm" class="btn btn-primary">Remove Agent</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="removeAppointmentModal" tabindex="-1" aria-labelledby="removeAppointmentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="removeAppointmentModalLabel">Remove Appointment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/admin-dashboard" method="post" id="removeAppointmentForm">
                    <input type="hidden" name="formSource" value="removeAppointment">

                    <div class="mb-3">
                        <label for="appointmentId" class="form-label">Appointment ID</label>
                        <input type="text" class="form-control" id="appointmentId" name="appointmentId" value="${param.appointmentId}" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" form="removeAppointmentForm" class="btn btn-primary">Remove Appointment</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="createAppointmentModal" tabindex="-1" aria-labelledby="createAppointmentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createAppointmentModalLabel">Create Appointment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/admin-dashboard" method="post" id="createAppointmentFor">
                    <input type="hidden" name="formSource" value="addAppointment">
                    <div class="mb-3">
                        <label for="appointmentClient" class="form-label">Client</label>
                        <select class="form-select" id="appointmentClient" name="clientId" required>
                            <option value="">Select Client</option>
                            <c:forEach items="${users}" var="user">
                                <option value="${user.id}">${user.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="appointmentAgent" class="form-label">Agent</label>
                        <select class="form-select" id="appointmentAgent" name="agentId" required>
                            <option value="">Select Agent</option>
                            <c:forEach items="${agents}" var="agent">
                                <option value="${agent.id}">${agent.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="appointmentType" class="form-label">Type</label>
                        <select class="form-select" id="appointmentType" name="type" required>
                            <option value="">Select Type</option>
                            <option value="Virtual Tour">Virtual Tour</option>
                            <option value="In-Person Viewing">In-Person Viewing</option>
                            <option value="Consultation">Consultation</option>
                            <option value="Document Signing">Document Signing</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="appointmentDate" class="form-label">Date</label>
                        <input type="date" class="form-control" id="appointmentDate" name="date" required>
                    </div>
                    <div class="mb-3">
                        <label for="appointmentTime" class="form-label">Time</label>
                        <input type="time" class="form-control" id="appointmentTime" name="time" required>
                    </div>
                    <div class="mb-3">
                        <label for="appointmentNotes" class="form-label">Notes</label>
                        <textarea class="form-control" id="appointmentNotes" name="notes" rows="3"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Create Appointment</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addAdminModal" tabindex="-1" aria-labelledby="addAdminModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAdminModalLabel">Add New Admin</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/admin-dashboard" method="post" id="addAdminForm">
                    <input type="hidden" name="formSource" value="addAdmin">

                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="name" name="name" value="${param.name}" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${param.email}" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password"
                               minlength="8" required>
                        <div class="form-text">Minimum 8 characters</div>
                    </div>

                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    </div>

                    <div class="mb-3">
                        <label for="contact" class="form-label">Contact Number</label>
                        <input type="number" class="form-control" id="contact" name="contact" value="${param.contact}" required>
                    </div>

                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <select class="form-select" id="role" name="role" required>
                            <option value="">Select Type</option>
                            <option value="Admin">Admin</option>
                            <option value="SuperAdmin">SuperAdmin</option>
                            <option value="Moderator">Moderator</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" form="addAdminForm" class="btn btn-primary">Add Admin</button>
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
<script>
    document.getElementById('sidebarToggle').addEventListener('click', function() {
        document.querySelector('.sidebar-container').classList.toggle('active');
        document.querySelector('.main-content').classList.toggle('active');
    });

    document.addEventListener('DOMContentLoaded', function() {
        const today = new Date().toISOString().split('T')[0];
        document.querySelectorAll('input[type="date"]').forEach(input => {
            input.min = today;
        });
    });
</script>
</body>
</html>