package com.mrlv.api.vo;

import com.mrlv.api.entity.CmsArticle;
import lombok.Data;

@Data
public class ArticleListVO extends CmsArticle {

    private String categoryName;
}
