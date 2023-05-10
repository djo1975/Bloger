CREATE TABLE User (
    id SERIAL PRIMARY KEY,
    name VARCHAR(55),
    photo VARCHAR(255),
    updated_at DATE,
    created_at DATE,
    bio VARCHAR(55),
    posts_counter INTEGER
);

CREATE TABLE Post (
    id SERIAL PRIMARY KEY,
    author_id INTEGER REFERENCES User(id),
    created_at DATE,
    updated_at DATE
);

CREATE TABLE Like (
    id SERIAL PRIMARY KEY,
    author_id INTEGER REFERENCES User(id),
    post_id INTEGER REFERENCES Post(id),
    title VARCHAR(255),
    text VARCHAR(555),
    created_at DATE,
    updated_at DATE,
    comments_counter INTEGER,
    links_counter INTEGER
);

CREATE TABLE Comment (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES User(id),
    post_id INTEGER REFERENCES Post(id),
    text VARCHAR(255),
    updated_at DATE,
    created_at DATE
);

CREATE INDEX idx_author_id ON Post(author_id);
CREATE INDEX idx_author_id ON Like(author_id);
CREATE INDEX idx_post_id ON Like(post_id);
CREATE INDEX idx_user_id ON Comment(user_id);
CREATE INDEX idx_post_id ON Comment(post_id);