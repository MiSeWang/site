package com.mrlv.api.dao;

import com.mrlv.api.entity.CmsArticle;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.mrlv.api.vo.ArticleListVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Mrlv
 * @since 2019-08-04
 */
@Mapper
public interface CmsArticleMapper extends BaseMapper<CmsArticle> {

    List<ArticleListVO> queryArticles();
}
