let cart = [];

async function getCart() {
    new Promise((resolve, reject) => {
        let r = new XMLHttpRequest();
        r.open("GET", "endpoints/cart.php");
        r.send();
        r.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                r = JSON.parse(r.responseText);
                cart = r;
                updateModal();
                document.getElementById("cart").onmouseover = document.getElementById("cart-modal").onmouseleave = function() {
                    showModal(true);
                }
                document.getElementById("cart-modal").onmouseleave = function() {
                    showModal(false);
                }
                resolve();
            }
        }
    });
    
}

function updateModal() {
    document.getElementById("cart").innerText = `Cart (${cart.length})`;
    
    let modal = document.getElementById("cart-content");
    modal.innerHTML = cart.length ? "<table><tr><th>Image</th><th>Name</th><th>Price</th><th>Quantity</th><th></th></tr>" + cart.map(p => {
        return `
        <tr>
            <td>
                <img class="shop" src="${p.pic_url}">
            </td>
            <td>${p.name}</td>
            <td class="puff-price"><span>${p.price ?? "-"}</span></td>
            <td>x ${p.quantity}</td>
            <td><button onclick="removeItemFromCart(${p.id})">Remove</button></td>
        </tr>`
    }).join("") + '</table><button onclick="alert(`Sorry,\n\nClub Penguin shut down March 30, 2017\n\nAll your puffles are forever gone.\n\nTime to move on...`)">Checkout</button>' : "Your cart is currently empty";
    showModal(false);

}

function showModal(b) {
    document.getElementById("cart-modal").hidden = !b;
}

function setCart() {
    let r = new XMLHttpRequest();
    r.open("POST", "endpoints/cart.php");
    r.setRequestHeader("Content-type", "application/json")
    r.send(JSON.stringify(cart));
    r.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            updateModal();
        }
    }
}

function addItemToCart(item, quantity) {
    let id = item.id;
    let exists = cart.filter(e => e.id === id).length > 0;
    if (exists) {
        cart = cart.map(e => {
            return e.id === id ? {...item, quantity: e.quantity + quantity} : e
        })
    } else {
        cart.push({...item, quantity: quantity})
    }
    setCart()
    search()
}

function removeItemFromCart(id) {
    let index = -1;
    let exists = cart.filter((e, i) => {
        if (e.id === id) index = i;
        return (e.id === id);
    }).length > 0;
    if (exists) cart.splice(index, 1);
    setCart()
    search()
}

getCart();