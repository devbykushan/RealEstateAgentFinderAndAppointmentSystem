<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .gradient-custom {
      background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    }
    .text-gradient {
      color: #2575fc;
    }
    .card {
      border-radius: 15px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
    }
    .form-control:focus {
      border-color: #2575fc;
      box-shadow: 0 0 0 0.25rem rgba(37, 117, 252, 0.25);
    }
    .form-floating.icon-group {
      position: relative;
    }
    .form-floating.icon-group .icon {
      position: absolute;
      left: 12px;
      top: 50%;
      transform: translateY(-50%);
      z-index: 3;
      color: #6c757d;
    }
    .form-floating.icon-group .form-control {
      padding-left: 40px;
    }
    .form-floating.icon-group label {
      left: 40px;
    }
    .login-btn-custom {
      background-color: #2575fc;
      color: white;
      border: none;
      width: 50%;
      padding: 12px 0;
      font-size: 1.1rem;
      letter-spacing: 0.5px;
      transition: all 0.3s ease;
    }

    .login-btn-custom:hover {
      background-color: #1a5fd3;
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
<body class="gradient-custom vh-100">
<div class="container py-5 h-100">
  <div class="row d-flex justify-content-center align-items-center h-100">
    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
      <div class="card bg-white text-dark">
        <div class="card-body p-5 text-center">
          <div class="mb-4">
            <% String success = (String) request.getAttribute("success"); %>
            <% if (success != null) { %>
            <div class="alert alert-success mb-3 alert-dismissible fade show" role="alert">
              <i class="bi bi-check-circle-fill me-2"></i>
              <%= success %>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% } %>
            <i class="bi bi-person-gear" style="font-size: 4.5rem; color: #2575fc"></i>
            <h2 class="fw-bold mb-4 text-uppercase text-gradient">Admin Login</h2>
            <p class="text-dark-50 mb-4">Please enter your login credentials</p>
          </div>

          <form action="${pageContext.request.contextPath}/admin-login" method="post">
            <c:if test="${not empty error}">
              <div class="alert alert-danger mb-3 alert-custom alert-dismissible fade show alert-shake " role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                  ${error}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
            </c:if>

            <div class="form-floating mb-3 icon-group">
              <i class="bi bi-envelope-at-fill icon"></i>
              <input type="email" name="email" id="email" class="form-control"
                     placeholder="name@example.com" required>
              <label for="email">Email address</label>
            </div>

            <div class="form-floating mb-4 icon-group">
              <i class="bi bi-key-fill icon"></i>
              <input type="password" name="password" id="password" class="form-control"
                     placeholder="Password" required>
              <label for="password">Password</label>
            </div>

            <div class="form-check d-flex justify-content-start mb-4">
              <input class="form-check-input me-2" type="checkbox" name="remember" id="remember">
              <label class="form-check-label" for="remember">Remember me</label>
            </div>

            <button class="btn login-btn-custom px-5 mb-3 rounded-pill" type="submit">
              Login
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>