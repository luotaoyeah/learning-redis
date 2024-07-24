package com.luotao.learningredis.springdataredis;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;

@SpringBootTest
public class _19 {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Test
    public void _01() {
        redisTemplate.opsForValue().set("a", "A");

        Assertions.assertEquals("A", redisTemplate.opsForValue().get("a"));

        Assertions.assertEquals(true, redisTemplate.delete("a"));
    }
}
