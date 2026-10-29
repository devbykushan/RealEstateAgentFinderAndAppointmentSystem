<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Properties | Real Estate Dashboard</title>
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

        .property-card {
            transition: all 0.3s;
            cursor: pointer;
            height: 100%;
        }

        .property-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        .property-img {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .status-available {
            background-color: #d4edda;
            color: #155724;
        }

        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .status-sold {
            background-color: #f8d7da;
            color: #721c24;
        }

        .status-rented {
            background-color: #e2e3e5;
            color: #383d41;
        }

        .price-tag {
            font-weight: bold;
            color: var(--secondary-color);
            font-size: 1.2rem;
        }

        .amenity-badge {
            background-color: #f1f8ff;
            color: #0366d6;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 0.75rem;
            margin-right: 5px;
            margin-bottom: 5px;
            display: inline-block;
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
                        <i class="bi bi-house-door text-primary me-2"></i>All Properties
                    </h4>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search properties..." id="propertySearch" name="propertySearch">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <select class="form-select" id="typeFilter">
                            <option value="all">All Types</option>
                            <option value="House">House</option>
                            <option value="Apartment">Apartment</option>
                            <option value="Land">Land</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="form-select" id="statusFilter">
                            <option value="all">All Statuses</option>
                            <option value="Available">Available</option>
                            <option value="Pending">Pending</option>
                            <option value="Sold">Sold</option>
                            <option value="Rented">Rented</option>
                        </select>
                    </div>
                </div>

                <div class="row" id="propertiesContainer">
                    <c:forEach items="${properties}" var="property">
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="card property-card">
                                <img src="${pageContext.request.contextPath}/images/properties/${property.image}" class="card-img-top property-img" alt="${property.title}">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h5 class="card-title mb-0">${property.title}</h5>
                                        <span class="status-badge status-${property.status.toLowerCase()}">
                                                ${property.status}
                                        </span>
                                    </div>
                                    <p class="card-text text-muted small">
                                        <i class="bi bi-geo-alt me-1"></i> ${property.address}
                                    </p>
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <div>
                                            <span class="price-tag">$${property.price}</span>
                                            <span class="text-muted small ms-2">${property.type}</span>
                                        </div>
                                        <div class="text-muted small">
                                            <i class="bi bi-arrows-fullscreen me-1"></i> ${property.sqft} sqft
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <c:forEach items="${property.amenities}" var="amenity">
                                            <span class="amenity-badge">${amenity}</span>
                                        </c:forEach>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
