<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deck Management</title>
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
    <div class="container" id="content">
        <div class="col-md-6 col-lg-4">
            <div class="modal fade" id="exampleModalAdd" tabindex="-1"
                 role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="container">
                                <form action="/decks?action=addNewDeck" method="post">
                                    <h1 style="color: black;">Adding A New Deck</h1>
                                    <hr>
                                    <p>Deck Information</p>
                                    <table>
                                        <tr>
                                            <th>Deck Name:</th>
                                            <td>
                                                <input type="text" name="deckName" id="deckName">
                                            </td>
                                        </tr>

                                        <tr>
                                            <th>Deck Price:</th>
                                            <td>
                                                <input type="number" step="any" name="deckPrice" id="deckPrice">
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
                                                <select name="typeId">
                                                    <c:forEach items="${types}" var="type">
                                                        <option value="${type.getTypeId()}">${type.getTypeName()}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>

                                        <tr>
                                            <th>Deck Brand:</th>
                                            <td>
                                                <select name="brandId">
                                                    <c:forEach items="${brands}" var="brand">
                                                        <option value="${brand.getBrandId()}">${brand.getBrandName()}</option>
                                                    </c:forEach>
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
                                            <th>Preview Image</th>
                                            <td>
                                                <img src="images/preview-icon.jpg" id="output" src="" width="100"
                                                     height="100">
                                            </td>
                                        </tr>
                                    </table>
                                    <input type="submit" value="Add Deck" class="btn btn-success">
                                </form>
                                <div class="modal-footer">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-danger"
                                    data-dismiss="modal">CLOSE
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="main">
        <div id="head">
            <div class="navbar">
                <h1>Decks List</h1>
                <a href="/home">
                    <img src="images/logo.png" height="50" width="50"/>
                </a>
                <a style="color: white" class="btn btn-success" data-toggle="modal"
                   data-target="#exampleModalAdd">Add New Deck
                </a>

                <a href="/types?action=addNewType" class="btn btn-success">Add New Type</a>
                <a href="/brands?action=addNewBrand" class="btn btn-success">Add New Brand</a>
                <a href="/types?action=showListType" class="btn btn-success">Show List Type</a>
                <a href="/brands?action=showListBrand" class="btn btn-success">Show List Brand</a>
                <div>
                    <c:if test='${message != null}'>
                        <span class="message">Welcome, ${message}</span>
                    </c:if>
                    <form autocomplete="off">
                        <input type="hidden" name="action" value="searchDeckByName">
                        <input type="text" name="searchDeckByName" id="searchDeckByName" placeholder="Deck Name...">
                        <input type="submit" class="btn btn-success" value="Search">
                    </form>
                </div>
            </div>
            <hr>
            <div class="container">
                <table class="table" id="decks">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Size</th>
                        <th scope="col">Type</th>
                        <th scope="col">Brand</th>
                        <th scope="col">Description</th>
                        <th scope="col">Image</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${decks}" var="deck">
                        <tr>
                            <td>${deck.getDeckId()}</td>
                            <td><a href="/decks?action=view&deckId=${deck.getDeckId()}">${deck.getDeckName()}</a></td>
                            <td>${deck.getDeckPrice()}</td>
                            <td>${deck.getDeckSize()}</td>
                            <td>${deck.getTypeId().typeName}</td>
                            <td>${deck.getBrandId().brandName}</td>
                            <td>${deck.getDeckDescription()}</td>
                            <td><img src="${deck.getDeckImage()}" alt="Deck Image Preview" width="50px" height="50px">
                            </td>
                            <th>
                                <a href="/decks?action=editDeck&deckId=${deck.getDeckId()}"
                                   class="btn btn-secondary">EDIT</a>
                            </th>
                            <th><a href="/decks?action=deleteDeck&deckId=${deck.getDeckId()}"
                                   class="btn btn-danger">DELETE</a>
                            </th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</center>
</body>
<style>
    span{
        color: white;
    }
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

    #decks {
        font-family: Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    #decks td, #decks th {
        border: 1px solid #ddd;
        padding: 8px;
    }

    #decks tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    #decks tr:hover {
        background-color: #ddd;
    }

    #decks th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color: #4CAF50;
        color: white;
    }

    input[type=text] {
        width: 100%;
        padding: 10px 15px;
        display: inline-block;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type=number] {
        width: 100%;
        padding: 10px 15px;
        display: inline-block;
        border-radius: 4px;
        box-sizing: border-box;
    }

    select {
        width: 100%;
        padding: 10px 15px;
        display: inline-block;
        border-radius: 4px;
        box-sizing: border-box;
    }

    select option {
        width: 100%;
        padding: 10px 15px;
        display: inline-block;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type=submit]:hover {
        background-color: #45a049;
    }
</style>
</html>
