<#import "blocks/templates.ftlh" as t>
<@t.template user>

    <div id="carouselExampleDark" class="carousel slide carousel-fade">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <#list images as image>
                <div class="carousel-item <#if image.previewImage>active</#if>">
                    <img src="/images/${image.id}" class="d-block w-100" alt="...">
                </div>
            </#list>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <hr>
    <p><h1 style="text-align: center">${part.title} | ${part.price} г.в.</h1></p>
    <p style="text-align: center">${part.description}</p>
    <p style="text-align: center">Номер телефона клиента: <b>${authorPart.phoneNumber}</b></p>

    <hr>
    <p style="text-align: center">
        <a href="/user/${authorPart.id}">
            <img src="/static/images/avatar.png" alt="mdo" width="32" height="32" class="rounded-circle"> ${authorPart.name}
        </a>
    </p>
</@t.template>