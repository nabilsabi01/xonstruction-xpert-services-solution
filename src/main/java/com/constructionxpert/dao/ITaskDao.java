package com.constructionxpert.dao;

import com.constructionxpert.model.Task;

import java.util.List;

public interface ITaskDao {
    List<Task> getTasks();
    void addTask(Task task);
    void updateTask(Task task);
    void deleteTask(Task task);
}
