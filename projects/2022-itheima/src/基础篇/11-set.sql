-- SADD
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/sadd/
-- 往集合中添加元素

SADD set:01 A B C
SMEMBERS set:01
DEL set:01


-- SREM
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/srem/
-- 从集合中删除一个元素

SADD set:01 A B C
SMEMBERS set:01
SREM set:01 B
SMEMBERS set:01
SREM set:01 A C
DEL set:01


-- SMEMBERS
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/smembers/
-- 返回集合中的所有元素

SADD set:01 A B C
SMEMBERS set:01
DEL set:01
