package com.mrlv.api.service;

import com.baomidou.mybatisplus.service.IService;
import com.mrlv.api.entity.SysRole;
import com.mrlv.api.vo.AuthVo;

import java.util.Set;

public interface ISysRoleService extends IService<SysRole> {

    Set<AuthVo> getRolesByUserId(Integer userId);
}
