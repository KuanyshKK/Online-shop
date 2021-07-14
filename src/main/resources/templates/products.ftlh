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
        <div class="col-3">
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="/products">Продукты</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/manufacturerList">Производители</a>
                </li>
            </ul>
        </div>
        <div class="col-9">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Наименование</th>
                    <th scope="col">Описание</th>
                    <th scope="col">Цена</th>
                    <th scope="col">
                        <#if (productDataModel.manufacturers?size>0)>
                            <a href="#" data-toggle="tooltip" title="Добавить товар"><i class="fas fa-plus" data-toggle="modal" data-target="#productModalCenter"></i></a>
                            <#else>
                                <a href="/manufacturerList/add"><i class="fas fa-plus"></i></a>
                        </#if>

                    </th>
                </tr>
                </thead>
                <tbody>
                <#if productDataModel?? &&(productDataModel.products?size > 0)>
                <#list productDataModel.products as product>
                <tr>
                    <th scope="row">${product?counter}</th>
                    <td>${product.name!""}</td>
                    <td>${product.description!""}</td>
                    <td>${product.price!""}</td>
                    <td class="my-activity-column">
                        <a href="/products/${product.id}" data-toggle="tooltip" title="Информация">
                            <i class="fas fa-info-circle fa-lg info-color pr-3"></i>
                        </a>
                        <a href="/products/${product.id}/update" data-toggle="tooltip" title="Изменить товар">
                            <i class="far fa-edit fa-lg modify-color pr-3"></i>
                        </a>
                        <a href="/products/${product.id}/deletePage" data-toggle="tooltip" title="Удалить товар">
                            <i class="far fa-trash-alt fa-lg delete-color"></i>
                        </a>
                    </td>
                </tr>
                </#list>
                <#else>
                    <h2>Нету продуктов</h2>
                </#if>
                </tbody>
            </table>
        </div>
        <div class="modal fade" id="productModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Новый товар</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/products" method="post">
                            <div class="form-group">
                                <label for="exampleInputName">Наименование</label>
                                <input type="text" name="name" class="form-control" id="exampleInputInputName" >
                            </div>
                            <div class="form-group">
                                <select class="custom-select" name="manufacturerId">
                                <#list productDataModel.manufacturers as manufacturer>
                                        <option value="${manufacturer.id}">${manufacturer.name}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputDescription">Описание</label>
                                <input type="text" name="description" class="form-control" id="exampleInputDescription">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPrice">Цена</label>
                                <input type="number" name="price" class="form-control" id="exampleInputPrice">
                            </div>
                            <button class="btn btn-primary">Добавить</button>
                        </form>
                    </div>
                </div>
            </div>
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