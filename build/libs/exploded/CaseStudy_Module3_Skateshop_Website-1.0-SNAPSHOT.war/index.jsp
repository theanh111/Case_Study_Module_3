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
<div class="background">
    <div class="caption">
        <h1>WELCOME TO <span style="color: #32CD32">SKATESHOP</span></h1>
        <h5>Skateshop For <span style="color: #32CD32;"> Skateboarders!</span></h5>
    </div>
    <div align="center">
        <form action="/home">
            <input class="button" type="submit" value="Let's Start!">
        </form>
    </div>
    <div class="copyright"><p>Tran The Anh C0720I1 - 2020 ©</p></div>
</div>
</body>
<style>
    body, html {
        height: 100%;
        margin: 0;
        font-weight: bold;
        font-family: Arial, Helvetica, sans-serif;
    }

    .button {
        background-color:#44c767;
        border-radius:28px;
        border:1px solid #18ab29;
        display:inline-block;
        cursor:pointer;
        color:#ffffff;
        font-family:Arial;
        font-size:17px;
        padding:16px 31px;
        text-decoration:none;
        text-shadow:0px 1px 0px #2f6627;
    }
    .button:hover {
        background-color:#5cbf2a;
    }
    .button:active {
        position:relative;
        top:1px;
    }

    .background {
        background-image: url("images/background.jpg");
        height: 100%;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        padding: 0;
        display: grid;
        max-width: 100%;
        max-height: 100vh;
        margin: auto;
    }

    .caption {
        border: 5px #FFFFFF;
        height: 1px;
        text-align: center;
        font-size: xx-large;
        margin-left: auto;
        margin-right: auto;
        color: #FFFFFF;
        padding-top: 150px;
        line-height: 20px;
    }

    .copyright {
        color: #FFFFFF;
        margin-top: auto;
        margin-left: auto;
        margin-right: auto;
    }
</style>
</html>


