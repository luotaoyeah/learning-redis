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
-- 获取某个元素的排名, 从 0 开始,

ZADD sortedset:01 1 A 3 C 2 B
ZRANK sortedset:01 C
ZREVRANK sortedset:01 C
DEL sortedset:01


-- ZCARD
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/zcard/
-- 获取所有元素个数,

ZADD sortedset:01 1 A 3 C 2 B 4 D
ZCARD sortedset:01
DEL sortedset:01


-- ZINCRBY
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/zincrby/
-- 给某个元素的 score 加上某个数量,

ZADD sortedset:01 1 A 3 C 2 B 4 D
ZINCRBY sortedset:01 10 C
DEL sortedset:01
