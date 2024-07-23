-- SET
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/set/
-- 如果 KEY 尚不存在, 则添加该 KEY, 如果 KEY 已经存在, 则修改该 KEY 的值,

GET foo

SET foo "FOO"
GET foo

SET foo "BAR"
GET foo
DEL foo

-- -- string value 包含特殊符号时, 比如双引号, 需要进行转义,
SET b "A\"B"
GET b
DEL b


-- MSET
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/mset/
-- 同时设置多个 key/value 对,

MSET foo "FOO" bar "BAR"
MGET foo bar

DEL foo bar


-- MGET
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/mget/
-- 获取多个 KEY 的值, 以数组的形式返回,

SET foo "FOO"
SET bar "BAR"
MGET foo bar

DEL foo bar
