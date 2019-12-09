with temp(maxtime, category2) as
  (select max(maxplaytime),
          category
   from designers
   join desgame on designers.des_id = desgame.des_id
   join games on desgame.g_id = games.g_id
   join gamecat on games.g_id = gamecat.g_id
   join categories on gamecat.c_id = categories.c_id
   group by category)
  (select distinct designer,
                   category,
                   maxtime as max
   from temp
   join categories on category2 = category
   join gamecat on gamecat.c_id = categories.c_id
   join games on gamecat.g_id = games.g_id
   join desgame on games.g_id = desgame.g_id
   join designers on desgame.des_id = designers.des_id
   where games.maxplaytime = maxtime
     and category2 = category
   order by category desc)