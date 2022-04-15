        
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
                <?php if (!isset($_SESSION['user'])) { ?> 
                    <li><a class="button" href="login.php">Login</a></li>
                <?php } else { ?>
                    <li><a class="button" href="endpoints/logout.php">Logout</a></li>
                <?php } ?>
                </ul>
            </nav>
        </div>