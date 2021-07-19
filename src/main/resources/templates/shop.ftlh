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
    <link rel="stylesheet" href="/css/star.css">
    <title>Document</title>

</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-2 my-menu mt-5 pt-1">
            <@navbar.verticalNav>

            </@>
        </div>
        <div class="col-7 pl-4">
            <h3 class="mb-3">Электротовары</h3>
            <#if shopDataModel ?? &&(shopDataModel.products?size >0)>
                <div class="row row-cols-3">
                <#list shopDataModel.products as product>
                    <div class="col-4 mb-4 px-2">
                        <div class="card text-center">
                            <div class="card-header">
                                <h5 class="card-title">${product.name}</h5>
                            </div>
                            <#if product.filePath??>
                                <img src="/files/${product.filePath!""}" class="card-img-top productInfoImage" alt="pic">
                                <#else>
                                <h4 class="my-5">Нету картинки</h4>
                            </#if>

                            <div class="card-body">
                                <a href="#" class="btn btn-success" data-toggle="modal"
                                   data-target="#cartProductModalCenter" data-whatever=${product.id}>В корзину</a>
                                <a href="#" class="btn btn-warning mt-2" data-toggle="modal"
                                   data-target="#productRatingModalCenter" data-whatever="${product.id}">Оставить
                                    отзыв</a>
                            </div>
                            <div class="card-footer text-muted">
                                <p class="card-text float-right">Цена: ${product.price}</p>
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
                        <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                               aria-describedby="emailHelp">
                    </div>
                    <button type="submit" class="btn btn-primary ">Перейти</button>
                </form>
            </div>
        </div>
        <div class="modal fade" id="cartProductModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Добавить товар в корзину</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/cartProducts/add" method="post">
                            <div class="form-group">
                                <input type="hidden" name="productId" class="form-control" id="addProduct">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail">Ваш email</label>
                                <input type="email" name="customerEmail" class="form-control"
                                       id="exampleInputInputEmail" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputAmount">Количество</label>
                                <input type="number" name="amount" class="form-control" id="exampleInputAmount"
                                       required>
                            </div>
                            <button class="btn btn-primary">Добавить</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="productRatingModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Оставить отзыв</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/products/addReview" method="post">
                            <div class="form-group">
                                <input type="hidden" name="productId" class="form-control" id="addReview">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputName">Имя</label>
                                <input type="text" name="name" class="form-control" id="exampleInputInputName">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputSurname">Фамилия</label>
                                <input type="text" name="surname" class="form-control" id="exampleInputSurname">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPhoneNumber">Номер телефона</label>
                                <input type="text" name="phoneNumber" class="form-control" id="exampleInputPhoneNumber">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail">Ваш email</label>
                                <input type="text" name="email" class="form-control" id="exampleInputEmail">
                            </div>
                            <div class="form-group pt-3">
                                <label for="exampleFormControlDescription">Коментарий</label>
                                <textarea class="form-control" name="comment" id="exampleFormControlComment"
                                          rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <fieldset class="rating">

                                    <p class="mt-2">Ваша оценка</p>
                                    <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="Rocks!">5 stars</label>
                                    <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                                    <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="Meh">3 stars</label>
                                    <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
                                    <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="Sucks big time">1 star</label>
                                </fieldset>
                            </div>


                            <button class="btn btn-primary float-right mt-5">Добавить</button>
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
        modal.find('.modal-body #addProduct').val(recipient)
    })
</script>
<script>
    $('#productRatingModalCenter').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var recipient = button.data('whatever')
        var modal = $(this)
        modal.find('.modal-body #addReview').val(recipient)
    })
</script>
</html>