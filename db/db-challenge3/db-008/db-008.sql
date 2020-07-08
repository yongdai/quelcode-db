SELECT nickname, chat_name, DATE_FORMAT(joined_at, '%Y/%m/%d') AS joined_at FROM chatmembers 
INNER JOIN users
ON chatmembers.member_user_id = users.user_id 
INNER JOIN chatrooms
ON chatrooms.chat_room_id = chatmembers.chat_room_id 
WHERE users.is_deleted != 1 
AND chatrooms.is_deleted != 1
ORDER BY joined_at ASC;