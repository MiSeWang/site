package com.mrlv.api.service.impl;

import com.mrlv.api.entity.CmsArticle;
import com.mrlv.api.dao.CmsArticleMapper;
import com.mrlv.api.service.ICmsArticleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.mrlv.api.vo.ArticleListVO;
import org.springframework.stereotype.Service;

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

    public List<ArticleListVO> queryArticles(){
        return baseMapper.queryArticles();
    }

    @Override
    public Boolean saveArticle() {
        return null;
    }
}
