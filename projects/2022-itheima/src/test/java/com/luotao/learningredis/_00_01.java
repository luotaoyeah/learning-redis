package com.luotao.learningredis;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import redis.clients.jedis.Jedis;

public class _00_01 {

    public Jedis jedis;

    @BeforeEach
    public void beforeEach() {
        jedis = JedisConnectionFactory.get();
        jedis.select(0);
    }

    @AfterEach
    public void afterEach() {
        if (jedis != null) {
            jedis.close();
        }
    }
}
