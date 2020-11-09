<%--
Created by IntelliJ IDEA.
User: xxtyo
Date: 11/5/2020
Time: 4:00 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Skateshop</title>
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
<center>
    <h1>Welcome to Skateshop - Web Application</h1>
    <form action="/decks">
        <input type="submit" value="Admin Page">
    </form>
    <form action="/home">
        <input type="submit" value="Home">
    </form>
</center>
<div id="main">
    <div id="head">
        <div class="navbar">
            <a target="_blank" href="https://github.com/theanh111">
                <img src="images/logo.png" height="100" width="100"/>
            </a>
            <a target="_blank" href="https://github.com/theanh111">Home</a>
            <a target="_blank" href="https://github.com/theanh111">Skateboard</a>
            <a target="_blank" href="https://github.com/theanh111">Truck</a>
            <a target="_blank" href="https://github.com/theanh111">About</a>
            <form>
                <input type="text" placeholder="Example: NOMAD Black">
                <input type="submit" value="Search">
            </form>
        </div>
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
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
    }

    .navbar a:hover {
        background-color: white;
        color: #333333;
    }

    body {
        margin: 0 auto;
        font-family: Arial, Tahoma;
    }
</style>
</html>
