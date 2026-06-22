DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    signup_date DATE NOT NULL,
    acquisition_channel VARCHAR(50)
);

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    event_name VARCHAR(50) NOT NULL,
    event_time TIMESTAMP NOT NULL
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    payment_time TIMESTAMP NOT NULL,
    amount NUMERIC(10,2) NOT NULL CHECK (amount >= 0)
);
