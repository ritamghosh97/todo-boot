package com.ritam.todo.security.config.validation;

import javax.validation.Constraint;
import javax.validation.Payload;

import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = FieldMatchValidator.class)
@Target(value = {ElementType.TYPE, ElementType.ANNOTATION_TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface FieldMatch {

    String message() default "";

    String first();

    String second();

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    @Target(value = {ElementType.TYPE, ElementType.ANNOTATION_TYPE})
    @Retention(RetentionPolicy.RUNTIME)
    @Documented
    @interface List {
        FieldMatch[] value();
    }
}
