<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Real Estate Agent Finder - User Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            min-height: 100vh;
        }
        .text-gradient {
            color: #2575fc;
        }
        .signup-card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        .form-control:focus {
            border-color: #2575fc;
            box-shadow: 0 0 0 0.25rem rgba(37, 117, 252, 0.25);
        }
        .alert-shake {
            animation: shake 0.5s;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20%, 60% { transform: translateX(-5px); }
            40%, 80% { transform: translateX(5px); }
        }
        .alert-custom {
            border-left: 4px solid #dc3545;
            border-radius: 4px;
        }
    </style>
</head>
<body class="d-flex align-items-center">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card signup-card">
                <div class="card-body p-5">

                    <div class="text-center mb-4 text-gradient">
                        <i class="bi bi-person" style="font-size: 4.5rem;"></i>
                        <h2 class="mt-3 fw-bold">Create Your Account</h2>
                    </div>
                    <p class="text-muted text-center">Join thousands finding their dream home</p>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger mb-3 alert-custom alert-dismissible fade show alert-shake" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                ${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/user-signup" method="post">

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

                        <button type="submit" class="btn btn-primary w-100 py-2 mb-3">
                            Sign Up
                        </button>

                        <div class="text-center">
                            <p class="text-muted">Already have an account?
                                <a href="${pageContext.request.contextPath}/user-login" class="text-gradient">
                                    Log In
                                </a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
