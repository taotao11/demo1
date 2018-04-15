package com.ssm.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;

    private Long id;
    private String zh;
    private String name;
    private String pwd;
    private Integer sex;
    private String email;
    private String ipone;
    @TableField("creat_time")
    private Date creatTime;
    @TableField("update_time")
    private Date updateTime;
    private int meny;

    public int getMeny() {
        return meny;
    }

    public void setMeny(int meny) {
        this.meny = meny;
    }

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
        ", pwd=" + pwd +
        ", sex=" + sex +
        ", email=" + email +
        ", ipone=" + ipone +
        ", creatTime=" + creatTime +
        ", updateTime=" + updateTime +
        "}";
    }
}