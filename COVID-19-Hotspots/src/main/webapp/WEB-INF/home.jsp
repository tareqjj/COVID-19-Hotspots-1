
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>Palestinian Health Ministry</title>




    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOKLvcXGg9zCD2zSR6gjqsszAc1l017Tc&callback=initMap&libraries=visualization&v=weekly" defer></script>
    <!-- jsFiddle will insert css and js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        #map {
            height: 100%;
        }

        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
</head>
<body>
<%--<script>--%>
<%--    const url = 'https://www.corona.ps/API/summary';--%>
<%--    async function getData() {--%>
<%--        const response = await fetch(url);--%>
<%--        const data = await response.json();--%>
<%--        const {TotalCases, TotalRecovery, TotalActiveCases, TotalDeath, TotalCriticalCases, TotalTestedSamples}--%>
<%--        document.getElementById('cases').textContent = TotalCases;--%>
<%--        document.getElementById('recovery').textContent = TotalRecovery;--%>
<%--        document.getElementById('active').textContent = TotalActiveCases;--%>
<%--        document.getElementById('death').textContent = TotalDeath;--%>
<%--        document.getElementById('critical').textContent = TotalCriticalCases;--%>
<%--        document.getElementById('samples').textContent = TotalTestedSamples;--%>
<%--    }--%>
<%--    getData();--%>
<%--</script>--%>

<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Covid-19 Real Time Map</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
<%--            <div class="collapse navbar-collapse " id="navbarCollapse">--%>
                <ul class="navbar-nav me-auto mb-2 mb-md-0 d-flex">
                    <li class="nav-item active">
                        <a class="nav-link" aria-current="page" href="/home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/auth">Login/Register</a>
                    </li>
                </ul>
<%--                <form class="d-flex">--%>
<%--                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--                    <button class="btn btn-outline-success" type="submit">Search</button>--%>
<%--                </form>--%>
<%--            </div>--%>
        </div>
    </nav>
</header>

<main>

    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div id="map"></div>
                <script>
                    let map, heatmap;
                    function initMap() {
                        const myLatLng = { lat: 31.90493919635812, lng: 35.20443782875959  };
                        const map = new google.maps.Map(document.getElementById("map"), {
                            zoom: 9,
                            center: myLatLng,
                        });
                        <c:forEach items="${tests}" var="test">
                        <c:forEach items="${test.locations}" var="locat">
                        const x${locat.id} = { lat: ${locat.lang}, lng: ${locat.lat} };
                        new google.maps.Marker({
                            position: x${locat.id},
                            map,
                            title: "Hello World!",
                        });
                        </c:forEach>
                        </c:forEach>
                    }
                </script>
            </div>
        </div>
    </div>


    <!-- Marketing messaging and features
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
            <div class="col-lg-4">
                <img class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder:" preserveAspectRatio="xMidYMid slice" focusable="false" src="/img/vaccine.jpg"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/></img>

                <h2>Covid-19 Vaccine</h2>
                <p>The world is in the midst of a COVID-19 pandemic. As WHO and partners work together on the response -- tracking the pandemic, advising on critical interventions, distributing vital medical supplies to those in need--- they are racing to develop and deploy safe and effective vaccines.</p>
                <p><a class="btn btn-secondary" href="https://www.who.int/emergencies/diseases/novel-coronavirus-2019/covid-19-vaccines" role="button" target="_blank">View details &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false" src="/img/novel.jpg"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/></img>

                <h2>Novel Coronavirus</h2>
                <p>Welcome to Elsevier's Novel Coronavirus Information Center. Here you will find expert, curated information for the research and health community on SARS-CoV-2 (the novel coronavirus) and COVID-19 (the disease).
                    All resources are free to access and include guidelines for clinicians and patients.</p>
                <p><a class="btn btn-secondary" href="https://www.elsevier.com/novel-coronavirus-covid-19" role="button" target="_blank">View details &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false" src="/img/travel.jpg"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/></img>

                <h2>Travel Restrictions </h2>
                <p> The information is correct to the best of IATA's knowledge at the time of publication and is being reviewed and updated on an ongoing basis by IATA staff, given the rapidly evolving nature of the international response to the COVID-19 outbreak IATA cannot guarantee its accuracy.</p>
                <p><a class="btn btn-secondary" href="https://www.iatatravelcentre.com/world.php" role="button" target="_blank">View details &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->


        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Palestine's number of cases</span></h2>
            </div>
            <div class="col-md-5">
                <table class="table">
                    <thead class="thead-light">
                    <tr style="background-color: #5a5a5a;">
                        <th scope="col">#</th>
                        <th scope="col"> Cases Status </th>
                        <th scope="col">Number of Cases</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Total Cases</td>
                        <td>Otto</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td ><span id="cases"></span></td>
                        <td>Thornton</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry</td>
                        <td>the Bird</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">Live Stream World Wide Covid-19 Cases Number</h2>
            </div>
            <div class="col-md-5 order-md-1">
                <iframe width="500" height="283" src="https://www.youtube.com/embed/NMre6IAAAiU?autoplay=1" frameborder="0" allow="accelerometer;  clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">News Feed </h2>
                <p class="lead">All the news you want to know about Covid-19 pandemic around the world.</p>
            </div>
            <div class="col-md-5">
                <!-- start feedwind code --> <script type="text/javascript" src="https://feed.mikle.com/js/fw-loader.js" preloader-text="Loading..." data-fw-param="141722/"></script> <!-- end feedwind code -->
            </div>
        </div>

        <hr class="featurette-divider">

        <!-- /END THE FEATURETTES -->

    </div><!-- /.container -->


    <!-- FOOTER -->
    <footer class="container">
        <p class="float-end"><a href="#">Back to top</a></p>
        <p>&copy; 2017-2020 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>
</main>

</body>
</html>