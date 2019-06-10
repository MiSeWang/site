package com.mrlv.api.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mrlv.api.entity.SysUser;
import com.mrlv.api.service.ISysUserService;
import com.mrlv.api.vo.ResultMsg;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 *  用户管理
 */
@RequestMapping("/sys_user")
@RestController
public class SysUserController {

    private static final Logger log = LoggerFactory.getLogger(SysUserController.class);

    @Autowired
    private ISysUserService sysUserService;



    @GetMapping
    public ResultMsg query(){
        String oper = "query user";
        log.info("{}, body: {}", oper, "");
        List<SysUser> sysUsers = sysUserService.selectList(new EntityWrapper<SysUser>().eq("del_flag", 1));
        return ResultMsg.succ(oper).data("page", sysUsers);
    }

    @PostMapping
    public ResultMsg save(@RequestBody String body){
        String oper = "add sys user";
        log.info("{}, body: {}",oper,body);
        JSONObject userObject = JSON.parseObject(body);
        String loginName = userObject.getString("loginName");
        String password = userObject.getString("password");
        String name = userObject.getString("name");
        Integer gender = userObject.getInteger("gender");
        String email = userObject.getString("email");
        String phone = userObject.getString("phone");
        Integer loginFlag = userObject.getInteger("loginFlag");
        JSONArray roles = userObject.getJSONArray("roles");

        if (StringUtils.isEmpty(loginName)){
            return ResultMsg.fail(oper, "用户账号不能为空");
        }
        if (StringUtils.isEmpty(password)){
            return ResultMsg.fail(oper, "密码不能为空");
        }
        SysUser userDB = sysUserService.selectOne(new EntityWrapper<SysUser>().eq("login_name", loginName));
        if (userDB != null) {
            return ResultMsg.fail(oper, "用户已经注册");
        }
        Date nowDate = new Date();
        SysUser sysUser = new SysUser();
        sysUser.setLoginName(loginName);
        sysUser.setPassword(password);
        sysUser.setName(name);
        sysUser.setGender(gender);
        sysUser.setEmail(email);
        sysUser.setLoginFlag(loginFlag);
        sysUser.setPhone(phone);
        sysUser.setCreateDate(nowDate);
        sysUser.setUpdateDate(nowDate);

        //密码加密
//        RandomNumberGenerator saltGen = new SecureRandomNumberGenerator();
//        String salt = saltGen.nextBytes().toBase64();
//        String hashedPwd = new Sha256Hash(user.getPassword(), salt, 1024).toBase64();
        //保存新用户数据
//        user.setPwd(hashedPwd);
//        user.setSalt(salt);
        boolean success = sysUserService.insert(sysUser);
        return ResultMsg.result(oper, success).data("id", sysUser.getId()).data("createDate", nowDate);
    }

    @DeleteMapping
    public ResultMsg delete(@RequestBody String body){
        String oper = "delete user";
        log.info("{}, body: {}", oper, "");
        JSONObject userObject = JSON.parseObject(body);
        SysUser sysUser = (SysUser)SecurityUtils.getSubject().getPrincipal();
        if (userObject.getBoolean("isBatch")){
            JSONArray array = userObject.getJSONArray("id");
            if (array.isEmpty()){
                return ResultMsg.fail(oper, "无法删除用户：参数为空（用户id）");
            }
            List<Integer> ids = array.toJavaList(Integer.class);
            for (Integer id : ids) {
                if (sysUser.getId().equals(id)){
                    return ResultMsg.fail(oper, "系统限制：不能删除当前登录账号");
                }
            }
            boolean success = sysUserService.deleteBatchIds(ids);
            return ResultMsg.succ(oper, success);
        } else {
            Integer id = userObject.getInteger("id");
            if (id == null){
                return ResultMsg.fail(oper, "无法删除用户：参数为空（用户id）");
            }
            if (sysUser.getId().equals(id)){
                return ResultMsg.fail(oper, "系统限制：不能删除当前登录账号");
            }
            boolean success = sysUserService.deleteById(userObject.getInteger("id"));
            return ResultMsg.succ(oper, success);
        }
    }

    public ResultMsg queryRoleIdsByUserId(){
        
    }
}
