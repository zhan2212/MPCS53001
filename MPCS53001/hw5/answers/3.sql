select count(business_id) as count
from
  (select distinct business.business_id
   from business
   left outer join review on business.business_id = review.business_id
   where review is null) as t1;