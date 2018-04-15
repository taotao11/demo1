package com.ssm.controller;


import com.ssm.entity.Money;
import com.ssm.service.MoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
@Controller
@RequestMapping("/money")
public class MoneyController {
    @Autowired
    private MoneyService moneyService;
   @RequestMapping("select")
    public ModelAndView selectMoney(){
        ModelAndView mv = new ModelAndView();
        Money money = moneyService.selectById(1);
        mv.setViewName("index");
        mv.addObject("money",money);
        return mv;
    }
    @RequestMapping("selectAdmin")
    public ModelAndView selectMoneyAdmin(){
        ModelAndView mv = new ModelAndView();
        Money money = moneyService.selectById(1);
        mv.setViewName("admin/index");
        mv.addObject("money",money);
        return mv;
    }
}

