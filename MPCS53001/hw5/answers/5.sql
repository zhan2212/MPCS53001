with temp1 as
  (select avg(review.stars),
          review.user_id
   from
     (select count(review_id),
             user_id
      from review
      join users using (user_id)
      group by user_id
      having count(review_id) >= 50) as t1
   inner join review on t1.user_id = review.user_id
   group by review.user_id
   order by avg(review.stars) asc
   limit 1)
   
select temp1.user_id as user_id,
       users.name as user_name,
       review.business_id as business_id,
       business.name as business_name
from temp1
left outer join review on temp1.user_id = review.user_id
left outer join users on review.user_id = users.user_id
left outer join business on review.business_id = business.business_id
order by review.stars desc
limit 1
