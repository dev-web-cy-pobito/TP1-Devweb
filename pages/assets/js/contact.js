window.onload = () => {
    let r = new XMLHttpRequest();
    let e = document.getElementById("jobs");
    // Merci pôle emploi pour la liste de métiers
    r.open("GET", "endpoints/getJobsList.php");
    r.send();
    r.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            r = JSON.parse(r.responseText);
            e.innerHTML = "";
            r.forEach(g => {
                let inj = "";
                g.children.forEach(m => {
                    inj += `<option value=${m.id}>${m.name}</option>`;
                });
                e.innerHTML += `<optgroup label="${g.name}">${inj}</optgroup>`;
            });
        }
    }
}

function submit() {

    let f = document.getElementById("form");
    let p = new FormData();
    p.append("mail", f["mail"].value);
    p.append("first-name", f["first-name"].value);
    p.append("last-name", f["last-name"].value);
    p.append("gender", f["gender"].value);
    p.append("activity", f["activity"].value);
    p.append("subject", f["subject"].value);
    p.append("message", f["message"].value);

    let d = new Date(f["date"].value);
    p.append("date", d/1000);

    let r = new XMLHttpRequest();
    r.open("POST", "endpoints/checkContact.php");
    r.send(p);
    r.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let j = JSON.parse(this.responseText);
            if (j["error"]) {
                alert(j.error ?? "An unknown exception occured.");
            } else if (j["redirect"]) {

                // We don't have a mail server, therefore send it yourself (don't worry, the contact data was still validated by the server)
                window.location.href = j["redirect"];
            }
        }
    }
}