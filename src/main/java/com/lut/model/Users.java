package com.lut.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("users")    //数据库对应的表名
public class Users {
    @TableId(type = IdType.AUTO)   //主键自增长
    private int userid;
    private String username;
    private String gender;
    private String password;
    private String fullname;
    private String ethnicity;
    private String birthday;
    private String email;
    private String phone;
    private String nativeplace;
    private String address;
}
