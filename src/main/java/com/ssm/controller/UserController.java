package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.common.SelectForm;
import com.ssm.entity.User;
import com.ssm.service.UserService;
import com.ssm.utils.GetUUid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器 会员管理
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 所有用户查询
     * @param current
     * @return
     */
    @RequestMapping("/selectAllUser/{current}")
    public ModelAndView selectAllUser(@PathVariable("current") int current){
        ModelAndView mv = new ModelAndView();
        //Page<User>(current,10) current 第几页 10 条数
        Page<User> page = userService.selectPage(new Page<User>(current,10),new EntityWrapper<User>());
        mv.setViewName("/admin/usersInfo");
        mv.addObject("page",page);
        return mv;
    }
    /**
     * 会员高级查询
     * @param form
     * @return
     */
    @RequestMapping("/heightSelect")
    public Page<User> heightSelectAdmin(SelectForm form){
        //得到查询条件
        EntityWrapper<User> wrapper = GetUUid.heightSelect(new EntityWrapper<User>(),form);
        Page<User> page = new Page<User>(form.getCurrent(),10);
        Page<User> pages = userService.selectPage(page,wrapper);
        return pages;
    }

    /**
     * 用户添加
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
    public ModelAndView AddUser(User user){

        ModelAndView mv = new ModelAndView();
        //判断是否存在账号
        int count = userService.selectCount(new EntityWrapper<User>().eq("zh",user.getZh()));
        if (count > 0){
            mv.addObject("error","存在账号请重试!!");
        }
        user.setCreatTime(new Date());
        //默认金币为0
        user.setMeny(0);
       boolean isInsert =  userService.insert(user);
       if (isInsert){
           mv.addObject("message","注册成功,请登录！！！");
           mv.setViewName("login");
           return mv;
       }else {
           mv.addObject("error","请填写完整后重试！！");
           mv.setViewName("register");
           return mv;
       }
    }

    /**
     * 修改用户
     * @param user
     * @return
     */
    @RequestMapping("/updateUser")
    public ModelAndView updateUser(User user,HttpSession session){
        ModelAndView mv = new ModelAndView();
        user.setUpdateTime(new Date());
        boolean isUpdate = userService.updateById(user);
        if (isUpdate){
            session.setAttribute("user",user);
            mv.setViewName("userInfo");
            mv.addObject("success","修改成功!!");
            return mv;
        }else {
            mv.setViewName("userInfo");
            mv.addObject("error","修改失败，请重试!!!");
            return mv;
        }
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public ModelAndView deleteUser(long id){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/usersInfo");
        boolean isDelete = userService.deleteById(id);
        if (isDelete){

            mv.addObject("success","删除管理员id:  {"+""+"} 成功!!");
        }else {
            mv.addObject("error","删除管理员id:  {"+""+"} 失败!!");
        }
        return mv;
    }

    /**
     * 会员登录
     * @param zh
     * @param pwd
     * @param session
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView login(String zh, String pwd, HttpSession session){
        ModelAndView mv = new ModelAndView();
        if (zh.equals("") || zh == null || pwd.equals("") || pwd.equals("")){
            mv.addObject("error","账号不为空");
            mv.setViewName("login");
            return  mv;
        }

        List<User> users = userService.selectList(
                new EntityWrapper<User>().eq("zh",zh)
        );
        if (users.size() == 0){
            mv.addObject("error","用户名密码不正确,请重试!!");
            mv.setViewName("login");
            return  mv;
        }
        User user = users.get(0);
        if (user.getPwd().equals(pwd)){
            session.setAttribute("user",user);
            mv.setViewName("index");
        }else {
            mv.addObject("error","用户名密码不正确,请重试!!");
            mv.setViewName("login");
            return mv;
        }

        return mv;
    }
    //退出登录
    @RequestMapping("/layout")
    public ModelAndView layout(HttpSession session){
      session.setAttribute("user",null);
      ModelAndView mv = new ModelAndView();
      mv.setViewName("login");
      return mv;
    }
}

