package com.constructionxpert.dao;

import com.constructionxpert.model.Task;
import java.util.List;

public interface ITaskDAO {
    void addTask(Task task);
    Task getTask(int taskId);
    List<Task> getAllTasks();
    List<Task> getTasksByProjectId(int projectId);
    void updateTask(Task task);
    void deleteTask(int taskId);
}
