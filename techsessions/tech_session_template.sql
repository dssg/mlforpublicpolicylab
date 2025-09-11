SELECT
    projectid,

    total_price_excluding_optional_support,
    students_reached,

    school_charter AS charter,
    school_magnet AS magnet,
    school_year_round AS year_round,
    school_nlns AS nlns,
    school_kipp AS kipp,
    school_charter_ready_promise AS charter_ready,

    CASE WHEN resource_type = 'Books' THEN 1 ELSE 0 END AS resource_books,
    CASE WHEN resource_type = 'Technology' THEN 1 ELSE 0 END AS resource_tech,
    CASE WHEN resource_type = 'Supplies' THEN 1 ELSE 0 END AS resource_supplies,

    CASE WHEN poverty_level = 'highest poverty' THEN 1 ELSE 0 END AS poverty_highest,
    CASE WHEN poverty_level = 'high poverty' THEN 1 ELSE 0 END AS poverty_high,
    CASE WHEN poverty_level IN ('moderate poverty', 'low poverty') THEN 1 ELSE 0 END AS poverty_lower

FROM {table_schema}.{table_name}
WHERE 
    school_state IN ({state_list})
    AND
    date_posted::DATE BETWEEN '{start_dt}'::DATE AND '{end_dt}'::DATE
;
