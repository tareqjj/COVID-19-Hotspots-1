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
    <title>Title</title>
</head>
<body>
<div>
    <p><c:out value="${error}"/></p>
    <form action="/agent/search">
        <label>ID Number: <input type="number" name="record_id"></label>
        <button type="submit">Search</button>
    </form>
    <h2>All submitted Tests:</h2>
    <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>status</th>
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
</div>
</body>
</html>
