package com.luotao.learningredis.jedis;

import java.util.List;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ScanOptions;
import redis.clients.jedis.ScanParams;
import redis.clients.jedis.ScanResult;

// 高级篇:最佳实践:BIGKEY
@SpringBootTest
public class _03_03_03 extends _00_01 {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    // 当数据的内容过大, 或者集合元素的数量过多, 称之为 big key,

    // jedis 使用 SCAN 命令,
    @Test
    public void _01() {
        // 记录游标遍历次数
        int n = 1;

        // 记录当前游标
        String cursor = "0";

        do {
            System.out.printf("\n遍历次数: %d\n--------------------------------------------------\n", n);
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

    // redis.clients.jedis.ScanParams.match(java.lang.String)
    @Test
    public void _02() {
        // 记录游标遍历次数
        int n = 1;

        // 记录当前游标
        String cursor = "0";

        do {
            System.out.printf("\n遍历次数: %d\n--------------------------------------------------\n", n);
            n = n + 1;

            ScanResult<String> scan = jedis.scan(cursor, new ScanParams().match("serialNo*"));

            cursor = scan.getCursor();

            List<String> result = scan.getResult();
            for (int index = 0; index < result.size(); index++) {
                String key = result.get(index);
                System.out.printf("%3d. %s%n", index + 1, key);
            }
        } while (!cursor.equals("0"));
    }

    // spring-data-redis 使用 SCAN 命令,
    // org.springframework.data.redis.connection.RedisKeyCommands.scan(org.springframework.data.redis.core.ScanOptions)
    @Test
    public void _03() {
        try (Cursor<byte[]> cursor = redisTemplate.getConnectionFactory().getConnection().scan(ScanOptions.scanOptions().match("serialNo*").build())) {
            // 记录游标遍历次数
            int n = 0;

            // 记录每次遍历结果中各个元素的索引,
            int index = 0;

            long cursorId = -1;

            while (cursor.hasNext()) {
                if (cursorId != cursor.getCursorId()) {
                    cursorId = cursor.getCursorId();
                    n = n + 1;
                    System.out.printf("\n遍历次数: %d\n--------------------------------------------------\n", n);

                    // 索引重置
                    index = 0;
                }

                index = index + 1;

                String key = new String(cursor.next());
                System.out.printf("%3d. %s%n", index, key);
            }
        }
    }
}
