<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${user.name} | Real Estate Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-bg: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            --card-bg: rgba(255, 255, 255, 0.95);
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --sidebar-width: 280px;
        }

        body {
            background: var(--primary-bg);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Sidebar Styles */
        .sidebar-container {
            width: var(--sidebar-width);
            position: sticky;
            top: 0;
            height: 100vh;
        }

        .sidebar {
            height: 100%;
            display: flex;
            flex-direction: column;
            padding: 1rem;
        }

        .sidebar-content {
            flex: 1;
        }

        .sidebar-footer {
            margin-top: auto;
            padding: 1rem 0;
            text-align: center;
        }

        .nav-item {
            margin-bottom: 0.5rem;
        }

        .nav-link {
            border-radius: 6px;
            padding: 0.75rem 1rem;
            transition: all 0.2s;
            color: var(--primary-color);
            display: flex;
            align-items: center;
        }

        .nav-link:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }

        .nav-link.active {
            background-color: var(--secondary-color);
            color: white !important;
        }

        .nav-link.btn {
            text-align: left;
            border: 1px solid var(--secondary-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav-link.btn.active {
            background-color: var(--secondary-color);
            color: white !important;
            border-color: var(--secondary-color);
        }

        /* Dashboard Styles */
        .dashboard-card {
            background: var(--card-bg);
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            margin-bottom: 20px;
            border: none;
        }

        .profile-img {
            width: 90px;
            height: 90px;
            object-fit: cover;
        }

        .agent-profile-img {
            width: 120px;
            height: 120px;
            object-fit: cover;
        }

        .property-card img {
            height: 180px;
            object-fit: cover;
        }

        .agent-card {
            transition: transform 0.3s;
            cursor: pointer;
        }

        .agent-card:hover {
            transform: translateY(-5px);
        }

        .star-rating {
            display: inline-block;
            font-size: 0;
        }

        .star-rating input[type="radio"] {
            display: none;
        }

        .star-rating label {
            font-size: 2rem;
            padding: 0 3px;
            cursor: pointer;
            color: #ddd;
        }
        .star-rating label:hover,
        .star-rating label:hover ~ label,
        .star-rating input[type="radio"]:checked ~ label {
            color: #ffc107;
        }

        .star-rating {
            direction: rtl;
            unicode-bidi: bidi-override;
        }

        .agent-specialties {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-top: 10px;
        }

        .specialty-badge {
            background-color: #e9f7fe;
            color: #1976d2;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
        }

        .modal-agent-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin: 0 auto;
            display: block;
        }

        .logout-btn {
            width: 100%;
            max-width: 200px;
            margin: 0 auto;
        }

        .sort-container {
            width: 200px;
        }
    </style>
</head>
<body>
<div class="container-fluid py-6">
    <div class="d-flex justify-content-center align-items-center mb-4 py-3">
        <h1 class="text-white"><i class="bi bi-house-heart"></i> FindMyAgent</h1>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-3 sidebar-container">
            <div class="dashboard-card sidebar">
                <div class="sidebar-content">
                    <div class="text-center mb-4">
                        <img src="${pageContext.request.contextPath}/images/user.png" class="profile-img rounded-circle mb-3" alt="Profile">
                        <h5 class="mb-1">${user.name}</h5>
                        <p class="text-muted small"> Id : ${user.id}</p>
                    </div>

                    <ul class="nav flex-column mb-4">
                        <li class="nav-item">
                            <a class="nav-link ${pageContext.request.requestURI.endsWith('user-dashboard') ? 'active' : ''}"
                               href="${pageContext.request.contextPath}/user-dashboard">
                                <i class="bi bi-speedometer2 me-2"></i>Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${pageContext.request.requestURI.endsWith('/user-appointments') ? 'btn-primary active' : 'btn-outline-primary'}"
                               href="${pageContext.request.contextPath}/user-appointments">
                                <i class="bi bi-calendar me-2"></i>Appointments
                                <span class="badge bg-danger ms-2">${appointments_count}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${pageContext.request.requestURI.endsWith('/user-properties') ? 'btn-primary active' : 'btn-outline-primary'}"
                               href="${pageContext.request.contextPath}/user-properties">
                                <i class="bi bi-house-heart me-2"></i>Properties
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="sidebar-footer">
                    <a class="btn btn-outline-danger logout-btn" href="${pageContext.request.contextPath}/user-login">
                        <i class="bi bi-box-arrow-right me-2"></i>Logout
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-9">
            <!-- Agents Section -->
            <div class="dashboard-card p-4 mb-4">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="mb-0">
                        <i class="bi bi-people text-primary me-2"></i>Available Agents
                    </h4>
                    <form action="${pageContext.request.contextPath}/user-dashboard" method="get" id="agentFilterForm" class="sort-container">
                        <select class="form-select" id="agentSort" name="agentSort" onchange="this.form.submit()">
                            <option value="default" ${param.agentSort == 'default' ? 'selected' : ''}>Sort by: Default</option>
                            <option value="highest" ${param.agentSort == 'highest' ? 'selected' : ''}>Highest Rating</option>
                            <option value="lowest" ${param.agentSort == 'lowest' ? 'selected' : ''}>Lowest Rating</option>
                            <option value="mostExp" ${param.agentSort == 'mostExp' ? 'selected' : ''}>Most Experience</option>
                        </select>
                    </form>
                </div>

                <div class="row" id="agentsContainer">
                    <c:forEach items="${agents}" var="agent" varStatus="loop">
                        <div class="col-md-4 mb-4">
                            <div class="card agent-card h-100" data-bs-toggle="modal" data-bs-target="#agentModal${loop.index}">
                                <div class="card-body text-center">
                                    <img src="${pageContext.request.contextPath}/images/agents/${agent.image}" class="rounded-circle mb-3" width="80" alt="Agent">
                                    <h5 class="card-title mb-3">${agent.name}</h5>
                                    <p class="card-text small text-muted mb-1">
                                        <i class="bi bi-briefcase me-1"></i> ${agent.experience} years experience
                                    </p>
                                    <p class="card-text small text-muted">
                                        <i class="bi bi-house me-1"></i> ${agent.propertiesSold} properties sold
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Agent Modal -->
                        <div class="modal fade" id="agentModal${loop.index}" tabindex="-1" aria-labelledby="agentModalLabel${loop.index}" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="agentModalLabel${loop.index}">Agent Profile</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-4 text-center">
                                                <img src="${pageContext.request.contextPath}/images/agents/${agent.image}" class="modal-agent-img rounded-circle mb-3" alt="Agent">
                                                <h4>${agent.name}</h4>
                                                <div class="star-rating mb-2">
                                                    <c:forEach begin="1" end="${Math.round(Double.parseDouble(agent.rating))}">
                                                        <i class="bi bi-star-fill"></i>
                                                    </c:forEach>
                                                    <c:forEach begin="${Math.round(Double.parseDouble(agent.rating)) + 1}" end="5">
                                                        <i class="bi bi-star"></i>
                                                    </c:forEach>
                                                    <span class="text-muted small ms-1">${agent.reviewsCount} (reviews)</span>
                                                </div>
                                                <button class="btn btn-primary w-100 mb-3" data-bs-toggle="modal" data-bs-target="#appointmentModal${loop.index}">
                                                    <i class="bi bi-calendar-plus me-1"></i> Create Appointment
                                                </button>
                                                <button class="btn btn-outline-secondary w-100 mb-3" data-bs-toggle="modal" data-bs-target="#reviewModal${loop.index}">
                                                    <i class="bi bi-pencil-square me-1"></i> Add Review
                                                </button>
                                                <form action="${pageContext.request.contextPath}/user-reviews" style="display: inline;">
                                                    <input type="hidden" name="agentEmail" value="${agent.email}">
                                                    <input type="hidden" name="agentPassword" value="${agent.password}">
                                                    <button type="submit" class="btn btn-primary">
                                                        <i class="bi bi-list-ul me-1"></i> View All Reviews
                                                    </button>
                                                </form>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="mb-4">
                                                    <h5>About</h5>
                                                    <p>${agent.bio}</p>
                                                </div>

                                                <div class="row mb-4">
                                                    <div class="col-6">
                                                        <div class="d-flex align-items-center mb-2">
                                                            <i class="bi bi-briefcase me-2"></i>
                                                            <div>
                                                                <small class="text-muted">Experience</small>
                                                                <div>${agent.experience} years</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="d-flex align-items-center mb-2">
                                                            <i class="bi bi-house me-2"></i>
                                                            <div>
                                                                <small class="text-muted">Properties Sold</small>
                                                                <div>${agent.propertiesSold}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="d-flex align-items-center mb-2">
                                                            <i class="bi bi-geo-alt me-2"></i>
                                                            <div>
                                                                <small class="text-muted">Location</small>
                                                                <div>${agent.location}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="mb-3">
                                                    <h5>Specialties</h5>
                                                    <div class="agent-specialties">
                                                        <c:forEach items="${agent.specialties}" var="specialty">
                                                            <span class="specialty-badge">${specialty}</span>
                                                        </c:forEach>
                                                    </div>
                                                </div>

                                                <div class="mb-3">
                                                    <h5>Languages</h5>
                                                    <div class="agent-languages">
                                                        <c:forEach items="${agent.languages}" var="language">
                                                            <span class="specialty-badge">${language}</span>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Review Modal -->
                        <div class="modal fade" id="reviewModal${loop.index}" tabindex="-1" aria-labelledby="reviewModalLabel${loop.index}" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="reviewModalLabel">Write a Review for ${agent.name}</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="newReviewForm" action="${pageContext.request.contextPath}/user-dashboard" method="POST">
                                            <input type="hidden" name="agentName" value="${agent.name}">

                                            <div class="mb-4 text-center">
                                                <h5>How would you rate your experience?</h5>
                                                <div class="star-rating">

                                                    <input type="radio" id="star5-${loop.index}" name="rating" value="5" required>
                                                    <label for="star5-${loop.index}" title="5 stars"><i class="bi bi-star-fill"></i></label>

                                                    <input type="radio" id="star4-${loop.index}" name="rating" value="4">
                                                    <label for="star4-${loop.index}" title="4 stars"><i class="bi bi-star-fill"></i></label>

                                                    <input type="radio" id="star3-${loop.index}" name="rating" value="3">
                                                    <label for="star3-${loop.index}" title="3 stars"><i class="bi bi-star-fill"></i></label>

                                                    <input type="radio" id="star2-${loop.index}" name="rating" value="2">
                                                    <label for="star2-${loop.index}" title="2 stars"><i class="bi bi-star-fill"></i></label>

                                                    <input type="radio" id="star1-${loop.index}" name="rating" value="1">
                                                    <label for="star1-${loop.index}" title="1 star"><i class="bi bi-star-fill"></i></label>
                                                </div>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Review Title</label>
                                                <input type="text" class="form-control" name="title" placeholder="Summarize your experience" required>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Your Review*</label>
                                                <textarea class="form-control" name="content" rows="5" placeholder="Share details of your experience with this agent" required></textarea>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Transaction Type</label>
                                                <select class="form-select" name="transactionType" required>
                                                    <option value="">Select transaction type</option>
                                                    <option value="Purchase">Purchase</option>
                                                    <option value="Sale">Sale</option>
                                                    <option value="Rental">Rental</option>
                                                </select>
                                            </div>

                                            <div class="mb-3">
                                                <input type="hidden" class="form-control" name="reviewerName" value="${user.name}" required>
                                            </div>

                                            <div class="form-check mb-3">
                                                <input class="form-check-input" type="checkbox" id="recommend" name="wouldRecommend" checked>
                                                <label class="form-check-label" for="recommend">
                                                    I would recommend this agent to others
                                                </label>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                <button type="submit" name="action" value="addReview" class="btn btn-primary">Submit Review</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Appointment Modal -->
                        <div class="modal fade" id="appointmentModal${loop.index}" tabindex="-1" aria-labelledby="appointmentModalLabel${loop.index}" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="appointmentModalLabel${loop.index}">Schedule Appointment</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="${pageContext.request.contextPath}/user-dashboard" method="post" id="appointmentForm${loop.index}">
                                            <input type="hidden" name="agentId" value="${agent.id}">
                                            <div class="mb-3">
                                                <label class="form-label">Agent</label>
                                                <input type="text" class="form-control" name="agentName" value="${agent.name}" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Appointment Type</label>
                                                <select class="form-select" name="appointmentType" required>
                                                    <option value="">Select type</option>
                                                    <option value="Virtual Tour">Virtual Tour</option>
                                                    <option value="In-Person Viewing">In-Person Viewing</option>
                                                    <option value="Consultation">Consultation</option>
                                                    <option value="Document Signing">Document Signing</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Priority</label>
                                                <select class="form-select" name="priority">
                                                    <option value="Normal">Normal</option>
                                                    <option value="High">High</option>
                                                    <option value="Urgent">Urgent</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Date</label>
                                                <input type="date" class="form-control" name="appointmentDate" required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Time</label>
                                                <input type="time" class="form-control" name="appointmentTime" required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Notes (Optional)</label>
                                                <textarea class="form-control" name="notes" rows="3"></textarea>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                <button type="submit" name="action" value="createAppointment" class="btn btn-primary">Schedule</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
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
