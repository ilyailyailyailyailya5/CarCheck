<#import "blocks/templates.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Личный кабинет</h1>
    <hr>
    <br>
    <div style="text-align: center">
        <img src="/static/images/avatar.png"
             style="border:3px solid #0d6efd; border-radius: 100px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        Электоронная почта: <b>${user.email}</b>
        <br>
        Номер телефона: <b>${user.phoneNumber}</b>
        <br>
        <br>
        <#if user.isAdmin()>
            <a class="btn btn-outline-primary mb-3" style="text-align: center; width: 50%"
               href="/admin">
                Панель администратора
            </a><br>
        </#if>
        <a class="btn btn-outline-primary mb-3" style="text-align: center; width: 50%"
           href="/my/parts">
            Мои заявки
        </a>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" style="text-align: center; width: 50%" class="btn btn-dark mb-2">
                Выйти из аккаунта
            </button>
        </form>
    </div>
</@t.template>