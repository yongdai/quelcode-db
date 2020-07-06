CREATE TABLE User (
    user_id INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    email_address VARCHAR(100) NOT NULL,
    password VARCHAR(20) NOT NULL,
    nickname VARCHAR(100) NOT NULL,
    self_intro VARCHAR(255),
    tel_mobile VARCHAR(20),
    tel_office VARCHAR(20),
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    create_date DATETIME NOT NULL,
    edit_date DATETIME NOT NULL
);

CREATE TABLE Chatrooms (
    chat_room_id INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    chat_description VARCHAR(255),
    is_file_sendable TINYINT(1) DEFAULT 1 NOT NULL,
    is_direct_chat TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    create_date DATETIME NOT NULL,
    owner_user_id INTEGER(11) NOT NULL REFERENCES Users(user_id),
    edit_date DATETIME NOT NULL,
    editor_user_id INTEGER(11) NOT NULL REFERENCES Users(user_id)
);

CREATE TABLE Chatposts (
    chat_post_id INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    chat_room_id INTEGER(11) NOT NULL REFERENCES Chatrooms(chat_room_id),
    message VARCHAR(1000) NOT NULL,
    attached_filename VARCHAR(100),
    is_deleted TINYINT(1) NOT NULL DEFAULT 0,
    create_date DATETIME NOT NULL,
    owner_user_id INTEGER(11) NOT NULL REFERENCES Users(user_id),
    edit_date DATETIME NOT NULL,
    editor_user_id INTEGER(11) NOT NULL REFERENCES Users(user_id)
);

CREATE TABLE Chatmembers (
    chat_room_id INTEGER(11) NOT NULL REFERENCES Chatrooms(chat_room_id),
    member_user_id VARCHAR(255)) NOT NULL REFERENCES Users(user_id),
    PRIMARY KEY(chat_room_id, member_user_id),
    join_date DATETIME NOT NULL
);

CREATE TABLE Tasks (
    task_id INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    task_description VARCHAR(255) NOT NULL,
    task_assigned_id INTEGER(11) NOT NULL REFERENCES Users(user_id),
    due_date DATETIME,
    chat_room_id INTEGER(11) NOT NULL REFERENCES Chatrooms(chat_room_id),
    is_completed TINYINT(1) NOT NULL DEFAULT 0,
    is_deleted TINYINT(1) NOT NULL DEFAULT 0,
    create_date DATETIME NOT NULL,
    owner_user_id INTEGER(11) NOT NULL REFERENCES Users(user_id),
    edit_date DATETIME NOT NULL,
    editor_user_id INTEGER(11) NOT NULL REFERENCES Users(user_id)
);
