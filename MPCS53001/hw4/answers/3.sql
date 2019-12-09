select c_id,
       count(name) as cnt
from (games
      natural join gamecat
      natural join categories)
group by c_id
having count(name) >= 15