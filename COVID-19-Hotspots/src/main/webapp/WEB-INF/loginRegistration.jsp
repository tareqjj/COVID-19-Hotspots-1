<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/16/2021
  Time: 2:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <style>
        main{display: flex; justify-content: space-evenly; margin: 50px}
    </style>
    <title>Login and Registration</title>
    <script>
        $(document).ready(function (){
            $('#password').on('keyup', function () {
                if($('#password').val().toLowerCase() == $('#password').val() ||
                    $('#password').val().length < 8 ||
                    /^[a-zA-Z0-9]*$/.test($('#password').val()) == true){
                    $('#message').html('Weak').css('color', 'red');
                }else
                    $('#message').html('Strong').css('color', 'green');
            });
            $('#confirm_password').on('keyup', function () {
                if ($('#password').val() == $('#confirm_password').val()) {
                    $('#message1').html('Matching').css('color', 'green');
                } else
                    $('#message1').html('Not Matching').css('color', 'red');
            });
            $('#Email').on('keyup',function (){
                if(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g.test($('#Email').val()) == false) {
                    $('#message2').html('Invalid Email').css('color', 'red');
                }else
                    $('#message2').html('Valid').css('color', 'green');
            });
            $('#idNumber').on('keyup',function (){
                if(/^\d{9}$/.test($('#idNumber').val()) == false) {
                    $('#message3').html('Invalid Id Number').css('color', 'red');
                }else
                    $('#message3').html('Valid').css('color', 'green');
            });
            $()
        })
    </script>
</head>
<body>
    <main>
        <div>
            <h1>Register</h1>
            <form:form method="POST" action="/registration" modelAttribute="user">
                <p>
                    <form:label path="firstName" class="col-form-label">First Name:</form:label>
                    <form:errors path="firstName" cssClass="text-danger"/>
                    <form:input path="firstName" class="form-control" required="required"/>
                </p>
                <p>
                    <form:label path="lastName" class="col-form-label">Last Name:</form:label>
                    <form:errors path="lastName" cssClass="text-danger"/>
                    <form:input path="lastName" class="form-control" required="required"/>
                </p>
                <p>
                    <form:label path="username" class="col-form-label">Email:</form:label>
                    <p id="message2"></p>
                    <form:errors path="username" cssClass="text-danger"/>
                    <form:input type="username" id="Email" path="username" class="form-control" required="required"/>
                </p>
                <p>
                    <form:label path="idNumber" class="col-form-label">IdNumber:</form:label>
                    <p id="message3"></p>
                    <form:errors path="idNumber" cssClass="text-danger"/>
                    <form:input type="username" path="idNumber" id="idNumber" class="form-control" required="required"/>
                </p>
                <p>
                    <form:label path="password" class="col-form-label">Password:</form:label>
                    <p id="message"></p>
                    <form:password path="password" id="password" class="form-control" required="required"/>
                </p>
                <p>
                    <form:label path="passwordConfirmation" class="col-form-label">Password Confirmation:</form:label>
                    <p id="message1"></p>
                    <form:password path="passwordConfirmation" id="confirm_password" class="form-control" required="required"/>
                </p>
                <input type="submit" value="Register!" class="btn btn-success"/>
            </form:form>
        </div>
        <div>
            <c:if test="${logoutMessage != null}">
                <c:out value="${logoutMessage}"/>
            </c:if>
            <h1>Login</h1>
            <c:if test="${errorMessage != null}">
                <c:out value="${errorMessage}"/>
            </c:if>
            <form method="post" action="/login">
                <p>
                    <label for="username" class="col-form-label">Email</label>
                    <input type="email" id="username" name="username" class="form-control"/>
                </p>
                <p>
                    <label for="password" class="col-form-label">Password</label>
                    <input type="password" id="password" name="password" class="form-control"/>
                </p>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="submit" value="Login!" class="btn btn-primary"/>
            </form>
        </div>
    </main>
</body>
</html>
