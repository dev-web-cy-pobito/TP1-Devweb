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
    let r = new XMLHttpRequest(type);
    let data = new FormData();

    data.append("email", email.value);
    data.append("password", password.value);

    r.open("POST", "endpoints/" + type + ".php", true);
    r.send(data);

    r.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let j = JSON.parse(this.responseText);
            if (j.error) {
                info.innerText = j.error;
                info.classList.add('warning-box');
                info.classList.remove('hidden');
                info.scrollIntoView();
            } else {
                if (type === "register") {
                    document.getElementById('register').classList.add('hidden')
                    info.scrollIntoView();
                    info.innerText = "Successfully Registered"
                    info.classList.add('success-box');
                    info.classList.remove('hidden');
                } else if (type === "login") {
                    window.location.href = "index.php";
                }
            }
        }
    }
}