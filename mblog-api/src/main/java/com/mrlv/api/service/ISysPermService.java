package com.mrlv.api.service;

import com.baomidou.mybatisplus.service.IService;
import com.mrlv.api.entity.SysPerm;
import com.mrlv.api.vo.AuthVo;

import java.util.Set;

public interface ISysPermService extends IService<SysPerm> {
    Set<AuthVo> getPermsByUserId(Integer userId);
}
