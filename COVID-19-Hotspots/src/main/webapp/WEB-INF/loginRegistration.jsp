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
    <style>
        main{display: flex; justify-content: space-evenly; margin: 50px}
    </style>
    <title>Login and Registration</title>
</head>
<body>
    <main>
        <div>
            <h1>Register</h1>
            <p><form:errors path="user.*"/></p>
            <form:form method="POST" action="/registration" modelAttribute="user">
                <p>
                    <form:label path="firstName" class="col-form-label">First Name:</form:label>
                    <form:input path="firstName" class="form-control"/>
                </p>
                <p>
                    <form:label path="lastName" class="col-form-label">Last Name:</form:label>
                    <form:input path="lastName" class="form-control"/>
                </p>
                <p>
                    <form:label path="username" class="col-form-label">Email:</form:label>
                    <form:input type="username" path="username" class="form-control"/>
                </p>
                <p>
                    <form:label path="password" class="col-form-label">Password:</form:label>
                    <form:password path="password" class="form-control"/>
                </p>
                <p>
                    <form:label path="passwordConfirmation" class="col-form-label">Password Confirmation:</form:label>
                    <form:password path="passwordConfirmation" class="form-control"/>
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
