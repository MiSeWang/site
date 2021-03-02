package com.mrlv.api.controller.article;


import com.alibaba.fastjson.JSONObject;
import com.mrlv.api.constant.DelFlag;
import com.mrlv.api.entity.CmsArticle;
import com.mrlv.api.entity.CmsArticleData;
import com.mrlv.api.entity.SysUser;
import com.mrlv.api.service.ICmsArticleService;
import com.mrlv.api.vo.ResultMsg;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Mrlv
 * @since 2019-08-04
 */
@RestController
@RequestMapping("/webArticle")
public class ArticleWebController {

    private static final Logger log = LoggerFactory.getLogger(ArticleWebController.class);

    @Autowired
    private ICmsArticleService cmsArticleService;


    /**
     * 根据id获取文章
     */
    @GetMapping("/queryById")
    public ResultMsg queryArticleById(String id){
        return ResultMsg.createSuccessData(cmsArticleService.queryArticleById(id));
    }

    /**
     * 获取文章列表
     * @return
     */
    @GetMapping("/query")
    public ResultMsg queryArticles(){
        return ResultMsg.createSuccessData(cmsArticleService.queryArticles());
    }
}

