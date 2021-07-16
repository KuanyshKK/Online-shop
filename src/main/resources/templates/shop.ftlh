<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">
    <title>Document</title>

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
        <div class="col-7 pl-4">
            <h3 class="mb-3">Электротовары</h3>
            <#if shopDataModel ?? &&(shopDataModel.products?size >0)>
                <div class="row row-cols-3">
                <#list shopDataModel.products as product>
                    <div class="col-4 mb-4 px-2">
                        <div class="card text-center">
                            <div class="card-header">
                                Товар
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${product.name}</h5>
                                <p class="card-text">Цена - ${product.price}</p>
                                <a href="#" class="btn btn-primary" data-toggle="modal"
                                   data-target="#cartProductModalCenter" data-whatever=${product.id}>В корзину</a>
                            </div>
                            <div class="card-footer text-muted">
                            </div>
                        </div>
                    </div>
                </#list>
            <#else>
                <h2>Магазин пустой</h2>
                </div>
            </#if>
        </div>

    </div>
    <div class="col-3">
        <h3>Корзина</h3>
        <div class="card border-warning mt-3" style="max-width: 18rem;">
            <div class="card-body ">
                <form action="/cartProducts" method="get">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Ваш email</label>
                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    </div>
                    <button type="submit" class="btn btn-primary ">Перейти</button>
                </form>
            </div>
    </div>
    <div class="modal fade" id="cartProductModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Добавить товар в корзину</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/cartProduct/add" method="post">
                        <div class="form-group">
                            <input type="hidden" name="productId" class="form-control" id="recipient-name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail">Ваш email</label>
                            <input type="email" name="customerEmail" class="form-control" id="exampleInputInputEmail" required>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputAmount">Количество</label>
                            <input type="number" name="amount" class="form-control" id="exampleInputAmount" required>
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
<script>
    $('#cartProductModalCenter').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var recipient = button.data('whatever')
        var modal = $(this)
        modal.find('.modal-body #recipient-name').val(recipient)
    })
</script>
</html>