package com.mrlv.api.entity;

import java.util.Date;
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
 * @since 2019-08-04
 */
@TableName("cms_article")
public class CmsArticle extends Model<CmsArticle> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private String id;
    /**
     * 栏目编号
     */
    @TableField("category_id")
    private String categoryId;
    /**
     * 标题
     */
    private String title;
    /**
     * 文章链接
     */
    private String link;
    /**
     * 标题颜色
     */
    private String color;
    /**
     * 文章图片
     */
    private String image;
    /**
     * 关键字
     */
    private String keywords;
    /**
     * 描述、摘要
     */
    private String description;
    /**
     * 权重
     */
    private Integer weight;
    /**
     * 权重期限
     */
    @TableField("weight_date")
    private Date weightDate;
    /**
     * 点击数
     */
    private Integer hits;
    /**
     * 推荐位置
     */
    private String posid;
    /**
     * 自定义内容视图
     */
    @TableField("custom_content_view")
    private String customContentView;
    /**
     * 视图配置
     */
    @TableField("view_config")
    private String viewConfig;
    /**
     * 创建者
     */
    @TableField("creator")
    private String creator;
    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;
    /**
     * 更新者
     */
    @TableField("updater")
    private String updater;
    /**
     * 更新时间
     */
    @TableField("update_time")
    private Date updateTime;
    /**
     * 备注消息
     */
    private String remarks;
    /**
     * 删除标识（0：已删除 1：正常）
     */
    @TableField("del_flag")
    private Integer delFlag;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public Date getWeightDate() {
        return weightDate;
    }

    public void setWeightDate(Date weightDate) {
        this.weightDate = weightDate;
    }

    public Integer getHits() {
        return hits;
    }

    public void setHits(Integer hits) {
        this.hits = hits;
    }

    public String getPosid() {
        return posid;
    }

    public void setPosid(String posid) {
        this.posid = posid;
    }

    public String getCustomContentView() {
        return customContentView;
    }

    public void setCustomContentView(String customContentView) {
        this.customContentView = customContentView;
    }

    public String getViewConfig() {
        return viewConfig;
    }

    public void setViewConfig(String viewConfig) {
        this.viewConfig = viewConfig;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "CmsArticle{" +
        ", id=" + id +
        ", categoryId=" + categoryId +
        ", title=" + title +
        ", link=" + link +
        ", color=" + color +
        ", image=" + image +
        ", keywords=" + keywords +
        ", description=" + description +
        ", weight=" + weight +
        ", weightDate=" + weightDate +
        ", hits=" + hits +
        ", posid=" + posid +
        ", customContentView=" + customContentView +
        ", viewConfig=" + viewConfig +
        ", creator=" + creator +
        ", createTime=" + createTime +
        ", updater=" + updater +
        ", updateTime=" + updateTime +
        ", remarks=" + remarks +
        ", delFlag=" + delFlag +
        "}";
    }
}
