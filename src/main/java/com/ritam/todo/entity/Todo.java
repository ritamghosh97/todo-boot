package com.ritam.todo.entity;

import org.springframework.format.annotation.DateTimeFormat;

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

    @Column(name="description")
    private String description;

    @Column(name="target_date")
    @DateTimeFormat(pattern = "dd-MMM-yyyy")
    private LocalDate targetDate;

    @Column(name="is_done")
    private boolean isDone;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Todo(){

    }

    public Todo(User user, String description, @NotNull LocalDate targetDate, boolean isDone) {
        this.user = user;
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

    public User getUserId() {
        return user;
    }

    public void setUserId(User user) {
        this.user = user;
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
                ", description='" + description + '\'' +
                ", targetDate=" + targetDate +
                ", isDone=" + isDone +
                '}';
    }
}
