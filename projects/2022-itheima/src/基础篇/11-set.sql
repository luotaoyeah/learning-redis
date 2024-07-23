-- SADD
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/sadd/
-- 往集合中添加一个元素

SADD set:01 A B C
SMEMBERS set:01
DEL set:01

-- SREM
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/srem/
-- 往集合中添加一个元素

SADD set:01 A B C
SMEMBERS set:01
SREM set:01 B
SMEMBERS set:01
DEL set:01

