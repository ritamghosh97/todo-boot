package com.ritam.todo.service;

import com.ritam.todo.entity.Todo;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class TodoService {

    private static final List<Todo> todos = new LinkedList<>();

    public static final String RITAM_USER_NAME = "ritamghosh97";

    private static int todoId = 1;

    static {
        todos.add(new Todo(todoId++, RITAM_USER_NAME, "Learn Spring Boot",
                LocalDate.now().plusMonths(3), false));
        todos.add(new Todo(todoId++, RITAM_USER_NAME, "Learn Javascript",
                LocalDate.now().plusMonths(1), false));
        todos.add(new Todo(todoId++, RITAM_USER_NAME, "Learn Html",
                LocalDate.now().plusMonths(2), false));
        todos.add(new Todo(todoId++, RITAM_USER_NAME, "Learn CSS",
                LocalDate.now().plusMonths(3), false));
    }

    public List<Todo> findByUsername(String username){
        return todos.stream().filter(todo -> todo.getUsername().equalsIgnoreCase(username)).collect(Collectors.toList());
    }

    public void addTodo(String description, LocalDate targetDate){
        Todo todo = new Todo(todoId++, RITAM_USER_NAME, description, targetDate, false);
        todos.add(todo);
    }

    public void deleteTodoById(int id){
        todos.removeIf(t -> t.getId() == id);
    }

    public Todo findTodoById(int id) {
        return todos.stream().filter(t -> t.getId() == id).findFirst().orElse(null);
    }

    public void updateTodo(Todo todo) {
        deleteTodoById(todo.getId());
        todo.setUsername(RITAM_USER_NAME);
        todos.add(todo);
    }
}
