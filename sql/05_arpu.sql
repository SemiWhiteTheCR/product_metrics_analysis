SELECT
    ROUND(COALESCE(SUM(p.amount), 0) / COUNT(DISTINCT u.user_id), 2) AS arpu
FROM users u
LEFT JOIN payments p
    ON u.user_id = p.user_id;
