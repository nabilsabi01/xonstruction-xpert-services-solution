<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #34495e;
            --accent-color: #ecf0f1;
        }

        body {
            font-family: 'Roboto', sans-serif;
        }

        .navbar {
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .section {
            display: none;
        }

        .section.active {
            display: block;
        }

        .project-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .project-card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .project-card .card-header {
            background-color: var(--primary-color);
            color: #fff;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .project-card .card-body {
            padding: 1.5rem;
        }

        .project-card .card-footer {
            background-color: var(--accent-color);
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .btn {
            padding: 0.375rem 0.75rem;
            font-size: 0.875rem;
            border-radius: 0.25rem;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: #1e2d3b;
            border-color: #1e2d3b;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }

        .btn-info {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }

        .btn-info:hover {
            background-color: #138496;
            border-color: #117a8b;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-black">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">ConstructionXpert</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="projects" onclick="displaySection('projects')">Projects</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="tasks" onclick="displaySection('tasks')">Tasks</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="displaySection('resources')">Resources</a>
                </li>
            </ul>
            <div class="d-flex align-items-center">
                <span class="text-white me-3">Nabil SABI</span>
                <img src="IMAGES/profile.png" alt="User Avatar" class="rounded-circle" width="40">
            </div>
        </div>
    </div>
</nav>

<main class="container-fluid py-4">
    <section id="content">
        <div id="projects" class="section active">
            <a href="projects?action=new" class="btn btn-primary mb-3">Add New Project</a>
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <c:forEach items="${projects}" var="project">
                    <div class="col">
                        <div class="card project-card h-100">
                            <div class="card-header">
                                <h5 class="card-title">${project.projectName}</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text">${project.projectDesc}</p>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Start Date: ${project.startDate}</li>
                                    <li class="list-group-item">End Date: ${project.endDate}</li>
                                    <li class="list-group-item">Budget: ${project.budget}</li>
                                </ul>
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <a href="projects?action=edit&projectId=${project.projectId}" class="btn btn-warning">
                                    <i class="bi bi-pencil me-2"></i> Edit
                                </a>
                                <a href="tasks?projectId=${project.projectId}" class="btn btn-info">
                                    <i class="bi bi-list-check me-2"></i> View Tasks
                                </a>
                                <form action="projects" method="post">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="projectId" value="${project.projectId}">
                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this project?')">
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
        sections.forEach(section => {
            section.classList.remove('active');
        });
        document.getElementById(sectionId).classList.add('active');
    }
</script>
</body>
</html>
