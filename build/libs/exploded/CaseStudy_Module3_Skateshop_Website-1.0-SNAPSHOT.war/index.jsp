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
        <input type="submit" value="Let's start!">
    </form>
</center>
<div id="main">
    <div id="head">
        <div class="navbar">
            <a target="_blank" href="https://github.com/theanh111">
                <img src="../main/webapp/images/logo.jpg" height="30" width="50"/>
            </a>
            <a target="_blank" href="https://github.com/theanh111">Home</a>
            <a target="_blank" href="https://github.com/theanh111">Skateboard</a>
            <a target="_blank" href="https://github.com/theanh111">Truck</a>
            <a target="_blank" href="https://github.com/theanh111">About</a>
            <form>

            </form>
            <input type="text" placeholder="Example: NOMAD Black">
            <input type="submit" value="Search">
        </div>
    </div>

    <div id="head-link">
        <span>This is Head-link</span>
    </div>
    <div id="s-body">
        <div id="left">
            <span>This is Leftside</span>
        </div>
        <div id="content">
            <h1>Ok test</h1>
        </div>
        <div id="right">
            <span>This is Rightside</span>
        </div>
    </div>

    <div id="footer">
        <span>This is Footer</span>
    </div>
</div>
</body>
<style>

    .navbar {
        background-color: #333;
        top: 0;
    }

    /*.navbar a {*/
    /*    float: left;*/
    /*    display: block;*/
    /*    color: #F2F2F2;*/
    /*    text-align: center;*/
    /*    padding: 14px 16px;*/
    /*    text-decoration: none;*/
    /*    font-size: 17px;*/
    /*}*/

    /*.navbar a:hover {*/
    /*    background-color: white;*/
    /*    color: #333333;*/
    /*}*/

    body {
        margin: 0 auto;
        font-family: Arial, Tahoma;
    }

    span {
        color: blue;
        font-size: larger;
    }

    #s-body {
        float: left;
    }

    #head, #head-link, #s-body, #footer {
        width: 100%;
        margin-bottom: 5px;
        clear: both;
    }

    @media all and (min-width: 1001px) {
        body {
            width: 980px;
            font-size: 14px;
        }

        #head {
            height: 100px;
            background-color: #F5F5F5;
            border: 1px solid #CDCDCD;
        }

        #head-link {
            height: 30px;
            line-height: 30px;
            border: 1px solid #CDCDCD;
            background-color: #F5F5F5;
        }

        #left {
            width: 160px;
            min-height: 400px;
            border: 1px solid #004C00;
            float: left;
            background-color: #004C00;
        }

        #content {
            width: 640px;
            min-height: 400px;
            border: 1px solid #CDCDCD;
            float: left;
            margin-left: 5px;
        }

        #right {
            width: 165px;
            min-height: 400px;
            border: 1px solid orange;
            float: right;
            margin-right: -2px;
            background-color: orange;
        }

        #footer {
            height: 50px;
            clear: both;
            border: 1px solid #000;
            background-color: #000;
        }
    }

    @media screen and (max-width: 1000px) {
        body {
            width: 850px;
            font-size: 13px;
        }

        #head {
            height: 80px;
            background-color: #F5F5F5;
            border: 1px solid #CDCDCD;
        }

        #head-link {
            height: 30px;
            line-height: 30px;
            border: 1px solid #CDCDCD;
            background-color: #F5F5F5;
        }

        #left {
            width: 160px;
            min-height: 300px;
            border: 1px solid #004C00;
            float: left;
            background-color: #004C00;
        }

        #content {
            width: 510px;
            min-height: 300px;
            border: 1px solid #CDCDCD;
            float: left;
            margin-left: 5px;
        }

        #right {
            width: 165px;
            min-height: 300px;
            border: 1px solid orange;
            float: right;
            margin-right: -2px;
            background-color: orange;
        }

        #footer {
            height: 30px;
            clear: both;
            border: 1px solid #000;
            background-color: #000;
        }
    }

    @media screen and (max-width: 750px) {
        body {
            width: 600px;
            font-size: 12px;
        }

        #head {
            height: 60px;
            background-color: #F5F5F5;
            border: 1px solid #CDCDCD;
        }

        #head-link {
            height: 20px;
            line-height: 20px;
            border: 1px solid #CDCDCD;
            background-color: #F5F5F5;
        }

        #left {
            width: 160px;
            min-height: 300px;
            border: 1px solid #004C00;
            float: left;
            background-color: #004C00;
        }

        #content {
            width: 432px;
            min-height: 300px;
            border: 1px solid #CDCDCD;
            float: right;
            margin-right: -2px;
            clear: right;
        }

        #right {
            display: none;
            visibility: hidden;
        }

        #footer {
            height: 30px;
            clear: both;
            border: 1px solid #000;
            background-color: #000;
        }
    }

    @media screen and (max-width: 540px) {
        body {
            width: 450px;
            font-size: 10px;
        }

        #head {
            height: 40px;
            background-color: #F5F5F5;
            border: 1px solid #CDCDCD;
        }

        #head-link {
            height: 30px;
            line-height: 30px;
            border: 1px solid #CDCDCD;
            background-color: #F5F5F5;
        }

        #left {
            width: 160px;
            min-height: 200px;
            border: 1px solid #004C00;
            float: left;
            background-color: #004C00;
        }

        #content {
            width: 282px;
            min-height: 200px;
            border: 1px solid #CDCDCD;
            float: right;
            margin-right: -2px;
            clear: right;
        }

        #right {
            display: none;
            visibility: hidden;
        }

        #footer {
            height: 25px;
            clear: both;
            border: 1px solid #000;
            background-color: #000;
        }
    }

    @media screen and (max-width: 380px) {
        body {
            width: 360px;
            font-size: 10px;
        }

        #head {
            height: 30px;
            background-color: #F5F5F5;
            border: 1px solid #CDCDCD;
        }

        #head-link {
            height: 12px;
            line-height: 12px;
            border: 1px solid #CDCDCD;
            background-color: #F5F5F5;
        }

        #left {
            width: 100%;
            min-height: 40px;
            border: 1px solid #004C00;
            background-color: #004C00;
            clear: both;
            margin-bottom: 5px;
        }

        #content {
            width: 100%;
            min-height: 200px;
            border: 1px solid #CDCDCD;
            float: left;
            margin: 0px;
            clear: both;
        }

        #right {
            display: none;
            visibility: hidden;
        }

        #footer {
            height: 20px;
            clear: both;
            border: 1px solid #000;
            background-color: #000;
        }
    }
</style>
</html>
