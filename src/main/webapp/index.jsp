<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FindMyAgent | Connect with Top Real Estate Professionals</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --dark: #1a1a2e;
            --light: #f8f9fa;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: var(--dark);
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 15px 0;
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--primary);
            font-size: 1.5rem;
        }

        .navbar-brand i {
            margin-right: 8px;
        }

        .nav-link {
            color: var(--dark);
            font-weight: 500;
            margin: 0 10px;
        }

        .nav-link:hover {
            color: var(--primary);
        }

        .btn-primary {
            background-color: var(--primary);
            border: none;
            padding: 8px 20px;
            border-radius: 8px;
        }

        .btn-primary:hover {
            background-color: var(--secondary);
        }

        .btn-outline-primary {
            border-color: var(--primary);
            color: var(--primary);
        }

        .btn-outline-primary:hover {
            background-color: var(--primary);
            color: white;
        }

        .hero {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 120px 0;
            text-align: center;
        }

        .hero h1 {
            font-weight: 700;
            font-size: 2.8rem;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 30px;
        }

        .stats-container {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            margin-top: -80px;
            position: relative;
            z-index: 10;
        }

        .stat-item {
            text-align: center;
            padding: 0 15px;
        }

        .stat-number {
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 5px;
        }

        .stat-change {
            font-size: 0.9rem;
            color: #28a745;
        }

        .stat-label {
            color: #6c757d;
            font-size: 0.9rem;
        }

        .online-badge {
            display: inline-block;
            background-color: #28a745;
            color: white;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 0.8rem;
            margin-top: 5px;
        }

        .feature-icon {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 20px;
        }

        .feature-card {
            padding: 30px;
            border-radius: 10px;
            background: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            height: 100%;
            transition: transform 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-10px);
        }

        .agent-card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s;
            margin-bottom: 20px;
        }

        .agent-card:hover {
            transform: translateY(-5px);
        }

        .agent-img {
            height: 200px;
            object-fit: cover;
        }

        .rating {
            color: #ffc107;
        }

        .testimonial-card {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .testimonial-img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }

        footer {
            background-color: var(--dark);
            color: white;
            padding: 60px 0 20px;
        }

        .footer-links h5 {
            margin-bottom: 20px;
            font-weight: 600;
        }

        .footer-links ul {
            list-style: none;
            padding: 0;
        }

        .footer-links li {
            margin-bottom: 10px;
        }

        .footer-links a {
            color: #adb5bd;
            text-decoration: none;
        }

        .footer-links a:hover {
            color: white;
        }

        .social-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(255,255,255,0.1);
            color: white;
            margin-right: 10px;
        }

        .social-icon:hover {
            background: var(--primary);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="bi bi-house-heart"></i> FindMyAgent
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Find Agents</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Neighborhoods</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Resources</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
            </ul>
            <div class="d-flex">
                <a href="login.html" class="btn btn-outline-primary me-2">Login</a>
                <a href="signup.html" class="btn btn-primary">Sign Up</a>
            </div>
        </div>
    </div>
</nav>

<section class="hero">
    <div class="container">
        <h1>Find the Perfect Real Estate Agent</h1>
        <p>Connect with top-rated agents in your area who specialize in exactly what you're looking for</p>
        <a href="signup.html" class="btn btn-primary btn-lg">Get Started</a>
    </div>
</section>

<div class="container">
    <div class="stats-container">
        <div class="row text-center">
            <div class="col-md-4">
                <div class="stat-item">
                    <div class="stat-number">
                        <fmt:formatNumber value="${not empty stats ? stats.usersCount : 0}" type="number"/>
                    </div>
                    <div class="stat-change">
                        • <fmt:formatNumber value="${not empty stats ? stats.usersCount : 0}" type="number"/> last month
                    </div>
                    <div class="stat-label">new users on the platform</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-item">
                    <div class="stat-number">
                        <fmt:formatNumber value="${not empty stats ? stats.agentsCount : 0}" type="number"/>
                    </div>
                    <div class="stat-change">
                        • <fmt:formatNumber value="${not empty stats ? stats.agentsCount : 0}" type="number"/> last month
                    </div>
                    <div class="stat-label">manually verified agents</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-item">
                    <div class="stat-number">
                        <fmt:formatNumber value="${not empty stats ? stats.activeAgentsCount : 0}" type="number"/>
                    </div>
                    <div class="online-badge">online now</div>
                    <div class="stat-label">active agents</div>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="py-5">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h2>How It Works</h2>
            <p class="lead">Find the right agent in just a few simple steps</p>
        </div>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="feature-card text-center">
                    <div class="feature-icon">
                        <i class="bi bi-search"></i>
                    </div>
                    <h3>Search</h3>
                    <p>Tell us what you're looking for and where. We'll match you with agents who specialize in exactly that.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card text-center">
                    <div class="feature-icon">
                        <i class="bi bi-people"></i>
                    </div>
                    <h3>Compare</h3>
                    <p>Review agent profiles, ratings, and recent sales. Select who you'd like to connect with.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card text-center">
                    <div class="feature-icon">
                        <i class="bi bi-chat-dots"></i>
                    </div>
                    <h3>Connect</h3>
                    <p>Message agents directly or request a consultation. Find your perfect match with no obligation.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5 bg-light">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h2>Top Rated Agents</h2>
            <p class="lead">Highly recommended by home buyers and sellers</p>
        </div>
        <div class="row g-4">
            <c:forEach var="agent" items="${agents}" varStatus="loop" begin="0" end="2">
                <div class="col-md-4">
                    <div class="agent-card">
                        <img src="${pageContext.request.contextPath}/images/agents/${agent.image}" class="agent-img w-100" alt="${agent.name}">
                        <div class="p-3">
                            <h4>${agent.name}</h4>
                            <p class="text-muted">${agent.specialties}</p>
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
                            <p><i class="bi bi-geo-alt"></i> ${agent.location}</p>
                            <a href="${pageContext.request.contextPath}/user-signup" class="btn btn-outline-primary w-100">View Profile</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="text-center mt-4">
                <a href="${pageContext.request.contextPath}/user-signup" class="btn btn-primary">View All Agents</a>
            </div>
        </div>
</section>

<section class="py-5">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h2>Success Stories</h2>
            <p class="lead">What our users say about finding their perfect agent</p>
        </div>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="testimonial-card text-center">
                    <img src="https://randomuser.me/api/portraits/women/33.jpg" class="testimonial-img">
                    <div class="rating mb-3">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                    </div>
                    <p class="mb-4">"Found an amazing agent who understood exactly what we were looking for. Closed on our dream home in just 3 weeks!"</p>
                    <h5>Jennifer K.</h5>
                    <p class="text-muted">Boston, MA</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial-card text-center">
                    <img src="https://randomuser.me/api/portraits/men/75.jpg" class="testimonial-img">
                    <div class="rating mb-3">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                    </div>
                    <p class="mb-4">"As a first-time seller, I was nervous. My agent walked me through every step and got me 15% over asking price!"</p>
                    <h5>David T.</h5>
                    <p class="text-muted">Austin, TX</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial-card text-center">
                    <img src="https://randomuser.me/api/portraits/women/62.jpg" class="testimonial-img">
                    <div class="rating mb-3">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-half"></i>
                    </div>
                    <p class="mb-4">"The agent matching was spot on. Found someone with expertise in historic homes who knew all the right buyers."</p>
                    <h5>Amanda S.</h5>
                    <p class="text-muted">Charleston, SC</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5 bg-primary text-white">
    <div class="container py-5 text-center">
        <h2 class="mb-4">Ready to Find Your Perfect Agent?</h2>
        <p class="lead mb-5">Join thousands of happy home buyers and sellers who found their ideal real estate professional</p>
        <a href="signup.html" class="btn btn-light btn-lg px-5 me-3">Sign Up Free</a>
        <a href="#" class="btn btn-outline-light btn-lg px-5">Learn More</a>
    </div>
</section>

<footer>
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-4">
                <h4><i class="bi bi-house-heart"></i> FindMyAgent</h4>
                <p class="mt-3">The smartest way to find and connect with top-rated real estate agents in your area.</p>
                <div class="mt-4">
                    <a href="#" class="social-icon"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="social-icon"><i class="bi bi-twitter"></i></a>
                    <a href="#" class="social-icon"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="social-icon"><i class="bi bi-linkedin"></i></a>
                </div>
            </div>
            <div class="col-lg-2 col-md-4">
                <div class="footer-links">
                    <h5>Company</h5>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Press</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-4">
                <div class="footer-links">
                    <h5>Resources</h5>
                    <ul>
                        <li><a href="#">Home Buying</a></li>
                        <li><a href="#">Home Selling</a></li>
                        <li><a href="#">Agent Resources</a></li>
                        <li><a href="#">Market Reports</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-4">
                <div class="footer-links">
                    <h5>Legal</h5>
                    <ul>
                        <li><a href="#">Terms of Use</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Cookie Policy</a></li>
                        <li><a href="#">DMCA</a></li>
                        <li><a href="#">Sitemap</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-4">
                <div class="footer-links">
                    <h5>Cities</h5>
                    <ul>
                        <li><a href="#">New York</a></li>
                        <li><a href="#">Los Angeles</a></li>
                        <li><a href="#">Chicago</a></li>
                        <li><a href="#">Houston</a></li>
                        <li><a href="#">View All</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <hr class="mt-4">
        <div class="row">
            <div class="col-md-6">
                <p class="mb-0">© 2023 FindMyAgent. All rights reserved.</p>
            </div>
            <div class="col-md-6 text-md-end">
                <p class="mb-0">Made with <i class="bi bi-heart-fill text-danger"></i> By PG-176</p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>