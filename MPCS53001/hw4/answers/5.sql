select category,
       avg(avgscore) as avg
from (games
      natural join gamecat
      natural join categories)
group by category
having count(name) >= 15
order by avg desc
limit 5