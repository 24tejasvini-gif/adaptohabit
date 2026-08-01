CREATE DATABASE adaptohabit;
USE adaptohabit;

-- 2. USER TABLE
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);


-- 3.  USER CONTEXT TABLE
CREATE TABLE user_context (
    context_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    available_time INT NOT NULL,
    energy_level ENUM('low', 'medium', 'high') NOT NULL,
    location ENUM('home', 'work', 'gym', 'outdoors') NOT NULL,
    recorded_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 4. HABIT TABLE
CREATE TABLE habits (
    habit_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    habit_name VARCHAR(100) NOT NULL,
    description TEXT,
    estimated_time INT NOT NULL,
    energy_required ENUM('low', 'medium', 'high') NOT NULL,
    location_required ENUM('indoor', 'outdoor') NOT NULL,
    category VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 5.ROUTINE STACK TABLE 
CREATE TABLE routine_stack (
    routine_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    routine_date DATE NOT NULL,
    generated_at TIME ,  
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
);

-- 6.ROUTINE TASK TABLE 
CREATE TABLE routine_tasks(
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    routine_id INT NOT NULL,
    habit_id INT NOT NULL,
    task_order INT NOT NULL, STATUS ENUM('pending', 'completed', 'skipped') NOT NULL DEFAULT 'pending',
    FOREIGN KEY (routine_id) REFERENCES routine_stack(routine_id) ON DELETE CASCADE,
    FOREIGN KEY (habit_id) REFERENCES habits(habit_id) ON DELETE CASCADE
);

-- 7. HABIT HISTORY TABLE
CREATE TABLE habit_history(
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    habit_id INT NOT NULL,
    completion_date DATE NOT NULL,
    completion_time TIME NOT NULL,
    status ENUM('completed', 'skipped') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (habit_id) REFERENCES habits(habit_id) ON DELETE CASCADE
);