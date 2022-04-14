const data = {
    categories: [],
    puffles: [],
    filter: {
        categories: [],
        search: ""
    },
    sort: {
        by: "name",
        ascendant: true
    }
};

function chooseSort(t) {

    if (t === data.sort.by) data.sort.ascendant ^= true;
    if (["name", "colors", "price"].includes(t)) data.sort.by = t;

    populateTable("shop");
}

function chooseFilter(f) {
    console.log(f);

    t = [...document.getElementsByTagName("input")].map(i => i.checked = f.includes(i.id));

    data.puffles = [];
    let r = new XMLHttpRequest();
    r.open("POST", "endpoints/getPuffles.php");
    r.setRequestHeader("Content-type", "application/json")
    r.send(JSON.stringify(f));
    r.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            r = JSON.parse(r.responseText);
            r.forEach(g => data.puffles.push(g));
            populateTable("shop");
        }
    }


}

function getCheckedCategories() {
    let c = [...document.getElementsByTagName("input")];
    c = c.filter(i => (i.type === "checkbox" && i.checked));
    return [...c.map(i => {
        return i.id.toString();
    })]
}

function searchTxt() {
    data.filter.search = document.getElementById("search").value;
    populateTable('shop');
}

function search() {
    chooseFilter(getCheckedCategories());
}

function puffleFilter(p) {
    return p.name.toLowerCase().includes(data.filter.search.toLowerCase());
}

function puffleSort(p1, p2) {
    return (data.sort.ascendant == (p1[data.sort.by] > p2[data.sort.by]) ? 1 : -1);
}

function addCart(a) {
    let max = parseInt(a.parentElement.getAttribute("max"));
    let i = parseInt(a.parentElement.innerText.replace("+", "").replace("-", "").replace("\n", ""));
    if (i + 1 < max) {
        a.parentElement.innerHTML = `<button onclick="removeCart(this)">-</button>${i+1}<button onclick="addCart(this)">+</button>`;
    } else {
        a.parentElement.innerHTML = `<button onclick="removeCart(this)">-</button>${i+1}`;
    }
}

function removeCart(a) {
    let i = parseInt(a.parentElement.innerText.replace("+", "").replace("-", "").replace("\n", ""));

    if (i - 1 > 0) {
        a.parentElement.innerHTML = `<button onclick="removeCart(this)">-</button>${i-1}<button onclick="addCart(this)">+</button>`;
    } else {
        a.parentElement.innerHTML = `${i - 1}<button onclick="addCart(this)">+</button>`;

    }
}

function populateTable(el) {
    if (!(el = document.getElementById(el))) return;
    let temp_puffles = [...data.puffles];
    temp_puffles = [...data.puffles].filter(puffleFilter);
    temp_puffles = temp_puffles.sort(puffleSort);
    el.innerHTML = `
    <tr>
        <th>Image</th>
        <th onclick="chooseSort('name')">Name</th>
        <th onclick="chooseSort('price')">Price</th>
        <th>Description</th>
        <th>Apparition Date</th>
        <th>Acheter</th>
        <th>Stock</th>
    </tr>`;
    // <th>Categories</th>

    temp_puffles.forEach(p => {
        el.innerHTML += `
    <tr>
        <td>
            <div class="imgZoom">
                <input type="checkbox" id="zoom${p.name}">
                <label for="zoom${p.name}">
                    <img class="shop" src="${p.pic_url}">
                </label>
            </div>
        </td>
        <td>${p.name}</td>
        <td class="puff-price"><span>${p.price ?? ""}</span></td>
        <td>${p.description}</td>
        <td>${p.apparition_date}</td>
        <td class="puff-cart" max=${p.stock}><button onclick="removeCart(this)">-</button>0<button onclick="addCart(this)">+</button></td>
        <td class="puff-stock"><span onclick='javascript:this.innerText = ${p.stock ?? "Indisponible"}'>Vérifier</span></td>
    </tr>`
    });
}
/* <td class="puff-cat">${p.categories.map(c => "<span>" + c + "</span>").join("")}</td> */


function populateMenu(el) {
    if (!(el = document.getElementById(el))) return;
    data.categories.forEach(c => {
        let sub = el.children[0].cloneNode(true);
        sub.children[0].innerText = c.name;
        sub.children[0].href = `javascript:chooseFilter(["${c.id}"])`;
        el.appendChild(sub);
    })
}

function populateCatList(el) {
    let e = document.getElementById(el);
    e.innerHTML = "";
    data.categories.forEach(c => {
        e.innerHTML += `
        <div>
            <input onclick="search()" type="checkbox" name="${c.name}" id="${c.id}" checked>
            <label for="${c.name}">${c.name}</label>
        </div>`
    })
}

window.onload = () => {
    let categories = new Set();

    let r = new XMLHttpRequest();
    r.open("GET", "endpoints/getPufflesCats.php");
    r.send();
    r.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            r = JSON.parse(r.responseText);
            r.forEach(g => data.categories.push(g));
            populateCatList("categories");
            populateMenu("categories-submenu");
            search()
        }
    }
}