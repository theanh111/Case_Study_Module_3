<%--
Created by IntelliJ IDEA.
User: xxtyo
Date: 11/1/2020
Time: 10:54 PM
To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;c   harset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
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
    <h1>Decks</h1>
    <p>
        <a href="/decks?action=addNewDeck" class="btn btn-success">Add New Deck</a>
        <a href="/decks?action=addNewType" class="btn btn-success">Add New Type</a>
        <a href="/decks?action=addNewBrand" class="btn btn-success">Add New Brand</a>
        <br>
        <br>
        <a href="/decks?action=showListType" class="btn btn-success">Show List Type</a>
        <a href="/decks?action=showListBrand" class="btn btn-success">Show List Brand</a>
    </p>
    <hr>
    <table border="1" cellpadding="10px">
        <tr>
            <th>Deck ID</th>
            <th>Deck Name</th>
            <th>Deck Price</th>
            <th>Deck Size</th>
            <th>Type Id</th>
            <th>Brand Id</th>
            <th>Deck Description</th>
            <th>Deck Image</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${decks}" var="deck">
            <tr>
                <td>${deck.getDeckId()}</td>
                <td><a href="/decks?action=view&deckId=${deck.getDeckId()}">${deck.getDeckName()}</a></td>
                <td>${deck.getDeckPrice()}</td>
                <td>${deck.getDeckSize()}</td>
                <td>${deck.getTypeId().typeName}</td>
                <td>${deck.getBrandId().brandName}</td>
                <td>${deck.getDeckDescription()}</td>
                <td><img src="${deck.getDeckImage()}" alt="Deck Image Preview" width="100px" height="100px"></td>
                <th><a href="/decks?action=editDeck&deckId=${deck.getDeckId()}" class="btn btn-secondary">EDIT</a></th>
                <th><a href="/decks?action=deleteDeck&deckId=${deck.getDeckId()}" class="btn btn-danger">DELETE</a></th>
            </tr>
        </c:forEach>
    </table>
</center>
</body>
</html>
