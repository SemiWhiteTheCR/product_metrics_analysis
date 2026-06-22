WITH signup_cohort AS (
    SELECT user_id, signup_date
    FROM users
),
returned_users AS (
    SELECT DISTINCT
        u.user_id,
        u.signup_date
    FROM signup_cohort u
    JOIN events e
        ON e.user_id = u.user_id
       AND e.event_time::date = u.signup_date + INTERVAL '7 day'
)
SELECT
    s.signup_date,
    COUNT(DISTINCT s.user_id) AS cohort_size,
    COUNT(DISTINCT r.user_id) AS retained_users,
    ROUND(
        100.0 * COUNT(DISTINCT r.user_id) / COUNT(DISTINCT s.user_id),
        2
    ) AS retention_day_7_pct
FROM signup_cohort s
LEFT JOIN returned_users r
    ON s.user_id = r.user_id
GROUP BY s.signup_date
ORDER BY s.signup_date;
