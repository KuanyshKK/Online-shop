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
        <div class="col-10">
            <#list orders as order>
                <div class="card mb-5">
                    <h5 class="card-header">Заказ №${order.dateTime}</h5>
                    <div class="card-body">
                        <div class="row row-cols-3">
                            <#list order.cartProducts as pr>
                                <div class="col-4 mb-4 px-2">
                                    <div class="card text-center">
                                        <div class="card-header">
                                            <i>${pr.product.name}</i>
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title"></h5>
                                            <p class="card-text">Цена - ${pr.product.price}</p>
                                        </div>

                                    </div>
                                </div>
                            </#list>
                        </div>
                    </div>
                    <div class="card-footer text-muted">
                        <p class="float-right">Сумма заказа: ${order.total}</p>
                    </div>
                </div>
            </#list>


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

</script>
</html>

