package com.ssm.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 义卖物品表
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
public class Goods extends Model<Goods> {

    private static final long serialVersionUID = 1L;

    /**
     * 义捐物品id
     */
    private Long id;
    private String name;
    private Integer pice;
    /**
     * 物品图片地址
     */
    private String gurl;
    private String content;
    /**
     * 会员id
     */
    private Long uid;
    /**
     * 数量
     */
    private Integer count;
    /**
     * 物品状态 0 以创建 1 未通过 2 已通过 3以卖出
     */
    private Integer type;
    /**
     * 管理员id
     */
    private Long aid;
    /**
     * 理由
     */
    private String message;
    @TableField("creat_time")
    private Date creatTime;
    @TableField("end_time")
    private Date endTime;
    //表示不是数据库字段
    @TableField(exist = false)
    private String admin;
    @TableField(exist = false)
    private String user;
    @TableField(exist = false)
    private List<String> picUrl;

    public List<String> getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(List<String> picUrl) {
        this.picUrl = picUrl;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPice() {
        return pice;
    }

    public void setPice(Integer pice) {
        this.pice = pice;
    }

    public String getGurl() {
        return gurl;
    }

    public void setGurl(String gurl) {
        this.gurl = gurl;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Long getAid() {
        return aid;
    }

    public void setAid(Long aid) {
        this.aid = aid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {

        this.creatTime = creatTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Goods{" +
        ", id=" + id +
        ", name=" + name +
        ", pice=" + pice +
        ", gurl=" + gurl +
        ", content=" + content +
        ", uid=" + uid +
        ", count=" + count +
        ", type=" + type +
        ", aid=" + aid +
        ", message=" + message +
        ", creatTime=" + creatTime +
        ", endTime=" + endTime +
        "}";
    }
}
