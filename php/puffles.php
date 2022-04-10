<?php

include_once "db.php";

class Puffles {
    private DB $db;

    public function __construct(DB $db) {
        $this->db = $db;
    }

    public function getCats($with_id = false) {
        return $this->db->getRowsByColumns('categories',$with_id ? ['id','name'] : ['name']);
    }

    public function puffleExists($id) {
        return (null != $this->db->getOneBy('puffles', 'id', $id));
    }

    public function getPufflesFromCatsId($cats_id) {
        $r = $this->db->getConnection()->prepare("SELECT puffles.* FROM puffles
        INNER JOIN categorized_puffles 
        ON puffles.id=categorized_puffles.puffle_id
        
        "  . (empty($cats_id) ? "" : "WHERE category_id=" . implode(" OR category_id=", $cats_id)). "
        GROUP BY puffle_id;");
        $r->execute();
        return $r->get_result()->fetch_all(MYSQLI_ASSOC);
    }

    public function getOrgJobs(){
        $cats = $this->getCats(true);
        foreach ($cats as &$cat) {
            $cat['children'] = $this->getPufflesFromCatsId($cat['id']);
            unset($cat['id']);
        }
        return $cats;
    }
}

?>