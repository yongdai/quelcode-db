BEGIN;
LOCK TABLES chatrooms WRITE, chatmembers READ;
UPDATE chatrooms
SET is_file_sendable = 0, updated_at = NOW(), update_user_id = 1
WHERE chat_room_id NOT IN (SELECT chat_room_id FROM chatmembers WHERE member_user_id = 1)
AND is_deleted = 0;
UNLOCK TABLES;
COMMIT;