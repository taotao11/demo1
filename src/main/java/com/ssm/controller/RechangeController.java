package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Rechange;
import com.ssm.entity.User;
import com.ssm.service.RechangeService;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
@Controller
@RequestMapping("/rechange")
public class RechangeController {
    @Autowired
    private RechangeService rechangeService;
    @Autowired
    private UserService userService;

    /**
     * 管理员查询充值账单
     * @param
     * @param current
     * @return
     */
    @RequestMapping("/selectMoneyByAdmin")
    public ModelAndView selectMoneyByAdmin(int current){
        ModelAndView mv = new ModelAndView();
        Page<Rechange> page = rechangeService.selectPage(new Page<Rechange>(current,5),
                new EntityWrapper<Rechange>());
        mv.addObject("page",page);

        for (int i = 0; i< page.getRecords().size();i++){
            long uid = page.getRecords().get(i).getUid();

            String user = userService.selectById(uid).getName();
            System.out.println(user);
            page.getRecords().get(i).setUser(user);
        }
        mv.setViewName("admin/moneyList");
        return mv;
    }

    /**
     * 用户查询充值账单
     * @param uid
     * @param current
     * @return
     */
    @RequestMapping("/selectMoneyByUid")
    public ModelAndView selectMoneyByUid(long uid,int current){
        ModelAndView mv = new ModelAndView();
       Page<Rechange> page = rechangeService.selectPage(new Page<Rechange>(current,5),
                new EntityWrapper<Rechange>()
                .eq("uid",uid));
        mv.addObject("page",page);
        mv.setViewName("moneyList");
        return mv;
    }

    /**
     * 会员充值
     * @param rechange
     * @return
     */
    //添加事务
    @Transactional
    @RequestMapping("/addRechange")
    public ModelAndView AddReChange(Rechange rechange, String pwd, HttpSession session){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("addMoney");
        if (rechange.getUid() == null){
            mv.addObject("error","严重错误，请先登录!!!");
            return mv;
        }
        if (rechange.getMoney() == 0){
            mv.addObject("error","充值金币不能为0");
        }
        User user = userService.selectById(rechange.getUid());
        if (user == null){
            mv.addObject("error","严重错误，请先登录!!!");
            return mv;
        }else if (!pwd.equals(user.getPwd())){
            mv.addObject("error","严重错误，密码不正确!!!");
            return mv;
        }

        rechange.setCreatTime(new Date());
        try {
            boolean isInsert =  rechangeService.insert(rechange);
            if (isInsert){

                user.setMeny(user.getMeny() + rechange.getMoney());
                //添加用户金币
                userService.updateById(user);
                session.setAttribute("user",user);
                mv.addObject("success","充值成功!!!");
            }else {
                mv.addObject("error","充值失败!!!");
            }
        }catch (Exception e){
            mv.addObject("error",e.getMessage());
        }
        return mv;
    }
}

