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
                        <i class="bi bi-house-door text-primary me-2"></i>My Properties
                    </h4>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addPropertyModal">
                        <i class="bi bi-plus-circle me-1"></i> Add Property
                    </button>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search properties..." id="propertySearch">
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
                            <option value="all">All Status</option>
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
                                            <span class="price-tag">LKR${property.price}</span>
                                            <span class="text-muted small ms-2">${property.type}</span>
                                        </div>
                                        <div class="text-muted small">
                                            <i class="bi bi-arrows-fullscreen me-1"></i> ${property.size} sqft
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <c:forEach items="${property.amenities}" var="amenity">
                                            <span class="amenity-badge">${amenity}</span>
                                        </c:forEach>
                                    </div>
                                    <div class="d-flex justify-content-end gap-2">
                                        <form method="post" action="${pageContext.request.contextPath}/agent-properties">
                                            <input type="hidden" name="propertyTitle" value="${property.title}">
                                            <button type="submit" class="btn btn-sm btn-outline-danger" name="action" value="delete">
                                                <i class="bi bi-trash me-1"></i> Delete
                                            </button>
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

<!-- Add Property Modal -->
<div class="modal fade" id="addPropertyModal" tabindex="-1" aria-labelledby="addPropertyModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addPropertyModalLabel">Add New Property</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addPropertyForm" action="${pageContext.request.contextPath}/agent-properties" method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <input type="hidden" name="agent" value="${agent.name}">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Property Title*</label>
                            <input type="text" class="form-control" name="title" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Property Type*</label>
                            <select class="form-select" name="type" required>
                                <option value="">Select Type</option>
                                <option value="House">House</option>
                                <option value="Apartment">Apartment</option>
                                <option value="Land">Land</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Price*</label>
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <input type="number" class="form-control" name="price" required>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Status*</label>
                            <select class="form-select" name="status" required>
                                <option value="Available">Available</option>
                                <option value="Pending">Pending</option>
                                <option value="Sold">Sold</option>
                                <option value="Rented">Rented</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Address*</label>
                            <input type="text" class="form-control" name="address" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">City*</label>
                            <input type="text" class="form-control" name="city" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label class="form-label">State/Province*</label>
                            <input type="text" class="form-control" name="province" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label class="form-label">Bedrooms</label>
                            <input type="number" class="form-control" name="bedrooms">
                        </div>
                        <div class="col-md-3 mb-3">
                            <label class="form-label">Bathrooms</label>
                            <input type="number" class="form-control" name="bathrooms" step="0.5">
                        </div>
                        <div class="col-md-3 mb-3">
                            <label class="form-label">Square Feet*</label>
                            <input type="number" class="form-control" name="sqft" required>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label class="form-label">Year Built</label>
                            <input type="number" class="form-control" name="builtYear">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Amenities</label>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="amenities" value="Swimming Pool" id="pool">
                                    <label class="form-check-label" for="pool">Swimming Pool</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="amenities" value="Gym" id="gym">
                                    <label class="form-check-label" for="gym">Gym</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="amenities" value="Parking" id="parking">
                                    <label class="form-check-label" for="parking">Parking</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="amenities" value="Garden" id="garden">
                                    <label class="form-check-label" for="garden">Garden</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="amenities" value="Security" id="security">
                                    <label class="form-check-label" for="security">Security</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="amenities" value="Elevator" id="elevator">
                                    <label class="form-check-label" for="elevator">Elevator</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="amenities" value="Balcony" id="balcony">
                                    <label class="form-check-label" for="balcony">Balcony</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="amenities" value="Furnished" id="furnished">
                                    <label class="form-check-label" for="furnished">Furnished</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="amenities" value="Air Conditioning" id="ac">
                                    <label class="form-check-label" for="ac">Air Conditioning</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="amenities" value="WiFi" id="wifi">
                                    <label class="form-check-label" for="wifi">WiFi</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Image</label>
                        <input type="file" class="form-control" name="propertyImage" accept="image/*" required>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" name="action" value="create" form="addPropertyForm" class="btn btn-primary">Add Property</button>
            </div>
        </div>
    </div>
</div>


<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteConfirmationModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this property? This action cannot be undone.</p>
                <form id="deletePropertyForm" action="${pageContext.request.contextPath}/properties" method="POST">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="propertyId" id="propertyToDelete">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" form="deletePropertyForm" class="btn btn-danger">Delete Property</button>
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