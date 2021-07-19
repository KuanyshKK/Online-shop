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
            <div class="card mb-5">

                <div class="card-header text-center">
                    Товар
                </div>

                <div class="card-body">
                    <div class="row no-gutters">
                        <div class="col-8 pl-5 pt-2"><h5 class="card-title">${product.name!}</h5>
                            <p class="card-text">Производитель - ${product.manufacturer.name!}</p>
                            <p class="card-text">Категория - ${product.category.name!}</p>
                            <p class="card-text">Описание - ${product.description!}</p>
                            <p>Отзывы о товаре</p></div>
                        <div class="col-4"><img src="/files/${product.filePath!}" class="productInfoImage" alt=""></div>
                    </div>

                </div>

                <div class="card-footer text-muted">
                    Цена: ${product.price!}
                </div>

            </div>
            <h4>Отзывы:</h4>
            <#if (product.reviews?size > 0)>
                <#list product.reviews as review >
                    <div class="card text-center mt-5">
                        <div class="card-header pl-0">
                            <div class="row">
                                <div class="col-2 pr-5"><i>${review.reviewerName}</i></div>
                                <div class="col-8">

                                </div>
                                <div class="col-2">
                                    Оценка: ${review.rate}
                                </div>
                            </div>

                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <textarea class="form-control" name="description" id="exampleFormControlDescription"
                                          rows="3"> <#if review.comment??>${review.comment!""}</#if></textarea>
                            </div>
                        </div>

                    </div>
                </#list>
            </#if>
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