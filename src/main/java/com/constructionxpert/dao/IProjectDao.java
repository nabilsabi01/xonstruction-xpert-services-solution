package com.constructionxpert.dao;

import com.constructionxpert.model.Project;

import java.util.List;

public interface IProjectDao {
    List<Project> getAllProjects();
    void addProject(Project project);
    void deleteProject(Project project);
    void updateProject(Project project);
}
