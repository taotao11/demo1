package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 管理员页面跳转
 */
@Controller
@RequestMapping("/web")
public class WebController {
    /**
     * 管理员登录页跳转
     * @return
     */
    @RequestMapping(value = {"/","/index"})
    public String index(){
        return "/admin/login";
    }
    /**
     * 管理员添加页面跳转
     * @return
     */
    @RequestMapping("/register")
    public String register(){
        return "/admin/register";
    }

    /**
     * 管理员管理页跳转
     * @return
     */
    @RequestMapping("/adminsInfo")
    public String adminsInfo(){
        return "/admin/adminsInfo";
    }

    /**
     * 管理员信息修改页
     * @return
     */
    @RequestMapping("/adminInfo")
    public String adminInfo(){
       return "/admin/adminInfo";
    }

    /**
     * 用户管理跳转
     * @return
     */
    @RequestMapping("usersInfo")
    public String usersInfo(){
        return "admin/usersInfo";
    }

    /**
     * 救助页跳转
     * @return
     */
    @RequestMapping("/Apply")
    public String Applay(){
        return "admin/Applays";
    }

    /**
     * 义卖物品审核跳转
     * @return
     */
    @RequestMapping("/goods")
    public String goods(){
        return "admin/goods";
    }

    /**
     * 用户账单列表页
     * @return
     */
    @RequestMapping("moneyList")
    public String moneyList(){
        return "admin/moneyList";
    }

    /**
     * 用户定单页跳转
     * @return
     */
    @RequestMapping("orderList")
    public String orderList(){
        return "admin/ordersUserInfo";
    }

    /**
     * 用户捐赠查看
     * @return
     */
    @RequestMapping("myjuanzhen")
    public String juanzhen(){
        return "admin/myjuanzhen";
    }

}
