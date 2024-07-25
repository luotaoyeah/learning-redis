package com.luotao.learningredis;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class User {

    private String name;

    private int age;
}
