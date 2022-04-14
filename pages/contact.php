<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
    <head>
<?php include_once '../partials/head.inc.php'; ?>
        <script src="assets/js/contact.js"></script>
    </head>

    <body>
<?php include_once '../partials/navbar.inc.php'; ?>

        <div id="vertical-center">
            <div id="menu" class="column-left inline vl">
                <?php include_once '../partials/menu.inc.php'; ?>
            </div>
            <div id="main" class="column-right inline floating-container">
                <h1>Contact</h1>
                <div class="content">
                    <form id="form" action="javascript:submit();">
                        <div class="contact-form">
                            <div class="col-half-left">
                                <label>First name</label>
                                <input name="first-name" placeholder="First name" type="text" required>
                            </div>
                            <div class="col-half-right">
                                <label>Last name</label>
                                <input name="last-name" placeholder="Last name" type="text" required>
                            </div>
                            <div class="col-full">
                                <label>Email Address</label>
                                <input name="mail" placeholder="example@domain.com" type="email" required>
                            </div>
                            <div class="col-full">
                                <label>Birth date</label><br>
                                <input name="date" placeholder="dd/mm/yyyy" type="date" required>
                            </div>
                            <div class="col-full">
                                <label>Gender</label><br>
                                <div class="radio">
                                    <div>
                                        <input id="male" type="radio" name="gender" value="m" checked>
                                        <label for="male">Male</label>
                                    </div>
                                    <div>
                                        <input id="female" type="radio" name="gender" value="f">
                                        <label for="female">Female</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-full">
                                <label>Your activity in France</label><br>
                                <select name="activity" id="jobs" required>
                                    <option value disabled selected>Loading...</option>
                                </select>
                            </div>
                            <div class="col-full">
                                <label>Subject</label>
                                <input placeholder="Subject" name="subject" required>
                            </div>
                            <div class="col-full">
                                <label>Message</label>
                                <textarea placeholder="Message" name="message" required></textarea>
                            </div>
                            <div class="col-full">
                                <button type="submit">Send</button>
                            </div>
                        </div>
                    </form>
 
                </div>
            </div>
        </div>
<?php include_once '../partials/footer.inc.php'; ?>

    </body>

</html>
