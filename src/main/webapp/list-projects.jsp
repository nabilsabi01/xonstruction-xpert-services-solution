<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f5f5f5;
        }

        .sidebar {
            background-color: #343a40;
            color: #fff;
            height: 100vh;
            padding: 1rem;
        }

        .sidebar a {
            color: #fff;
            text-decoration: none;
        }

        .sidebar a:hover {
            color: #ccc;
        }

        .main-content {
            padding: 2rem;
        }

        .card {
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-footer {
            background-color: #f5f5f5;
            border-top: none;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .fade-in {
            animation: fade-in 0.5s ease-in-out;
        }

        @keyframes fade-in {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 sidebar">
            <h3 class="mb-4">Admin Dashboard</h3>
            <nav>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            <i class="fa fa-tachometer-alt me-2"></i>
                            Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fa fa-users me-2"></i>
                            Projects
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fa fa-chart-bar me-2"></i>
                            Tasks
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fa fa-cog me-2"></i>
                            Resources
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="col-md-9 main-content">
            <a href="projects?action=new" class="btn btn-primary mb-3">Add New Project</a>
            <div class="row justify-content-center">
                <c:forEach items="${projects}" var="project" varStatus="status">
                    <div class="col-md-4 col-sm-6 g-3">
                        <div class="card fade-in" style="animation-delay: ${status.index * 0.2}s">
                            <div class="card-body">
                                <h5 class="card-title">${project.projectName}</h5>
                                <p class="card-text">${project.projectDesc}</p>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Start Date: ${project.startDate}</li>
                                    <li class="list-group-item">End Date: ${project.endDate}</li>
                                    <li class="list-group-item">Budget: ${project.budget}</li>
                                </ul>
                            </div>
                            <div class="card-footer">
                                <a href="projects?action=edit&projectId=${project.projectId}" class="btn btn-warning">
                                    <i class="fa fa-edit me-2"></i>
                                    Edit
                                </a>
                                <form action="projects" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="projectId" value="${project.projectId}">
                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this project?')">
                                        <i class="fa fa-trash me-2"></i>
                                        Delete
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script></body>
</html>