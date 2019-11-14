package com.mrlv.api.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author Mrlv
 * @since 2019-08-18
 */
@TableName("cms_article_data")
public class CmsArticleData extends Model<CmsArticleData> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private String id;
    /**
     * 内容
     */
    private String content;
    /**
     * 文章信息id
     */
    @TableField("article_id")
    private String articleId;
    /**
     * 相关文章
     */
    private String relation;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "CmsArticleData{" +
        ", id=" + id +
        ", content=" + content +
        ", articleId=" + articleId +
        ", relation=" + relation +
        "}";
    }
}
