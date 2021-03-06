<%--
  Created by IntelliJ IDEA.
  User: Diaa
  Date: 1/20/2021
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/carousel/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="carousel.css" rel="stylesheet">
    <title>Results</title>
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
    <p><c:out value="${error}"/></p>
    <form class="form-inline" action="/tester/search" method="get">
        <label for="sample_id" class="col-form-label"><b>Sample No</b></label>
        <input class="form-control mr-sm-2" style= "width: 25%; display:inline-block;" type="number" placeholder="#" aria-label="Search" id="sample_id" name="sample_id" required>
        <button class="btn btn-outline-success my-2 my-sm-0" style= "background-color: #5a5a5a; color:white;" type="submit">Search</button>
    </form>
    <main style="height: 80%;">
        <table class="table table-striped">
            <thead class="thead-light">
            <tr style="background-color: #5a5a5a;">
                <th style= "color:white;">Name</th>
                <th style= "color:white;">Sample ID</th>
                <th style= "color:white;">Status</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allPendingTests}" var="test">
                <tr>
                    <td ><c:out value="${test.record.first_name}"/> <c:out value="${test.record.last_name}"/></td>
                    <td><a href="/tester/test/${test.sample}"><c:out value="${test.sample}"/></a></td>
                    <td><c:out value="${test.status}"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </main>
    <hr class="featurette-divider">
    <footer class="container">
        <p class="float-end"><a href="#">Back to top</a></p>
        <p>&copy; 2017-2020 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
