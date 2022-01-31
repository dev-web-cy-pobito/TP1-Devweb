window.onload = () => {
    let r = new XMLHttpRequest();
    let e = document.getElementById("metiers");
    // Merci pôle emploi pour la liste de métiers
    r.open("GET", "http://www.nosdonnees.fr/dataset/51f20c04-79e5-471c-bdcc-6ed91757122b/resource/a4031fcf-0ded-47df-9d88-870c06c8321e/download/codesrometree.xls.json");
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