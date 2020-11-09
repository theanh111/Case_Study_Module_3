<%--
  Created by IntelliJ IDEA.
  User: xxtyo
  Date: 11/9/2020
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
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
<div id="main">
    <div id="head">
        <div class="navbar">
            <div>
                <h1>SKATESHOP</h1>
            </div>
            <div class="">
                <a href="/home">
                    <img src="images/logo.png" height="50" width="50"/>
                </a>
            </div>
            <div>
                <form>
                    <input type="hidden" name="action" value="searchDeckByName">
                    <input type="text" name="searchDeckByName" id="searchDeckByName" placeholder="Deck Name..." style="width: 250px; height: 30px">
                    <input type="submit" class="btn btn-success" value="Search">
                </form>
            </div>
            <div>
                <form action="">
                    <input type="submit" class="btn btn-success" value="Login">
                    <input type="submit" class="btn btn-success" value="Sign Up">
                </form>
            </div>
        </div>
    </div>
</div>
<%--<div id="menu">--%>
<%--    <div style="left: 50px">--%>
<%--        <ul>--%>
<%--            <li><a href="#">Sem 1</a>--%>
<%--                <ul>--%>
<%--                    <li><a target="_blank" href="https://www.coursera.org/specializations/computer-fundamentals">Computing--%>
<%--                        Fundametal</a></li>--%>
<%--                    <li><a target="_blank" href="https://en.wikipedia.org/wiki/C_(programming_language)">C--%>
<%--                        Programming</a></li>--%>
<%--                    <li><a target="_blank" href="https://www.wikihow.com/Build-a-Dynamic-Website">Building Dynamic--%>
<%--                        Website</a></li>--%>
<%--                    <li><a target="_blank"--%>
<%--                           href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html">M5--%>
<%--                        Transact-SQL</a></li>--%>
<%--                    <li><a target="_blank"--%>
<%--                           href="https://dictionary.cambridge.org/vi/dictionary/english/project">Project</a></li>--%>
<%--                </ul>--%>
<%--            </li>--%>
<%--            <li><a href="#">Sem 2</a>--%>
<%--                <ul>--%>
<%--                    <li><a href="#">Cloud Computing</a></li>--%>
<%--                    <li><a href="#">APJ - I</a></li>--%>
<%--                    <li><a href="#">APJ - II</a></li>--%>
<%--                    <li><a href="#">APJ - III</a></li>--%>
<%--                    <li><a href="#">eProject</a></li>--%>
<%--                </ul>--%>
<%--            </li>--%>
<%--            <li><a href="#">Sem 3</a></li>--%>
<%--            <li><a href="#">Sem 4</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="container" id="content">
    <p style="margin-top: 50px">SKATESHOP <i style="color: blue">Skateshop</i></p>
    <hr>
    <div class="row">
        <c:forEach items="${decks}" var="deck">
            <div class="col-md-6 col-lg-4" style="margin-bottom: 0px; border: 1px solid black; border-radius: 10px">
                <div class="single_service">
                    <div class="thumb">
                        <div><img src="${deck.getDeckImage()}" style="height: 100px"></div>
                    </div>
                    <div class="service_infor">
                        <p>Name: <a href="/decks?action=view&deckId=${deck.getDeckId()}">${deck.getDeckName()}</a>
                        </p>
                        <p>Price: ${deck.getDeckPrice()}</p>
                        <p>Size ${deck.getDeckSize()}</p>
                        <div class="row">
                            <div class="col">
                                <button type="button" class="btn btn-outline-secondary" data-toggle="modal"
                                        data-target="#exampleModalUpdate${deck.getDeckId()}">Quick View
                                </button>
                                <div class="modal fade" id="exampleModalUpdate${deck.getDeckId()}" tabindex="-1"
                                     role="dialog"
                                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="container">
                                                    <h2>Login For More Information</h2>
                                                    <form method="post" action="/login">
                                                        <label>Username</label>
                                                        <input type="text" class="form-control" name="userName"
                                                               placeholder="account">
                                                        <label>Password</label>
                                                        <input type="password" class="form-control" name="password"
                                                               placeholder="passwords">
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Sign In
                                                            </button>
                                                            <a href="/customers?action=signUp"
                                                               class="btn btn-success">Sign Up</a>
                                                        </div>
                                                        <button type="button" class="btn btn-secondary"
                                                                data-dismiss="modal">Close
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Close
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
</body>
<style>
    .navbar {
        background-color: #333;
        top: 0;
    }

    .navbar a {
        float: left;
        display: block;
        color: #F2F2F2;
        text-align: center;
        padding: 8px 10px;
        text-decoration: none;
        font-size: 17px;
    }

    .navbar a:hover {
        background-color: white;
        color: #333333;
    }

    body {
        font-family: Arial, Tahoma;
    }

    h1 {
        color: white;
    }

    #menu {
        height: 50px;
        padding: 0;
        margin: 0;
        background-color: #000000;
        border: 1px solid #CDCDCD;
    }

    #menu ul, #menu li {
        padding: 0;
        margin: 0;
    }

    #menu li {
        position: relative;
        float: left;
        list-style: none;
        margin: 0;
        padding: 0;
    }

    #menu li a {
        width: 100px;
        height: 30px;
        display: block;
        text-decoration: none;
        text-align: center;
        line-height: 30px;
        background-color: black;
        color: white;
    }

    #menu ul ul li a {
        width: 200px;
        text-align: left;
        padding-left: 10px;
    }

    #menu li a:hover {
        background-color: red;
    }

    #menu ul ul {
        position: absolute;
        top: 30px;
        left: 15px;
        visibility: hidden;
    }

    #menu ul li:hover ul {
        visibility: visible;
    }
</style>
</html>
