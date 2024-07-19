-- using 1721416318 as a seed to the RNG


select
	sum(l_extendedprice * l_discount) as revenue
from
	lineitem
where
	l_shipdate >= date ''
	and l_shipdate < date '' + interval '1' year
	and l_discount between  - 0.01 and  + 0.01
	and l_quantity < ;
set rowcount -1
go

