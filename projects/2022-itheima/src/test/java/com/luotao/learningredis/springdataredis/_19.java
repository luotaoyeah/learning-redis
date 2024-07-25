package com.luotao.learningredis.springdataredis;

import com.luotao.learningredis.User;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;

// 自定义 RedisTemplate 的 RedisSerializer
@SpringBootTest
public class _19 {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Test
    public void _01() {
        redisTemplate.opsForValue().set("a", "A");

        Assertions.assertEquals("A", redisTemplate.opsForValue().get("a"));

        Assertions.assertEquals(true, redisTemplate.delete("a"));
    }

    @Test
    public void _02() {
        // 使用自定义的序列化器, 将对象序列化为 JSON 字符串, 然后存入 redis,
        redisTemplate.opsForValue().set("user:03", new User().setName("LUOTAO").setAge(18));

        // 获取 JSON 字符串之后, 会自动反序列化为对象,
        User user = (User) redisTemplate.opsForValue().get("user:03");

        Assertions.assertEquals("User(name=LUOTAO, age=18)", user.toString());

        Assertions.assertEquals(true, redisTemplate.delete("user:03"));
    }
}
