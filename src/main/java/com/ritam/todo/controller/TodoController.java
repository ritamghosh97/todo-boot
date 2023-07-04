package com.ritam.todo.controller;

import com.ritam.todo.entity.Todo;
import com.ritam.todo.model.TodoModel;
import com.ritam.todo.service.TodoService;
import com.ritam.todo.service.UserService;
import com.ritam.todo.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/todo-app")
public class TodoController {

    private final TodoService todoService;

    @Autowired
    private UserService userService;

    private final static DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-yyyy");

    @Autowired
    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    @GetMapping("/todos")
    public String showAllTodos(Model theModel){

        User loggedUser = getCurrentlyLoggedInUser();

        com.ritam.todo.entity.User user
                = userService.findByUsername(loggedUser.getUsername());

        List<Todo> todos = todoService.findByUsername(loggedUser.getUsername());
        System.out.println("Todos: "+todos);
        theModel.addAttribute("todos", todos);
        theModel.addAttribute("user", user.getFirstName());
        return "list-todos";
    }

    @GetMapping("/add-todo")
    public String showNewTodoPage(Model theModel){
        TodoModel todo = new TodoModel();
        theModel.addAttribute("todo", todo);
        return "add-todo";
    }

    @PostMapping("/add-todo")
    public String addTodo(@Valid @ModelAttribute("todo") TodoModel todo, BindingResult theBindingResult){
        /*
            Here if return only the 'list-todos' jsp page, then it would show
            an empty list, because it'll not get anything from the model attribute
            as we are adding anything to model. To get the full list we can again
            retrieve the todos and add it the model and then return 'list-todos'.

            But easiest way around is redirect to the url, which is showing the
            list of todos.
        */

        User user = getCurrentlyLoggedInUser();

        if(theBindingResult.hasErrors()){
            return "add-todo";
        } else {
            todoService.addTodo(user, todo.getDescription(), todo.getTargetDate());
            return "redirect:todos";
        }
    }

    @GetMapping("/delete-todo")
    public String deleteTodo(@RequestParam Integer id){
        todoService.deleteById(id);
        return "redirect:todos";
    }

    @GetMapping("/update-todo")
    public String showUpdateTodoPage(@RequestParam Integer id, Model theModel) {
        Todo todo = todoService.findById(id);
        TodoModel todoModel = new TodoModel(todo.getId(), todo.getDescription(), todo.getTargetDate().format(formatter), todo.getIsDone());
        if (null != todo) {
            theModel.addAttribute("todo", todoModel);
        }
        return "add-todo";
    }

    @PostMapping("/update-todo")
    public String updateTodo(@Valid @ModelAttribute("todo") TodoModel todo, BindingResult theBindingResult){

        if(theBindingResult.hasErrors()){
            return "add-todo";
        } else {
            todoService.updateTodo(todo);
            return "redirect:todos";
        }
    }

    private static User getCurrentlyLoggedInUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();
        return user;
    }

}
