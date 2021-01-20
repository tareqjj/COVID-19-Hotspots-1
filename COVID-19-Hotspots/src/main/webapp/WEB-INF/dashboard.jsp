<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/19/2021
  Time: 12:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Dashboard</title>
</head>
<body>
    <header>
        <h1>Welcome <c:out value="${loggedUser.firstName}"/>!</h1>
        <form id="logoutForm" method="POST" action="/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" value="Logout!" />
        </form>
    </header>
    <main>
        <p>First Name: <c:out value="${loggedUser.firstName}"/></p>
        <p>Last Name: <c:out value="${loggedUser.lastName}"/></p>
        <p>Email: <c:out value="${loggedUser.username}"/></p>
        <p>Sign Up Date: <c:out value="${loggedUser.createdAt}"/></p>
        <p>Last Sign In: <c:out value="${loggedUser.lastSignIn}"/></p>
    </main>
</body>
</html>
