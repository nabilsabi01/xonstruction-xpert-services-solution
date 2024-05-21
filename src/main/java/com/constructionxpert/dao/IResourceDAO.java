package com.constructionxpert.dao;

import com.constructionxpert.model.Resource;
import java.util.List;

public interface IResourceDAO {
    void addResource(Resource resource);
    Resource getResource(int resourceId);
    List<Resource> getAllResources();
    List<Resource> getResourcesByTaskId(int taskId);
    void updateResource(Resource resource);
    void deleteResource(int resourceId);
}
