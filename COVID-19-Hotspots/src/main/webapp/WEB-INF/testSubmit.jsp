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
            top: 10px;
            left: 25%;
            z-index: 5;
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
            top: 10px;
            z-index: 5;
        }
    </style>
</head>
<body>
<div id="floating-panel">
    <form:form action="/agent/tests/${test.id}/submit" modelAttribute="test">
        <form:label path="sample">Sample Number:</form:label>
        <form:errors path="sample"/>
        <form:input path="sample" type="number"/>
        <input type="submit" value="Submit!"/>
    </form:form>
</div>
<div id="map"></div>
<script>
    let map, heatmap;
    function initMap() {
        const myLatLng = { lat: ${test.locations[0].lang}, lng: ${test.locations[0].lat} };
        const map = new google.maps.Map(document.getElementById("map"), {
            zoom: 4,
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
