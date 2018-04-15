package com.ssm.entity;

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
 * @author 
 * @since 2018-04-11
 */
@TableName("order_user")
public class OrderUser extends Model<OrderUser> {

    private static final long serialVersionUID = 1L;

    private Long id;
    /**
     * 物品id
     */
    private Long gid;
    private Integer pice;
    /**
     * 卖家id
     */
    private Long sid;
    /**
     * 买家id
     */
    private Long bid;
    /**
     * 收获地址
     */
    private String adress;
    /**
     * 买家电话
     */
    private String ipone;
    @TableField("creat_time")
    private Date creatTime;
    //表示不是数据库字段 买家
    @TableField(exist = false)
    private String bname;
    //表示不是数据库字段 卖家姓名
    @TableField(exist = false)
    private String sname;
    @TableField(exist = false)
    private String goodsName;

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getGid() {
        return gid;
    }

    public void setGid(Long gid) {
        this.gid = gid;
    }

    public Integer getPice() {
        return pice;
    }

    public void setPice(Integer pice) {
        this.pice = pice;
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public Long getBid() {
        return bid;
    }

    public void setBid(Long bid) {
        this.bid = bid;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
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

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "OrderUser{" +
        ", id=" + id +
        ", gid=" + gid +
        ", pice=" + pice +
        ", sid=" + sid +
        ", bid=" + bid +
        ", adress=" + adress +
        ", ipone=" + ipone +
        ", creatTime=" + creatTime +
        "}";
    }
}
