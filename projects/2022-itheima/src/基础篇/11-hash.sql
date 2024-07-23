-- HSET
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/hset/
-- hash 类型的数据, 就类似于 java 中的 HashMap, 是一组无序的 field/value 对,

-- 设置某个 key 中的一个 field/value 对,
HSET user:3 name LUOTAO
DEL user:3

-- 设置某个 key 中的多个 field/value 对,
HSET user:3 name LUOTAO age 18
DEL user:3


-- HGET
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/hget/

-- 获取某个 key 下的某个 field 对应的 value,
HSET user:3 name LUOTAO age 18
HGET user:3 name
HGET user:3 age
DEL user:3


-- HMGET
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/hmget/

-- 获取某个 key 下的多个 field 对应的 value, 以数组的形式返回,
HSET user:3 name LUOTAO age 18
HMGET user:3 name age
DEL user:3