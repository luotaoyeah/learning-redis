-- LPUSH
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/lpush/
-- 从左侧插入元素

LPUSH list:01 A B C
DEL list:01


-- RPUSH
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/rpush/
-- 从右侧插入元素

RPUSH list:01 A B C
DEL list:01


-- LRANGE
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/lrange/
-- 返回指定范围内的元素,

-- 0 表示第一个元素, -1 表示最后一个元素,
RPUSH list:01 A B C
LRANGE list:01 0 -1
DEL list:01


-- LPOP
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/lpop/
-- 从左侧删除一个元素, 并返回该元素,

RPUSH list:01 A B C
LRANGE list:01 0 -1
LPOP list:01
DEL list:01


-- RPOP
-- ----------------------------------------------------------------------------------------------------
-- https://redis.io/docs/latest/commands/rpop/
-- 从右侧删除一个元素, 并返回该元素,

RPUSH list:01 A B C
LRANGE list:01 0 -1
RPOP list:01
DEL list:01
