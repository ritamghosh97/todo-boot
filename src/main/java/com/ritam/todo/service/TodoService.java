package com.ritam.todo.service;

import com.ritam.todo.entity.Todo;
import com.ritam.todo.exception.TodoNotFoundException;
import com.ritam.todo.model.TodoModel;
import com.ritam.todo.repository.TodoRepository;
import com.ritam.todo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@Service
public class TodoService {

    @Autowired
    private TodoRepository todoRepository;

    @Autowired
    private UserRepository userRepository;

    private final static DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-yyyy");

    public void addTodo(User loggedUser, String description, String targetDate){

        com.ritam.todo.entity.User user
                = userRepository.findByUserName(loggedUser.getUsername());

        Todo todo = new Todo(user, description, LocalDate.parse(targetDate, formatter), false);

        todoRepository.save(todo);
    }

    public List<Todo> findByUsername(String username) {
        com.ritam.todo.entity.User user = userRepository.findByUserName(username);
        return todoRepository.findTodosByUserId(user.getId());
    }

    public void deleteById(Integer id) {
        todoRepository.deleteById(id);
    }

    public Todo findById(Integer id) {
        Optional<Todo> todoOptional = todoRepository.findById(id);

        if(todoOptional.isPresent()){
            return todoOptional.get();
        } else {
            throw new TodoNotFoundException("Todo is not found with id: "+id);
        }
    }

    public void updateTodo(TodoModel todo) {
        LocalDate targetDate = LocalDate.parse(todo.getTargetDate(), formatter);
        todoRepository.updateTodo(todo.getId(), todo.getDescription(), targetDate, todo.getIsDone());
    }
}
