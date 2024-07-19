-- using 1721416318 as a seed to the RNG


select
	l_orderkey,
	sum(l_extendedprice * (1 - l_discount)) as revenue,
	o_orderdate,
	o_shippriority
from
	customer,
	orders,
	lineitem
where
	c_mktsegment = ''
	and c_custkey = o_custkey
	and l_orderkey = o_orderkey
	and o_orderdate < date ''
	and l_shipdate > date ''
group by
	l_orderkey,
	o_orderdate,
	o_shippriority
order by
	revenue desc,
	o_orderdate;
set rowcount 10
go

