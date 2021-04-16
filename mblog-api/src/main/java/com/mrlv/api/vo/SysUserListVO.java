package com.mrlv.api.vo;

import com.mrlv.api.entity.SysRole;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
/**
 * ApiModel 描述一个实体类型。这个实体类型如果成为任何一个生成api帮助文档方法的返回值类型的时候，此注解会被解析。
 */
@ApiModel(value = "自定义用户列表实体-SysUserListVO", description = "SysUserListVO描述")
public class SysUserListVO {

    private String id;

    @ApiModelProperty(value = "登录账号", name = "登录账号(loginName)")
    private String loginName;

    private String password;

    private String name;

    private Integer gender;

    private String email;

    private String phone;

    private String photo;

    private Integer status;

    private Date createTime;

    private Date updateTime;

    private String loginIp;

    private String remarks;

    List<SysRole> roles;

}
