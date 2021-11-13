select b.name, count(c.id)
from customer c 
join broker b on (c.broker_id = b.id)
group by b.id
order by count(c.id) desc, b.name