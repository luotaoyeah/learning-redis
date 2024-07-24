package com.luotao.learningredis;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

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
}
