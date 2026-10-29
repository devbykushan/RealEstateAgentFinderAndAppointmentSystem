<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Real Estate Agent Finder - Agent Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            min-height: 100vh;
        }
        .agent-card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        .form-control:focus {
            border-color: #2575fc;
            box-shadow: 0 0 0 0.25rem rgba(37, 117, 252, 0.25);
        }
        .text-agent {
            color: #2575fc;
        }
        .image-preview {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid #2575fc;
            display: none;
        }
        .upload-btn {
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }
        .upload-btn input {
            position: absolute;
            font-size: 100px;
            opacity: 0;
            right: 0;
            top: 0;
            cursor: pointer;
        }
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20%, 60% { transform: translateX(-5px); }
            40%, 80% { transform: translateX(5px); }
        }
        .btn-agent {
            background-color: #2575fc;
            border-color: #2575fc;
        }
        .btn-agent:hover {
            background-color: #1a5dc8;
            border-color: #1a5dc8;
        }
    </style>
</head>
<body class="d-flex align-items-center">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card agent-card bg-white">
                <div class="card-body p-5">

                    <div class="text-center mb-4 text-agent">
                        <i class="bi bi-briefcase" style="font-size: 4.5rem;"></i>
                        <h2 class="mt-3 fw-bold">Agent Registration</h2>
                        <p class="text-muted">Join our professional network</p>
                    </div>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger mb-3 alert-dismissible fade show alert-shake" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                ${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/agent-signup" method="post" enctype="multipart/form-data">

                        <div class="d-flex flex-column align-items-center mb-4">
                            <img id="imagePreview" class="image-preview mb-2" alt="Profile Preview" >
                            <label class="btn btn-outline-primary upload-btn">
                                <i class="bi bi-camera-fill me-2"></i>Upload Profile Photo
                                <input type="file" id="profileImage" name="profileImage" accept="image/*" onchange="previewImage(this)">
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

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-agent py-2">
                                <i class="bi bi-person-plus-fill me-2"></i>Register as Agent
                            </button>
                        </div>

                        <div class="text-center mt-3">
                            <a href="${pageContext.request.contextPath}/agent-login" class="text-agent text-decoration-none">
                                <i class="bi bi-box-arrow-in-right me-1"></i>Existing Agent? Login Here
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function previewImage(input) {
        const preview = document.getElementById('imagePreview');
        const file = input.files[0];
        const reader = new FileReader();

        reader.onload = function(e) {
            preview.src = e.target.result;
            preview.style.display = 'block';

        }

        if (file) {
            reader.readAsDataURL(file);
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
