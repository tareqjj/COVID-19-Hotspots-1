<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/18/2021
  Time: 9:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Welcome Page</title>
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
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Action / Status</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allUsers}" var="user">
                <tr>
                    <td><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></td>
                    <td><c:out value="${user.username}"/></td>
                    <c:choose>
                        <c:when test="${user.roleFlag}">
                            <td>admin</td>
                        </c:when>
                        <c:otherwise>
                            <td><a href="/destroy/${user.id}">delete</a> <a href="/makeAdmin/${user.id}">make admin</a></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </main>
</body>
</html>
