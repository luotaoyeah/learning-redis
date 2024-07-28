package com.luotao.learningredis.jedis;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SessionCallback;
import redis.clients.jedis.Pipeline;

// 高级篇:最佳实践:pipeline
// https://redis.io/docs/latest/develop/use/pipelining/
@SpringBootTest
public class _03_03_05 extends _00_01 {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Test
    public void _01() {
        Pipeline pipeline = jedis.pipelined();

        pipeline.get("a");
        pipeline.get("b");
        pipeline.get("c");

        List<Object> objects = pipeline.syncAndReturnAll();

        for (Object obj : objects) {
            System.out.println(obj);
        }
    }

    // https://docs.spring.io/spring-data/redis/reference/redis/pipelining.html
    // spring-data-redis 执行 pipeline 有多种方式,
    @Test
    public void _02() {
        // 1. org.springframework.data.redis.core.RedisTemplate.execute(org.springframework.data.redis.core.RedisCallback<T>, boolean, boolean)
        // 无法获取执行结果,
        redisTemplate.execute(
            connection -> {
                connection.set("a".getBytes(), "A".getBytes());
                connection.get("a".getBytes());

                return null;
            },
            false,
            true
        );

        // 2. org.springframework.data.redis.core.RedisTemplate.executePipelined(org.springframework.data.redis.core.RedisCallback<?>)
        List<Object> objects02 = redisTemplate.executePipelined(
            (RedisCallback<Object>) connection -> {
                {
                    try {
                        connection.set("a".getBytes(), new ObjectMapper().writeValueAsString("A").getBytes());
                    } catch (JsonProcessingException e) {
                        throw new RuntimeException(e);
                    }
                    connection.get("a".getBytes());
                    connection.del("a".getBytes());

                    return null;
                }
            }
        );
        System.out.println("\n2. RedisCallback\n--------------------------------------------------");
        for (Object obj : objects02) {
            System.out.println(obj);
        }

        // 3. org.springframework.data.redis.core.RedisTemplate.executePipelined(org.springframework.data.redis.core.SessionCallback<?>)
        List<Object> objects03 = redisTemplate.executePipelined(
            new SessionCallback<Object>() {
                @Override
                public Object execute(RedisOperations operations) throws DataAccessException {
                    operations.opsForValue().set("a", "A");
                    operations.opsForValue().get("a");
                    operations.delete("a");

                    // 必须返回 null,
                    return null;
                }
            }
        );
        System.out.println("\n3. SessionCallback\n--------------------------------------------------");
        for (Object obj : objects03) {
            System.out.println(obj);
        }
    }
}
