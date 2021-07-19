<#import "navbar.ftlh" as navbar>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/main.css">
    <title>Document</title>
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col-2 my-menu">
            <@navbar.verticalNav>

            </@navbar.verticalNav>
        </div>
        <div class="col-3"></div>
        <div class="col-3" align="center">
            <form action="/orders" method="get">
                <div class="form-group">
                    <label for="exampleInputEmail">Ваш email</label>
                    <input type="text" name="email" class="form-control" id="exampleInputEmail">
                </div>
                <button class="btn btn-primary px-5">Вход</button>
            </form>
        </div>
        <div class="col-3"></div>
    </div>
</div>

</body>
</html>