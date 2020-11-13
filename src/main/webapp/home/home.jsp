<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <nav class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="/home">
            <img src="images/logo.png" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
            SKATESHOP
        </a>
    </nav>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/home">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
            </li>
        </ul>
        <div>
            <c:if test='${message != null}'>
                <span class="message">Welcome, ${message}</span>
            </c:if>
        </div>
        <form autocomplete="off" class="form-inline my-2 my-lg-0">
            <input type="hidden" name="action" value="searchDeckByName">
            <input class="form-control mr-sm-2" type="text" placeholder="Search..." aria-label="Search"
                   name="searchDeckByName" id="searchDeckByName">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

        <a href="/customers?action=login" class="btn btn-success">Login</a>
        <a href="/customers?action=register" class="btn btn-success">Register</a>


        <%--        <div>--%>
        <%--            <div class="modal fade" id="loginModal" tabindex="-1"--%>
        <%--                 role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
        <%--                <div class="modal-dialog modal-dialog-centered" role="document">--%>
        <%--                    <div class="modal-content">--%>
        <%--                        <div class="modal-header">--%>
        <%--                            <div class="container">--%>
        <%--                                <form action="/home?action=login" method="post">--%>
        <%--                                    <h1 style="color: black;">Login</h1>--%>
        <%--                                    <hr>--%>
        <%--                                    <table>--%>
        <%--                                        <tr>--%>
        <%--                                            <th>Username: </th>--%>
        <%--                                            <td>--%>
        <%--                                                <input type="text" name="username" id="username">--%>
        <%--                                            </td>--%>
        <%--                                        </tr>--%>

        <%--                                        <tr>--%>
        <%--                                            <th>Password: </th>--%>
        <%--                                            <td>--%>
        <%--                                                <input type="password" name="password" id="password">--%>
        <%--                                            </td>--%>
        <%--                                        </tr>--%>
        <%--                                    </table>--%>
        <%--                                    <input type="submit" value="Login" class="btn btn-success">--%>
        <%--                                </form>--%>
        <%--                                <a id="registerButton" href="/customers?action=register" class="btn btn-success">Register</a>--%>
        <%--                                <div class="modal-footer">--%>
        <%--                                </div>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                        <div class="modal-footer">--%>
        <%--                            <button type="button" class="btn btn-outline-danger"--%>
        <%--                                    data-dismiss="modal">CLOSE--%>
        <%--                            </button>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>
    </div>
    </div>
</nav>

<div>
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="images/banner-header1.jpg" alt="First slide" style="width: 50% ; height: 650px">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="images/banner-header2.jpg" alt="Second slide"
                     style="width: 50% ; height: 650px">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="images/banner-header3.jpg" alt="Third slide" style="width: 50%; height: 650px">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

<div class="container" id="content">
    <p style="margin-top: 50px">Decks <i style="color: blue">(${decks.size()} items)</i></p>
    <div>
        <div class="dropdown">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Sort By
                <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li><a href="/home?action=SizeLowToHigh">Size Low - High</a></li>
                <li><a href="/home?action=SizeHighToLow">Size High - Low</a></li>
                <li><a href="/home?action=PriceLowToHigh">Price Low - High</a></li>
                <li><a href="/home?action=PriceHighToLow">Price High - Low</a></li>
            </ul>
        </div>
    </div>

    <hr>
    <div class="row">
        <c:forEach items="${decks}" var="deck">
            <div class="col-md-6 col-lg-4">
                <div class="single_service">
                    <div class="thumb">
                        <div><img src="${deck.getDeckImage()}" style="height: 220px; width: 200px"></div>
                    </div>
                    <div class="service_infor">
                        <p>Name: <b>${deck.getDeckName()}</b></p>
                        <p>Price: <b>${deck.getDeckPrice()}</b></p>
                        <p>Size: <b>${deck.getDeckSize()}</b></p>
                        <div class="row">
                            <div class="col">
                                <button type="button" class="btn btn-outline-secondary" data-toggle="modal"
                                        data-target="#exampleModalUpdate${deck.getDeckId()}">Quick View
                                </button>
                                <hr>
                                <div class="modal fade" id="exampleModalUpdate${deck.getDeckId()}" tabindex="-1"
                                     role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="container">
                                                    <h2>${deck.getDeckName()}</h2>
                                                    <img src="${deck.getDeckImage()}" height="300px" width="300px">
                                                    <h3>- Price: ${deck.getDeckPrice()}</h3>
                                                    <h3>- Size: ${deck.getDeckSize()}</h3>
                                                    <p>- Description: ${deck.getDeckDescription()}</p>
                                                    <div class="modal-footer">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">CLOSE
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div class="footer">
    <footer class="page-footer font-small special-color-dark pt-4">
        <div class="container">

            <ul class="list-unstyled list-inline text-center">
                <li class="list-inline-item">
                    <a class="btn-floating btn-fb mx-1">
                        <img src="images/icon.jpg" width="40px" height="40px">
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-tw mx-1">
                        <img src="images/icon2.jpg" width="40px" height="40px">
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-gplus mx-1">
                        <img src="images/icon.jpg" width="40px" height="40px">
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-li mx-1">
                        <img src="images/icon2.jpg" width="40px" height="40px">
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-dribbble mx-1">
                        <img src="images/icon.jpg" width="40px" height="40px">
                    </a>
                </li>
            </ul>
        </div>
        <div class="footer-copyright text-center py-3">© 2020 Copyright:
            <a class="nav-link" href="https://github.com/theanh111"> Trần Thế Anh - C0720I1 </a>
        </div>

    </footer>
</div>

</body>
<style>
    input[type=text] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type=submit]:hover {
        background-color: #45a049;
    }

    .footer {
        background-color: black;
    }

    footer {
        background-color: black;
    }

    hr {
        border: 0;
        height: 1px;
        background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
    }
</style>
</html>
