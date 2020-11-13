<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<div class="sidenav">
    <div class="login-main-text">
        <h2>Application<br> Login Page</h2>
        <p>Login or register from here to access.</p>
    </div>
</div>
<div class="main">
    <div class="col-md-6 col-sm-12">
        <div class="login-form">
            <h1>LOGIN</h1>
            <hr>
            <form autocomplete="off" method="post" action="/customers?action=login">
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" class="form-control" name="username" id="username" placeholder="Username">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                </div>
                <button type="submit" class="btn btn-black">Login</button>
                <a href="/customers?action=register" class="btn btn-secondary">Register</a>
            </form>
        </div>
        <div>
            <c:if test='${message != null}'>
                <span class="message">${message}</span>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
<style>
    .message {
        color: red;
    }

    body {
        font-family: "Lato", sans-serif;
    }

    .sidenav {
        height: 100%;
        background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(60, 205, 50, 0.1)),
        url("../images/background.jpg");
        background-color: #000;
        overflow-x: hidden;
        padding-top: 20px;
    }

    .main {
        padding: 0px 10px;
    }

    @media screen and (max-height: 450px) {
        .sidenav {
            padding-top: 15px;
        }
    }

    @media screen and (max-width: 450px) {
        .login-form {
            margin-top: 10%;
        }
    }

    @media screen and (min-width: 768px) {
        .main {
            margin-left: 40%;
        }

        .sidenav {
            width: 40%;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
        }

        .login-form {
            margin-top: 40%;
        }
    }


    .login-main-text {
        margin-top: 20%;
        padding: 60px;
        color: #fff;
    }

    .login-main-text h2 {
        font-weight: 300;
    }

    .btn-black {
        background-color: #000 !important;
        color: #fff;
    }
</style>