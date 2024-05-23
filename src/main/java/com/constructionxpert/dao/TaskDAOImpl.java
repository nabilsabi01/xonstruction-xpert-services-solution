package com.constructionxpert.dao;

import com.constructionxpert.model.Task;
import com.constructionxpert.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TaskDAOImpl implements ITaskDAO {
    @Override
    public void addTask(Task task) {
        String sql = "INSERT INTO tasks (project_id, task_name, task_desc, start_date, end_date, task_status) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, task.getProjectId());
            stmt.setString(2, task.getTaskName());
            stmt.setString(3, task.getTaskDesc());
            stmt.setDate(4, task.getStartDate());
            stmt.setDate(5, task.getEndDate());
            stmt.setString(6, task.getTaskStatus());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Task getTask(int taskId) {
        String sql = "SELECT * FROM tasks WHERE task_id = ?";
        Task task = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, taskId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    task = new Task();
                    task.setTaskId(rs.getInt("task_id"));
                    task.setProjectId(rs.getInt("project_id"));
                    task.setTaskName(rs.getString("task_name"));
                    task.setTaskDesc(rs.getString("task_desc"));
                    task.setStartDate(rs.getDate("start_date"));
                    task.setEndDate(rs.getDate("end_date"));
                    task.setTaskStatus(rs.getString("task_status"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return task;
    }

    @Override
    public List<Task> getTasksByProjectId(int projectId) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE project_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, projectId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Task task = new Task();
                    task.setTaskId(rs.getInt("task_id"));
                    task.setProjectId(rs.getInt("project_id"));
                    task.setTaskName(rs.getString("task_name"));
                    task.setTaskDesc(rs.getString("task_desc"));
                    task.setStartDate(rs.getDate("start_date"));
                    task.setEndDate(rs.getDate("end_date"));
                    task.setTaskStatus(rs.getString("task_status"));
                    tasks.add(task);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }

    @Override
    public void updateTask(Task task) {
        String sql = "UPDATE tasks SET project_id = ?, task_name = ?, task_desc = ?, start_date = ?, end_date = ?, task_status = ? WHERE task_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, task.getProjectId());
            stmt.setString(2, task.getTaskName());
            stmt.setString(3, task.getTaskDesc());
            stmt.setDate(4, task.getStartDate());
            stmt.setDate(5, task.getEndDate());
            stmt.setString(6, task.getTaskStatus());
            stmt.setInt(7, task.getTaskId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteTask(int taskId) {
        String sql = "DELETE FROM tasks WHERE task_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, taskId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
