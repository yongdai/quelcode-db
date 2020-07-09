BEGIN;
LOCK TABLES tasks WRITE;
UPDATE tasks
SET is_completed = 1, updated_at = NOW(), update_user_id = 1
WHERE created_at BETWEEN '2020/04/26 09:00:00' AND '2020/04/26 11:30:00'
AND tasks.is_deleted = 0;
UNLOCK TABLES;
COMMIT;