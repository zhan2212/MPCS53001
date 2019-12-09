select users.user_id as user_id,
       name,
       review_count
from users
inner join
  (select user_id,
          count(review_id) as review_count
   from review
   group by user_id) as t1 on users.user_id = t1.user_id
order by review_count desc, name asc
limit 10;