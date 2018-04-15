package com.ssm.common;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import java.util.Date;

/**
 *
 * 高级查询接收类
 */
public class SelectForm {

  private   String name;

  private   Date benginTime;

  private   Date endTime;
    //第几页
  private int current = 0;

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public SelectForm() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBenginTime() {
        return benginTime;
    }

    public void setBenginTime(Date benginTime) {
        this.benginTime = benginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
