package com.javafx.mytest.dao;

import com.javafx.mytest.config.Props;
import com.javafx.mytest.dto.MainFormDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class MainFormDAO {

    public List<MainFormDTO> getAllRecords() {
        List<MainFormDTO> records = new ArrayList<>();

        
        Properties properties = Props.loadProperties();
        String url = properties.getProperty("db.url");
        String user = properties.getProperty("db.user");
        String password = properties.getProperty("db.password");

        
        try (Connection connection = DriverManager.getConnection(url, user, password)){

            
            String sql = """
                select id, partner_type, name, director, director_email, partner_phone, partner_legal_address, inn, rating,
                 CASE
                                 WHEN amount <= 10000 THEN 0
                                 WHEN amount > 10000 AND amount <= 50000 THEN 5
                                 WHEN amount > 50000 AND amount <= 300000 THEN 10
                                 WHEN amount > 300000 THEN 15
                             END AS discount
                             from 
                (SELECT id, partner_type, name, director, director_email, partner_phone, partner_legal_address, inn, rating, 
                 (select sum (quantity) from partner_production pp where p.id = pp.partner_id) as amount                 
                  FROM partner p) as source
            """;

           
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {

                
                while (resultSet.next()) {
                    Integer id = resultSet.getInt("id");
                    String type = resultSet.getString("partner_type");
                    String name = resultSet.getString("name");
                    String director = resultSet.getString("director");
                    String phone = resultSet.getString("partner_phone");
                    Integer rating = resultSet.getInt("rating");
                    Integer discount = resultSet.getInt("discount");

                    // Создание DTO и добавление в список
                    MainFormDTO dto = new MainFormDTO(id, type, name, director, phone, rating, discount);
                    records.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return records;
    }
}
