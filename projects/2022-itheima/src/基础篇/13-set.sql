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


-- SISMEMBER
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/sismember/
-- 判断某个元素是否属于集合

SADD set:01 A B C
SMEMBERS set:01
SISMEMBER set:01 A
SISMEMBER set:01 D
DEL set:01


-- SCARD
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/scard/
-- 返回集合中的元素个数, CARDINALITY

SADD set:01 A B C
SCARD set:01
SREM set:01 A B
SCARD set:01
DEL set:01
