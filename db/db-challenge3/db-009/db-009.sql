SELECT chat_name, COUNT(chat_post_id) AS '投稿数' FROM chatrooms
INNER JOIN chatposts
ON chatrooms.chat_room_id = chatposts.chat_room_id
INNER JOIN users
ON chatposts.owner_user_id = users.user_id
WHERE chatposts.is_deleted != 1 
AND   users.is_deleted != 1
GROUP BY chat_name;