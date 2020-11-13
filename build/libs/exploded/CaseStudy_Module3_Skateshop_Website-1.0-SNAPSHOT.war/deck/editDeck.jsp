<%--
  Created by IntelliJ IDEA.
  User: xxtyo
  Date: 11/1/2020
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Deck</title>
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
    <h1>Edit Deck</h1>
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <p>
        <a href="/decks" class="btn btn-primary">Back To Deck List</a>
    </p>
    <form method="post">
        <fieldset>
            <legend>Deck Information</legend>
            <table>
                <tr>
                    <th>Deck ID:</th>
                    <td><input type="text" disabled value="${deck.getDeckId()}">
                    </td>
                </tr>
                <tr>
                    <th>Deck Name:</th>
                    <td><input type="text" name="deckName" id="deckName" value="${deck.getDeckName()}">
                    </td>
                </tr>
                <tr>
                    <th>Deck Price:</th>
                    <td><input type="number" step="any" name="deckPrice" id="deckPrice" value="${deck.getDeckPrice()}">
                    </td>
                </tr>
                <tr>
                    <th>Deck Size:</th>
                    <td>
                        <select name="deckSize">
                            <option value="7.5">7.5</option>
                            <option value="7.75">7.75</option>
                            <option value="8.0">8.0</option>
                            <option value="8.25">8.25</option>
                            <option value="8.5">8.5</option>
                            <option value="8.75">8.75</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <th>Deck Type:</th>
                    <td>
                            <input type="text" name="typeId" id="typeId" value="${deck.getTypeId().typeName}">
                    </td>
                </tr>

                <tr>
                    <th>Deck Brand:</th>
                    <td>
                        <input type="text" name="brandId" id="brandId" value="${deck.getBrandId().brandName}">
                    </td>
                </tr>
                <tr>
                    <th>Deck Description:</th>
                    <td><input type="text" name="deckDesc" id="deckDesc" value="${deck.getDeckDescription()}">
                    </td>
                </tr>
                <tr>
                    <th>Deck Image:</th>
                    <td><input type="text" name="deckImage" id="deckImage" value="${deck.getDeckImage()}">
                    </td>
                </tr>
                <tr>
                    <th>Preview Image:</th>
                    <td>
                        <img src="${deck.getDeckImage()}" alt="Image" width="100px" height="100px">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Update Deck" class="btn btn-success"></td>
                </tr>
            </table>
        </fieldset>
    </form>
</center>
</body>
<style>
    body {
        font-family: Arial;
        font-size: larger;
    }
</style>
</html>
