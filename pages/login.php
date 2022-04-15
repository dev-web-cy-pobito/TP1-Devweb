<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
    <head>
<?php include_once '../partials/head.inc.php'; ?>
<script src="assets/js/auth.js"></script>
    </head>

    <body>

<?php include_once '../partials/navbar.inc.php'; ?>

<div id="vertical-center">
            <!-- <div id="menu" class="column-left inline vl">
                <?php // include_once '../partials/menu.inc.php'; ?>
            </div> -->
            <div id="main" class="column-right inline floating-container">
                <div class="hidden" id="info"></div>    
            <?php if (!isset($_SESSION['user'])) { ?>
                
                <div id="login">
                    <h1 >Login</h1>
                    <div class="content">
                        <form action="javascript:login();">
                            <div class="contact-form">
                                <div class="col-full">
                                    <label>Email Address</label>
                                    <input id="login_email" name="login_email" placeholder="example@domain.com" type="email" required>
                                </div>
                                <div class="col-full">
                                    <label>Password</label>
                                    <input id="login_password" name="login_password" placeholder="password" type="password" required>
                                </div>
                                <div class="col-full">
                                    <button type="submit">Login</button> 
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
                <div id="register">
                    <h1>Register</h1>
                    <div class="content">
                        <form action="javascript:register();">
                            <div class="contact-form">
                                <div class="col-full">
                                    <label>Email Address</label>
                                    <input id="register_email" name="register_email" placeholder="example@domain.com" type="email" required>
                                </div>
                                <div class="col-full">
                                    <label>Password</label>
                                    <input id="register_password" name="register_password" placeholder="password" type="password" required>
                                </div>
                                <div class="col-half">
                                <button type="submit">Register</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <?php } else { ?>
                <h1>My Account</h1>
                <div class="content">
                </div>
                <?php } ?>
            </div>
        </div>
    
<?php include_once '../partials/footer.inc.php'; ?>
    </body>
</html>