package com.ssm.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
public class Qzmessage extends Model<Qzmessage> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 会员id
     */
    private Long uid;
    /**
     * 身份证
     */
    private String code;
    private String picurl;
    private String contet;
    /**
     * 求助金额
     */
    private Integer qpice;
    /**
     * 求助信息状态 0 以创建 1 以通过打款 2 不通过   
     */
    private Integer type;
    /**
     * 管理员id
     */
    private Long aid;
    private String message;
    @TableField("creat_time")
    private Date creatTime;
    @TableField("end_time")
    private Date endTime;
    //表示不是数据库中的字段
    @TableField(exist = false)
    private String admin;
    @TableField(exist = false)
    private String user;
    @TableField(exist = false)
    private List<String> urls;

    public List<String> getUrls() {
        return urls;
    }

    public void setUrls(List<String> urls) {
        this.urls = urls;
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

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPicurl() {
        return picurl;
    }

    public void setPicurl(String picurl) {
        this.picurl = picurl;
    }

    public String getContet() {
        return contet;
    }

    public void setContet(String contet) {
        this.contet = contet;
    }

    public Integer getQpice() {
        return qpice;
    }

    public void setQpice(Integer qpice) {
        this.qpice = qpice;
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
        return "Qzmessage{" +
        ", id=" + id +
        ", uid=" + uid +
        ", code=" + code +
        ", picurl=" + picurl +
        ", contet=" + contet +
        ", qpice=" + qpice +
        ", type=" + type +
        ", aid=" + aid +
        ", message=" + message +
        ", creatTime=" + creatTime +
        ", endTime=" + endTime +
        "}";
    }
}
