package com.mrlv.api.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.mrlv.api.dao.SysRoleMapper;
import com.mrlv.api.entity.SysRole;
import com.mrlv.api.service.ISysRoleService;
import com.mrlv.api.vo.AuthVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service("sysRoleService")
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements ISysRoleService {

    @Override
    public Set<AuthVo> getRolesByUserId(Integer userId) {

        List<SysRole> list = baseMapper.getRolesByUserId(userId);

        return list.stream().map(r -> new AuthVo(r.getName(), r.getName())).collect(Collectors.toSet());
    }
}
