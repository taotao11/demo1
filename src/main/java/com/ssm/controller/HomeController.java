package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 启动页 页面跳转类
 */
@Controller
public class HomeController {
    /**
     * 启动跳转页
     * @return
     */
    @RequestMapping(value = {"/index","/"})
    public String index(){
        return "login";
    }

    /**
     * 注册页跳转
     * @return
     */
    @RequestMapping("/register")
    public String register(){
        return "register";
    }
    @RequestMapping("/ces")
    public String ces(){
        return "ces";
    }

    /**
     * 个人信息页跳转
     * @return
     */
    @RequestMapping("/userInfo")
    public String userInfo(){
        return "userInfo";
    }

    /**
     * 添加义卖物品页跳转
     * @return
     */
    @RequestMapping("/addGoods")
    public String addGoods(){
        return "addGoods";
    }

    /**
     * 用户查看物品页跳转
     * @return
     */
    @RequestMapping("/myGoods")
    public String myGoods(){

        return "myGoods";
    }

    /**
     * 申请救助页跳转
     * @return
     */
    @RequestMapping("applyAssistance")
    public String applyAssistance(){
       return "applyAssistance";
    }

    /**
     * 救助列表
     * @return
     */
    @RequestMapping("myApplay")
    public String myApplay(){
        return "myApplay";
    }

    /**
     * 充值页面
     * @return
     */
    @RequestMapping("addMoney")
    public String addMoney(){
        return "addMoney";
    }

    /**
     * 用户充值列表页
     * @return
     */
    @RequestMapping("moneyList")
    public String moneyList(){
        return "moneyList";
    }

    /**
     * 用户查询订单跳转
     * @return
     */
    @RequestMapping("orderlist")
    public String orderList(){
        return "ordersUserInfo";
    }

    /**
     * 求助大厅
     * @return
     */
    @RequestMapping("contribute")
    public String contribute(){
        return "contribute";
    }

    /**
     * 我的捐助
     * @return
     */
    @RequestMapping("myjuanzhu")
    public String myjuanzhu(){
        return "myjuanzhen";
    }

    /**
     * 信息公开页
     * @return
     */
    @RequestMapping("pubilcInfo")
    public String message(){
        return "pubilcInfo";
    }

    /**
     * 平台捐赠信息公开
     * @return
     */
    @RequestMapping("pintaijuan")
    public String pintaijuan(){
        return "pintaijuan";
    }
}
