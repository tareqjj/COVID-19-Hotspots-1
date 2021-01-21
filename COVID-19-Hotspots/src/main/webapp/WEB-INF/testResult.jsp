<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Test Page</title>
</head>
<body>
<table class="table table-striped">
    <thead>
    <tr>
        <th>Sample ID</th>
        <th>Test Status</th>
        <th>Result</th>
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
    <label for="testResult" class="col-form-label">Test Result</label>
    <select class="form-select" id="testResult" name="testResult">
        <option value="negative">False</option>
        <option value="positive">True</option>
    </select>
    <input type="submit" value="Submit">
</form>
</body>
</html>
