package com.springsecurity.auth.validator;

import com.springsecurity.auth.models.User;
import com.springsecurity.auth.repositories.UserRepository;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    private  final UserRepository userRepository;

    public UserValidator(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        if (!user.getPasswordConfirmation().equals(user.getPassword()))
            errors.rejectValue("passwordConfirmation", "Match");
        if (userRepository.findByUsername(user.getUsername()) != null)
            errors.rejectValue("username", "Registered");
    }
}
