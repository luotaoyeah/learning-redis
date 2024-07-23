-- HSET
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/hset/
-- hash 类型的数据, 就类似于 java 中的 HashMap, 是一组无序的 field/value 对,

-- 设置某个 KEY 中的一个 field/value 对,
HSET user:3 name LUOTAO
DEL user:3

-- 设置某个 KEY 中的多个 field/value 对,
HSET user:3 name LUOTAO age 18
DEL user:3