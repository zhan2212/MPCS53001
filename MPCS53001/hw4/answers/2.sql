select name,
       char_length(name) as namelen
from games
where minplayers = 3
  and maxplayers = 5
order by char_length(name) desc
limit 10