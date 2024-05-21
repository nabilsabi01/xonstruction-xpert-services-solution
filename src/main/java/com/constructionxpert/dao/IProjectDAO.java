package com.constructionxpert.dao;

import com.constructionxpert.model.Project;
import java.util.List;

public interface IProjectDAO {
    void addProject(Project project);
    Project getProject(int projectId);
    List<Project> getAllProjects();
    void updateProject(Project project);
    void deleteProject(int projectId);
}
