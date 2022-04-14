function login() {
    email = document.getElementById("login_email");
    password = document.getElementById("login_password");
    request(email, password, "login");
}

function register() {
    email = document.getElementById("register_email");
    password = document.getElementById("register_password");
    request(email, password, "register");
}

function request(email, password, type) {
    let info = document.getElementById("info");
    let r = new XMLLHttpRequest(type);
    let data = new FormData();

    data.append("email", email.value);
    data.append("password", password.value);

    r.open("POST", "endpoints/" + type + ".php", true);
    r.send(data);

    r.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let j = JSON.parse(this.responseText);
            r.innerText = j.error ? j.error : j.success;
        }
    }
}