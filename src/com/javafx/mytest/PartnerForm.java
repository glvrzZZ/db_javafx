package com.javafx.mytest;

import com.javafx.mytest.dao.MainFormDAO;
import com.javafx.mytest.dto.MainFormDTO;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

/*
public class PartnerForm {
    private final MainFormDAO dao = new MainFormDAO();
    private final boolean isEditMode;
    private final MainFormDTO partner;

    public PartnerForm(MainFormDTO partner, boolean isEditMode) {
        this.partner = partner;
        this.isEditMode = isEditMode;
    }

    public void show() {
        Stage stage = new Stage();
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setTitle(isEditMode ? "Редактирование партнера" : "Добавление партнера");

        // Создание элементов интерфейса
        TextField nameField = new TextField(partner.getName());
        ComboBox<String> typeBox = new ComboBox<>();
        typeBox.getItems().addAll("Тип 1", "Тип 2", "Тип 3");
        typeBox.setValue(partner.getType());

        TextField ratingField = new TextField(String.valueOf(partner.getRating()));

        TextField directorField = new TextField(partner.getDirector());
        TextField phoneField = new TextField(partner.getPhone());


        Button saveButton = new Button("Сохранить");
        Button cancelButton = new Button("Отмена");

        // Размещение элементов в сетке
        GridPane grid = new GridPane();
        grid.setPadding(new Insets(10));
        grid.setVgap(8);
        grid.setHgap(10);

        grid.add(new Label("Наименование:"), 0, 0);
        grid.add(nameField, 1, 0);

        grid.add(new Label("Тип партнера:"), 0, 1);
        grid.add(typeBox, 1, 1);

        grid.add(new Label("Рейтинг:"), 0, 2);
        grid.add(ratingField, 1, 2);



        grid.add(new Label("ФИО директора:"), 0, 4);
        grid.add(directorField, 1, 4);

        grid.add(new Label("Телефон:"), 0, 5);
        grid.add(phoneField, 1, 5);



        grid.add(saveButton, 0, 7);
        grid.add(cancelButton, 1, 7);

        // Обработка кнопки "Сохранить"
        saveButton.setOnAction(e -> {
            try {
                int rating = Integer.parseInt(ratingField.getText());
                if (rating < 0) {
                    throw new IllegalArgumentException("Рейтинг должен быть неотрицательным числом.");
                }

                partner.setName(nameField.getText());
                partner.setType(typeBox.getValue());
                partner.setRating(rating);

                partner.setDirector(directorField.getText());
                partner.setPhone(phoneField.getText());


                if (isEditMode) {
                    dao.updatePartner(partner);
                } else {
                    dao.addPartner(partner);
                }

                stage.close();
            } catch (NumberFormatException ex) {
                showAlert("Ошибка ввода", "Некорректный формат рейтинга.");
            } catch (IllegalArgumentException ex) {
                showAlert("Ошибка ввода", ex.getMessage());
            }
        });

        // Обработка кнопки "Отмена"
        cancelButton.setOnAction(e -> stage.close());

        // Настройка сцены
        Scene scene = new Scene(grid, 400, 300);
        stage.setScene(scene);
        stage.showAndWait();
    }

    private void showAlert(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }
}
 */
