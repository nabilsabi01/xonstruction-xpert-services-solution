package com.constructionxpert.model;

public class Resource {
    private int resourceId;
    private int taskId;
    private String resourceName;
    private String resourceType;
    private int quantity;
    private String supplierName;
    private String supplierContact;

    public Resource() {
    }

    public Resource(int resourceId, int taskId, String resourceName, String resourceType, int quantity, String supplierName, String supplierContact) {
        this.resourceId = resourceId;
        this.taskId = taskId;
        this.resourceName = resourceName;
        this.resourceType = resourceType;
        this.quantity = quantity;
        this.supplierName = supplierName;
        this.supplierContact = supplierContact;
    }

    public Resource(int taskId, String resourceName, String resourceType, int quantity, String supplierName, String supplierContact) {
        this.taskId = taskId;
        this.resourceName = resourceName;
        this.resourceType = resourceType;
        this.quantity = quantity;
        this.supplierName = supplierName;
        this.supplierContact = supplierContact;
    }

    public int getResourceId() {
        return resourceId;
    }

    public void setResourceId(int resourceId) {
        this.resourceId = resourceId;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getResourceType() {
        return resourceType;
    }

    public void setResourceType(String resourceType) {
        this.resourceType = resourceType;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getSupplierContact() {
        return supplierContact;
    }

    public void setSupplierContact(String supplierContact) {
        this.supplierContact = supplierContact;
    }
}
