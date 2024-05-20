package com.constructionxpert.dao;

import com.constructionxpert.model.Task;
import com.constructionxpert.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TaskDaoImpl implements ITaskDao{
    @Override
    public List<Task> getTasks() {
        List<Task> rooms = new ArrayList<>();
        String sql = "SELECT * FROM tasks";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int roomId = resultSet.getInt("room_id");
                String roomType = resultSet.getString("room_type");
                int capacity = resultSet.getInt("capacity");
                double pricePerNight = resultSet.getDouble("price_per_night");
                String equipment = resultSet.getString("equipment");
                boolean isAvailable = resultSet.getBoolean("is_available");
                Task room = new Task();
                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    @Override
    public void addTask(Task task) {

    }

    @Override
    public void updateTask(Task task) {

    }

    @Override
    public void deleteTask(Task task) {

    }
}
