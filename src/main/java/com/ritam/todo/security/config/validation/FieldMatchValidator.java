package com.ritam.todo.security.config.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.BeanWrapperImpl;

public class FieldMatchValidator implements ConstraintValidator<FieldMatch, Object> {

    private String firstFieldName;

    private String secondFieldName;

    private String message;

    @Override
    public void initialize(FieldMatch fieldMatchAnnotation) {
        firstFieldName = fieldMatchAnnotation.first();
        secondFieldName = fieldMatchAnnotation.second();
        message = fieldMatchAnnotation.message();
    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext context) {
        boolean valid=false;

        try{

            System.out.println("First Field: "+firstFieldName);
            System.out.println("First Field: "+secondFieldName);
            Object firstObj = new BeanWrapperImpl(value).getPropertyValue(firstFieldName);
            Object secondObj = new BeanWrapperImpl(value).getPropertyValue(secondFieldName);


            System.out.println("firstObj: "+firstObj.toString());
            System.out.println("secondObj: "+secondObj.toString());

            valid = (null==firstObj && null==secondObj) || (null != firstObj && firstObj.equals(secondObj));

        }catch (Exception e){
            //ignore exception
        }

        if(!valid){
            context.buildConstraintViolationWithTemplate(message)
                    .addPropertyNode(firstFieldName)
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
        }

        return valid;
    }
}
