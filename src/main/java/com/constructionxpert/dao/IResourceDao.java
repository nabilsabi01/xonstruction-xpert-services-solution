package com.constructionxpert.dao;

import jdk.internal.loader.Resource;

import java.util.List;

public interface IResourceDao {
    List<Resource> getResources();
    void addResource(Resource resource);
    void deleteResource(Resource resource);
    void updateResource(Resource resource);
}
