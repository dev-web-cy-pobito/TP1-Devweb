<?php

include_once "../config.php";

mysqli_report(MYSQLI_REPORT_ALL);

/**
 * Database class
 */
class DB {
    private $con;
    private $tables;
    private $db;

    /**
     * Constructor class
     */
    public function __construct($url = null, $db = null, $user = null, $pass = null) {

        $conn = new mysqli($url ?? $_SERVER["config"]["db_host"], $user ?? $_SERVER["config"]["db_username"], $pass ?? $_SERVER["config"]["db_password"], $db ?? $_SERVER["config"]["db_database"]);

        if ($conn->connect_error) {
            throw new RuntimeException("Connection failed: " . $conn->connect_error);
            die("Connection failed: " . $conn->connect_error);

        } else {

            $this->db = $db;
            $this->con = $conn;
            $this->tables = $this->getAllTables();

        }
    }

    /**
     * Returns connection object
     */
    public function getConnection() {
        return $this->con;
    }

    /**
     * Generates mysqli bind_param character for one value
     */
    public function getCharType($value ) {
        if (strcmp(gettype($value), "integer") == 0) {
            return "i";
        } else if (strcmp(gettype($value), "double") == 0) {
            return "d";
        } else {
            return "s";
        }
    }

    /**
     * Generates mysqli bind_param character for array of values
     */
    public function getStrtype($values) {
        $strtype = "";
        foreach ($values as $value) {
            $strtype .= $this->getCharType($value);
        }
        return $strtype;
    }

    /**
     * Gets all tables from database
     */
    private function getAllTables() {
        $r = $this->con->prepare("SELECT table_name FROM information_schema.tables WHERE table_schema = ?");
        $r->bind_param("s", $this->db);
        $r->execute();
        $r = $r->get_result()->fetch_all();

        return array_map(function($a) {
            return $a[0];
        }, $r);
    }

    /**
     * Whenever a table exists
     */
    private function tableExists($table) {
        if (sizeof($this->tables) == 0) throw new RuntimeException("No tables found");
        return in_array($table, $this->tables);
    }

    /**
     * Gets all columns from table
     */
    public function getAllColumns($table) {
        if ($this->tableExists($table)) {
            $r = $this->con->prepare("SHOW COLUMNS from ${table}");
            $r->execute();
            $r = $r->get_result()->fetch_all();

            return array_map(function($a) {
                return $a[0];
            }, $r);
        } else {
            throw new RuntimeException("Table ${table} does not exist");
        }
    }

    /**
     * Whenever a column exists in a table
     */
    public function columnExists($table, $column) {
        if ($this->tableExists($table)) {
            return in_array($column, $this->getAllColumns($table));
        }
        return false;
    }

    /**
     * Perform a basic select query for a table, a column and a value
     */
    public function getBy($table, $key, $value) {

        if ($this->columnExists($table, $key)) {
            $r = $this->con->prepare("select * from ${table} where ${key}=?;");
            $r->bind_param($this->getCharType($value), $value);
            $r->execute();
            return $r->get_result()->fetch_all(MYSQLI_ASSOC);
        } else {
            throw new RuntimeException("Table ${table} does not exist");
        }
        
    }

    public function checkData($data, $table) {
        $columns = $this->getAllColumns($table);

        $d = array_keys($data);

        // TODO:  check data
        return true;
    }

    public function setSimpleValues($table, $data, $id = false, $ignore = false, $unique = false) {
        
        if ($this->checkData($data, $table)) {

            $sql = "insert" . (($ignore == true) ? " ignore " : " " ) . "into ${table} (" . implode(", ", array_keys($data)) . ") values (" . implode(", ", array_map(function($a) {return "?";}, $data)) . ")" . (($id != false) ? " where id = ?;" : ";");
            
            $r = $this->con->prepare($sql);

            $r->bind_param($this->getStrtype(array_values($data)), ...array_values($data));
            if ($id != false) {
                $r->bind_param($this->getCharType($id), $id);
            }

            $r->execute();
            return $r->get_result();
        }
        return false;
    }

    public function getLastInsertId(){
        return mysqli_insert_id($this->getConnection());
    }

    /**
     * Perform a basic unique select query for a table, a column and a value
     */
    public function getOneBy($table, $key, $value) {
        $r = $this->getBy($table, $key, $value);
        if (sizeof($r) > 0) {
            return $r[0];
        }
        return null;
    }

    /**
     * Get columns from table and all thier content
     */
    public function getRowsByColumns($table, $columns) {
        foreach ($columns as $column) {
            if (!$this->columnExists($table,$column)) {
                throw new RuntimeException("Column ${column} does not exist in ${table}");
            }
        }
        $r = $this->con->prepare("select ". implode(", ", $columns) ." from ${table}");
        $r->execute();
        return $r->get_result()->fetch_all(MYSQLI_ASSOC);
    }
}
