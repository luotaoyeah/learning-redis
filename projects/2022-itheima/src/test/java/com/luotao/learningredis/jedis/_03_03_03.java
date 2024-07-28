package com.luotao.learningredis.jedis;

import java.util.List;
import org.junit.jupiter.api.Test;
import redis.clients.jedis.ScanResult;

// 高级篇:最佳实践:BIGKEY
public class _03_03_03 extends _00_01 {

    // 当数据的内容过大, 或者集合元素的数量过多, 称之为 big key,

    // jedis 使用 SCAN 命令,
    @Test
    public void _01() {
        // 记录遍历次数
        int n = 1;

        // 记录当前游标
        String cursor = "0";

        do {
            System.out.printf("\n遍历次数: %d\n----------------------------------------------------------------------------------------------------\n", n);
            n = n + 1;

            ScanResult<String> scan = jedis.scan(cursor);

            cursor = scan.getCursor();

            List<String> result = scan.getResult();
            for (int i = 0; i < result.size(); i++) {
                String key = result.get(i);
                System.out.printf("%3d. %s%n", i + 1, key);
            }
        } while (!cursor.equals("0"));
    }
}
