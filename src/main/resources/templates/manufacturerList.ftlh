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
    <link rel="stylesheet" href="css/main.css">
    <title>Products</title>

</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-2 my-menu mt-5 pt-1">
            <ul class="nav nav-pills flex-column">
                <li class="nav-item pt-1">
                    <a class="nav-link" href="/products">Товары</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/manufacturerList">Производители</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/categories">Категории</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/shop">Магазин</a>
                </li>
            </ul>
        </div>
        <div class="col-10">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Наименование</th>
                    <th scope="col">Код</th>
                    <th scope="col">
                        <a href="/manufacturerList/add" data-toggle="tooltip" title="Добавить производителя"><i class="fas fa-plus"></i></a>
                    </th>
                </tr>
                </thead>
                <tbody>
                <h3 class="mb-3">Производители</h3>
                <#if manufacturers?? &&(manufacturers?size > 0)>
                    <#list manufacturers as manufacturer>
                        <tr>
                            <th scope="row">${manufacturer?counter}</th>
                            <td>${manufacturer.name!""}</td>
                            <td>${manufacturer.code!""}</td>
                            <td class="my-activity-column">
                                <a href="/manufacturerList/${manufacturer.id!}" data-toggle="tooltip" title="Информация">
                                    <i class="fas fa-info-circle fa-lg info-color pr-3"></i>
                                </a>
                                <a href="/manufacturerList/${manufacturer.id!}/update" data-toggle="tooltip" title="Изменить производителя">
                                    <i class="far fa-edit fa-lg modify-color pr-3"></i>
                                </a>
                                <a href="/manufacturerList/${manufacturer.id!}/deletePage" data-toggle="tooltip" title="Удалить производителя">
                                    <i class="far fa-trash-alt fa-lg delete-color"></i>
                                </a>
                            </td>
                        </tr>
                    </#list>
                <#else>
                    <h2>Нету производителей</h2>
                </#if>
                </tbody>
            </table>
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