<#import "navbar.ftlh" as navbar>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://kit.fontawesome.com/9b46d5b3aa.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/main.css">
    <title>Производители</title>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-2 my-menu">
            <@navbar.verticalNav>

            </@>
        </div>
        <div class="col-10">
            <h3>Добавить производителя</h3>
            <form action="/manufacturerList/add" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="exampleInputName">Наименование</label>
                    <input type="text" name="name" class="form-control" id="exampleInputInputName" >
                </div>
                <div class="form-group">
                    <label for="exampleInputDescription">Код</label>
                    <input type="number" name="code" class="form-control" id="exampleInputCode">
                </div>
                <div class="form-group">
                    <label for="exampleInputPrice">Email</label>
                    <input type="email" name="email" class="form-control" id="exampleInputEmail">
                </div>
                <div class="form-group" >
                    <label for="file">
                        <p>Фото</p>
                        <input type="file" id="file" name="file">
                    </label>
                </div>
                <button class="btn btn-primary">Добавить</button>
            </form>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
</html>