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
    <title>Категории</title>

</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-2 my-menu">
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
            <h3 class="mb-3">Корзина пользователя </h3>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Наименование</th>
                    <th scope="col">Описание</th>
                    <th scope="col">Действия</th>
                </tr>
                </thead>
                <tbody>
                <#if cartProducts?? &&(cartProducts?size > 0)>
                    <#list cartProducts as cartProduct>
                        <tr>
                            <th scope="row">${cartProduct?counter}</th>
                            <td>${cartProduct.product.name!}</td>
                            <td>${cartProduct.amount!}</td>
                            <td class="my-activity-column">
                                <a href="#" data-toggle="tooltip" title="Изменить количество">
                                    <i class="far fa-edit fa-lg modify-color pr-3" data-toggle="modal"
                                       data-target="#cartProductUpdateModalCenter" data-whatever=${cartProduct.id}></i>
                                </a>
                                <a href="#" data-toggle="tooltip" title="Удалить товар">
                                    <i class="far fa-trash-alt fa-lg delete-color pr-3" data-toggle="modal"
                                       data-target="#cartProductDeleteModalCenter" data-whatever=${cartProduct.id}></i>
                                </a>
<#--                                <a href="/cartProducts/${cartProduct.id}/deletePage" data-toggle="tooltip" title="Удалить продукт из корзины">-->
<#--                                    <i class="far fa-trash-alt fa-lg delete-color"></i>-->
<#--                                </a>-->
                            </td>
                        </tr>
                    </#list>
                <#else>
                    <h2>Нету товара</h2>
                </#if>
                </tbody>
            </table>
            <#list cartProducts as cp>
                <#if cp.customerEmail ??>
                    <a href="/cartProducts/deleteAll/${cp.customerEmail}" class="btn btn-danger float-right ">Удалить все</a>
                </#if>
                <#break>

            </#list>

        </div>
    </div>

    <div class="modal fade" id="cartProductUpdateModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Изменить товар корзины</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/cardProducts/update" method="post">
                        <div class="form-group">
                            <input type="hidden" name="productId" class="form-control" id="recipient-name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputAmount">Количество</label>
                            <input type="number" name="amount" class="form-control" id="exampleInputAmount" value="0">
                        </div>
                        <button class="btn btn-primary">Изменить</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="cartProductDeleteModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Удаление товара</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body p-0">
                    <form action="/cartProducts/delete" method="get">
                        <div class="form-group">
                            <input type="hidden" name="productId" class="form-control" id="recipient-name">
                        </div>
                        <p class="mx-3 mb-5 ">Вы действительно хотите удалить?</p>
                        <div class="modal-footer pt-1">
                            <button class="btn btn-danger">Да</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Нет</button>
                        </div>
                    </form>
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
    $('#cartProductUpdateModalCenter').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var recipient = button.data('whatever')
        var modal = $(this)
        modal.find('.modal-body #recipient-name').val(recipient)
    })
</script>
<script>
    $('#cartProductDeleteModalCenter').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var recipient = button.data('whatever')
        var modal = $(this)
        modal.find('.modal-body #recipient-name').val(recipient)
    })
</script>
</html>