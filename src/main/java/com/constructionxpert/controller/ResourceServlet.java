package com.constructionxpert.controller;

import com.constructionxpert.dao.*;
import com.constructionxpert.model.Resource;
import com.constructionxpert.model.Task;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ResourceServlet", value = "/resources")
public class ResourceServlet extends HttpServlet {
    private ITaskDAO taskDAO;
    private IResourceDAO resourceDAO;

    @Override
    public void init() throws ServletException {
        taskDAO = new TaskDAOImpl();
        resourceDAO = new ResourceDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    showNewResourceForm(request, response);
                    break;
                default:
                    listResources(request, response);
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
                    insertResourec(request, response);
                    break;
                case "update":
                    updateTask(request, response);
                    break;
                case "delete":
                    deleteResource(request, response);
                    break;
                default:
                    listResources(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listResources(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskDAO.getTask(taskId);
        List<Resource> resources = resourceDAO.getResourcesByTaskId(taskId);

        request.setAttribute("resource", resources);
        request.setAttribute("tasks", task);
        request.getRequestDispatcher("list-resources.jsp").forward(request, response);
    }

    private void showNewResourceForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        request.setAttribute("taskId", taskId);
        request.getRequestDispatcher("resourceForm.jsp").forward(request, response);
    }

    private void insertResourec(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        String resourceName = request.getParameter("resourceName");
        String resourceType = request.getParameter("resourceType").toLowerCase();
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String supplierName = request.getParameter("supplierName");
        String supplierContact = request.getParameter("supplierName");
        Resource newResource = new Resource(taskId, resourceName, resourceType, quantity, supplierName, supplierContact);
        resourceDAO.addResource(newResource);
        response.sendRedirect("resources?taskId=" + taskId);
    }

    private void updateTask(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int resourceId = Integer.parseInt(request.getParameter("resourceId"));
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        String resourceName = request.getParameter("resourceName");
        String resourceType = request.getParameter("resourceType").toLowerCase();
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String supplierName = request.getParameter("supplierName");
        String supplierContact = request.getParameter("supplierName");
        Resource resource = new Resource(resourceId, taskId, resourceName, resourceType, quantity, supplierName, supplierContact);
        resourceDAO.updateResource(resource);
        response.sendRedirect("resources?taskId=" + taskId);
    }

    private void deleteResource(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int resourceId = Integer.parseInt(request.getParameter("resourceId"));
        resourceDAO.deleteResource(resourceId);
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        response.sendRedirect("resources?taskId=" + taskId);
    }
}