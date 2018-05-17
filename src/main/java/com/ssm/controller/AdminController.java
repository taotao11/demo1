package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import com.ssm.entity.Admin;
import com.ssm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器 管理员控制类
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    /**
     * 查询 所有管理员
     * @return
     */
    @RequestMapping("/selectAll")
    public ModelAndView selectAllAdmin (int current){
        ModelAndView mv = new ModelAndView();

        //current 第几页 size 条数
        Page<Admin> page = adminService.selectPage(new Page<Admin>(current,5),new EntityWrapper<Admin>());
       mv.setViewName("html/web/infos");
       mv.addObject("page",page);
        return mv;
    }

    /**
     * 添加管理员
     * @param admin
     * @return
     */
    @RequestMapping("/addAmain")
    public ModelAndView addAdmin(Admin admin){
        ModelAndView mv = new ModelAndView();
        System.out.println(admin);
       List<Admin> list =  adminService.selectList(new EntityWrapper<Admin>().eq("zh",admin.getZh()));
        if (list.size() < 0){
            mv.setViewName("/html/web/info");
            mv.addObject("error","账号已经存在,请更换账号!!");
            return mv;
        }
        admin.setCreatTime(new Date());
        try {
            boolean isInsert = adminService.insert(admin);
            if (isInsert){
                mv.addObject("success","新增成功!!!");
                mv.setViewName("/html/web/infos");
            }else {
                mv.setViewName("/html/web/info");
                mv.addObject("error","未知错误,请重试!!");
            }
        }catch (Exception e){
            mv.setViewName("/html/web/info");
            mv.addObject("error",e.getMessage());
        }


        return mv;
    }

    /**
     * 修改管理员
     * @param admin
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView updateAdmin(Admin admin,HttpSession session){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/html/web/info");
        System.out.println(admin);
        admin.setUpdateTime(new Date());
        boolean isupdae = adminService.updateById(admin);
        if(isupdae){
            mv.addObject("success","修改成功！！！");
            Admin adminSession = adminService.selectById(admin.getId());
            //重置session
            session.setAttribute("admin",adminSession);
            return mv;
        }else {
            mv.addObject("error", "修改成功!!!");
        }
        return mv;
    }

    /**
     * 删除管理员
     * @param id
     * @return
     */
    @RequestMapping("/deleteAdmin")
    public ModelAndView deleteAdmin(long id){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/html/web/infos");
        //删除
        boolean isDelete = adminService.deleteById(id);
        if(isDelete){
            mv.addObject("success","删除管理员id:  {"+""+"} 成功!!");
            return mv;
        }
        mv.addObject("error","删除管理员id:  {"+ id +"} 失败!!");
        return mv;
    }


    /**
     * 管理员登录
     * @param zh
     * @param pwd
     * @param session
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ModelAndView login(String zh, String pwd, HttpSession session){
        ModelAndView mv = new ModelAndView();
        List<Admin> admins = adminService.selectList(
                new EntityWrapper<Admin>().eq("zh",zh)
        );
        if (admins.size() == 0){
            mv.addObject("error","用户名密码不正确");
            mv.setViewName("/html/web/index");
            return mv;
        }
        Admin admin = admins.get(0);
        if (admin.getPwd().equals(pwd)){
            session.setAttribute("admin",admin);
            mv.setViewName("/html/web/info");
        }else {
            mv.setViewName("/html/web/index");
            mv.addObject("error","用户名密码不正确");
        }

        return mv;
    }

    /**
     * 管理员退出
     * @return
     */
    @RequestMapping("/layout")
    public String layout(HttpSession session){
        session.setAttribute("admin",null);

        return "html/web/index";
    }
}

