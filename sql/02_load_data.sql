COPY users(user_id, signup_date, acquisition_channel)
FROM 'dataset/users.csv'
DELIMITER ',' CSV HEADER;

COPY events(event_id, user_id, event_name, event_time)
FROM 'dataset/events.csv'
DELIMITER ',' CSV HEADER;

COPY payments(payment_id, user_id, payment_time, amount)
FROM 'dataset/payments.csv'
DELIMITER ',' CSV HEADER;
