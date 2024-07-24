package com.luotao.learningredis.jedis;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

// jedis 连接池
public class _17 extends _00_01 {

    @Test
    public void _01() {
        // SET
        Assertions.assertEquals("OK", jedis.set("a", "A"));

        // GET
        Assertions.assertEquals("A", jedis.get("a"));

        // DEL
        jedis.del("a");
    }
}
