with temp1 (business_id, user_id) as
(select review.business_id as business_id,
       review.user_id as user_id
from
  (select count(review_id),
          user_id
   from review join users using (user_id)
   group by user_id
   having count(review_id) >= 200) as t1
inner join review on t1.user_id = review.user_id)


select t1.user_id as user_id1,
       t2.user_id as user_id2,
       count(t1.business_id) as similarity
from temp1 as t1
cross join temp1 as t2
where t1.user_id != t2.user_id
  and t1.business_id = t2.business_id
  
group by (t1.user_id, t2.user_id)
order by count(t1.business_id) desc
limit 1
