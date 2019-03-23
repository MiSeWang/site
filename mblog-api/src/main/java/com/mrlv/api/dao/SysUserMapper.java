package com.mrlv.api.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.mrlv.api.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {
    List<SysUser> findAll();
}
