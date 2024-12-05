-- Users table
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    time_balance INTEGER DEFAULT 0,
    profile_image_url VARCHAR(255),
    location VARCHAR(255),
    bio TEXT,
    rating DECIMAL(3,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Skills table
CREATE TABLE skills (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User Skills mapping table
CREATE TABLE user_skills (
    user_id BIGINT REFERENCES users(id),
    skill_id BIGINT REFERENCES skills(id),
    proficiency_level VARCHAR(50) NOT NULL,
    hourly_rate INTEGER,
    verified BOOLEAN DEFAULT false,
    verification_date TIMESTAMP,
    PRIMARY KEY (user_id, skill_id)
);

-- Service Requests table
CREATE TABLE requests (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id),
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    estimated_hours INTEGER NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'open',
    category VARCHAR(100),
    skill_id BIGINT REFERENCES skills(id),
    location VARCHAR(255),
    remote_possible BOOLEAN DEFAULT false,
    deadline TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bids table
CREATE TABLE bids (
    id BIGSERIAL PRIMARY KEY,
    request_id BIGINT REFERENCES requests(id),
    provider_id BIGINT REFERENCES users(id),
    amount INTEGER NOT NULL,
    message TEXT,
    status VARCHAR(50) NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Transactions table
CREATE TABLE transactions (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id),
    request_id BIGINT REFERENCES requests(id),
    bid_id BIGINT REFERENCES bids(id),
    type VARCHAR(50) NOT NULL,
    amount INTEGER NOT NULL,
    description TEXT,
    status VARCHAR(50) NOT NULL DEFAULT 'completed',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Messages table
CREATE TABLE messages (
    id BIGSERIAL PRIMARY KEY,
    sender_id BIGINT REFERENCES users(id),
    recipient_id BIGINT REFERENCES users(id),
    request_id BIGINT REFERENCES requests(id),
    content TEXT NOT NULL,
    read BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_requests_user_id ON requests(user_id);
CREATE INDEX idx_requests_status ON requests(status);
CREATE INDEX idx_bids_request_id ON bids(request_id);
CREATE INDEX idx_transactions_user_id ON transactions(user_id);
CREATE INDEX idx_messages_sender_recipient ON messages(sender_id, recipient_id);