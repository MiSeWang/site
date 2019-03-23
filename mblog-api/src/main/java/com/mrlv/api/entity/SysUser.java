package com.mrlv.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.mrlv.api.vo.AuthVo;

import java.io.Serializable;
import java.util.*;

@TableName("sys_user")
public class SysUser extends Model<SysUser> {

    @TableId(type = IdType.AUTO)
    private Integer id;        //用户id
    private String name;       //用户名
    private Integer sex;       //性别
    private String loginName;  //用户名
    private String password;   //密码
    private String email;      //邮箱
    private String phone;     //手机号码
    private Integer userType;  //用户类型
    private String avatar;      //头像
    private String loginIp;    //登陆ip
    private Date loginDate;    //登陆时间
    private Integer loginFlag; //是否启用
    private Date createDate;   //创建时间
    private Date updateDate;   //更新时间
    private String remarks;    //说明
    private Integer delFlag;   //是否删除

    @TableField(exist = false)
    private Set<AuthVo> roles = new HashSet<>();    //用户所有角色值，用于shiro做角色权限的判断
    @TableField(exist = false)
    private Set<AuthVo> perms = new HashSet<>();    //用户所有权限值，用于shiro做资源权限的判断

    @Override
    public String toString() {
        return "SysUser{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", loginName='" + loginName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", userType=" + userType +
                ", avatar='" + avatar + '\'' +
                ", loginIp='" + loginIp + '\'' +
                ", loginDate=" + loginDate +
                ", loginFlag=" + loginFlag +
                ", createDate=" + createDate +
                ", updateDate=" + updateDate +
                ", remarks='" + remarks + '\'' +
                ", delFlag=" + delFlag +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public Integer getLoginFlag() {
        return loginFlag;
    }

    public void setLoginFlag(Integer loginFlag) {
        this.loginFlag = loginFlag;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public Set<AuthVo> getRoles() {
        return roles;
    }

    public void setRoles(Set<AuthVo> roles) {
        this.roles = roles;
    }

    public Set<AuthVo> getPerms() {
        return perms;
    }

    public void setPerms(Set<AuthVo> perms) {
        this.perms = perms;
    }

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
