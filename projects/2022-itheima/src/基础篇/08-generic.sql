-- KEYS
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/keys/
-- 模糊查询 key

KEYS *

-- DEL
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/del/
-- 删除一个或多个 key, 返回被删除的 key 的数量,

SET foo "FOO"
SET bar "BAR"

GET foo
GET bar

DEL foo bar

-- 如果 key 不存在, 则返回 0,
DEL TEST


-- EXISTS
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/exists/
-- 判断某个 key 是否存在,

EXISTS TEST


-- TTL
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/ttl/
-- 查看某个 key 的剩余存活时间, 单位为秒,

-- 返回值 -2 表示该 key 不存在,
TTL bar

-- 返回值 -1 表示该 key 永久有效,
SET foo "FOO"
TTL foo
DEL foo


-- EXPIRE
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/expire/
-- 设置某个 key 的有效时间, 过期之后该 key 会被自动删除, 单位为秒,
SET foo "FOO"
EXPIRE foo 10
TTL foo
DEL foo


-- TYPE
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/type/
-- 返回值的类型,

SET str:01 "STRING"
HSET hash:01 name "HASH"
LPUSH list:01 "LIST"
SADD set:01 "SET"
ZADD sortedset:01 0 "ZSET"

TYPE str:01
TYPE hash:01
TYPE list:01
TYPE set:01
TYPE sortedset:01

DEL str:01
DEL hash:01
DEL list:01
DEL set:01
DEL sortedset:01