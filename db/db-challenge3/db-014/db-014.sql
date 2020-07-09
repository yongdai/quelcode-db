BEGIN;
LOCK TABLES chatmembers WRITE, users READ;
DELETE FROM chatmembers 
WHERE member_user_id 
IN (SELECT user_id FROM users WHERE is_deleted = 1);
UNLOCK TABLES;
COMMIT;