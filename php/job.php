<?php

include_once "db.php";

class Jobs {
    private DB $db;

    public function __construct(DB $db) {
        $this->db = $db;
    }

    private function getCats($with_id = false) {
        return $this->db->getColumns('job_cats',$with_id ? ['id','name'] : ['name']);
    }

    private function getJobsFromCatId($cat_id) {
        $r = $this->db->getConnection()->prepare("SELECT jobs.name FROM jobs INNER JOIN job_to_cat ON jobs.id=job_to_cat.job_id WHERE category_id=${cat_id};");
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