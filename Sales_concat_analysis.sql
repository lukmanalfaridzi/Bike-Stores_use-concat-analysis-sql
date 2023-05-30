SELECT
  ord.order_id,
  CONCAT(cust.first_name, ' ', cust.last_name) AS customers,
  cust.city,
  cust.state,
  ord.order_date,
  SUM(ite.quantity) AS total_units,
  SUM(ite.quantity * ite.list_price) AS Revenue,
  pro.product_name,
  cat.category_name,
  sto.store_name,
  CONCAT (sta.first_name,' ', sta.last_name) AS sales_rep
FROM sales.orders AS ord
JOIN sales.customers AS cust
ON ord.customer_id = cust.customer_id
JOIN sales.order_items AS ite
ON ord.order_id = ite.order_id
JOIN production.products AS pro
ON ite.product_id = pro.product_id
JOIN production.categories AS cat
ON pro.category_id = cat.category_id 
JOIN sales.stores AS sto
ON ord.store_id = sto.store_id
JOIN sales.staffs AS sta	
ON ord.staff_id = sta.staff_id
GROUP BY
	  ord.order_id,
	  CONCAT(cust.first_name, ' ', cust.last_name),
	  cust.city,
	  cust.state,
	  ord.order_date,
	  pro.product_name,
	  cat.category_name,
	  sto.store_name,
	  CONCAT (sta.first_name,' ', sta.last_name)
