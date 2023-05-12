CREATE TABLE User (
    id SERIAL PRIMARY KEY,
    name VARCHAR(55),
    photo VARCHAR(255),
    updated_at DATE,
    created_at DATE,
    bio VARCHAR(55),
    posts_counter INTEGER
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  text TEXT,
  comments_counter INTEGER DEFAULT 0,
  likes_counter INTEGER DEFAULT 0,
  author_id INTEGER NOT NULL REFERENCES users(id),
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE Like (
    id SERIAL PRIMARY KEY,
    author_id INTEGER REFERENCES User(id),
    post_id INTEGER REFERENCES Post(id),
    created_at DATE,
    updated_at DATE,
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