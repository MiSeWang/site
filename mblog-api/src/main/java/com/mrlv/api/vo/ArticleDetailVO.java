package com.mrlv.api.vo;

import com.mrlv.api.entity.CmsArticle;
import lombok.Data;

@Data
public class ArticleDetailVO extends CmsArticle {

    //内容
    String content;
}
