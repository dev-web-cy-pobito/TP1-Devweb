<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/puffles.js"></script>
    <title>Shop</title>
</head>

<body>

    <div id="header" class="dark-bg">
        <img class="logo" src="assets/images/logo.png">
        <div class="title">
            <h1 class="title">Puffles</h1>
        </div>
        <nav class="h-menu">
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="shop.html">Shop</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </nav>
    </div>

    <div id="vertical-center">
        <div id="menu" class="column-left inline vl">
            <h1 class="box-title">Menu</h1>
            <nav class="v-menu">
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="shop.html">Shop</a></li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>
            </nav>
            <h4 class="box-title">Categories</h4>
            <nav class="v-menu">
                <ul id="categories-submenu">
                    <li><a href="javascript:chooseFilter(data.categories)">All of our Puffles</a></li>
                </ul>
            </nav>
        </div>
        <div id="main" class="column-right inline floating-container">
            <h1>Home</h1>
            <div class="content">
            
                <div class="col-full">
                    <label>Search</label>
                    <input id="search" oninput="search()" type="text">
                    <div id="categories" class="inline">
                        <!-- To be generated -->
                    </div>
                </div>
                <div class="shop">
                    <table id="shop">
                        <!-- To be generated -->
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div id="footer" class="dark-bg">
        <p class="footer">Copyright : Puffle&co ©</p>
        <p class="footer">Webmasters : Alex & Sam</p>
    </div>

</body>

</html>