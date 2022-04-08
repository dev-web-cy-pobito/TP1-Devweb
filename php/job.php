<?php

include_once "db.php";

class Jobs {
    private DB $db;

    public function __construct(DB $db) {
        $this->db = $db;
    }

    private function getCats($with_id = false) {
        return $this->db->getRowsByColumns('job_categories',$with_id ? ['id','name'] : ['name']);
    }

    public function jobExists($id) {
        return (null != $this->db->getOneBy('jobs', 'id', $id));
    }

    private function getJobsFromCatId($cat_id) {
        $r = $this->db->getConnection()->prepare("SELECT jobs.name, jobs.id FROM jobs WHERE category_id = ?;");
        $r->bind_param($this->db->getCharType($cat_id), $cat_id);
        $r->execute();
        return $r->get_result()->fetch_all(MYSQLI_ASSOC);
    }

    public function getOrgJobs(){
        $cats = $this->getCats(true);
        foreach ($cats as &$cat) {
            $cat['children'] = $this->getJobsFromCatId($cat['id']);
            unset($cat['id']);
        }
        return $cats;
    }
}

?>