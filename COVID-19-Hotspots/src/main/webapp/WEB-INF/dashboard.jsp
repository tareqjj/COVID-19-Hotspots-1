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
    <link href="carousel.css" rel="stylesheet">
    <title>Dashboard</title>
</head>
<body>
    <header>
        <nav class="navbar navbar-light bg-light form-inline" style="margin-left: 10px;">
            <h1>Welcome <c:out value="${loggedUser.firstName}"/>!</h1>
            <span>
                <form  id="homePage" method="POST" action="/home">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input class="btn btn-outline-success my-2 my-sm-0" style= "background-color: #5a5a5a; color:white;" type="submit" value="Home" />
                </form>
                <form  id="logoutForm" method="POST" action="/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input class="btn btn-outline-success my-2 my-sm-0" style= "background-color: #5a5a5a; color:white; margin-right: 10px" type="submit" value="Logout!" />
                </form>
            </span>
        </nav>
    </header>
    <main style="margin:10px 39%; height: 80%;">
        <h2>User Information</h2>
        <p>First Name: <c:out value="${loggedUser.firstName}"/></p>
        <p>Last Name: <c:out value="${loggedUser.lastName}"/></p>
        <p>Email: <c:out value="${loggedUser.username}"/></p>
        <p>Sign Up Date: <c:out value="${loggedUser.createdAt}"/></p>
        <p>Last Sign In: <c:out value="${loggedUser.lastSignIn}"/></p>
        <h2>Test Information</h2>
        <p>Test Date: <c:out value="${loggedUser.record.tests.get(0).createdAt}"/></p>
        <p>Test Status: <c:out value="${loggedUser.record.tests.get(0).status}"/></p>
        <p>Test Result: <c:out value="${loggedUser.record.tests.get(0).result}"/></p>
    </main>
    <footer class="container">
        <p class="float-end"><a href="#">Back to top</a></p>
        <p>&copy; 2017-2020 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
