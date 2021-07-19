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

            </@>
        </div>
        <div class="col-7">
                <div class="col"><table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Наименование</th>
                            <th scope="col">Количество</th>
                            <th scope="col">Цена</th>
                        </tr>
                        </thead>
                        <tbody>
                        <h3 class="mb-3">Товары в корзине</h3>
                        <#if dataModel?? &&(dataModel.cartProducts?size > 0)>
                            <#list dataModel.cartProducts as cartProduct>
                                <tr>
                                    <th scope="row">${cartProduct?counter}</th>
                                    <td>${cartProduct.product.name!""}</td>
                                    <td>${cartProduct.amount!""}</td>
                                    <td>${cartProduct.product.price!}</td>
                                </tr>
                            </#list>
                        <#else>
                            <h2>Нету продуктов в корзине</h2>
                        </#if>
                        </tbody>
                    </table></div>

        </div>
        <div class="col-3 my-menu text-dark">
            <h3 class="pt-3">Введите данные</h3>
            <form action="/orders" method="post" enctype="application/x-www-form-urlencoded">
                <div class="form-group">
                    <label for="exampleInputName">Имя</label>
                    <input type="text" name="name" class="form-control" id="exampleInputInputName" >
                </div>
                <div class="form-group">
                    <label for="exampleInputSurname">Фамилия</label>
                    <input type="text" name="surname" class="form-control" id="exampleInputSurname" >
                </div>
                <div class="form-group">
                    <label for="exampleInputPhoneNumber">Номер телефона</label>
                    <input type="text" name="phoneNumber" class="form-control" id="exampleInputPhoneNumber">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail">Ваш email</label>
                    <input type="text" name="email" class="form-control" id="exampleInputEmail" value="${dataModel.customerEmail!""}" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputAddress">Адрес</label>
                    <input type="text" name="address" class="form-control" id="exampleInputAddress" >
                </div>
                <div class="form-group">
                    <label for="exampleInputManufacturer"></label>
                    <select class="custom-select" name="payType">
                            <option value="credit">Картой</option>
                            <option value="cash">Наличными</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleInputTotal">Сумма</label>
                    <input type="text" name="total" class="form-control" id="exampleInputTotal" value="<#setting number_format="0.##">${dataModel.total!}" readonly>
                </div>
                <button class="btn btn-primary mb-4 float-right">Купить</button>
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

