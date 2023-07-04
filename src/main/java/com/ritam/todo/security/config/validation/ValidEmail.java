package com.ritam.todo.security.config.validation;

import javax.validation.Constraint;
import javax.validation.Payload;

import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = EmailValidator.class)
@Target(value={ElementType.FIELD, ElementType.TYPE, ElementType.ANNOTATION_TYPE})
@Retention(value = RetentionPolicy.RUNTIME)
public @interface ValidEmail {
    String message() default "Invalid email!";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
