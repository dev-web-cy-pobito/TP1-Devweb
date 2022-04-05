window.onload = () => {
    let r = new XMLHttpRequest();
    let e = document.getElementById("jobs");
    // Merci pôle emploi pour la liste de métiers
    r.open("GET", "assets/other/jobs.json");
    r.send();
    r.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            r = JSON.parse(r.responseText);
            e.innerHTML = "";
            r.forEach(g => {
                let inj = "";
                g.children.forEach(m => {
                    inj += `<option value=${m.id}>${m.text}</option>`;
                });
                e.innerHTML += `<optgroup label="${g.text}">${inj}</optgroup>`;
            });
        }
    }
}