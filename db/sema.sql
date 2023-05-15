CREATE TABLE Comment (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    post_id INTEGER,
    text VARCHAR(255) NOT NULL,
    updated_at DATETIME NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (post_id) REFERENCES Post(id)
);

CREATE TABLE Like (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    post_id INTEGER,
    updated_at DATETIME NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (post_id) REFERENCES Post(id)
);

CREATE TABLE User (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    photo VARCHAR(255) NOT NULL,
    bio VARCHAR(255) NOT NULL,
    updated_at DATETIME NOT NULL,
    created_at DATETIME NOT NULL,
    posts_counter INTEGER
);

CREATE TABLE Post (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    updated_at DATETIME NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(id)
);
