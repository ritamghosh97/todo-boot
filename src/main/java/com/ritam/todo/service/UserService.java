package com.ritam.todo.service;

import com.ritam.todo.entity.User;
import com.ritam.todo.security.config.user.model.CrmUser;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    User findByUsername(String username);

    void save (CrmUser crmUser);
}
