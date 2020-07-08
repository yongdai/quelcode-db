SELECT users.nickname, P.newest_post, chatrooms.chat_name
FROM chatposts
LEFT JOIN (SELECT chat_room_id, max(created_at) AS newest_post FROM chatposts GROUP BY chat_room_id) AS P
ON chatposts.created_at = P.newest_post
LEFT JOIN users
ON users.user_id = chatposts.owner_user_id
LEFT JOIN chatrooms
ON P.chat_room_id = chatrooms.chat_room_id
WHERE chatposts.is_deleted != 1 
AND   users.is_deleted != 1
HAVING newest_post IS NOT NULL
ORDER BY P.chat_room_id ASC;
