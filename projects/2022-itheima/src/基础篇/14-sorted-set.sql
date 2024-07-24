-- ZADD
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/zadd/
-- 添加多个元素, 如果元素已经存在, 则更新它的 score,

ZADD sortedset:01 1 A 3 C 2 B
ZADD sortedset:01 1 A 3 C 4 D
DEL sortedset:01


-- ZREM
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/zrem/
-- 删除多个元素,

ZADD sortedset:01 1 A 3 C 2 B
ZREM sortedset:01 C B
DEL sortedset:01


-- ZSCORE
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/zscore/
-- 获取某个元素的 score,

ZADD sortedset:01 1 A 3 C 2 B
ZSCORE sortedset:01 C
DEL sortedset:01


-- ZRANK
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/zrank/
-- 获取某个元素的排名,

ZADD sortedset:01 1 A 3 C 2 B
ZRANK sortedset:01 C
ZREVRANK sortedset:01 C
DEL sortedset:01
