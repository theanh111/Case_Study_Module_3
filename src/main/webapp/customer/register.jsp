<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<div class="sidenav">
    <div class="register-main-text">
        <h2>Application<br> Login Page</h2>
        <p>Login or register from here to access.</p>
    </div>
</div>
<div class="main">
    <div class="col-md-6 col-sm-12">
        <div class="register-form">
            <h1>REGISTER</h1>
            <hr>
            <form method="post" action="/customers?action=register">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" class="form-control" name="customerName" id="customerName" placeholder="Tran The Anh...">
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" class="form-control" name="customerAddress" id="customerAddress" placeholder="So 23, lo TT-01, Khu đo thi Mon City...">
                </div>
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" class="form-control" name="username" id="username" placeholder="theanh28..">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="********">
                </div>
                <a href="/customers?action=login" class="btn btn-black">Login</a>
                <input type="submit" class="btn btn-secondary" value="Register">
            </form>
        </div>
        <div>
            <c:if test='${requestScope["message"] != null}'>
                <span class="message">${requestScope["message"]}</span>
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
        .register-form {
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

        .register-form {
            margin-top: 20%;
        }
    }


    .register-main-text {
        margin-top: 20%;
        padding: 60px;
        color: #fff;
    }

    .register-main-text h2 {
        font-weight: 300;
    }

    .btn-black {
        background-color: #000 !important;
        color: #fff;
    }
</style>