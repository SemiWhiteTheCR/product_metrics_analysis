WITH user_steps AS (
    SELECT
        user_id,
        MAX(CASE WHEN event_name = 'signup' THEN 1 ELSE 0 END) AS step_signup,
        MAX(CASE WHEN event_name = 'view_product' THEN 1 ELSE 0 END) AS step_view_product,
        MAX(CASE WHEN event_name = 'add_to_cart' THEN 1 ELSE 0 END) AS step_add_to_cart,
        MAX(CASE WHEN event_name = 'purchase' THEN 1 ELSE 0 END) AS step_purchase
    FROM events
    GROUP BY user_id
),
funnel_counts AS (
    SELECT 'signup' AS step, COUNT(*) FILTER (WHERE step_signup = 1) AS users_count FROM user_steps
    UNION ALL
    SELECT 'view_product', COUNT(*) FILTER (WHERE step_view_product = 1) FROM user_steps
    UNION ALL
    SELECT 'add_to_cart', COUNT(*) FILTER (WHERE step_add_to_cart = 1) FROM user_steps
    UNION ALL
    SELECT 'purchase', COUNT(*) FILTER (WHERE step_purchase = 1) FROM user_steps
)
SELECT
    step,
    users_count,
    ROUND(
        100.0 * users_count / FIRST_VALUE(users_count) OVER (
            ORDER BY CASE step
                WHEN 'signup' THEN 1
                WHEN 'view_product' THEN 2
                WHEN 'add_to_cart' THEN 3
                WHEN 'purchase' THEN 4
            END
        ),
        2
    ) AS conversion_from_start_pct
FROM funnel_counts
ORDER BY CASE step
    WHEN 'signup' THEN 1
    WHEN 'view_product' THEN 2
    WHEN 'add_to_cart' THEN 3
    WHEN 'purchase' THEN 4
END;
