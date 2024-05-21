package com.constructionxpert.dao;


import com.constructionxpert.model.Resource;
import com.constructionxpert.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResourceDAOImpl implements IResourceDAO {
    @Override
    public void addResource(Resource resource) {
        String sql = "INSERT INTO resources (task_id, resource_name, resource_type, quantity, supplier_name, supplier_contact) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, resource.getTaskId());
            stmt.setString(2, resource.getResourceName());
            stmt.setString(3, resource.getResourceType());
            stmt.setInt(4, resource.getQuantity());
            stmt.setString(5, resource.getSupplierName());
            stmt.setString(6, resource.getSupplierContact());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Resource getResource(int resourceId) {
        String sql = "SELECT * FROM resources WHERE resource_id = ?";
        Resource resource = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, resourceId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    resource = new Resource();
                    resource.setResourceId(rs.getInt("resource_id"));
                    resource.setTaskId(rs.getInt("task_id"));
                    resource.setResourceName(rs.getString("resource_name"));
                    resource.setResourceType(rs.getString("resource_type"));
                    resource.setQuantity(rs.getInt("quantity"));
                    resource.setSupplierName(rs.getString("supplier_name"));
                    resource.setSupplierContact(rs.getString("supplier_contact"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resource;
    }

    @Override
    public List<Resource> getAllResources() {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT * FROM resources";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Resource resource = new Resource();
                resource.setResourceId(rs.getInt("resource_id"));
                resource.setTaskId(rs.getInt("task_id"));
                resource.setResourceName(rs.getString("resource_name"));
                resource.setResourceType(rs.getString("resource_type"));
                resource.setQuantity(rs.getInt("quantity"));
                resource.setSupplierName(rs.getString("supplier_name"));
                resource.setSupplierContact(rs.getString("supplier_contact"));
                resources.add(resource);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resources;
    }

    @Override
    public List<Resource> getResourcesByTaskId(int taskId) {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT * FROM resources WHERE task_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, taskId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Resource resource = new Resource();
                    resource.setResourceId(rs.getInt("resource_id"));
                    resource.setTaskId(rs.getInt("task_id"));
                    resource.setResourceName(rs.getString("resource_name"));
                    resource.setResourceType(rs.getString("resource_type"));
                    resource.setQuantity(rs.getInt("quantity"));
                    resource.setSupplierName(rs.getString("supplier_name"));
                    resource.setSupplierContact(rs.getString("supplier_contact"));
                    resources.add(resource);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resources;
    }

    @Override
    public void updateResource(Resource resource) {
        String sql = "UPDATE resources SET task_id = ?, resource_name = ?, resource_type = ?, quantity = ?, supplier_name = ?, supplier_contact = ? WHERE resource_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, resource.getTaskId());
            stmt.setString(2, resource.getResourceName());
            stmt.setString(3, resource.getResourceType());
            stmt.setInt(4, resource.getQuantity());
            stmt.setString(5, resource.getSupplierName());
            stmt.setString(6, resource.getSupplierContact());
            stmt.setInt(7, resource.getResourceId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteResource(int resourceId) {
        String sql = "DELETE FROM resources WHERE resource_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, resourceId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
