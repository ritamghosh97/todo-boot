package com.ritam.todo.controller;

import com.ritam.todo.entity.User;
import com.ritam.todo.security.config.user.model.CrmUser;
import com.ritam.todo.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private UserService userService;

    private static final Logger logger = LogManager.getLogger(RegistrationController.class);

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        logger.info("Init binder is intercepted this request to process string data!!");
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/showRegistrationForm")
    public String showUserRegistrationPage(Model theModel) {
        theModel.addAttribute("crmUser", new CrmUser());
        return "registration-form";
    }

    @PostMapping("/processRegistrationForm")
    public String processRegistrationForm(@Valid @ModelAttribute CrmUser crmUser, BindingResult bindingResult,
            Model theModel) {
        String username = crmUser.getUserName();

        logger.info("Processing registration form for: {}", username);

        User existingUser = userService.findByUsername(username);

        // form validation errors
        if (bindingResult.hasErrors()) {
            return "registration-form";
        }

        //
        if (null != existingUser) {

            // so that when the user is redirected to registration-form again
            // in case if the username exists, so that we don't have any pre-populated data
            theModel.addAttribute("crmUser", new CrmUser());

            // adding a model attribute to show the error in registration-form
            theModel.addAttribute("registrationError",
                    "Username already exists! Please try with different username.");

            logger.warn("User name already exists.");

            return "registration-form";
        }

        // create user account
        userService.save(crmUser);

        logger.info("Successfully created user: {}", username);

        return "redirect:showRegistrationForm?success";
    }

}
