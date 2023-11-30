CREATE DATABASE IF NOT EXISTS music_app;

USE music_app;

CREATE TABLE IF NOT EXISTS artists (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(100) NOT NULL,
    born VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS albums (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    release_year INT,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE IF NOT EXISTS songs (
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    duration INT,
    genre INT,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS subscription_plans (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS subscriptions (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_premium BOOLEAN DEFAULT FALSE,
    plan_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (plan_id) REFERENCES subscription_plans(plan_id)
);

CREATE TABLE IF NOT EXISTS customer_songs (
    customer_song_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    song_id INT,
    play_count INT DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

