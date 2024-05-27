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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
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
            padding: 1rem;
        }

        .navbar-brand {
            color: #fff;
            font-weight: 700;
            font-size: 1.5rem;
            transition: color 0.3s ease-in-out;
            display: flex;
            align-items: center;
        }

        .navbar-brand:hover {
            color: var(--accent-color);
        }

        .logo {
            margin-right: 0.5rem;
        }

        .navbar-nav .nav-link {
            color: rgba(255, 255, 255, 0.8);
            font-weight: 500;
            transition: color 0.3s ease-in-out;
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
        }

        .navbar-nav .nav-link:hover,
        .navbar-nav .nav-link.active {
            color: #fff;
            background-color: var(--primary-color);
        }

        .user-info {
            display: flex;
            align-items: center;
            color: rgba(255, 255, 255, 0.8);
            cursor: pointer;
            transition: color 0.3s ease-in-out;
            padding-left: 1rem;
        }

        .user-info:hover {
            color: #fff;
        }

        .user-name {
            margin-right: 0.5rem;
        }

        .project-card .btn {
            background-color: var(--secondary-color);
            color: #fff;
            transition: all 0.3s ease-in-out;
        }

        .project-card .btn:hover {
            background-color: var(--primary-color);
            transform: translateY(-2px);
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
            border-top-left-ryadius: 10px;
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

        .btn-custom {
            background-color: var(--primary-color);
            color: #fff;
            transition: all 0.3s ease-in-out;
        }

        .btn-custom:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            color: white;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="projects">
            <img class="logo" src="images/logo.png" alt="Logo" width="50">
            ConstructionXPert
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="projects">Projects</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="resources">Resources</a>
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
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0 title-page">Projects</h2>
                <button class="btn btn-custom" data-bs-toggle="modal" data-bs-target="#addEditModal" data-action="add">
                    <i class="bi bi-plus-circle me-2"></i> Add New Project
                </button>
            </div>
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <c:forEach items="${projects}" var="project">
                    <div class="col">
                        <div class="card h-100 project-card">
                            <div class="card-header">
                                <h5 class="card-title">${project.projectName}</h5>
                                <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#addEditModal" data-action="edit"
                                        data-id="${project.projectId}" data-name="${project.projectName}"
                                        data-desc="${project.projectDesc}" data-start="${project.startDate}"
                                        data-end="${project.endDate}" data-budget="${project.budget}">
                                    <i class="bi bi-pencil"></i>
                                </button>
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
                                <form action="projects" method="post" class="m-0">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="projectId" value="${project.projectId}">
                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this project?');">
                                        <i class="bi bi-trash"></i>
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

<!-- Add/Edit Project Modal -->
<div class="modal fade" id="addEditModal" tabindex="-1" aria-labelledby="addEditModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="projects" method="post" class="needs-validation" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title" id="addEditModalLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="action" name="action">
                    <input type="hidden" id="projectId" name="projectId">
                    <div class="mb-3">
                        <label for="projectName" class="form-label">Project Name</label>
                        <input type="text" class="form-control" id="projectName" name="projectName" required>
                        <div class="invalid-feedback">Please enter a project name.</div>
                    </div>
                    <div class="mb-3">
                        <label for="projectDesc" class="form-label">Project Description</label>
                        <textarea class="form-control" id="projectDesc" name="projectDesc" required></textarea>
                        <div class="invalid-feedback">Please enter a project description.</div>
                    </div>
                    <div class="mb-3">
                        <label for="startDate" class="form-label">Start Date</label>
                        <input type="date" class="form-control" id="startDate" name="startDate" required>
                        <div class="invalid-feedback">Please select a start date.</div>
                    </div>
                    <div class="mb-3">
                        <label for="endDate" class="form-label">End Date</label>
                        <input type="date" class="form-control" id="endDate" name="endDate" required>
                        <div class="invalid-feedback">Please select an end date.</div>
                    </div>
                    <div class="mb-3">
                        <label for="budget" class="form-label">Budget</label>
                        <input type="number" class="form-control" id="budget" name="budget" required>
                        <div class="invalid-feedback">Please enter a budget.</div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const addEditModal = document.getElementById('addEditModal');
        addEditModal.addEventListener('show.bs.modal', function(event) {
            const button = event.relatedTarget;
            const action = button.getAttribute('data-action');
            const modalTitle = addEditModal.querySelector('.modal-title');
            const actionInput = addEditModal.querySelector('#action');
            const projectIdInput = addEditModal.querySelector('#projectId');
            const projectNameInput = addEditModal.querySelector('#projectName');
            const projectDescInput = addEditModal.querySelector('#projectDesc');
            const startDateInput = addEditModal.querySelector('#startDate');
            const endDateInput = addEditModal.querySelector('#endDate');
            const budgetInput = addEditModal.querySelector('#budget');

            // Set modal title and form inputs based on action (add or edit)
            if (action === 'edit') {
                modalTitle.textContent = 'Edit Project';
                actionInput.value = 'edit';
                projectIdInput.value = button.getAttribute('data-id');
                projectNameInput.value = button.getAttribute('data-name');
                projectDescInput.value = button.getAttribute('data-desc');
                startDateInput.value = button.getAttribute('data-start');
                endDateInput.value = button.getAttribute('data-end');
                budgetInput.value = button.getAttribute('data-budget');
            } else {
                modalTitle.textContent = 'Add New Project';
                actionInput.value = 'add';
                projectIdInput.value = '';
                projectNameInput.value = '';
                projectDescInput.value = '';
                startDateInput.value = '';
                endDateInput.value = '';
                budgetInput.value = '';
            }
        });
    });
</script>
