package com.mrlv.api.service;

import com.mrlv.api.entity.CmsArticle;
import com.baomidou.mybatisplus.service.IService;
import com.mrlv.api.entity.CmsArticleData;
import com.mrlv.api.vo.ArticleDetailVO;
import com.mrlv.api.vo.ArticleListVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Mrlv
 * @since 2019-08-04
 */
public interface ICmsArticleService extends IService<CmsArticle> {


    /**
     * 获取文章详情
     * @param id
     * @return
     */
    ArticleDetailVO queryArticleById(String id);

    /**
     * 获取文章列表
     * @return
     */
    List<ArticleListVO> queryArticles();

    /**
     * 新增文章
     * @param cmsArticle
     * @param cmsArticleData
     * @return
     */
    Boolean saveArticle(CmsArticle cmsArticle, CmsArticleData cmsArticleData);


    /**
     * 删除文章
     * @param id
     * @return
     */
    Boolean delArticle(String id);
}
