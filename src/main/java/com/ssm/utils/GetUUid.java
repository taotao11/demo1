package com.ssm.utils;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ssm.common.SelectForm;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * uuid生成器
 *
 */
public class GetUUid {

    /**
     * 获得一个UUID
     * @return String UUID
     */
    public static String getUUID(){
        String uuid = UUID.randomUUID().toString();
        return uuid.replaceAll("-", "");
    }

    /**
     * 通用高级查询方法
     *  ne、neq不相等，   gt大于， lt小于 gte、ge大于等于   lte、le 小于等于   not非
     * @param wrapper
     * @param form
     * @return
     */
    public static EntityWrapper heightSelect(EntityWrapper wrapper, SelectForm form){
        if (form.getName() != null && form.getName().equals("")) {
            wrapper.eq("name", form.getName());
        }
        if (form.getBenginTime() != null && form.getEndTime() != null) {
            wrapper.between("creat_time", form.getBenginTime(), form.getEndTime());
            return wrapper;
        }else if(form.getBenginTime() != null) {
            wrapper.ge("creat_time",form.getBenginTime());
            return wrapper;
        }else {
            wrapper.le("creat_time",form.getEndTime());
        }
        return wrapper;
    }
    /**
     * Date对象转换成 yy--mm--dd
     * @return
     */
    public static String DataConver(Date date){
        SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MMMM-dd HH:mm:ss");
        System.out.println(bartDateFormat.format(date));
        return date.toString();
    }
    public static String feachError(List<FieldError> les){
        StringBuilder message = new StringBuilder();

        //遍历错误信息
        for (FieldError error : les) {
           message.append(error.getField() + ":" + error.getDefaultMessage() + ":" + error.getCode());

        }
        return message.toString();
    }
    /**
     * 时间转换字符串
     *
     * 字符串转换为java.util.Date<br>
     * 支持格式为 yyyy.MM.dd G 'at' hh:mm:ss z 如 '2002-1-1 AD at 22:10:59 PSD'<br>
     * yy/MM/dd HH:mm:ss 如 '2002/1/1 17:55:00'<br>
     * yy/MM/dd HH:mm:ss pm 如 '2002/1/1 17:55:00 pm'<br>
     * yy-MM-dd HH:mm:ss 如 '2002-1-1 17:55:00' <br>
     * yy-MM-dd HH:mm:ss am 如 '2002-1-1 17:55:00 am' <br>
     */
//    public static String SimDate(Date date){
//        SimpleDateFormat simple = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
//        return  simple.format(date);
//    }
    public static void main(String [] args){
        System.out.println(getUUID());
    }
}
