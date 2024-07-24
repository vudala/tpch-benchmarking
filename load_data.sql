COPY region   FROM '/home/dbgen/generated_data/region.tbl'   (DELIMITER('|'));
COPY nation   FROM '/home/dbgen/generated_data/nation.tbl'   (DELIMITER('|'));
COPY customer FROM '/home/dbgen/generated_data/customer.tbl' (DELIMITER('|'));
COPY supplier FROM '/home/dbgen/generated_data/supplier.tbl' (DELIMITER('|'));
COPY part     FROM '/home/dbgen/generated_data/part.tbl'     (DELIMITER('|'));
COPY partsupp FROM '/home/dbgen/generated_data/partsupp.tbl' (DELIMITER('|'));
COPY orders   FROM '/home/dbgen/generated_data/orders.tbl'   (DELIMITER('|'));
COPY lineitem FROM '/home/dbgen/generated_data/lineitem.tbl' (DELIMITER('|')); 