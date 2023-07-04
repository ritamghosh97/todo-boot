package com.ritam.todo.entity;

import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import java.time.LocalDate;

@Entity
@Table(name="todo")
public class Todo {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Size(min=10, message = "Enter at least 10 characters!")
    @Column(name="description")
    private String description;

    @NotNull(message = "Target Date must not be null!")
    @Future(message = "Target Date must be in future date!")
    @Column(name="target_date")
    private LocalDate targetDate;

    @Column(name="is_done")
    private boolean isDone;

    private String username;

    public Todo(){

    }

    public Todo(Integer id, String username, String description, @NotNull LocalDate targetDate, boolean isDone) {
        this.id = id;
        this.username = username;
        this.description = description;
        this.targetDate = targetDate;
        this.isDone = isDone;
    }

    public Todo(String username, String description, @NotNull LocalDate targetDate, boolean isDone) {
        this.username = username;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public @NotNull LocalDate getTargetDate() {
        return targetDate;
    }

    public void setTargetDate(@NotNull LocalDate targetDate) {
        this.targetDate = targetDate;
    }

    public boolean getIsDone() {
        return isDone;
    }

    public void setIsDone(boolean isDone) {
        this.isDone = isDone;
    }

    @Override
    public String toString() {
        return "Todo{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", description='" + description + '\'' +
                ", targetDate=" + targetDate +
                ", isDone=" + isDone +
                '}';
    }
}
