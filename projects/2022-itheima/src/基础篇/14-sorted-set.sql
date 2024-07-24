-- ZADD
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/zadd/
-- 添加多个元素, 如果元素已经存在, 则更新它的 score,

ZADD sortedset:01 1 A 3 C 2 B
ZADD sortedset:01 1 A 3 C 4 D
