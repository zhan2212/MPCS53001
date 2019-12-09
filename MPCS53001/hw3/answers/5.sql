select *
from
  (select avg(avgscore) as avg,
          maxplayers
   from games
   group by maxplayers
   order by maxplayers) as table1
where avg > 6