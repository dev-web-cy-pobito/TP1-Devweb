<?php

include_once "db.php";

class Auth {
    private $db;

    public function __construct(DB $db) {
        $this->db = $db;
    }

    public function getUser($email) {
        $r = $this->db->getOneBy("users", "email", $email);
        return $r;
    }

    public function login($email, $password) {
        $u = $this->getUser($email);
        if ($u != false) {
            if (password_verify($password, $u["password_hash"])) {
                return $u;
            }
            throw new Exception("Incorrect password.");
        }
        throw new Exception("No account with this email exists.");
    }

    private function checkPasswordFormat($pass) {

        // Verify that the password contains at least one capital city.
        $caps = ["sukhumi","kabul","episkopi cantonment","tirana","algiers","pago pago","andorra la vella","luanda","the valley","st. john's","buenos aires","yerevan","oranjestad","georgetown","canberra","vienna","baku","nassau","manama","dhaka","bridgetown","minsk","brussels","belmopan","porto-novo","hamilton","thimphu","sucre","la paz","sarajevo","gaborone","brasília","road town","bandar seri begawan","sofia","ouagadougou","bujumbura","phnom penh","yaoundé","ottawa","praia","george town","bangui","n'djamena","santiago","beijing","flying fish cove","west island","bogotá","moroni","avarua","san josé","zagreb","havana","willemstad","nicosia","prague","yamoussoukro","kinshasa","copenhagen","djibouti","roseau","santo domingo","dili","hanga roa","quito","cairo","san salvador","malabo","asmara","tallinn","addis ababa","stanley","tórshavn","palikir","suva","helsinki","paris","cayenne","papeete","libreville","banjul","tbilisi","berlin","accra","gibraltar","athens","nuuk","st. george's","hagåtña","guatemala city","st. peter port","conakry","bissau","georgetown","port-au-prince","tegucigalpa","budapest","reykjavík","new delhi","jakarta","tehran","baghdad","dublin","douglas","jerusalem","rome","kingston","tokyo","st. helier","amman","astana","nairobi","tarawa","pristina","kuwait city","bishkek","vientiane","riga","beirut","maseru","monrovia","tripoli","vaduz","vilnius","luxembourg","skopje","antananarivo","lilongwe","kuala lumpur","malé","bamako","valletta","majuro","nouakchott","port louis","mexico city","chisinau","monaco","ulaanbaatar","podgorica","plymouth","rabat","maputo","naypyidaw","stepanakert","windhoek","yaren","kathmandu","amsterdam","nouméa","wellington","managua","niamey","abuja","alofi","kingston","pyongyang","nicosia","belfast","saipan","oslo","muscat","islamabad","ngerulmud","jerusalem","panama city","port moresby","asunción","lima","manila","adamstown","warsaw","lisbon","san juan","doha","taipei","brazzaville","bucharest","moscow","kigali","gustavia","jamestown","basseterre","castries","marigot","st. pierre","kingstown","apia","san marino","riyadh","edinburgh","dakar","belgrade","victoria","freetown","singapore","philipsburg","bratislava","ljubljana","honiara","mogadishu","hargeisa","pretoria","grytviken","seoul","tskhinvali","juba","madrid","sri jayawardenapura kotte","khartoum","paramaribo","mbabane","stockholm","bern","damascus","são tomé","dushanbe","dodoma","bangkok","lomé","nukuʻalofa","tiraspol","port of spain","edinburgh of the seven seas","tunis","ankara","ashgabat","cockburn town","funafuti","kampala","kiev","abu dhabi","london","washington, d.c.","charlotte amalie","montevideo","tashkent","port vila","vatican city","caracas","hanoi","cardiff","mata-utu","el aaiún","sanaá","lusaka","harare"];

        return (sizeof(array_filter($caps, function ($p) use ($pass) {
            return(strpos(strtolower($pass), $p) !== false);
        })) > 0);
    }

    public function register($email, $password, $permission = 1) {

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            throw new Exception("Please use a valid email address");
        }

        if (!$this->checkPasswordFormat($password)) {
            throw new Exception("Password must contain at least one capital. (ex: Paris)");
        }

        if ($this->getUser($email) != false) {
            throw new Exception("User with this email already exists");
        }

        $this->db->setSimpleValues("users", ["email"=>$email, "password_hash" => password_hash($password, PASSWORD_DEFAULT), "permission" => $permission]);

    }
}

?>