BEGIN;
LOCK TABLES tasks WRITE;
UPDATE tasks
SET is_completed = 1, updated_at = NOW()
WHERE created_at BETWEEN '2020/04/26 09:00:00' AND '2020/04/26 11:30:00'
AND tasks.is_deleted != 1
AND update_user_id = 1;
UNLOCK TABLES;
COMMIT;