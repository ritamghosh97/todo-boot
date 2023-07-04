package com.ritam.todo.model;

import javax.persistence.Column;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;

public class TodoModel {

    private Integer id;

    @Size(min=10, message = "Enter at least 10 characters!")
    private String description;

    @NotNull(message = "Target Date must not be null!")
    private String targetDate;

    @Column(name="is_done")
    private boolean isDone;

    public TodoModel() {
    }

    public TodoModel(Integer id, String description, String targetDate, boolean isDone) {
        this.id = id;
        this.description = description;
        this.targetDate = targetDate;
        this.isDone = isDone;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTargetDate() {
        return targetDate;
    }

    public void setTargetDate(String targetDate) {
        this.targetDate = targetDate;
    }

    public boolean getIsDone() {
        return isDone;
    }

    public void setIsDone(boolean done) {
        isDone = done;
    }

    @Override
    public String toString() {
        return "TodoModel{" +
                "description='" + description + '\'' +
                ", targetDate=" + targetDate +
                ", isDone=" + isDone +
                '}';
    }
}
