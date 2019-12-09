select min(minplaytime)/60.0 as minhours,
       max(maxplaytime)/60.0 as maxhours,
       minplayers,
       maxplayers
from games
group by minplayers, maxplayers
order by minplayers, maxplayers