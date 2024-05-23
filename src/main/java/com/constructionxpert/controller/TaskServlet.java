package com.constructionxpert.controller;

import com.constructionxpert.dao.ITaskDAO;
import com.constructionxpert.dao.IProjectDAO;
import com.constructionxpert.dao.TaskDAOImpl;
import com.constructionxpert.dao.ProjectDAOImpl;
import com.constructionxpert.model.Task;
import com.constructionxpert.model.Project;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/tasks")
public class TaskServlet extends HttpServlet {
    private ITaskDAO taskDAO;
    private IProjectDAO projectDAO;

    @Override
    public void init() {
        taskDAO = new TaskDAOImpl();
        projectDAO = new ProjectDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    showNewTaskForm(request, response);
                    break;
                default:
                    listTasks(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "insert":
                    insertTask(request, response);
                    break;
                case "update":
                    updateTask(request, response);
                    break;
                case "delete":
                    deleteTask(request, response);
                    break;
                default:
                    listTasks(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listTasks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        Project project = projectDAO.getProject(projectId);
        List<Task> tasks = taskDAO.getTasksByProjectId(projectId);

        request.setAttribute("project", project);
        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("list-tasks.jsp").forward(request, response);
    }

    private void showNewTaskForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        request.setAttribute("projectId", projectId);
        request.getRequestDispatcher("taskForm.jsp").forward(request, response);
    }

    private void insertTask(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        String taskName = request.getParameter("taskName");
        String taskDesc = request.getParameter("taskDesc");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        String taskStatus = request.getParameter("taskStatus").toLowerCase(); // Ensure lowercase
        Task newTask = new Task(projectId, taskName, taskDesc, startDate, endDate, taskStatus);
        taskDAO.addTask(newTask);
        response.sendRedirect("tasks?projectId=" + projectId);
    }

    private void updateTask(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        String taskName = request.getParameter("taskName");
        String taskDesc = request.getParameter("taskDesc");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        String taskStatus = request.getParameter("taskStatus").toLowerCase(); // Ensure lowercase

        Task task = new Task(taskId, projectId, taskName, taskDesc, startDate, endDate, taskStatus);
        taskDAO.updateTask(task);
        response.sendRedirect("tasks?projectId=" + projectId);
    }

    private void deleteTask(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        taskDAO.deleteTask(taskId);
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        response.sendRedirect("tasks?projectId=" + projectId);
    }
}
