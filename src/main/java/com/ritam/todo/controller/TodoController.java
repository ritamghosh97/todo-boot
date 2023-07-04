package com.ritam.todo.controller;

import com.ritam.todo.entity.Todo;
import com.ritam.todo.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/todo-app")
public class TodoController {

    private final TodoService todoService;

    @Autowired
    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    @GetMapping("/todos")
    public String showAllTodos(Model theModel){
        List<Todo> todos = todoService.findByUsername("ritamghosh97");
        theModel.addAttribute("todos", todos);
        return "list-todos";
    }

    @GetMapping("/add-todo")
    public String showNewTodoPage(Model theModel){
        Todo todo = new Todo();
        theModel.addAttribute("todo", todo);
        return "add-todo";
    }

    @PostMapping("/add-todo")
    public String addTodo(@Valid @ModelAttribute("todo") Todo todo, BindingResult theBindingResult){
        /*
            Here if return only the 'list-todos' jsp page, then it would show
            an empty list, because it'll not get anything from the model attribute
            as we are adding anything to model. To get the full list we can again
            retrieve the todos and add it the model and then return 'list-todos'.

            But easiest way around is redirect to the url, which is showing the
            list of todos.
        */

        if(theBindingResult.hasErrors()){
            return "add-todo";
        } else {
            todoService.addTodo(todo.getDescription(), todo.getTargetDate());
            return "redirect:todos";
        }
    }

    @GetMapping("/delete-todo")
    public String deleteTodo(@RequestParam int id){
        todoService.deleteTodoById(id);
        return "redirect:todos";
    }

    @GetMapping("/update-todo")
    public String showUpdateTodoPage(@RequestParam int id, Model theModel) {
        Todo todo = todoService.findTodoById(id);
        if (null != todo) {
            theModel.addAttribute(todo);
        }
        return "add-todo";
    }

    @PostMapping("/update-todo")
    public String updateTodo(@Valid @ModelAttribute("todo") Todo todo, BindingResult theBindingResult){

        if(theBindingResult.hasErrors()){
            return "add-todo";
        } else {
            System.out.println("Todo:: "+todo);
            todoService.updateTodo(todo);
            return "redirect:todos";
        }
    }

}
