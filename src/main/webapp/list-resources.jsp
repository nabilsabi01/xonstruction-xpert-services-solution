<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resources Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
            line-height: 1.6;
            color: var(--dark-color);
        }

        .navbar {
            background-color: var(--secondary-color);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            color: #fff;
            font-weight: 700;
            transition: color 0.3s ease-in-out;
        }

        .navbar-brand:hover {
            color: var(--primary-color);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }

        .resource-card {
            border: none;
            border-radius: 10px;
            background-color: var(--card-bg-color);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
            overflow: hidden;
        }

        .resource-card:hover {
            background-color: var(--card-hover-bg-color);
            transform: translateY(-5px);
        }

        .resource-card .card-body {
            padding: 1.5rem;
        }

        .resource-card .card-title {
            color: var(--primary-color);
            font-weight: 700;
        }

        .resource-card .btn {
            margin-right: 0.5rem;
        }

        .resource-card .btn-warning {
            background-color: var(--accent-color);
            border-color: var(--accent-color);
            color: var(--dark-color);
        }

        .resource-card .btn-warning:hover {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            color: #fff;
        }

        .resource-card .btn-danger {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .resource-card .btn-danger:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">ConstructionXpert</a>
    </div>
</nav>

<main class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1>Resources for Task: ${tasks.taskName}</h1>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#resourceModal" onclick="showResourceModal(null, ${tasks.taskId})">
            <i class="bi bi-plus-circle me-2"></i>Add Resource
        </button>
    </div>

    <div class="row">
        <c:forEach items="${resource}" var="res">
            <div class="col-md-4">
                <div class="card mb-4 resource-card">
                    <div class="card-body">
                        <h5 class="card-title">${res.resourceName}</h5>
                        <p class="card-text">
                            <strong>Type:</strong> ${res.resourceType}<br>
                            <strong>Quantity:</strong> ${res.quantity}<br>
                            <strong>Supplier:</strong> ${res.supplierName}<br>
                            <strong>Contact:</strong> ${res.supplierContact}
                        </p>
                        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#resourceModal"
                                onclick="showResourceModal(${res.resourceId}, ${tasks.taskId}, '${res.resourceName}', '${res.resourceType}', ${res.quantity}, '${res.supplierName}', '${res.supplierContact}')">
                            <i class="bi bi-pencil me-2"></i>Edit
                        </button>
                        <form action="resources" method="post" class="d-inline">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="resourceId" value="${res.resourceId}">
                            <input type="hidden" name="taskId" value="${tasks.taskId}">
                            <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this resource?')">
                                <i class="bi bi-trash me-2"></i>Delete
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<!-- Resource Modal -->
<div class="modal fade" id="resourceModal" tabindex="-1" aria-labelledby="resourceModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="resourceForm" action="resources" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="resourceModalLabel">Add Resource</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="resourceId" name="resourceId">
                    <input type="hidden" id="taskId" name="taskId">
                    <input type="hidden" id="action" name="action">
                    <div class="form-group">
                        <label for="resourceName">Resource Name</label>
                        <input type="text" class="form-control" id="resourceName" name="resourceName" required>
                    </div>
                    <div class="form-group">
                        <label for="resourceType">Resource Type</label>
                        <select class="form-control" id="resourceType" name="resourceType" required>
                            <option value="TOOL">Tool</option>
                            <option value="LABOR">Labor</option>
                            <option value="EQUIPMENT">Equipment</option>
                            <option value="MATERIAL">Material</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" required>
                    </div>
                    <div class="form-group">
                        <label for="supplierName">Supplier Name</label>
                        <input type="text" class="form-control" id="supplierName" name="supplierName">
                    </div>
                    <div class="form-group">
                        <label for="supplierContact">Supplier Contact</label>
                        <input type="text" class="form-control" id="supplierContact" name="supplierContact">
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
    function showResourceModal(resourceId, taskId, resourceName = '', resourceType = 'TOOL', quantity = 1, supplierName = '', supplierContact = '') {
        const modalTitle = document.getElementById('resourceModalLabel');
        const actionInput = document.getElementById('action');

        if (resourceId) {
            modalTitle.textContent = 'Edit Resource';
            actionInput.value = 'update';
            document.getElementById('resourceId').value = resourceId;
        } else {
            modalTitle.textContent = 'Add Resource';
            actionInput.value = 'insert';
            document.getElementById('resourceId').value = '';
        }

        document.getElementById('taskId').value = taskId;
        document.getElementById('resourceName').value = resourceName;
        document.getElementById('resourceType').value = resourceType;
        document.getElementById('quantity').value = quantity;
        document.getElementById('supplierName').value = supplierName;
        document.getElementById('supplierContact').value = supplierContact;
    }
</script>
</body>
</html>
