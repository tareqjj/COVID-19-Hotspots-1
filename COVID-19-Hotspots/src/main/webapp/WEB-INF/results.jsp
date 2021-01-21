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
    <title>Results</title>
</head>
<body>
<h1>Welcome, <c:out value="${loggedUser.firstName}"/> <c:out value="${loggedUser.lastName}"/></h1>
    <p><c:out value="${error}"/></p>
    <form action="/tester/search" method="get">
        <label for="sample_id" class="col-form-label">Sample ID</label>
        <input type="number" id="sample_id" name="sample_id">
        <input type="submit" value="Search">
    </form>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>Sample ID</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${allPendingTests}" var="test">
            <tr>
                <td><c:out value="${test.record.first_name}"/> <c:out value="${test.record.last_name}"/></td>
                <td><a href="/tester/test/${test.sample}"><c:out value="${test.sample}"/></a></td>
                <td><c:out value="${test.status}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
