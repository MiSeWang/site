package com.mrlv.api.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mrlv.api.entity.SysUser;
import com.mrlv.api.service.ISysUserService;
import com.mrlv.api.vo.Result;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/sys_user")
public class SysUserController {

    private static final Logger log = LoggerFactory.getLogger(SysUserController.class);

    @Autowired
    private ISysUserService sysUserService;

    @PostMapping
    public Result add(@RequestBody String body){
        String oper = "add sys user";
        log.info("{}, body: {}",oper,body);
        JSONObject userObject = JSON.parseObject(body);
        String loginName = userObject.getString("loginName");
        String password = userObject.getString("password");
        String name = userObject.getString("name");
        Integer sex = userObject.getInteger("sex");
        String email = userObject.getString("email");
        String phone = userObject.getString("phone");
        Integer loginFlag = userObject.getInteger("loginFlag");
        JSONArray roles = userObject.getJSONArray("roles");

        if (StringUtils.isEmpty(loginName)){
            return Result.fail(oper, "用户账号不能为空");
        }
        if (StringUtils.isEmpty(password)){
            return Result.fail(oper, "密码不能为空");
        }
        SysUser userDB = sysUserService.selectOne(new EntityWrapper<SysUser>().eq("loginName", loginName));
        if (userDB != null) {
            return Result.fail(oper, "用户已经注册");
        }
        SysUser sysUser = new SysUser();
        sysUser.setLoginName(loginName);
        sysUser.setPassword(password);
        sysUser.setName(name);
        sysUser.setSex(sex);
        sysUser.setEmail(email);
        sysUser.setLoginFlag(loginFlag);
        sysUser.setPhone(phone);

        //密码加密
//        RandomNumberGenerator saltGen = new SecureRandomNumberGenerator();
//        String salt = saltGen.nextBytes().toBase64();
//        String hashedPwd = new Sha256Hash(user.getPassword(), salt, 1024).toBase64();
        //保存新用户数据
//        user.setPwd(hashedPwd);
//        user.setSalt(salt);
        sysUser.setCreateDate(new Date());
        boolean success = sysUserService.insert(sysUser);
        return Result.result(oper, success).data("id", sysUser.getId()).data("createDate", sysUser.getCreateDate());
    }

    @PostMapping("/query")
    @ResponseBody
    public Result query(){
        String oper = "query user";
        log.info("{}, body: {}", oper, "");
        List<SysUser> sysUsers = sysUserService.selectList(new EntityWrapper<>());
        return Result.succ(oper).data("page", sysUsers);
    }

}
