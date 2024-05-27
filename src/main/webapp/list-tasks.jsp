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
            --primary-color: #FF7555;
            --secondary-color: #5C6CA2;
            --light-color: #F5F5F5;
            --dark-color: #333333;
            --accent-color: #FFD17C;
            --bg-color: #FFFFFF;
            --card-bg-color: #FFFFFF;
            --card-hover-bg-color: #F8F9FA;
            --pending-color: #ffc107;
            --in-progress-color: #17a2b8;
            --completed-color: #28a745;
        }

        body {
            background-color: var(--bg-color);
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
        }

        .row.row-cols-1 > * {
            margin-bottom: 1.5rem;
        }

        .row.row-cols-md-2 > * {
            margin-bottom: 1.5rem;
        }

        .row.row-cols-lg-3 > * {
            margin-bottom: 1.5rem;
        }

        /* Start Navbar */
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

        .logo {
            margin-right: 0.5rem;
        }

        .user-name {
            color: white;
            cursor: pointer;
            transition: color 0.3s ease-in-out;
            margin-right: 0.5rem;
        }

        .user-name:hover{
            color: var(--primary-color);
        }
        /* End Navbar */

        /* Custom CSS for Tasks Page */
        .task-card {
            border: none;
            border-radius: 10px;
            background-color: var(--card-bg-color);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
            overflow: hidden;
        }

        .task-card:hover {
            transform: translateY(-5px);
            background-color: var(--card-hover-bg-color);
        }

        .task-card .card-header {
            background-color: var(--secondary-color);
            color: #fff;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.2rem 1.5rem;
        }

        .task-card .card-header h5 {
            margin-bottom: 0;
        }

        .task-card .card-body {
            padding: 1.8rem;
        }

        .task-card .card-footer {
            background-color: var(--light-color);
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            padding: 1.2rem 1.5rem;
        }

        .task-card .btn {
            background-color: var(--primary-color);
            color: #fff;
            transition: all 0.3s ease-in-out;
        }

        .task-card .btn:hover {
            background-color: var(--secondary-color);
        }

        .task-card .list-group-item {
            background-color: transparent;
            border: none;
            padding: 0.5rem 0;
            color: var(--dark-color);
        }

        .task-card .list-group-item i {
            color: var(--primary-color);
        }

        .title-page {
            color: var(--primary-color);
            font-weight: 700;
        }

        .badge {
            font-size: 0.9em;
            padding: 0.4em 0.7em;
        }

        .badge-pending {
            background-color: var(--pending-color);
        }

        .badge-in-progress {
            background-color: var(--in-progress-color);
        }

        .badge-completed {
            background-color: var(--completed-color);
        }

        .btn-add {
            background-color: var(--primary-color);
            color: white;
            transition: all 0.3s ease-in-out;
        }

        .btn-add:hover {
            background-color: var(--secondary-color);
            color: white;
            transform: translateY(-2px);
        }

        #taskForm .mb-3 {
            margin-bottom: 1.5rem !important;
        }

        #taskModal .modal-footer button {
            margin-left: 0.5rem;
            margin-right: 0.5rem;
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
        <div id="tasks" class="section active">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2 class="mb-0 title-page">Tasks for Project: ${project.projectName}</h2>
                <button class="btn btn-add" data-bs-toggle="modal" data-bs-target="#taskModal" onclick="showTaskModal(null, ${project.projectId})">
                    <i class="bi bi-plus-circle me-2"></i> Add New Task
                </button>
            </div>
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <c:forEach items="${tasks}" var="task">
                    <div class="col">
                        <div class="card h-100 task-card">
                            <div class="card-header">
                                <h5 class="card-title">${task.taskName}</h5>
                                <c:choose>
                                    <c:when test="${task.taskStatus == 'PENDING'}">
                                        <span class="badge badge-pending">Pending</span>
                                    </c:when>
                                    <c:when test="${task.taskStatus == 'IN_PROGRESS'}">
                                        <span class="badge badge-in-progress">In Progress</span>
                                    </c:when>
                                    <c:when test="${task.taskStatus == 'COMPLETED'}">
                                        <span class="badge badge-completed">Completed</span>
                                    </c:when>
                                </c:choose>
                            </div>
                            <div class="card-body">
                                <p class="card-text">${task.taskDesc}</p>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">
                                        <i class="bi bi-calendar-event me-2"></i> Start Date: ${task.startDate}
                                    </li>
                                    <li class="list-group-item">
                                        <i class="bi bi-calendar-check me-2"></i> End Date: ${task.endDate}
                                    </li>
                                </ul>
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <button class="btn" data-bs-toggle="modal" data-bs-target="#taskModal" onclick="showTaskModal(${task.taskId}, ${task.projectId}, '${task.taskName}', '${task.taskDesc}', '${task.startDate}', '${task.endDate}', '${task.taskStatus}')">
                                    <i class="bi bi-pencil me-2"></i> Edit
                                </button>
                                <form action="tasks" method="post" class="d-inline">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="taskId" value="${task.taskId}">
                                    <input type="hidden" name="projectId" value="${project.projectId}">
                                    <button type="submit" class="btn" onclick="return confirm('Are you sure you want to delete this task?')">
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
                        <input type="text" class="form-control" id="taskName" name="taskName">
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
                            <option value="Pending">Pending</option>
                            <option value="In_Progress">In Progress</option>
                            <option value="Completed">Completed</option>
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
            document.getElementById('taskStatus').value = taskStatus;
        } else {
            modalTitle.textContent = 'Add New Task';
            actionInput.value = 'insert';
            document.getElementById('taskId').value = '';
            document.getElementById('projectId').value = projectId;
            document.getElementById('taskName').value = '';
            document.getElementById('taskDesc').value = '';
            document.getElementById('startDate').value = '';
            document.getElementById('endDate').value = '';
            document.getElementById('taskStatus').value = 'Pending';
        }
    }
</script>
</body>
</html>
