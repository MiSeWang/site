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
@RequestMapping("/cmsArticle")
public class CmsArticleController {

    private static final Logger log = LoggerFactory.getLogger(CmsArticleController.class);

    @Autowired
    private ICmsArticleService cmsArticleService;


    /**
     * 根据id获取文章
     */
    @GetMapping("/queryArticleById")
    public ResultMsg queryArticleById(String id){
        return ResultMsg.createSuccessData(cmsArticleService.queryArticleById(id));
    }

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
    public ResultMsg saveArticle(@RequestBody String body){
        Date date = new Date();
        CmsArticle cmsArticle = JSONObject.parseObject(body, CmsArticle.class);
        CmsArticleData cmsArticleData = JSONObject.parseObject(body, CmsArticleData.class);
        SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
        if (StringUtils.isBlank(cmsArticle.getId())){
            cmsArticle.setCreator(user.getLoginName());
            cmsArticle.setCreateTime(date);
        } else {
            cmsArticle.setUpdater(user.getLoginName());
            cmsArticle.setUpdateTime(date);
        }
        return ResultMsg.createSuccessData(cmsArticleService.saveArticle(cmsArticle, cmsArticleData));
    }

    /**
     * 删除文章
     * rootDel(false:逻辑删除 true:物理删除)
     * @return
     */
    @PostMapping("/delArticle")
    public ResultMsg delArticle(@RequestBody String body){
        Date date = new Date();
        CmsArticle cmsArticle = JSONObject.parseObject(body, CmsArticle.class);
        Boolean rootDel = JSONObject.parseObject(body).getBoolean("rootDel");
        SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
        if (rootDel) {
            return ResultMsg.createSuccessData(cmsArticleService.delArticle(cmsArticle.getId()));

        } else {
            cmsArticle.setDelFlag(DelFlag.AL_DEL.value());
            cmsArticle.setUpdater(user.getLoginName());
            cmsArticle.setUpdateTime(date);
            return ResultMsg.createSuccessData(cmsArticleService.updateById(cmsArticle));
        }
    }
}

