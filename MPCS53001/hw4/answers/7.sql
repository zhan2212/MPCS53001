with temp (category, maxplaytime) as
  (select category,
          max(maxplaytime) as maxplaytime
   from (designers
         natural join desgame
         natural join games
         natural join gamecat
         natural join categories)
   group by category)
   
select designer,
       category,
       maxplaytime as max
from temp
natural join designers
natural join desgame
natural join games
natural join gamecat
natural join categories
order by category desc