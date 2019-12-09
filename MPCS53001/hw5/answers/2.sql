select avg(stars) as avg
from review
inner join
  (select users.user_id
   from users
   inner join
     (select user_id,
             count(review_id) as review_count
      from review
      group by user_id) as t1 on users.user_id = t1.user_id
   order by review_count desc, name asc
   limit 10) as t2 on review.user_id = t2.user_id;