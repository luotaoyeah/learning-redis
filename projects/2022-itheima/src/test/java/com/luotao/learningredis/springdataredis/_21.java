package com.luotao.learningredis.springdataredis;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;

// StringRedisTemplate 默认将四个序列化器都设置为了 StringRedisSerializer, 方便直接使用,
@SpringBootTest
public class _21 {

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Test
    public void _01() {
        redisTemplate.opsForValue().set("a", "A");

        Assertions.assertEquals("A", redisTemplate.opsForValue().get("a"));

        redisTemplate.delete("a");
    }
}
