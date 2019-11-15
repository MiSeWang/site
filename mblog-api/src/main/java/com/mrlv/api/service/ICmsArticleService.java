package com.mrlv.api.service;

import com.mrlv.api.entity.CmsArticle;
import com.baomidou.mybatisplus.service.IService;
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
     * 获取文章列表
     * @return
     */
    List<ArticleListVO> queryArticles();

    /**
     * 新增文章
     * @return
     */
    Boolean saveArticle();
}
