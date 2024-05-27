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
    <style>
        :root {
            --primary-color: #FF7555;
            --secondary-color: #5C6CA2;
            --light-color: #F5F5F5;
            --dark-color: #333333;
            --accent-color: #FFD17C;
            --bg-color: #FFFFFF;
            --card-bg-color: #FFFFFF;
            --card-hover-bg-color: #F8F9FA;
        }

        body {
            background-color: var(--bg-color);
            font-family: 'Poppins', sans-serif;
        }

        .navbar {
            background-color: var(--secondary-color);
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
            color: var(--primary-color);
        }

        .user-info {
            color: rgba(255, 255, 255, 0.8);
            cursor: pointer;
            transition: color 0.3s ease-in-out;
        }

        .user-info:hover {
            color: #fff;
        }

        .logo {
            margin-right: 0.5rem;
        }

        .user-name {
            margin-right: 0.5rem;
        }

        .project-card .btn {
            background-color: var(--primary-color);
            color: #fff;
            border-radius: 8px;
            padding: 0.25rem 0.75rem;
            font-size: 0.9rem;
            transition: all 0.3s ease-in-out;
            text-decoration: none;
        }

        .project-card .btn:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .project-card .btn i {
            margin-right: 0.3rem;
            font-size: 0.8rem;
        }

        .project-card {
            border: none;
            border-radius: 10px;
            background-color: var(--card-bg-color);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
            overflow: hidden;
        }

        .project-card:hover {
            transform: translateY(-5px);
            background-color: var(--card-hover-bg-color);
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
        }

        .project-card .card-header {
            background-color: var(--secondary-color);
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
            background-color: var(--primary-color);
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
            padding: 0.75rem 0;
            color: var(--dark-color);
        }

        .project-card .list-group-item i {
            color: var(--primary-color);
        }

        .title-page {
            color: var(--primary-color);
            font-weight: 700;
        }

        .btn-add {
            background-color: var(--primary-color);
            color: #fff;
            transition: all 0.3s ease-in-out;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            text-decoration: none;
        }

        .btn-add:hover {
            background-color: var(--secondary-color);
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center" href="projects">
            <img class="logo me-2" src="img/logo.png" alt="Logo" width="40">
            <span>ConstructionXPert</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <div class="user-info d-flex align-items-center ms-auto">
                <span class="user-name me-2">John Doe</span>
                <img src="img/profile.png" alt="User Avatar" class="rounded-circle" width="40">
            </div>
        </div>
    </div>
</nav>

<main class="container-fluid py-4">
    <section id="content">
        <div id="projects" class="section active">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0 title-page">Projects</h2>
                <a href="projects?action=new" class="btn-add">
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
                                        <i class="bi bi-calendar-check me-2"></i> End Date: ${project.endDate}
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
</body>
</html>