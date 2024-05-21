package com.constructionxpert.controller;

import com.constructionxpert.dao.IProjectDAO;
import com.constructionxpert.dao.ProjectDAOImpl;
import com.constructionxpert.model.Project;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/projects")
public class ProjectServlet extends HttpServlet {
    private IProjectDAO projectDAO;

    @Override
    public void init() {
        projectDAO = new ProjectDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                default:
                    listProjects(request, response);
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
                    insertProject(request, response);
                    break;
                case "update":
                    updateProject(request, response);
                    break;
                case "delete":
                    deleteProject(request, response);
                    break;
                default:
                    listProjects(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listProjects(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Project> projects = projectDAO.getAllProjects();
        request.setAttribute("projects", projects);
        request.getRequestDispatcher("list-projects.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("add-project.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        Project existingProject = projectDAO.getProject(projectId);
        request.setAttribute("project", existingProject);
        request.getRequestDispatcher("edit-project.jsp").forward(request, response);
    }

    private void insertProject(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String projectName = request.getParameter("projectName");
            String projectDesc = request.getParameter("projectDesc");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            double budget = Double.parseDouble(request.getParameter("budget"));

            Project newProject = new Project();
            newProject.setProjectName(projectName);
            newProject.setProjectDesc(projectDesc);
            newProject.setStartDate(Date.valueOf(startDate));
            newProject.setEndDate(Date.valueOf(endDate));
            newProject.setBudget(budget);

            projectDAO.addProject(newProject);
            response.sendRedirect(request.getContextPath() + "/projects");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void updateProject(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            String projectName = request.getParameter("projectName");
            String projectDesc = request.getParameter("projectDesc");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            double budget = Double.parseDouble(request.getParameter("budget"));

            Project project = new Project();
            project.setProjectId(projectId);
            project.setProjectName(projectName);
            project.setProjectDesc(projectDesc);
            project.setStartDate(Date.valueOf(startDate));
            project.setEndDate(Date.valueOf(endDate));
            project.setBudget(budget);

            projectDAO.updateProject(project);
            response.sendRedirect(request.getContextPath() + "/projects");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void deleteProject(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            projectDAO.deleteProject(projectId);
            response.sendRedirect(request.getContextPath() + "/projects");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
