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
        <fieldset>
            <legend>Deck Information</legend>
            <table border="1" cellpadding="5">
                <tr>
                    <th>Deck Name:</th>
                    <th>Deck Price:</th>
                    <th>Deck Size:</th>
                    <th>Deck Type:</th>
                    <th>Deck Brand:</th>
                    <th>Deck Description:</th>
                    <th>Deck Image:</th>
                    <td>Preview Image</td>
                </tr>
                <tr>
                    <td><input type="text" name="deckName" id="deckName"></td>
                    <td><input type="number" step="any" name="deckPrice" id="deckPrice"></td>
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

                    <td>
                        <select name="">
                            <option value="">Regular</option>
                            <option value="">Penny</option>
                            <option value="">Cruiser</option>
                            <option value="">Longboard</option>
                        </select>
                    </td>
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
                    <td><input type="text" name="deckDesc" id="deckDesc"></td>
                    <td>
                        <input type="text" name="deckImage" id="deckImage"
                               oninput="document.getElementById('output').src = window.URL.createObjectURL(this.files[0])">
                    </td>
                    <td>
                        <img src="images/preview-icon.jpg" id="output" src="" width="100" height="100">
                    </td>

                </tr>
                <%--                <tr>--%>
                <%--                   --%>
                <%--                 --%>
                <%--&lt;%&ndash;                    <td><input type="number" step="any" name="deckSize" id="deckSize"></td>&ndash;%&gt;--%>
                <%--                </tr>--%>
                <%--                <tr>--%>
                <%--               --%>
                <%--&lt;%&ndash;                    <td>&ndash;%&gt;--%>
                <%--&lt;%&ndash;                        <input type="text" name="typeId" id="typeId" placeholder="Type ID">&ndash;%&gt;--%>
                <%--&lt;%&ndash;                    </td>&ndash;%&gt;--%>
                <%--                </tr>--%>
                <%--                <tr>--%>
                <%--                   --%>
                <%--                --%>
                <%--&lt;%&ndash;                    <td>&ndash;%&gt;--%>
                <%--&lt;%&ndash;                        <input type="text" name="brandId" id="brandId">&ndash;%&gt;--%>
                <%--&lt;%&ndash;                    </td>&ndash;%&gt;--%>
                <%--                </tr>--%>
                <%--                <tr>--%>
                <%--                    --%>
                <%--                   --%>
                <%--                </tr>--%>
                <%--                <tr>--%>

                <%--                    <td>--%>
                <%--                        &lt;%&ndash;                        <input name="photo" type="file" name="deckImage" id="deckImage" accept="image/*"&ndash;%&gt;--%>
                <%--                        &lt;%&ndash;                               onchange="document.getElementById('output').src = window.URL.createObjectURL(this.files[0])">&ndash;%&gt;--%>
                <%--                        --%>
                <%--                    </td>--%>
                <%--                </tr>--%>
                <%--                <tr>--%>

<%--                <td>--%>
<%--                --%>
<%--                </td>--%>
<%--                </tr>--%>
            </table>
        </fieldset>
        <input type="submit" value="Add Deck" class="btn btn-success">
    </form>
</center>
</body>
</html>
