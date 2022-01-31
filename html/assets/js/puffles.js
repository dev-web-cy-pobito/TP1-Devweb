const data = {
    categories: [],
    puffles : [{
        "categories": ["Adoptable", "Original", "Membership-Free"],
        "pic_url": "assets/images/338Puffle_2014_Transformation_Player_Card_Blue.png",
        "name": "Blue",
        "description": "Considered trustworthy, loyal, and easy to care for. Their favorite toy is a ball.",
        "price": 400,
        "date": "November 2005"
    }, {
        "categories": ["Adoptable", "Original", "Membership-Free"],
        "pic_url": "assets/images/882Puffle_2014_Transformation_Player_Card_Red.png",
        "name": "Red",
        "description": "The most adventurous, and native to Rockhopper Island. They like being like pirates, bowling, surfing, and eating stinky cheese.",
        "price": 400,
        "date": "June 9, 2005[1]"
    }, {
        "categories": ["Adoptable", "Original", "Membership-Only"],
        "pic_url": "assets/images/449Puffle_2014_Transformation_Player_Card_Pink.png",
        "name": "Pink",
        "description": "Known for their athleticism, and depicted as cheerful. The best swimmers.",
        "price": 400,
        "date": "November 2005"
    }, {
        "categories": ["Adoptable", "Original", "Membership-Only"],
        "pic_url": "assets/images/bb0Puffle_2014_Transformation_Player_Card_Green.png",
        "name": "Green",
        "description": "Very energetic and silly, much like clowns, and usually seen with a propeller cap or a unicycle.",
        "price": 400,
        "date": "November 2005"
    }, {
        "categories": ["Adoptable", "Original", "Membership-Only"],
        "pic_url": "assets/images/33cPuffle_2014_Transformation_Player_Card_Black.png",
        "name": "Black",
        "description": "The strong and silent type, however, they have a wild side; they love to skateboard, and can fly as a fireball. They rarely smile, but they will smile when pleased.",
        "price": 400,
        "date": "November 2005"
    }, {
        "categories": ["Adoptable", "Original", "Membership-Only"],
        "pic_url": "assets/images/ee7Puffle_2014_Transformation_Player_Card_Purple.png",
        "name": "Purple",
        "description": "Love to dance, picky eaters, and portrayed as divas. They can blow incredibly large bubbles by using their bubble wand.",
        "price": 400,
        "date": "August 2006"
    }, {
        "categories": ["Adoptable", "Original", "Membership-Only"],
        "pic_url": "assets/images/bb3Puffle_2014_Transformation_Player_Card_Yellow.png",
        "name": "Yellow",
        "description": "Creative, artistic, can sculpt and paint great pieces of art. They love anything that has got to do with the arts, be it art, design, stage plays, and music.",
        "price": 400,
        "date": "October 2007"
    }, {
        "categories": ["Adoptable", "Original", "Membership-Only"],
        "pic_url": "assets/images/bb8Puffle_2014_Transformation_Player_Card_White.png",
        "name": "White",
        "description": "The smallest of all puffles, which fits their shy and quiet personalities. Their ice breath can freeze anything, and they like ice skating. They are connected back to ninjas quite often, especially since white puffles were first spotted at the Dojo Courtyard.",
        "price": 400,
        "date": "February 2009"
    }, {
        "categories": ["Adoptable", "Original", "Membership-Only"],
        "pic_url": "assets/images/449Puffle_2014_Transformation_Player_Card_Orange.png",
        "name": "Orange",
        "description": "Depicted as goofy and zany, and native to the Box Dimension. Their prominent buck teeth and long tongues make them stand out among other puffles.",
        "price": 400,
        "date": "February 2010"
    }, {
        "categories": ["Adoptable", "Original", "Membership-Only"],
        "pic_url": "assets/images/aafPuffle_2014_Transformation_Player_Card_Brown.png",
        "name": "Brown",
        "description": "The most intelligent puffles, they love experiments. Equiped with safety goggles and a pocket multi-purpose laser shooter.",
        "price": 400,
        "date": "January 2011"
    }, {
        "categories": ["Adoptable", "Original", "Premium", "Membership-Only"],
        "pic_url": "assets/images/aa0Puffle_2014_Transformation_Player_Card_Rainbow.png",
        "name": "Rainbow",
        "description": "Legendary, majestic, can fly, and fart sparkles. Native to the Cloud Forest. Their existence was rumored for years. Non-members could adopt them without needing to complete any tasks at the Rainbow Puffle Party.",
        "price": null,
        "date": "March 2013"
    }, {
        "categories": ["Adoptable", "Original", "Premium", "Membership-Only"],
        "pic_url": "assets/images/11dPuffle_2014_Transformation_Player_Card_Golden.png",
        "name": "Gold",
        "description": "Energetic, hide-and-seek experts, and they shine a lot. Like rainbow puffles, gold puffles had been rumored to exist years before being discovered. They can dig up exclusive golden items when they are walked.",
        "price": 10,
        "date": "November 2013"
    }, {
        "categories": ["Adoptable", "Mythical Puffle Creature", "Membership-Only"],
        "pic_url": "assets/images/ff5BlackTRexPuffle.png",
        "name": "Dinosaur",
        "description": "There are six variants: Blue Triceratops, Black T-Rex, Pink Stegosaurus, Red Triceratops, Purple T-Rex, and Yellow Stegosaurus. Rescued by time travelers. They can dig up exclusive prehistoric items when they are walked.",
        "price": null,
        "date": "January 2014/Age of the dinosaurs"
    }, {
        "categories": ["Adoptable", "Mythical Puffle Creature", "Membership-Only"],
        "pic_url": "assets/images/cc3Puffle_2014_Transformation_Player_Card_Blue_Border_Collie.png",
        "name": "Border Collie",
        "description": "Full of energy, they are always up for a walk or playing fetch. Just watch out for their slobbery kisses. They can dig up exclusive items and exclusive prehistoric items when they are walked.",
        "price": 800,
        "date": "April 2014"
    }, {
        "categories": ["Adoptable", "Mythical Puffle Creature", "Membership-Only"],
        "pic_url": "assets/images/66ePuffle_2014_Transformation_Player_Card_Orange_Tabby_Cat.png",
        "name": "Tabby Cat",
        "description": "Always curious, they will get into almost anything. They love high places and being the center of attention. They can dig up exclusive items and exclusive prehistoric items when they are walked.",
        "price": 800,
        "date": "April 2014"
    }, {
        "categories": ["Adoptable", "Mythical Puffle Creature", "Membership-Only"],
        "pic_url": "assets/images/44dSnowman_Puffle_up-close.png",
        "name": "Snowman",
        "description": "Artificial puffles made out of snow who resemble Olaf, and were created by Elsa. They can dig up exclusive items and exclusive prehistoric items when they are walked.",
        "price": null,
        "date": "August 2014"
    }, {
        "categories": ["Adoptable", "Mythical Puffle Creature", "Membership-Only"],
        "pic_url": "assets/images/ff3DWkiQRl.png",
        "name": "Ghost",
        "description": "Supernatural puffles that were lurking in the Puffle Hotel when it was haunted by Skip during the Halloween Party 2014. They can fly, and pass through anything.",
        "price": null,
        "date": "October 2014"
    }, {
        "categories": ["Adoptable", "Mythical Puffle Creature", "Membership-Only"],
        "pic_url": "assets/images/ddePuffle_yellow1020_paper.png",
        "name": "Yellow Unicorn",
        "description": "Found deep in the Wilderness. They were Adoptable in the mobile application Puffle Wild and at the Puffle Wild room. Other variants appeared at the Medieval Party 2013.",
        "price": 800,
        "date": "November 2014"
    }, {
        "categories": ["Adoptable", "Mythical Puffle Creature", "Membership-Only"],
        "pic_url": "assets/images/008Puffle_white1014_paper.png",
        "name": "Rabbit",
        "description": "Found deep in the Wilderness. They were Adoptable in the mobile application Puffle Wild and at the Puffle Wild room. They have large ears. A not Adoptable purple variant can be seen in the Puffle Wild loading screen.",
        "price": 800,
        "date": "November 2014"
    }, {
        "categories": ["Adoptable", "Mythical Puffle Creature", "Membership-Only"],
        "pic_url": "assets/images/ddePuffle_orange1009_paper.png",
        "name": "Raccoon",
        "description": "Found deep in the Wilderness. They were Adoptable in the mobile application Puffle Wild and at the Puffle Wild room.",
        "price": 800,
        "date": "November 2014"
    }, {
        "categories": ["Adoptable", "Mythical Puffle Creature", "Membership-Only"],
        "pic_url": "assets/images/001Puffle_black1017_paper.png",
        "name": "Deer",
        "description": "Found deep in the Wilderness. They were Adoptable in the mobile application Puffle Wild and at the Puffle Wild room. They were first seen in the first version of another mobile app, Sled Racer.",
        "price": 800,
        "date": "November 2014"
    }, {
        "categories": ["Adoptable", "Mythical Puffle Creature", "Membership-Only"],
        "pic_url": "assets/images/ff0Blue_Crystal_Puffle_smiling.png",
        "name": "Blue Crystal",
        "description": "Magic flying crystalline puffles, brought by Merry Walrus. Six of these puffles pull the Merry Walrus' sleigh, one of them is Enrique, from the We Wish You a Merry Walrus TV special.",
        "price": null,
        "date": "December 2014"
    }, {
        "categories": ["Adoptable", "Mythical Puffle Creature", "Membership-Only"],
        "pic_url": "assets/images/884Green_Alien_Puffle.png",
        "name": "Alien",
        "description": "Came from outer space. They abduct penguins to their UFO temporarily. During Operation: Crustacean, non-members could adopt the green variant.",
        "price": null,
        "date": "November 2015"
    }, {
        "categories": [],
        "pic_url": "assets/images/ffaCatnewartwork.png",
        "name": "Purple Turkish Van Cat",
        "description": "A drawing of it was discovered in the Doodle Dimension at the April Fools' Party 2012. A real one is in the video Puffle Trouble among a crowd of puffles. A picture of it could be seen in Jangrah's igloo in the Club Penguin: Monster Beach Party TV special.",
        "date": "Club Penguin: Monster Beach Party",
        "price": null
    }, {
        "categories": [],
        "pic_url": "assets/images/88fBat_Puffle_2013.png",
        "name": "Bat",
        "description": "One was seen through the Mansion Attic telescope of the Halloween Party 2012. Featured on the Puffle Bat Key Pin, the Puffle Bat Tee and the Halloween Tee. Members could turn into one during Halloween Parties 2013 and 2016 by dancing as a vampire.",
        "date": "Club Penguin: Halloween Panic!",
        "price": null
    }, {
        "categories": [],
        "pic_url": "assets/images/33eReindeer_Puffle_laughing.png",
        "name": "Reindeer",
        "description": "Members could transform into one during the Holiday Party 2012 by eating its magic cookie. Featured on the Holiday Cookies Pin as a cookie, and on the Reindeer Puffle Sweater as a silhouette. A decoration featuring a red-nosed reindeer puffle could be seen at the Dock during the Holiday Party 2013. Two real ones appear on the Puffle Wild loading screen. They are slightly larger than ordinary puffles.",
        "date": "Puffle Wild loading screen",
        "price": null
    }, {
        "categories": [],
        "pic_url": "assets/images/994Green_Puffle_Dragon.png",
        "name": "Dragon",
        "description": "Rumored due to an appearance in a foreign Club Penguin Magazine issue. Members could transform into the green and blue variants during the Medieval Party 2013 by using their respective potion.",
        "date": "Club Penguin: Halloween Panic!",
        "price": null
    }, {
        "categories": [],
        "pic_url": "assets/images/990Unicorn_Puffle_artwork.png",
        "name": "Unicorn",
        "description": "Members could transform into the white and black variants during the Medieval Party 2013 by using their respective potion. The yellow variant was Adoptable.",
        "date": "Puffle Wild",
        "price": null
    }, {
        "categories": [],
        "pic_url": "assets/images/115Chicken_Puffle_Artwork.png",
        "name": "Chicken",
        "description": "Members were able to transform into one during the Medieval Party 2013 when failing a potion recipe. During the Muppets World Tour, penguins who joined a member's Salad Tongs act became a chicken puffle until the act ended. It has its own official music video.",
        "date": "Muppets World Tour",
        "price": null
    }],
    filter: {
        categories: [],
        search: ""
    },
    sort: {
        by : "name",
        ascendant: true
    }
};

function chooseSort(t) {

    if (t === data.sort.by) data.sort.ascendant ^= true;
    if (["name", "colors", "price"].includes(t)) data.sort.by = t;

    populateTable("shop");
}

function chooseFilter(f) {
    let r = new Set();
    let t = [];

    f.forEach(c => {
        if (data.categories.includes(c)) r.add(c);
    });

    t = [...document.getElementsByTagName("input")].map(i => i.checked = f.includes(i.name));

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
    let r = (p.categories.length == 0 && data.filter.categories.length == 0);
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
        <th>Image</th>
        <th onclick="chooseSort('name')">Name</th>
        <th>Categories</th>
        <th onclick="chooseSort('price')">Price</th>
        <th>Description</th>
        <th>Apparition Date</th>
    </tr>`;

    temp_puffles.forEach(p => {
        el.innerHTML += `
    <tr>
        <td><img class="shop" src="${p.pic_url}"</td>
        <td>${p.name}</td>
        <td class="puff-cat">${p.categories.map(c => "<span>" + c + "</span>").join("")}</td>
        <td>${p.price ?? ""}</td>
        <td>${p.description}</td>
        <td>${p.date}</td>
    </tr>`
    });
}

function populateMenu(el) {
    if (!(el = document.getElementById(el))) return;
    data.categories.forEach(c => {
        let sub = el.children[0].cloneNode(true);
        sub.children[0].innerText = c;
        sub.children[0].href = `javascript:chooseFilter(["${c}"])`;
        el.appendChild(sub);
    })
}

window.onload = () => {
    let categories = new Set();
    let e = document.getElementById("categories");
    e.innerHTML = "";

    data.puffles.forEach(p => {
        if (p.categories.length == 0) p.categories.push("Other");

        p.categories.forEach(c => {
            categories.add(c);
        });
    });
    data.categories = [...categories];
    data.filter.categories = [...categories];
    data.categories.forEach(c => {
        e.innerHTML += `<div><input onclick="search()" type="checkbox" name="${c}" checked><label for="${c}">${c}</label></div>`
    })
    populateTable("shop");
    populateMenu("categories-submenu");
}