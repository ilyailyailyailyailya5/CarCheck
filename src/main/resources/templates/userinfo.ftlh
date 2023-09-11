<#import "blocks/templates.ftlh" as t>
<@t.template userByPrincipal>
    <h1 style="text-align: center">Информация о пользователе</h1>
    <hr>
    <div style="text-align: center">
        <img src="/static/images/avatar.png"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        Номер телефона: <b>${user.phoneNumber}</b>
    </div>
    <br>
    <hr>
    <h1 style="text-align: center">Товары пользователя ${user.name}</h1>
    <br>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <#list parts as part>
            <div class="col">
                <a href="/part/${part.id}" class="part-link">
                    <div class="card text-white bg-primary my-3 part ">
                        <img src="/images/${part.previewImageId}"
                             class="card-img-top" style="width: 100%; height: 250px">
                        <div class="card-body">
                            <h5 class="card-title">${part.title}</h5>
                            <p class="card-text">${part.price}</p>
                        </div>
                        <div class="card-footer">
                            ${part.city}
                        </div>
                    </div>
                </a>
            </div>
        <#else>
            <h1 style="text-align: start">Не найдено</h1>
        </#list>
    </div>
</@t.template>
