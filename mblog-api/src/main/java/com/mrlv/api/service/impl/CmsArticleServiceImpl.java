package com.mrlv.api.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mrlv.api.entity.CmsArticle;
import com.mrlv.api.entity.CmsArticleData;
import com.mrlv.api.mapper.CmsArticleDataMapper;
import com.mrlv.api.mapper.CmsArticleMapper;
import com.mrlv.api.service.ICmsArticleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.mrlv.api.vo.ArticleDetailVO;
import com.mrlv.api.vo.ArticleListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Mrlv
 * @since 2019-08-04
 */
@Service
public class CmsArticleServiceImpl extends ServiceImpl<CmsArticleMapper, CmsArticle> implements ICmsArticleService {

    @Autowired
    private CmsArticleDataMapper cmsArticleDataMapper;

    @Override
    public ArticleDetailVO queryArticleById(String id) {
        return baseMapper.queryArticleById(id);
    }

    public List<ArticleListVO> queryArticles(){
        return baseMapper.queryArticles();
    }

    @Transactional
    @Override
    public Boolean saveArticle(CmsArticle cmsArticle, CmsArticleData cmsArticleData) {
        if (this.insert(cmsArticle)){
            cmsArticleData.setArticleId(cmsArticle.getId());
            cmsArticleDataMapper.insert(cmsArticleData);
            return true;
        }
        return false;
    }

    @Transactional
    @Override
    public Boolean delArticle(String id) {
        cmsArticleDataMapper.delete(new EntityWrapper<CmsArticleData>().eq("article_id", id));
        return this.deleteById(id);
    }

}
