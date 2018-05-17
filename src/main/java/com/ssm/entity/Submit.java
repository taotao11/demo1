package com.ssm.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author 
 * @since 2018-05-17
 */
public class Submit extends Model<Submit> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    private Long uid;
    private String title;
    private Integer money;
    private Long aid;
    private String reason;
    @TableField("create_time")
    private Date createTime;
    @TableField("uplod_time")
    private Date uplodTime;
    /**
     * 报销类型 0 以创建 1 同意报销 2 不同意报销
     */
    private Integer type;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Long getAid() {
        return aid;
    }

    public void setAid(Long aid) {
        this.aid = aid;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUplodTime() {
        return uplodTime;
    }

    public void setUplodTime(Date uplodTime) {
        this.uplodTime = uplodTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Submit{" +
        ", id=" + id +
        ", uid=" + uid +
        ", title=" + title +
        ", money=" + money +
        ", aid=" + aid +
        ", reason=" + reason +
        ", createTime=" + createTime +
        ", uplodTime=" + uplodTime +
        ", type=" + type +
        "}";
    }
}
