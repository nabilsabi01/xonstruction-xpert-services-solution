package com.constructionxpert.model;

import java.sql.Date;

public class Task {
    private int taskId;
    private int projectId;
    private String taskName;
    private String taskDesc;
    private Date startDate;
    private Date endDate;
    private String taskStatus;

    // Constructors
    public Task() {
    }

    public Task(int taskId, int projectId, String taskName, String taskDesc, Date startDate, Date endDate, String taskStatus) {
        this.taskId = taskId;
        this.projectId = projectId;
        this.taskName = taskName;
        this.taskDesc = taskDesc;
        this.startDate = startDate;
        this.endDate = endDate;
        this.taskStatus = taskStatus;
    }

    public Task(int projectId, String taskName, String taskDesc, Date startDate, Date endDate, String taskStatus) {
        this.projectId = projectId;
        this.taskName = taskName;
        this.taskDesc = taskDesc;
        this.startDate = startDate;
        this.endDate = endDate;
        this.taskStatus = taskStatus;
    }

    // Getters and Setters
    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskDesc() {
        return taskDesc;
    }

    public void setTaskDesc(String taskDesc) {
        this.taskDesc = taskDesc;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(String taskStatus) {
        this.taskStatus = taskStatus;
    }

    @Override
    public String toString() {
        return "Task{" +
                "taskId=" + taskId +
                ", projectId=" + projectId +
                ", taskName='" + taskName + '\'' +
                ", taskDesc='" + taskDesc + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", taskStatus='" + taskStatus + '\'' +
                '}';
    }
}
