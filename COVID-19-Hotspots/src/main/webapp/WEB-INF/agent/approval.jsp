<%--
  Created by IntelliJ IDEA.
  User: Diaa
  Date: 1/20/2021
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="carousel.css" rel="stylesheet">
    <title>Approval Page</title>
</head>
<body>
    <header>
        <nav class="navbar navbar-light bg-light form-inline" style="margin-left: 10px;">
            <h1>Welcome <c:out value="${loggedUser.firstName}"/>!</h1>
            <form  id="logoutForm" method="POST" action="/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input class="btn btn-outline-success my-2 my-sm-0" style= "background-color: #5a5a5a; color:white; margin-right: 10px" type="submit" value="Logout!" />
            </form>
        </nav>
    </header>
    <div>
        <p><c:out value="${error}"/></p>
        <form action="/agent/search" class="col-form-label">
            <label style="margin-left: 10px;"><b>ID Number:</b> </label>
                <input type="number" name="record_id" required/>
            <button class="btn btn-outline-success my-2 my-sm-0" style= "background-color: #5a5a5a; color:white;" type="submit">Search</button>
        </form>
        <main style="height: 80%;">
            <h2>All submitted Tests:</h2>
            <table class="table table-striped">
                <thead class="thead-light">
                <tr style="background-color: #5a5a5a;">
                    <th style= "color:white;">Id</th>
                    <th style= "color:white;">First Name</th>
                    <th style= "color:white;">Last Name</th>
                    <th style= "color:white;">Status</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${submitted}" var="test">
                    <tr>
                        <td><a href="/agent/tests/${test.id}"><c:out value="${test.record.id}"/></a></td>
                        <td><c:out value="${test.record.first_name}"/></td>
                        <td><c:out value="${test.record.last_name}"/></td>
                        <td><c:out value="${test.status}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
    <hr class="featurette-divider">
    <footer class="container">
        <p class="float-end"><a href="#">Back to top</a></p>
        <p>&copy; 2017-2020 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
