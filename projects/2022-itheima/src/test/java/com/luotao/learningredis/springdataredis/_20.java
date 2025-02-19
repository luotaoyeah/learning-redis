package com.luotao.learningredis.springdataredis;

import com.luotao.learningredis.User;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;

import javax.annotation.Resource;

// 自定义 RedisTemplate 的 RedisSerializer
@SpringBootTest
public class _20 {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Resource(name = "redisTemplate02")
    private RedisTemplate<String, Object> redisTemplate02;

    @Test
    public void _01() {
        // 使用自定义的序列化器, 将对象序列化为 JSON 字符串, 然后存入 redis,
        redisTemplate.opsForValue().set("user:03", new User().setName("LUOTAO").setAge(18));

        // 获取 JSON 字符串之后, 会自动反序列化为对象,
        User user = (User) redisTemplate.opsForValue().get("user:03");

        Assertions.assertEquals("User(name=LUOTAO, age=18)", user.toString());

        Assertions.assertEquals(true, redisTemplate.delete("user:03"));
    }

    @Test
    public void _02() {
        redisTemplate02.opsForValue().set("user:04", new User().setName("LUOTAO").setAge(18));

        User user = (User) redisTemplate02.opsForValue().get("user:04");

        Assertions.assertEquals("User(name=LUOTAO, age=18)", user.toString());
    }
}
