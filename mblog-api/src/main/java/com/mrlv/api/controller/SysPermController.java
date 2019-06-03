package com.mrlv.api.controller;


import com.mrlv.api.service.ISysPermService;
import com.mrlv.api.vo.PermTreeVo;
import com.mrlv.api.vo.ResultMsg;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 权限管理
 */
@RestController
@RequestMapping("/sys_perm")
public class SysPermController {

    private final static Logger log = LoggerFactory.getLogger(SysPermController.class);

    @Autowired
    private ISysPermService sysPermService;


    @GetMapping
    public ResultMsg queryPermByPermType(String permType){
        String oper = "query perm by permType";
        log.info("permType: {}", permType);
        List<PermTreeVo> sysPerms = sysPermService.getPermTreeVo(permType);
        return ResultMsg.succ(oper, sysPerms);
    }
}
