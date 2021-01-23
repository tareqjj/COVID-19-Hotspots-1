<%--
  Created by IntelliJ IDEA.
  User: Diaa
  Date: 1/21/2021
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Heatmaps</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOKLvcXGg9zCD2zSR6gjqsszAc1l017Tc&callback=initMap&libraries=visualization&v=weekly" defer></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        #map {
            height: 100%;
        }

        /* Optional: Makes the sample page fill the window. */
        html,
        body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #floating-panel {
            position: absolute;
            bottom: 20%;
            /*top: 100px;*/
            /*left: 0px;*/
            /*z-index: 5;*/
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
            text-align: center;
            font-family: "Roboto", "sans-serif";
            line-height: 30px;
            padding-left: 10px;
        }

        #floating-panel {
            background-color: #fff;
            border: 1px solid #999;
            left: 25%;
            padding: 5px;
            position: absolute;
            bottom: 20%;
            z-index: 5;
        }
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-light bg-light form-inline" style="margin-left: 10px;">
        <form  id="testerPage" method="get" action="/agent">
            <input class="btn btn-outline-success my-2 my-sm-0" style= "background-color: #5a5a5a; color:white;" type="submit" value="Agent Dashboard" />
        </form>
        <form  id="logoutForm" method="POST" action="/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input class="btn btn-outline-success my-2 my-sm-0" style= "background-color: #5a5a5a; color:white; margin-right: 10px" type="submit" value="Logout!" />
        </form>
    </nav>
</header>
<main style="height: 80%; padding-left:10px">
    <div>
        <table class="table">
            <thead class="thead-light">
            <tr style="background-color: #5a5a5a;">
                <th style= "color:white;">Full Name</th>
                <th style= "color:white;">address</th>
                <th style= "color:white;">Date</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><c:out value="${test.record.first_name} ${test.record.last_name}"/></td>
                <td><c:out value="${test.record.address2} // ${test.record.address1}"/></td>
                <td><c:out value="${test.createdAt}"/></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div >
        <form:form action="/agent/tests/${test.id}/submit" modelAttribute="test">
            <form:label path="sample">Sample Number:</form:label>
            <form:errors path="sample"/>
            <form:input path="sample" type="number"/>
            <input type="submit" value="Submit!"/>
        </form:form>
        <form action="/agent/tests/${test.id}/reject" method="get">
            <div class="input-group" style="margin-left: 10px;">
                <button class="btn btn-danger"  type="submit">Reject</button>
            </div>
        </form>
    </div>
    <div id="map"></div>
</main>
<script>
    let map, heatmap;
    function initMap() {
        const myLatLng = { lat: ${test.locations[0].lang}, lng: ${test.locations[0].lat} };
        const map = new google.maps.Map(document.getElementById("map"), {
            zoom: 9,
            center: myLatLng,
        });
        <c:forEach items="${test.locations}" var="locat">
        const x${locat.id} = { lat: ${locat.lang}, lng: ${locat.lat} };
        new google.maps.Marker({
            position: x${locat.id},
            map,
            title: "Hello World!",
        });
        </c:forEach>
    }
</script>
