
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f5f5f5;
            color: #333;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 2rem;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004a9e;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card">
                <h1 class="mb-4">Edit Project</h1>
                <form action="projects" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="projectId" value="${project.projectId}">
                    <div class="mb-4">
                        <label for="projectName" class="form-label">Project Name</label>
                        <input type="text" class="form-control" id="projectName" name="projectName" value="${project.projectName}" required>
                    </div>
                    <div class="mb-4">
                        <label for="projectDesc" class="form-label">Project Description</label>
                        <textarea class="form-control" id="projectDesc" name="projectDesc" rows="3" required>${project.projectDesc}</textarea>
                    </div>
                    <div class="mb-4">
                        <label for="startDate" class="form-label">Start Date</label>
                        <input type="date" class="form-control" id="startDate" name="startDate" value="${project.startDate}" required>
                    </div>
                    <div class="mb-4">
                        <label for="endDate" class="form-label">End Date</label>
                        <input type="date" class="form-control" id="endDate" name="endDate" value="${project.endDate}" required>
                    </div>
                    <div class="mb-4">
                        <label for="budget" class="form-label">Budget</label>
                        <input type="number" class="form-control" id="budget" name="budget" value="${project.budget}" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update Project</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>'