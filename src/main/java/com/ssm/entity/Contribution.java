package com.ssm.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 会员捐助实体
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
public class Contribution extends Model<Contribution> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 捐钱的
     */
    private Long mid;
    /**
     * 求助信息表
     */
    private Long qid;
    /**
     * 求助者id
     */
    private Long quid;
    /**
     * 钱
     */
    private Integer money;
    @TableField("creat_time")
    private Date creatTime;

    //捐献的人
    @TableField(exist = false)
    private String jName;
    //被捐的人
    @TableField(exist = false)
    private String name;

    public String getjName() {
        return jName;
    }

    public void setjName(String jName) {
        this.jName = jName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public Long getQid() {
        return qid;
    }

    public void setQid(Long qid) {
        this.qid = qid;
    }

    public Long getQuid() {
        return quid;
    }

    public void setQuid(Long quid) {
        this.quid = quid;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
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
        return "Contribution{" +
        ", id=" + id +
        ", mid=" + mid +
        ", qid=" + qid +
        ", quid=" + quid +
        ", money=" + money +
        ", creatTime=" + creatTime +
        "}";
    }
}
