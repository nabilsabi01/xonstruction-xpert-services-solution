<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tasks by Project</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3f51b5; /* Indigo */
            --secondary-color: #ff9800; /* Orange */
            --accent-color: #4caf50; /* Green */
            --text-color: #333333; /* Dark Gray */
        }
        /* Custom CSS for Navbar */
        .navbar {
            padding: 0.5rem 1rem;
        }

        .navbar-brand {
            margin-right: 2rem;
        }

        .navbar-nav .nav-link {
            margin-right: 1rem;
        }

        .profile-img {
            border: 2px solid #fff;
        }

        .navbar-toggler {
            border: none;
        }

        .navbar-toggler:focus {
            outline: none;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: var(--text-color);
        }
        .card {
            margin-bottom: 20px;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }
        .card-header {
            background-color: var(--primary-color);
            color: #fff;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            padding: 10px 15px;
        }
        .card-body {
            padding: 1.5rem;
        }
        .card-footer {
            background-color: #f8f9fa;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            padding: 10px 15px;
        }
        .task-title {
            font-weight: 600;
            margin-bottom: 10px;
            font-size: 1.25rem;
            color: #fff;
        }
        .task-details {
            margin-bottom: 0;
            color: var(--text-color);
        }
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        .btn-primary:hover {
            background-color: #344891;
            border-color: #344891;
        }
        .status-badge {
            font-size: 0.9rem;
            font-weight: 500;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
                <img src="IMAGES/profile.png" alt="User Avatar" class="rounded-circle profile-img" width="40">
            </div>
        </div>
    </div>
</nav>


<div class="container">
    <div class="row mb-4">
        <div class="col-12">
            <h1 class="text-center mb-4" style="color: var(--primary-color);">Tasks for Project: ${project.projectName}</h1>
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#taskModal" onclick="showTaskModal(null, ${project.projectId})">
                    <i class="bi bi-plus-circle me-2"></i> Add New Task
                </button>
            </div>
        </div>
    </div>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <c:forEach items="${tasks}" var="task">
            <div class="col">
                <div class="card h-100">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="card-title task-title mb-0">${task.taskName}</h5>
                        <span class="badge rounded-pill status-badge ${task.taskStatus == 'Pending' ? 'bg-warning text-dark' : (task.taskStatus == 'In Progress' ? 'bg-info' : 'bg-success')}">
                                ${task.taskStatus}
                        </span>
                    </div>
                    <div class="card-body">
                        <p class="task-details">${task.taskDesc}</p>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item task-details">
                                <i class="bi bi-calendar me-2"></i> Start Date: ${task.startDate}
                            </li>
                            <li class="list-group-item task-details">
                                <i class="bi bi-calendar-check me-2"></i> End Date: ${task.endDate}
                            </li>
                        </ul>
                    </div>
                    <div class="card-footer d-flex justify-content-between">
                        <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#taskModal" onclick="showTaskModal(${task.taskId}, ${task.projectId}, '${task.taskName}', '${task.taskDesc}', '${task.startDate}', '${task.endDate}', '${task.taskStatus}')">
                            <i class="bi bi-pencil me-2"></i> Edit
                        </button>
                        <form action="tasks" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="taskId" value="${task.taskId}">
                            <input type="hidden" name="projectId" value="${project.projectId}">
                            <button type="submit" class="btn btn-outline-danger" onclick="return confirm('Are you sure you want to delete this task?')">
                                <i class="bi bi-trash me-2"></i> Delete
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Task Modal -->
<div class="modal fade" id="taskModal" tabindex="-1" aria-labelledby="taskModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="taskForm" action="tasks" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="taskModalLabel">Task Form</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="taskId" name="taskId">
                    <input type="hidden" id="projectId" name="projectId">
                    <input type="hidden" id="action" name="action">
                    <div class="mb-3">
                        <label for="taskName" class="form-label">Task Name</label>
                        <input type="text" class="form-control" id="taskName" name="taskName" required>
                    </div>
                    <div class="mb-3">
                        <label for="taskDesc" class="form-label">Task Description</label>
                        <textarea class="form-control" id="taskDesc" name="taskDesc" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="startDate" class="form-label">Start Date</label>
                        <input type="date" class="form-control" id="startDate" name="startDate">
                    </div>
                    <div class="mb-3">
                        <label for="endDate" class="form-label">End Date</label>
                        <input type="date" class="form-control" id="endDate" name="endDate">
                    </div>
                    <div class="mb-3">
                        <label for="taskStatus" class="form-label">Task Status</label>
                        <select class="form-select" id="taskStatus" name="taskStatus">
                            <option value="Pending" ${task.taskStatus == 'Pending' ? 'selected' : ''}>Pending</option>
                            <option value="In_Progress" ${task.taskStatus == 'In_Progress' ? 'selected' : ''}>In Progress</option>
                            <option value="Completed" ${task.taskStatus == 'Completed' ? 'selected' : ''}>Completed</option>
                        </select>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function showTaskModal(taskId, projectId, taskName = '', taskDesc = '', startDate = '', endDate = '', taskStatus = 'Pending') {
        const modalTitle = document.getElementById('taskModalLabel');
        const actionInput = document.getElementById('action');

        if (taskId) {
            modalTitle.textContent = 'Edit Task';
            actionInput.value = 'update';
            document.getElementById('taskId').value = taskId;
            document.getElementById('projectId').value = projectId;
            document.getElementById('taskName').value = taskName;
            document.getElementById('taskDesc').value = taskDesc;
            document.getElementById('startDate').value = startDate;
            document.getElementById('endDate').value = endDate;
            document.getElementById('taskStatus').value = taskStatus; // Ensure lowercase for status
        } else {
            modalTitle.textContent = 'Add New Task';
            actionInput.value = 'insert';
            document.getElementById('taskId').value = '';
            document.getElementById('projectId').value = projectId;
            document.getElementById('taskName').value = '';
            document.getElementById('taskDesc').value = '';
            document.getElementById('startDate').value = '';
            document.getElementById('endDate').value = '';
            document.getElementById('taskStatus').value = 'Pending'; // Ensure lowercase for status
        }
    }
</script>

</body>
</html>
