async function get_quests(){
    let res = await fetch("http://api.vk.ru/quests");
    let quests = await res.json();
    document.querySelector('.post-list1').innerHTML = ''
    let hasHeader = document.querySelector('.custom-header');
    if (hasHeader) {
        hasHeader.remove();
    }
    quests.forEach((quest) => {
        document.querySelector('.post-list1').innerHTML += `
            <div class="card" style="…">
                <div class="card-body">
                    <h5 class="card-title">${quest.name}</h5>
                    <p class="card-text">Цена задания: ${quest.cost}</p>
                    <input type="text" class="form-control"">
                    <a href="#" class="card-link" onclick="quest_not_done(${quest.id})">Отправить ответ</a>
                    <a href="#" class="card-link" onclick="delete_quest(${quest.id})">Удалить</a>
                </div>
            </div>
        `
    });
}

async function get_users(){
    let res = await fetch("http://api.vk.ru/users");
    let users = await res.json();
    document.querySelector('.post-list').innerHTML = ''
    users.forEach((user) => {
        document.querySelector('.post-list').innerHTML += `
            <div class="card" style="…">
                <div class="card-body">
                <h5 class="card-title">${user.name}</h5>
                <a href="#" class="card-link" onclick="choose_user(${user.id})">Выбрать</a>
                </div>
            </div>
        `
    });
}

async function choose_user(id_u){
    let res = await fetch("http://api.vk.ru/user/"+id_u);
    let user = await res.json();
    let res1 = await fetch("http://api.vk.ru/quests");
    let quests = await res1.json();
    if(user.quests != null)
        user_quest = user.quests.split('; ')
    else
        user_quest = 'Выполненных заданий нет'
    document.querySelector('.post-list').innerHTML = ''
    document.querySelector('.post-list').innerHTML += `
            <div class="card" style="…">
                <div class="card-body">
                <h5 class="card-title">${user.name}</h5>
                <p class="card-text">${user.balance}</p>
                <p class="card-text">Номера выполненных задания: ${user_quest}</p>
                <a href="#" class="card-link" onclick="get_users(), get_quests();">Изменить пользователя</a>
                </div>
            </div>
        `
    document.querySelector('.post-list1').innerHTML = ''
    let hasHeader = document.querySelector('.custom-header');
    if (!hasHeader)
        document.querySelector('.post-list1').insertAdjacentHTML('beforebegin', '<h5 class="custom-header">Доступные задания для выполнения</h5>');
    quests.forEach((quest) => {
        if ( user.quests != null){
            if (!user.quests.includes(quest.id)) {
                document.querySelector('.post-list1').innerHTML += `
                    <div class="card" style="…">
                        <div class="card-body">
                            <h5 class="card-title">${quest.name}</h5>
                            <p class="card-text">${quest.cost}</p>
                            <input type="text" class="form-control"">
                            <a href="#" class="card-link" onclick="quest_done(${id_u}, ${quest.id})">Отправить ответ</a>
                        </div>
                    </div>
                `
            }
        }
        else{
            document.querySelector('.post-list1').innerHTML += `
                    <div class="card" style="…">
                        <div class="card-body">
                            <h5 class="card-title">${quest.name}</h5>
                            <p class="card-text">${quest.cost}</p>
                            <input type="text" class="form-control"">
                            <a href="#" class="card-link" onclick="quest_done(${id_u}, ${quest.id})">Отправить ответ</a>
                        </div>
                    </div>
                `
        }
    });
}

async function add_quest(){
    const name = document.getElementById('name_quest').value;
    const cost = document.getElementById('cost').value;

    let formData = new FormData();
    formData.append('name', name);
    formData.append('cost', cost);

    const res = await fetch("http://api.vk.ru/quest", {
        method: 'POST',
        body: formData
    });

    const data = await res.json();

    if(data.status === true)
        get_quests();
}

async function add_user(){
    const name = document.getElementById('name_user').value;

    let formData = new FormData();
    formData.append('name', name);

    const res = await fetch("http://api.vk.ru/user", {
        method: 'POST',
        body: formData
    });

    const data = await res.json();

    if(data.status === true)
        get_users();
}

async function quest_done(id_u, id_q){
    const data = {
        id_u: id_u,
        id_q: id_q
    };

    const res = await fetch("http://api.vk.ru/user/"+id_u+"/quest/"+id_q, {
        method: 'PATCH',
        body: JSON.stringify(data)
    });

    const resdata = await res.json();
    
    if(resdata.status === true)
        choose_user(id_u);
}

async function quest_not_done(id_q){
    const res = await fetch("http://api.vk.ru/quest/"+id_q, {
        method: 'PATCH',
    });

    const data = await res.json();
}

async function delete_quest(id_q){
    const res = await fetch("http://api.vk.ru/quest/"+id_q, {
        method: "DELETE"
    })

    const data = await res.json();

    if(data.status === true)
        get_quests();
}

get_quests();
get_users();
