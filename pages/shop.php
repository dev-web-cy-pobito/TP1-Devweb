<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
    <head>
<?php include_once '../partials/head.inc.php'; ?>
<script src="assets/js/puffles.js"></script>
    </head>
    <body>
        <?php include_once '../partials/navbar.inc.php'; ?>

        <div id="vertical-center">
            <div id="menu" class="column-left inline vl">
                <?php include_once '../partials/menu.inc.php'; ?>
                <h4 class="box-title">Categories</h4>
                <nav class="v-menu">
                    <ul id="categories-submenu">
                        <li><a href="javascript:chooseFilter(data.categories.map(i => {return i.id.toString();}))">All of our Puffles</a></li>
                    </ul>
                </nav>
            </div>
            <div id="main" class="column-right inline floating-container">
                <h1>Home</h1>
                <div class="content">
                
                    <div class="col-full">
                        <label>Search</label>
                        <input id="search" oninput="searchTxt()" type="text">
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
<?php include_once '../partials/footer.inc.php'; ?>

    </body>

</html>