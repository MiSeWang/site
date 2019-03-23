package com.mrlv.api.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.mrlv.api.entity.SysPerm;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SysPermMapper extends BaseMapper<SysPerm> {

    List<SysPerm> getPermsByUserId(@Param("userId") Integer userId);

}
