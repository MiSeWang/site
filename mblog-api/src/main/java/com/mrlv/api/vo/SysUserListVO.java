package com.mrlv.api.vo;

import com.mrlv.api.entity.SysRole;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class SysUserListVO {

    private String id;

    private String loginName;

    private String password;

    private String name;

    private Integer gender;

    private String email;

    private String phone;

    private String avatar;

    private Integer loginFlag;

    private Date createDate;

    private Date updateDate;

    private String loginIp;

    private String remarks;

    List<SysRole> roles;

}
