<%--
  Created by IntelliJ IDEA.
  User: xxtyo
  Date: 11/1/2020
  Time: 10:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Brand Mangement</title>
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
    <div id="main">
        <div id="head">
            <div class="navbar">
                <h1>Brands List</h1>
                <a target="_blank" href="/decks">
                    <img src="images/logo.png" height="50" width="50"/>
                </a>
                <a href="/decks?action=addNewDeck" class="btn btn-success">Add New Deck</a>
                <a href="/types?action=addNewType" class="btn btn-success">Add New Type</a>
                <a href="/brands?action=addNewBrand" class="btn btn-success">Add New Brand</a>
                <a href="/types?action=showListType" class="btn btn-success">Show List Type</a>
                <a href="/brands?action=showListBrand" class="btn btn-success">Show List Brand</a>
                <form>
                    <input type="hidden" name="action" value="searchBrandByName">
                    <input type="text" name="searchBrandByName" id="searchBrandByName" placeholder="Brand Name...">
                    <input type="submit" class="btn btn-success" value="Search">
                </form>
            </div>
        </div>
        <p>
            <a href="/decks" class="btn btn-primary">Back To Deck List</a>
        </p>
        <h2>Brands List</h2>
        <table border="1" cellpadding="10px" width="95%">
            <tr>
                <th>Brand ID</th>
                <th>Brand Name</th>
                <th>Brand Address</th>
                <th colspan="2">Action</th>
            </tr>
            <c:forEach items="${brands}" var="brand">
                <tr>
                    <td>${brand.getBrandId()}</td>
                    <td>${brand.getBrandName()}</td>
                    <td>${brand.getBrandAddress()}</td>
                    <th><a href="/brands?action=editBrand&brandId=${brand.getBrandId()}"
                           class="btn btn-secondary">EDIT</a></th>
                    <th><a href="/brands?action=deleteBrand&brandId=${brand.getBrandId()}"
                           class="btn btn-danger">DELETE</a></th>
                </tr>
            </c:forEach>
        </table>
    </div>
</center>
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
        margin: 0 auto;
        font-family: Arial, Tahoma;
    }

    h1 {
        color: white;
    }
</style>
</html>
