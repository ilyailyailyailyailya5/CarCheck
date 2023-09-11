<#macro template user>
    <!doctype html>
    <html lang="ru">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="/static/css/style.css">
        <script class="scriptmy">
            window.onscroll = function() {scrollFunction()};

            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    document.getElementById("myBtn").style.display = "block";
                } else {
                    document.getElementById("myBtn").style.display = "none";
                }
            }

            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
              crossorigin="anonymous">
        <title>CARCHECK.RU</title>
    </head>
    <body>
    <nav class="navbar navbar-dark bg-primary" style="height: 100px; background-color: #e3f2fd;" >
        <div class="container-fluid">
            <a href="/" class="myimg">
                <img src="/static/images/clu4.png" alt="mdo"
                     height="30" width="80%">
            </a>
            <h3 style = "color: white; text-align: start;">+7-495-000-00-00</h3>
            <#if user.email??>
                <div class="dropdown text-end">
                    <a href="/profile">
                        <img src="/static/images/avatar.png" alt="mdo"
                             width="32" height="32" class="rounded-circle">
                    </a>
                </div>
            <#else>
                <button class="btn btn-light my-2 my-sm-0" type="button"
                        onclick="window.location.href = '/login'">
                    Вход
                </button>
            </#if>
        </div>
    </nav>
    <button onclick="topFunction()" id="myBtn" class = "btntn" title="Go to top">^</button>
    <section class="first">

        <div class="container">
            <div class="container mt-4">
                <#nested/>
            </div>

            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                    crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
                    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                    crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
                    crossorigin="anonymous"></script>
        </div>

    </section>
<#--   <footer class="footer">-->
<#--        <!-- Copyright &ndash;&gt;-->
<#--        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">-->
<#--            © 2023 Copyright:-->
<#--            <a class="text-white" href="localhost:8088">CARCHECK.RU</a>-->
<#--        </div>-->
<#--        <!-- Copyright &ndash;&gt;-->
<#--    </footer>-->
    </body>
    </html>
</#macro>