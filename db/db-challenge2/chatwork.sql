CREATE TABLE users (
    user_id INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    email_address VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    nickname VARCHAR(100) NOT NULL,
    self_intro VARCHAR(1000),
    tel_mobile VARCHAR(13),
    tel_office VARCHAR(13),
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

CREATE TABLE chatrooms (
    chat_room_id INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    chat_name VARCHAR(100) NOT NULL,
    chat_description VARCHAR(1000),
    is_file_sendable TINYINT(1) DEFAULT 1 NOT NULL,
    is_direct_chat TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    created_at DATETIME NOT NULL,
    owner_user_id INTEGER(11) NOT NULL REFERENCES users(user_id),
    updated_at DATETIME NOT NULL,
    update_user_id INTEGER(11) NOT NULL REFERENCES users(user_id)
);

CREATE TABLE chatposts (
    chat_post_id INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    chat_room_id INTEGER(11) NOT NULL REFERENCES chatrooms(chat_room_id),
    message VARCHAR(1000) NOT NULL,
    attached_filename VARCHAR(100),
    is_deleted TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL,
    owner_user_id INTEGER(11) NOT NULL REFERENCES users(user_id),
    updated_at DATETIME NOT NULL,
    update_user_id INTEGER(11) NOT NULL REFERENCES users(user_id)
);

CREATE TABLE chatmembers (
    chat_room_id INTEGER(11) NOT NULL REFERENCES chatrooms(chat_room_id),
    member_user_id VARCHAR(255) NOT NULL REFERENCES users(user_id),
    PRIMARY KEY(chat_room_id, member_user_id),
    joined_at DATETIME NOT NULL
);

CREATE TABLE tasks (
    task_id INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    task_description VARCHAR(1000) NOT NULL,
    task_assigned_id INTEGER(11) NOT NULL REFERENCES users(user_id),
    due_date DATETIME,
    chat_room_id INTEGER(11) NOT NULL REFERENCES chatrooms(chat_room_id),
    is_completed TINYINT(1) NOT NULL DEFAULT 0,
    is_deleted TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL,
    owner_user_id INTEGER(11) NOT NULL REFERENCES users(user_id),
    updated_at DATETIME NOT NULL,
    update_user_id INTEGER(11) NOT NULL REFERENCES users(user_id)
);
