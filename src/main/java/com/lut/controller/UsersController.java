package com.lut.controller;

import com.lut.mapper.UsersMapper;
import com.lut.model.Users;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description 用户页面处理器
 */
@Controller
public class UsersController {
    @Resource
    private UsersMapper usersMapper;

    //登录请求
    @RequestMapping("/users/login.do")
    public String login(String username, String password, HttpSession session) {
        System.out.println(username);
        System.out.println(password);

        //查询数据库是否存在该用户名和密码
        Map<String,Object> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);
        List<Users> users = usersMapper.selectByMap(map);
        if(users.size() == 0) {
            session.setAttribute("error", "用户名或密码错误"); // 登录失败后将错误信息存入session中
            return "login";
        } else {
            session.removeAttribute("error"); // 修改成功后清除session中错误信息
            session.setAttribute("username", username); // 将登录账号存入session中
            return "main"; // 登录成功后跳转到主页
        }
    }


}
