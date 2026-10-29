<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Agent Dashboard | FindMyAgent</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <style>
    :root {
      --primary-color: #2575fc;
      --secondary-color: #6a11cb;
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

    .rating-badge {
      background-color: #ffc107;
      color: #000;
      font-weight: 600;
      font-size: 0.8rem;
      padding: 0.25rem 0.75rem;
      border-radius: 50px;
    }

    .sidebar-menu {
      padding: 1rem 0;
      max-height: calc(100vh - 400px);
      overflow-y: auto;
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

    .upcoming-appointment {
      border-left: 4px solid var(--primary-color);
      transition: all 0.2s;
    }

    .upcoming-appointment:hover {
      background-color: rgba(52, 152, 219, 0.05);
    }

    .property-card img {
      height: 160px;
      object-fit: cover;
      border-radius: 8px 8px 0 0;
    }

    .property-card .card-body {
      padding: 1rem;
    }

    .property-card .card-footer {
      background: transparent;
      border-top: none;
      padding: 0 1rem 1rem;
    }

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

    .badge {
      font-weight: 500;
      padding: 0.35em 0.65em;
    }

    .badge-confirmed {
      background-color: #28a745;
    }
    .badge-pending {
      background-color: #ffc107;
      color: #212529;
    }
    .badge-cancelled {
      background-color: #6c757d;
    }
  </style>
</head>
<body>

<div class="sidebar-container">
  <div class="sidebar-header">
    <h4 class="text-white"><i class="bi bi-house-heart me-2"></i> FindMyAgent</h4>
  </div>

  <div class="sidebar-profile">
    <img src="${pageContext.request.contextPath}/images/agents/${agent.image}" class="profile-img rounded-circle" alt="Profile">
    <h5 class="text-white mb-1">${agent.name}</h5>
    <p class="text-white small mb-2">Agent ID: ${agent.id}</p>
    <div class="rating mb-2">
      <span class="rating-badge">
         <c:forEach begin="1" end="${Math.round(Double.parseDouble(agent.rating))}">
           <i class="bi bi-star-fill"></i>
         </c:forEach>
         <c:forEach begin="${Math.round(Double.parseDouble(agent.rating)) + 1}" end="5">
           <i class="bi bi-star"></i>
         </c:forEach>
      </span>
    </div>
  </div>

  <div class="sidebar-menu">
    <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/agent-dashboard">
          <i class="bi bi-speedometer2"></i>Dashboard
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/agent-appointments">
          <i class="bi bi-calendar"></i>Appointments
          <span class="badge bg-danger ms-auto">${count.appointmentsCount}</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/agent-reviews">
          <i class="bi bi-chat-square-text"></i>Reviews
          <span class="badge bg-primary ms-auto">${count.reviewsCount}</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/agent-properties">
          <i class="bi bi-house me-2"></i>Properties
          <span class="badge bg-success ms-auto">${count.propertiesCount}</span>
        </a>
      </li>
    </ul>
  </div>

  <div class="sidebar-footer">
    <a class="btn btn-outline-danger logout-btn" href="${pageContext.request.contextPath}/agent-login">
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
            <h6 class="text-muted mb-2">Total Appointments</h6>
            <h3 class="mb-0">${count.appointmentsCount}</h3>
          </div>
          <div class="stat-icon">
            <i class="bi bi-calendar-check"></i>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-6 col-lg-3 mb-4">
      <div class="dashboard-card stat-card p-3 h-100">
        <div class="d-flex justify-content-between align-items-center">
          <div>
            <h6 class="text-muted mb-2">Client Reviews</h6>
            <h3 class="mb-0">${count.reviewsCount}</h3>
          </div>
          <div class="stat-icon">
            <i class="bi bi-star"></i>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-3 mb-4">
      <div class="dashboard-card stat-card p-3 h-100">
        <div class="d-flex justify-content-between align-items-center">
          <div>
            <h6 class="text-muted mb-2">Properties Listed</h6>
            <h3 class="mb-0">${count.propertiesCount}</h3>
          </div>
          <div class="stat-icon">
            <i class="bi bi-house"></i>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="dashboard-card p-4 mb-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h4 class="mb-0">
        <i class="bi bi-calendar-check text-primary me-2"></i>Upcoming Appointments
      </h4>
      <a href="${pageContext.request.contextPath}/agent-appointments" class="btn btn-sm btn-outline-primary">View All</a>
    </div>

    <div class="table-responsive">
      <table class="table table-hover align-middle">
        <thead>
        <tr>
          <th>Date & Time</th>
          <th>Client</th>
          <th>Property</th>
          <th>Type</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${upcomingAppointments}" var="appointment" end="4">
          <tr class="upcoming-appointment">
            <td>${appointment.dateTime}</td>
            <td>
              <div class="d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/images/user.png" class="rounded-circle me-2" width="30" alt="Client">
                  ${appointment.clientName}
              </div>
            </td>
            <td>${appointment.propertyAddress}</td>
            <td>${appointment.type}</td>
            <td>
                  <span class="badge rounded-pill ${appointment.status == 'Confirmed' ? 'badge-confirmed' : appointment.status == 'Pending' ? 'badge-pending' : 'badge-cancelled'}">
                      ${appointment.status}
                  </span>
            </td>
            <td>
              <div class="btn-group btn-group-sm">
                <button class="btn btn-outline-primary" onclick="viewAppointment('${appointment.id}')">
                  <i class="bi bi-eye"></i>
                </button>
                <button class="btn btn-outline-secondary" onclick="editAppointment('${appointment.id}')">
                  <i class="bi bi-pencil"></i>
                </button>
              </div>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>

  <div class="dashboard-card p-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h4 class="mb-0">
        <i class="bi bi-chat-square-text text-primary me-2"></i>Recent Reviews
      </h4>
      <a href="${pageContext.request.contextPath}/agent-reviews" class="btn btn-sm btn-outline-primary">View All</a>
    </div>

    <div class="row">
      <c:forEach items="${recentReviews}" var="review" end="3">
        <div class="col-md-6 mb-4">
          <div class="card h-100">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-start mb-2">
                <div>
                  <h6 class="card-title mb-0">${review.clientName}</h6>
                  <div class="star-rating small text-warning">
                    <c:forEach begin="1" end="${review.rating}">
                      <i class="bi bi-star-fill"></i>
                    </c:forEach>
                    <c:forEach begin="${review.rating + 1}" end="5">
                      <i class="bi bi-star"></i>
                    </c:forEach>
                  </div>
                </div>
                <small class="text-muted">${review.date}</small>
              </div>
              <p class="card-text mt-2">${review.comment}</p>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
  document.getElementById('sidebarToggle').addEventListener('click', function() {
    document.querySelector('.sidebar-container').classList.toggle('active');
    document.querySelector('.main-content').classList.toggle('active');
  });
</script>
</body>
</html>