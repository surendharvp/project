-- Insert sample skills
INSERT INTO skills (name, category, description) VALUES
('Web Development', 'Technology', 'Full-stack web development services'),
('Graphic Design', 'Design', 'Professional graphic design services'),
('Language Teaching', 'Education', 'Language tutoring and instruction'),
('Home Repair', 'Maintenance', 'General home maintenance and repair'),
('Photography', 'Creative', 'Professional photography services');

-- Insert sample users (password is 'password123' hashed with BCrypt)
INSERT INTO users (email, password, name, time_balance, location, bio, rating) VALUES
('john@example.com', '$2a$10$rS.rJMR6YZvwxHG6hHzW8.KNFv4QK.WJ8l8K6z5pfQW.TWzUVx9hy', 'John Doe', 20, 'New York', 'Experienced web developer', 4.8),
('jane@example.com', '$2a$10$rS.rJMR6YZvwxHG6hHzW8.KNFv4QK.WJ8l8K6z5pfQW.TWzUVx9hy', 'Jane Smith', 15, 'Los Angeles', 'Professional designer', 4.9);

-- Link users with skills
INSERT INTO user_skills (user_id, skill_id, proficiency_level, hourly_rate) VALUES
(1, 1, 'Expert', 50),
(1, 2, 'Intermediate', 40),
(2, 2, 'Expert', 45),
(2, 3, 'Advanced', 35);