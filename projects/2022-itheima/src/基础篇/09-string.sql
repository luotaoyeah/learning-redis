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

-- 可以使用双引号包裹 value, 此时如果 value 中已经包含双引号, 则需要转义,
SET a "A\"B"
GET a
DEL a


-- 可以使用单引号包裹 value, 此时如果 value 中已经包含单引号, 则需要转义,
SET b 'A\'B'
GET b
DEL b

-- 如果 value 中不包含特殊字符, 则可以不用双引号或者单引号包裹,
SET c [A"B]
GET c
DEL c



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
