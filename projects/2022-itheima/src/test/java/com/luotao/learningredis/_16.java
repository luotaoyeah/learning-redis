package com.luotao.learningredis;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

// jedis 基本用法
public class _16 extends _00 {

    @Test
    public void _01() {
        // SET
        Assertions.assertEquals("OK", jedis.set("a", "A"));

        // GET
        Assertions.assertEquals("A", jedis.get("a"));

        // DEL
        jedis.del("a");
    }

    @Test
    public void _02() {
        jedis.del("hash:01");

        // HSET
        Assertions.assertEquals(1, jedis.hset("hash:01", "name", "LUOTAO"));

        Map<String, String> map = new HashMap<>();
        map.put("age", "18");
        Assertions.assertEquals(1, jedis.hset("hash:01", map));

        // HGETALL
        Map<String, String> result = jedis.hgetAll("hash:01");
        Assertions.assertEquals("LUOTAO", result.get("name"));
        Assertions.assertEquals("18", result.get("age"));

        jedis.del("hash:01");
    }
}
