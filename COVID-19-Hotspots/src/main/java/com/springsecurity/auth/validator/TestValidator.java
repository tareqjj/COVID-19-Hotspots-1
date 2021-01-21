package com.springsecurity.auth.validator;

import com.springsecurity.auth.models.Test;
import com.springsecurity.auth.repositories.TestRepository;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class TestValidator implements Validator {

    private final TestRepository testRepository;

    public TestValidator(TestRepository testRepository) {
        this.testRepository = testRepository;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return Test.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Test test = (Test) o;

        if(testRepository.findBySample(test.getSample()) != null)
            errors.rejectValue("sample", "Exist");
    }
}
