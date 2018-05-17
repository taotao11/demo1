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
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    private String zh;
    private String name;
    /**
     * 签名
     */
    private String title;
    private String pwd;
    private Integer sex;
    private String email;
    private String ipone;
    @TableField("creat_time")
    private Date creatTime;
    @TableField("update_time")
    private Date updateTime;
    private String url;
    private Integer kpi;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getZh() {
        return zh;
    }

    public void setZh(String zh) {
        this.zh = zh;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIpone() {
        return ipone;
    }

    public void setIpone(String ipone) {
        this.ipone = ipone;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getKpi() {
        return kpi;
    }

    public void setKpi(Integer kpi) {
        this.kpi = kpi;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "User{" +
        ", id=" + id +
        ", zh=" + zh +
        ", name=" + name +
        ", title=" + title +
        ", pwd=" + pwd +
        ", sex=" + sex +
        ", email=" + email +
        ", ipone=" + ipone +
        ", creatTime=" + creatTime +
        ", updateTime=" + updateTime +
        ", url=" + url +
        ", kpi=" + kpi +
        "}";
    }
}
