
## Query jobs associted with category

``` SQL
SELECT jobs.name FROM jobs INNER JOIN job_to_cat ON jobs.id=job_to_cat.job_id WHERE category_id={category_id};
```