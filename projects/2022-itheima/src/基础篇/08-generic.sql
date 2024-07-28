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


-- OBJECT ENCODING
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/object-encoding/
-- 返回值的编码类型,

SET str:01 "STRING"
HSET hash:01 name "HASH"
LPUSH list:01 "LIST"
SADD set:01 "SET"
ZADD sortedset:01 0 "ZSET"

OBJECT ENCODING str:01
OBJECT ENCODING hash:01
OBJECT ENCODING list:01
OBJECT ENCODING set:01
OBJECT ENCODING sortedset:01

DEL str:01
DEL hash:01
DEL list:01
DEL set:01
DEL sortedset:01


-- SCAN
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/scan/
-- 分段遍历 key, 类似分页查询, 每次返回部分数据,

-- 第一个参数表示游标, 从 0 开始, 每次遍历会返回新的游标, 用于下次遍历, 当游标重新变为 0 时表示遍历结束,
SCAN 0
SCAN 34
SCAN 62
SCAN 51

-- 参数 MATCH 表示对结果进行过滤, 注意这个过滤是在遍历出数据之后进行过滤, 如果遍历出来的数据都不满足, 则最后返回的数据为空,
SCAN 0 MATCH XXX*

-- 参数 COUNT 表示每次遍历返回几个数据, 默认为 10, 实际返回的数据个数可能比 COUNT 小, 也可能比 COUNT 大, 也就是 COUNT 参数并不是强制保证的,
SCAN 0 COUNT 5
SCAN 56 COUNT 5
SCAN 34 COUNT 5
SCAN 58 COUNT 5


-- 参数 TYPE 表示对结果根据类型进行过滤, 注意这个过滤是在遍历出数据之后进行过滤, 如果遍历出来的数据都不满足, 则最后返回的数据为空,
SCAN 0 TYPE set



-- CONFIG GET
-- ----------------------------------------------------------------------------------------------------
CONFIG GET *