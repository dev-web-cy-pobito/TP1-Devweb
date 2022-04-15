# Devweb - Moldovan Alexandru & Rodrigues Samuel

Projet devweb

Live version : https://alex.by-cy.tech/

## Initialization

MySQL connection settings can be edited in `php/config.php`

To create an empty database, you can source `mysql/init.sql`
To create a ready-to-go database, you can source `mysql/populate.sql`
To delete all data, you can source `mysql/drop.sql`

Alternative filling solution is using `php/fill_db.php`, but requires special web server mounting;

Webserver is to be mounted in the `pages` folder.
Due to lack of SMTP servers, the contact form does check user input but sends it back to the user so he can send it himself instead.

Passwords must contain one capital (ex. Paris, London...).

# Not associated with Disney

> all Puffle Data & images are provided by the Club Penguin Fandom Wiki. Credit due to the original authors
> https://clubpenguin.fandom.com/wiki/Puffle

> all French job details provided by Pôle Emploi and sourced from http://www.nosdonnees.fr/dataset/51f20c04-79e5-471c-bdcc-6ed91757122b/resource/a4031fcf-0ded-47df-9d88-870c06c8321e/download/codesrometree.xls.json
