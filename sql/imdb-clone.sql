create table items as
select x as id, 'x-' || x as name
from generate_series(1, 10) x;
