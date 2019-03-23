package com.mrlv.api.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.mrlv.api.dao.SysPermMapper;
import com.mrlv.api.entity.SysPerm;
import com.mrlv.api.service.ISysPermService;
import com.mrlv.api.vo.AuthVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;


@Service("sysPermService")
public class SysPermServiceImpl extends ServiceImpl<SysPermMapper, SysPerm> implements ISysPermService {

    @Override
    public Set<AuthVo> getPermsByUserId(Integer userId) {
        List<SysPerm> list = baseMapper.getPermsByUserId(userId);
        return list.stream().map(p -> new AuthVo(p.getName(), p.getVal())).collect(Collectors.toSet());
    }
}
