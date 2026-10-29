<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agent Reviews | Real Estate Dashboard</title>
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

        .review-card {
            transition: all 0.3s;
            border-left: 4px solid var(--secondary-color);
        }

        .review-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        .rating {
            color: #ffc107;
            font-size: 1.2rem;
        }

        .agent-profile {
            text-align: center;
            padding: 20px;
        }

        .agent-img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            border: 5px solid white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .average-rating {
            font-size: 2.5rem;
            font-weight: bold;
            color: var(--secondary-color);
        }

        .star-rating {
            direction: rtl;
            display: inline-block;
        }

        .star-rating input[type=radio] {
            display: none;
        }

        .star-rating label {
            color: #ddd;
            font-size: 2rem;
            padding: 0 3px;
            cursor: pointer;
        }

        .star-rating input[type=radio]:checked ~ label,
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: #ffc107;
        }

        .specialty-badge {
            background-color: #e9ecef;
            padding: 3px 8px;
            border-radius: 20px;
            font-size: 0.8rem;
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
                <div class="row">
                    <div class="col-md-4">
                        <div class="agent-profile">
                            <img src="${pageContext.request.contextPath}/images/agents/${agent.image}" class="agent-img mb-3" alt="Agent Profile">
                            <h3>${agent.name}</h3>
                            <p class="text-muted">Real Estate Agent</p>
                            <div class="mb-3">
                                <span class="average-rating">${agent.rating}</span>
                                <div class="rating mb-2">
                                </div>
                                <p class="text-muted small">Based on ${count.all} reviews</p>
                            </div>
                            <div class="d-flex justify-content-center gap-2 mb-3">
                                <c:forEach items="${agent.specialties}" var="specialty">
                                    <span class="specialty-badge">${specialty}</span>
                                </c:forEach>
                            </div>
                            <p class="text-muted">
                                <i class="bi bi-geo-alt"></i> Serving ${agent.location} and surrounding areas
                            </p>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h4 class="mb-0">
                                <i class="bi bi-chat-square-text text-primary me-2"></i>Client Reviews
                            </h4>
                        </div>

                        <!-- Review Stats -->
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <div class="card p-3 mb-3">
                                    <div class="d-flex justify-content-between">
                                        <span>5 stars</span>
                                        <span>${count.stars5}</span>
                                    </div>
                                    <div class="progress" style="height: 8px;">
                                        <div class="progress-bar bg-warning" style="width: ${(count.stars5/count.all)*100}%"></div>
                                    </div>
                                </div>
                                <div class="card p-3 mb-3">
                                    <div class="d-flex justify-content-between">
                                        <span>4 stars</span>
                                        <span>${count.stars4}</span>
                                    </div>
                                    <div class="progress" style="height: 8px;">
                                        <div class="progress-bar bg-warning" style="width: ${(count.stars4/count.all)*100}%"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card p-3 mb-3">
                                    <div class="d-flex justify-content-between">
                                        <span>3 stars</span>
                                        <span>${count.stars3}</span>
                                    </div>
                                    <div class="progress" style="height: 8px;">
                                        <div class="progress-bar bg-warning" style="width: ${(count.stars3/count.all)*100}%"></div>
                                    </div>
                                </div>
                                <div class="card p-3">
                                    <div class="d-flex justify-content-between">
                                        <span>1-2 stars</span>
                                        <span>${count.stars1_2}</span>
                                    </div>
                                    <div class="progress" style="height: 8px;">
                                        <div class="progress-bar bg-warning" style="width: ${(count.stars1_2/count.all)*100}%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Reviews List -->
                        <div id="reviewsContainer">
                            <c:forEach items="${reviews}" var="review">
                                <div class="card review-card mb-3">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between mb-2">
                                            <div>
                                                <h5 class="card-title mb-0">${review.title}</h5>
                                                <p class="text-muted small mb-0">Transaction Type : ${review.transactionType}</p>
                                            </div>
                                            <div class="rating">
                                                <c:forEach begin="1" end="${review.starsCount}">
                                                    <i class="bi bi-star-fill"></i>
                                                </c:forEach>
                                                <c:forEach begin="${review.starsCount + 1}" end="5">
                                                    <i class="bi bi-star"></i>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <p class="card-text">${review.content}</p>
                                        <p class="text-muted small">
                                            <i class="bi bi-person-fill-check"></i> Reviewed by ${review.createdUser}
                                        </p>
                                        <p class="text-muted small">
                                            <i class="bi bi-calendar me-1"></i> Reviewed on ${review.date}
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
