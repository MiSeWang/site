package com.mrlv.api.controller;


import com.mrlv.api.service.ICmsArticleService;
import com.mrlv.api.vo.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Mrlv
 * @since 2019-08-04
 */
@RestController
@RequestMapping("/cmsArticle")
public class CmsArticleController {

    @Autowired
    private ICmsArticleService cmsArticleService;

    /**
     * 获取文章列表
     * @return
     */
    @GetMapping("/queryArticles")
    public ResultMsg queryArticles(){
        return ResultMsg.createSuccessData(cmsArticleService.queryArticles());
    }

    /**
     * 保存文章
     * @return
     */
    @PostMapping("/saveArticle")
    public ResultMsg saveArticle(){
        return ResultMsg.createSuccess();
    }
}

