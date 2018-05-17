package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台控制器
 */
@Controller
@RequestMapping("/web")
public class webController {
    /**
     * 管理员登录页
     * @return
     */
    @RequestMapping({"/","index"})
    public String index(){
        return "html/web/index";
    }

    /**
     * 信息页
     * @return
     */
    @RequestMapping("/info")
    public String info(){
        return "html/web/info";
    }

    /**
     * 管理员列表
     * @return
     */
    @RequestMapping("infos")
    public String infos(){
        return "/html/web/infos";
    }
    @RequestMapping("/jupadate")
    public String update(){
        return "html/web/jupdate";
    }

    /**
     * 添加公告跳转
     * @return
     */
    @RequestMapping("/addNotice")
    public String notice(){
        return "html/web/add";
    }
}
