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
    <title>Add Type</title>
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
    <h1>Add New Type</h1>
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <p>
        <a href="/decks" class="btn btn-primary">Back To Deck List</a>
    </p>
    <form method="post" autocomplete="off">
        <fieldset>
            <legend>Type Information</legend>
            <table border="1" cellpadding="5">
                <tr>
                    <th>Type Id:</th>
                    <td><input type="text" name="typeId" id="typeId"></td>
                </tr>
                <tr>
                    <th>Type Name:</th>
                    <td><input type="text" name="typeName" id="typeName"></td>
                </tr>
                <tr>
                    <th>Type Status:</th>
                    <td><input type="text" name="typeStatus" id="typeStatus"></td>
                </tr>
            </table>
        </fieldset>
        <input type="submit" value="Add Type" class="btn btn-success">
    </form>
</center>
</body>
</html>
