<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>Test Page</title>
<%--    <table class="table table-striped">--%>
</head>
<body>
<header>
    <nav class="navbar navbar-light bg-light form-inline" style="margin-left: 10px;">
        <form  id="testerPage" method="get" action="/tester">
            <input class="btn btn-outline-success my-2 my-sm-0" style= "background-color: #5a5a5a; color:white;" type="submit" value="Tester Dashboard" />
        </form>
        <form  id="logoutForm" method="POST" action="/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input class="btn btn-outline-success my-2 my-sm-0" style= "background-color: #5a5a5a; color:white; margin-right: 10px" type="submit" value="Logout!" />
        </form>
    </nav>
</header>
    <main style="height: 80%;">
        <table class="table">
            <thead class="thead-light">
            <tr style="background-color: #5a5a5a;">
                <th style= "color:white;">Sample No</th>
                <th style= "color:white;">Test Status</th>
                <th style= "color:white;">Result</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><c:out value="${test.sample}"/></td>
                <td><c:out value="${test.status}"/></td>
                <td><c:out value="${test.result}"/></td>
            </tr>
            </tbody>
        </table>
        <form action="/tester/test/result/${test.sample}" method="get">
            <div class="input-group" style="margin-left: 10px;">
                <label for="testResult" class="col-form-label" style="padding-right: 10px;"><b>Test Result</b></label>
                <select class="custom-select" id="testResult" name="testResult" aria-label="Example select with button addon">
                    <option value="negative">Negative</option>
                    <option value="positive">Positive</option>
                </select>
                <div class="input-group-append">
                    <button class="btn btn-outline-success my-2 my-sm-0" style= "background-color: #5a5a5a; color:white;" type="submit">Submit</button>
                    <br>
                </div>
            </div>
        </form>
    </main>
    <hr class="featurette-divider">

    <footer class="container">
        <p class="float-end"><a href="#">Back to top</a></p>
        <p>&copy; 2017-2020 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>

    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</body>
</html>
