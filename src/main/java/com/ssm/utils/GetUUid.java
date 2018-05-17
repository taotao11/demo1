package com.ssm.utils;
import org.springframework.validation.FieldError;

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
