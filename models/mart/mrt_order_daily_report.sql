SELECT DATE_TRUNC(order_created_at, DAY) AS reporting_date,
    2 as column_2,
	1 as column_1,
	3 as column_3,
	4 as column_4,
	5 as column_5,
	6 as coluln_6,
    mapping.account_manager,
    mapping.state,
    COUNT(DISTINCT order_id) AS total_orders,
    AVG(total_distinct_items) AS average_total_distinct_items,
    SUM(sum_feedback_score) / SUM(total_feedbacks) AS average_feedback_score,
    AVG(total_order_amount) AS average_total_order_amount
FROM {{ ref('int_sales_database__order') }} AS orders
LEFT JOIN {{ ref('stg_google_sheets__account_manager_region_mapping') }} as mapping ON orders.user_state = mapping.state
GROUP BY report_date,
    account_manager,
    state