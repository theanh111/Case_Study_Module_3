<%--
  Created by IntelliJ IDEA.
  User: xxtyo
  Date: 11/8/2020
  Time: 12:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add</title>
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
    <h1>Add new deck</h1>
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <p>
        <a href="/decks" class="btn btn-primary">Back To Deck List</a>
    </p>
    <form method="post">
            <p>Deck Information</p>
            <table>
                <tr>
                    <th>Deck Name:</th>
                    <td><input type="text" name="deckName" id="deckName"></td>
                </tr>

                <tr>
                    <th>Deck Price:</th>
                    <td><input type="number" step="any" name="deckPrice" id="deckPrice"></td>
                </tr>

                <tr>
                    <th>Deck Size:</th>
                    <td>
                        <select name="">
                            <option value="">7.5</option>
                            <option value="">7.75</option>
                            <option value="">8.0</option>
                            <option value="">8.25</option>
                            <option value="">8.5</option>
                            <option value="">8.75</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>
                    <th>Deck Type:</th>
                    <select name="">
                        <option value="">Regular</option>
                        <option value="">Penny</option>
                        <option value="">Cruiser</option>
                        <option value="">Longboard</option>
                    </select>
                    </td>
                </tr>

                <tr>
                    <th>Deck Brand:</th>
                    <td>
                        <select name="">
                            <option value="">Promade</option>
                            <option value="">LBSkateshop</option>
                            <option value="">Primitive</option>
                            <option value="">Baker</option>
                            <option value="">DGK</option>
                            <option value="">The Crime</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <th>Deck Description:</th>
                    <td><input type="text" name="deckDesc" id="deckDesc"></td>
                </tr>

                <tr>
                    <th>Deck Image:</th>
                    <td>
                        <input type="text" name="deckImage" id="deckImage"
                               oninput="document.getElementById('output').src = window.URL.createObjectURL(this.files[0])">
                    </td>
                </tr>

                <tr>
                    <td>Preview Image</td>
                    <td>
                        <img src="images/preview-icon.jpg" id="output" src="" width="100" height="100">
                    </td>

                </tr>
            </table>
        <input type="submit" value="Add Deck" class="btn btn-success">
    </form>
</center>

</body>
</html>
