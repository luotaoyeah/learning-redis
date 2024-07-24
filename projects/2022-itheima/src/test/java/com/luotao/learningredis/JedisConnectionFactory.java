package com.luotao.learningredis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

// 使用连接池的方式, 获取连接,
public class JedisConnectionFactory {

    public static JedisPool jedisPool;

    static {
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();

        jedisPool = new JedisPool(jedisPoolConfig, "localhost", 26379);
    }

    public static Jedis get() {
        return jedisPool.getResource();
    }
}
