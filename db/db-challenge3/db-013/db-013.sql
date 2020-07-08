BEGIN;
LOCK TABLES users WRITE;
UPDATE users
SET is_deleted = 1, updated_at = NOW()
WHERE tel_office IS NULL
AND   tel_mobile IS NULL;
UNLOCK TABLES;
COMMIT;
