<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert Project Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <style>
        :root {
            --primary-color: #5C6CA2;
            --secondary-color: #FF7555;
            --light-color: #EFF4FC;
            --dark-color: #333333;
            --hover-color: #4d5b8a;
        }

        body {
            background-color: var(--light-color);
        }

        .navbar {
            background-color: var(--primary-color);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 0.5rem 1rem;
        }

        .navbar-brand {
            color: #fff;
            font-weight: 700;
            font-size: 1.5rem;
            transition: color 0.3s ease-in-out;
        }

        .navbar-brand:hover {
            color: var(--secondary-color);
        }

        .logo {
            width: 50px;
            margin-right: 5px;
        }
        .navbar-nav {
            margin: 0 auto;
        }

        .navbar-nav .nav-link {
            color: rgba(255, 255, 255, 0.8);
            font-weight: 500;
            transition: color 0.3s ease-in-out;
        }

        .navbar-nav .nav-link:hover,
        .navbar-nav .nav-link.active {
            color: var(--hover-color);
            background-color: var(--secondary-color);
        }

        .user-info {
            display: flex;
            align-items: center;
            color: rgba(255, 255, 255, 0.8);
            cursor: pointer;
            transition: color 0.3s ease-in-out;
        }

        .user-info:hover {
            color: #fff;
        }

        .user-name {
            margin-right: 0.5rem;
        }

        .user-name:hover {
            color: var(--secondary-color);
        }

        .project-card {
            border: none;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
            overflow: hidden;
        }

        .project-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
        }

        .project-card .card-header {
            background-color: var(--primary-color);
            color: #fff;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .project-card .card-header h5 {
            margin-bottom: 0;
        }

        .project-card .card-body {
            padding: 1.5rem;
        }

        .project-card .card-footer {
            background-color: var(--light-color);
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            padding: 1rem;
        }

        .project-card .btn {
            background-color: var(--secondary-color);
            color: #fff;
            transition: all 0.3s ease-in-out;
        }

        .project-card .btn:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }

        .project-card .list-group-item {
            background-color: transparent;
            border: none;
            padding: 0.5rem 0;
            color: var(--dark-color);
        }

        .project-card .list-group-item i {
            color: var(--primary-color);
        }
        .title-page{
            color: var(--primary-color);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img class="logo" src="images/logo.png">
            ConstructionXPert</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#" onclick="displaySection('projects')">Projects</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="displaySection('resources')">Resources</a>
                </li>
            </ul>
            <div class="user-info">
                <span class="user-name">John Doe</span>
                <img src="images/profile.png" alt="User Avatar" class="rounded-circle" width="40">
            </div>
        </div>
    </div>
</nav>

<main class="container-fluid py-4">
    <section id="content">
        <div id="projects" class="section active">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2 class="mb-0 title-page">Projects</h2>
                <a href="projects?action=new" class="btn btn-primary">
                    <i class="bi bi-plus-circle me-2"></i> Add New Project
                </a>
            </div>
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <c:forEach items="${projects}" var="project">
                <div class="col">
                    <div class="card h-100 project-card">
                        <div class="card-header">
                            <h5 class="card-title">${project.projectName}</h5>
                            <a href="projects?action=edit&projectId=${project.projectId}" class="btn btn-light">
                                <i class="bi bi-pencil"></i>
                            </a>
                        </div>
                        <div class="card-body">
                            <p class="card-text">${project.projectDesc}</p>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <i class="bi bi-calendar-event me-2"></i> Start Date: ${project.startDate}
                                </li>
                                <li class="list-group-item">
                                    <i class="bi bi bi-calendar-check me-2"></i> End Date: ${project.endDate}
                                </li>
                                <li class="list-group-item">
                                    <i class="bi bi-cash me-2"></i> Budget: ${project.budget}
                                </li>
                            </ul>
                        </div>
                        <div class="card-footer d-flex justify-content-between">
                            <a href="tasks?projectId=${project.projectId}" class="btn">
                                <i class="bi bi-list-check me-2"></i> View Tasks
                            </a>
                            <form action="projects" method="post" class="d-inline">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="projectId" value="${project.projectId}">
                                <button type="submit" class="btn" onclick="return confirm('Are you sure you want to delete this project?')">
                                    <i class="bi bi-trash me-2"></i> Delete
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function displaySection(sectionId) {
        const sections = document.querySelectorAll('.section');
        const navLinks = document.querySelectorAll('.nav-link');

        sections.forEach(section => {
            section.classList.remove('active');
        });

        navLinks.forEach(link => {
            link.classList.remove('active');
        });

        document.getElementById(sectionId).classList.add('active');
        document.querySelector(`.nav-link[onclick="displaySection('${sectionId}')"]`).classList.add('active');

        window.history.pushState({}, '', `?section=${sectionId}`);
    }

    function handleNavigation() {
        const urlParams = new URLSearchParams(window.location.search);
        const section = urlParams.get('section');

        if (section) {
            displaySection(section);
        } else {
            displaySection('projects');
        }
    }

    function toggleNavbar() {
        const navbar = document.querySelector('.navbar');
        navbar.classList.toggle('collapsed');
    }

    function toggleUserMenu() {
        const userMenu = document.querySelector('.user-menu');
        userMenu.classList.toggle('show');
    }

    document.addEventListener('DOMContentLoaded', function() {
        handleNavigation();

        const navToggler = document.querySelector('.navbar-toggler');
        navToggler.addEventListener('click', toggleNavbar);

        const userInfo = document.querySelector('.user-info');
        userInfo.addEventListener('click', toggleUserMenu);

        window.addEventListener('click', function(event) {
            const userMenu = document.querySelector('.user-menu');
            if (!event.target.closest('.user-info') && userMenu.classList.contains('show')) {
                userMenu.classList.remove('show');
            }
        });
    });
</script>