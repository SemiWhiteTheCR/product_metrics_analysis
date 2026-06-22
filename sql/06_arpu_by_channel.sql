SELECT
    u.acquisition_channel,
    ROUND(COALESCE(SUM(p.amount), 0), 2) AS revenue,
    COUNT(DISTINCT u.user_id) AS users_count,
    ROUND(COALESCE(SUM(p.amount), 0) / COUNT(DISTINCT u.user_id), 2) AS arpu
FROM users u
LEFT JOIN payments p
    ON u.user_id = p.user_id
GROUP BY u.acquisition_channel
ORDER BY arpu DESC;
