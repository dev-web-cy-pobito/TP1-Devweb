const data = {
    categories: [],
    puffles : [
        {
            "name": "Red Puffle",
            "colors": "red",
            "pic_url": "assets/images/logo.png",
            "description": "lorem ipsum in dolor",
            "price": 100,
            "categories": [
                "baisc"
            ]
        },
        {
            "name": "Red Puffle2",
            "colors": "red",
            "pic_url": "assets/images/logo.png",
            "description": "lorem ipsum in dolor",
            "price": 200,
            "categories": [
                "basic"
            ]
        },
        {
            "name": "Red Puffle3",
            "colors": "red",
            "pic_url": "assets/images/logo.png",
            "description": "lorem ipsum in dolor",
            "price": 300,
            "categories": [
                "baisc",
                "basic"
            ]
        },
    
    ],
    filter: {
        categories: [],
        search: ""
    },
    sort: {
        by : "name",
        ascendant: false
    }
};

function chooseSort(t) {

    if (t === data.sort.by) data.sort.ascendant ^= true;
    if (["name", "colors", "price"].includes(t)) data.sort.by = t;

    populateTable("shop");
}

function chooseFilter(f) {
    let r = new Set();

    f.forEach(c => {
        if (data.categories.includes(c)) r.add(c);
    });

    data.filter.categories = [...r];

    populateTable("shop");
}

function getCheckedCategories() {
    let c = [...document.getElementsByTagName("input")];
    c = c.filter(i => (i.type === "checkbox" && i.checked));
    return [...c.map(i => { return i.name})]
}

function search() {
    data.filter.search = document.getElementById("search").value;
    chooseFilter(getCheckedCategories());
}

function puffleFilter(p) {
    let r = false;
    p.categories.forEach(c => {
        if (data.filter.categories.includes(c) && p.name.toLowerCase().includes(data.filter.search.toLowerCase())) r = true;
    });
    return r;
}

function puffleSort(p1, p2) {
    return (data.sort.ascendant == (p1[data.sort.by] > p2[data.sort.by]) ? 1 : -1);
}

function populateTable(el) {
    if (!(el = document.getElementById(el))) return;

    let temp_puffles = [];
    temp_puffles = [...data.puffles].filter(puffleFilter);
    temp_puffles = temp_puffles.sort(puffleSort);
    el.innerHTML = `
    <tr>
        <th>Aperçu</th>
        <th onclick="chooseSort('name')">Puffle</th>
        <th>Catégories</th>
        <th onclick="chooseSort('price')">Prix</th>
        <th>Description</th>
    </tr>`;

    temp_puffles.forEach(p => {
        el.innerHTML += `
    <tr>
        <td><img class="shop" src="${p.pic_url}"</td>
        <td>${p.name}</td>
        <td>${p.categories.join("<br>")}</td>
        <td>${p.price}</td>
        <td>${p.description}</td>
    </tr>`
    });
}

window.onload = () => {
    let categories = new Set();
    let e = document.getElementById("categories");
    e.innerHTML = "";

    data.puffles.forEach(p => {
        p.categories.forEach(c => {
            categories.add(c);
        });
    });
    data.categories = [...categories];
    data.filter.categories = [...categories];
    data.categories.forEach(c => {
        e.innerHTML += `<input onclick="search()" type="checkbox" name="${c}" checked><label for="${c}">${c}</label>`
    })
    populateTable("shop");
}