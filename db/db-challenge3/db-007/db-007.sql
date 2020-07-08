SELECT 
chat_room_id, chat_name, chat_description, 
CASE
    WHEN is_file_sendable = 0 THEN '禁止'
    WHEN is_file_sendable = 1 THEN '許可'
END AS is_file_sendable, 
is_direct_chat, is_deleted, created_at, owner_user_id, updated_at, update_user_id 
FROM chatrooms
WHERE is_deleted = 0 
AND   chat_description LIKE '%ダイレクトチャット' 
ORDER BY chat_room_id ASC;
