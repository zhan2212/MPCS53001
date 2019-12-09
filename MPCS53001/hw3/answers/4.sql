select avg(avgscore) as avg,
       maxplayers
from games
group by maxplayers
order by maxplayers