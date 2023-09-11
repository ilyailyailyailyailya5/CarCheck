<#import "blocks/templates.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мои заявки</h1>
    <hr>
    <a class="btn btn-primary mt-3 mb-3" style="text-align: center; width: 100%"
       data-bs-toggle="collapse" href="#collapseExample"
       role="button"
       aria-expanded="false" aria-controls="collapseExample">
        Добавить новую заявку
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/part/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="partName">Марка автомобиля</label>
                <input type="text" required class="form-control"
                       id="partName" name="title">
            </div>
            <div class="form-group">
                <label for="price">Год выпуска</label>
                <div class="input-group mb-3">
                    <input type="number" required class="form-control" id="price" name="price">
                    <div class="input-group-append">
                        <span class="input-group-text">г.в.</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="searchCity">Город</label>
                <select id="searchCity" required name="city" class="form-control">
                    <option value="">Город не выбран</option>
                    <option value="Москва">Москва</option>
                    <option value="Санкт-Петербург">Санкт-Петербург</option>
                    <option value="Новосибирск">Новосибирск</option>
                    <option value="Екатеринбург">Екатеринбург</option>
                    <option value="Нижний Новгород">Нижний Новгород</option>
                    <option value="Казань">Казань</option>
                    <option value="Самара">Самара</option>
                    <option value="Челябинск">Челябинск</option>
                    <option value="Омск">Омск</option>
                    <option value="Ростов-на-Дону">Ростов-на-Дону</option>
                    <option value="Уфа">Уфа</option>
                    <option value="Красноярск">Красноярск</option>
                    <option value="Пермь">Пермь</option>
                </select>
            </div><br>
            <div class="form-group">
                <label for="description">Описание проблемы</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div><br>
            <h1 style="text-align: center">Приложите фотографии автомобиля</h1>
            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1"></label>
                </div>
            </div><br>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2"></label>
                </div>
            </div><br>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3"></label>
                </div>
            </div><br>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file4" id="file4">
                    <label class="custom-file-label" for="file4"></label>
                </div>
            </div><br>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file5" id="file5">
                    <label class="custom-file-label" for="file5"></label>
                </div>
            </div><br>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-outline-primary">Добавить</button>
        </form>
    </div>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <#list parts as part>
            <a href="/part/${part.id}" class="part-link">
                <div class="card text-white bg-primary my-3" style="width: 300px; height: 300px">
                    <div class="card-top">
                        <form action="/part/delete/${part.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-dark m-3">
                                Удалить
                            </button>
                        </form>
                    </div>
                    <#--                    <img src="/images/${part.previewImageId}"-->
                    <#--                         class="card-img-top" style="width: 100%; height: 250px">-->
                    <#--                    <div class="card-body bg-dark">-->
                    <#--                        <h5 class="card-title">${part.title}</h5>-->
                    <#--                        <p class="card-text">${part.price} г.в.</p>-->
                    <#--                    </div>-->
                    <#--                    <div class="card-footer bg-dark">-->
                    <#--                        ${part.city}-->
                    <#--                    </div>-->
                    <div class="card text-white bg-primary my-3">
                        <img src="/images/${part.previewImageId}"
                             class="card-img-top" style="width: 300px; height: 250px">
                        <div class="card-body">
                            <h5 class="card-title">${part.title}</h5>
                            <p class="card-text">${part.price}</p>
                        </div>
                        <div class="card-footer">
                            ${part.city}
                        </div>
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>