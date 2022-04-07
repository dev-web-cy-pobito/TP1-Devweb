<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
    <head>
<?php include_once '../partials/head.inc.php'; ?>
    </head>

    <body>

        <div id="header" class="dark-bg">
            <img class="logo" src="assets/images/logo.png">
            <div class="title">
                <h1 class="title">Puffles</h1>
            </div>
            <nav class="h-menu">
                <ul>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="shop.php">Shop</a></li>
                    <li><a href="contact.php">Contact</a></li>
                </ul>
            </nav>
        </div>

        <div id="vertical-center">
            <div id="menu" class="column-left inline vl">
                <h1 class="box-title">Menu</h1>
                <nav class="v-menu">
                    <ul>
                        <li><a href="index.php">Home</a></li>
                        <li><a href="shop.php">Shop</a></li>
                        <li><a href="contact.php">Contact</a></li>
                    </ul>
                </nav>
            </div>
            <div id="main" class="column-right inline floating-container">
                <h1>Home</h1>
                <div class="content">
                    <p>Puffles were Club Penguins' adorable furry companions. Once adopted, a puffle would follow you along the penguin island and take part different activities with you.
                        <br><br>Every puffle being different and having its own personnality, there is a puffle for everyone.
                        <br><br>An adopted puffle can live at your igloo, can follow you around or can chill in your backyard. Don't forget you are rensponsible for their well-being !
                        <br><br>Puffles can be taken care of by feeding them, playing with them, washing them, walking them, buying them toys and furniture or plenty of other island game or activities
                        <br><br>Our website gives you the ability of adopting your new pet & friend !
                    </p>
                </div>
            </div>
        </div>
<?php include_once '../partials/footer.inc.php'; ?>

    </body>

    </html>