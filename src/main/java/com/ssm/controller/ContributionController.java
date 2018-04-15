package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Contribution;
import com.ssm.entity.Qzmessage;
import com.ssm.entity.User;
import com.ssm.service.ContributionService;
import com.ssm.service.QzmessageService;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * <p>
 *  前端控制器--捐赠控制器
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
@Controller
@RequestMapping("/contribution")
public class ContributionController {
    @Autowired
    private ContributionService contributionService;
    @Autowired
    private UserService userService;
    @Autowired
    private QzmessageService qzmessageService;

    //管理员查询捐赠表
    @RequestMapping("/selectAll")
    public ModelAndView selectAll(int current){
        ModelAndView mv = new ModelAndView();
        Page<Contribution> page = contributionService.selectPage(new Page<Contribution>(current,5)
        ,new EntityWrapper<Contribution>());
        mv.setViewName("admin/myjuanzhen");
        for (int i= 0; i< page.getRecords().size(); i++){
            //捐献的人
            long jid = page.getRecords().get(i).getMid();
            String jName = userService.selectById(jid).getName();
            page.getRecords().get(i).setjName(jName);
            //被捐的人
            long qid = page.getRecords().get(i).getQuid();
            String qName = userService.selectById(qid).getName();
            page.getRecords().get(i).setName(qName);
        }
        mv.addObject("page",page);
        return mv;
    }

    /**
     * 添加捐献信息
     * @param jid
     * @param
     * @param qid
     * @param count
     * @param pwd
     * @return
     */
    @RequestMapping("/addContribution")
    public ModelAndView addContribution(long jid,long qid,int count,String pwd){
        ModelAndView mv = new ModelAndView();
        if (jid == 0 || qid == 0 || count == 0
                || pwd.equals("") || pwd == null){
            mv.setViewName("login");
            mv.addObject("error","请先登录!!!");
            return mv;
        }
        //查询当前会员信息
        User user = userService.selectById(jid);
        //判断
        if (user == null){
            mv.setViewName("login");
            mv.addObject("error","请先登录!!!");
            return mv;
        }
        if (!user.getPwd().equals(pwd)){
            mv.setViewName("qzmessageInfo");
            mv.addObject("error","密码错误!!!");
            return mv;
        }
        if (user.getMeny() < count){
            mv.setViewName("qzmessageInfo");
            mv.addObject("error","金币不够!!!");
            return mv;
        }
        //查询捐助信息
        Qzmessage qzmessage = qzmessageService.selectById(qid);

        User bjUser = userService.selectById(qzmessage.getUid());

        try {
            //当前会员金币减少
            user.setUpdateTime(new Date());
            user.setMeny(user.getMeny() - count);
            userService.updateById(user);
            //被捐会员金币增加
            bjUser.setUpdateTime(new Date());
            bjUser.setMeny(user.getMeny() + count);
            userService.updateById(bjUser);
            //生成捐赠表
            Contribution contribution = new Contribution();
            contribution.setCreatTime(new Date());
            /**
             * 捐钱的
             */
            contribution.setMid(user.getId());
            /**
             * 求助者id
             */
            contribution.setQid(bjUser.getId());
            /**
             * 求助信息表
             */
            contribution.setQuid(qzmessage.getId());
            /**
             * 钱
             */
           contribution.setMoney(count);
           contributionService.insert(contribution);

        }catch (Exception e){
            System.out.println(e.getMessage());
            mv.setViewName("qzmessageInfo");
            mv.addObject("error","系统错误!!!");
            return mv;
        }
        mv.addObject("success","捐赠成功!!");
        mv.setViewName("myjuanzhen");
        return mv;
    }

    /**
     * 会员查询捐赠表
     * @param uid
     * @param current
     * @return
     */
    @RequestMapping("selectByUid")
    public ModelAndView selectByUid(long uid ,int current){
        ModelAndView mv = new ModelAndView();
        Page<Contribution> page = contributionService.selectPage(new Page<Contribution>(current,5)
                ,new EntityWrapper<Contribution>().eq("mid",uid));
        mv.setViewName("myjuanzhen");
        for (int i= 0; i< page.getRecords().size(); i++){
            //被捐的人
            long qid = page.getRecords().get(i).getQuid();
            String qName = userService.selectById(qid).getName();
            page.getRecords().get(i).setName(qName);
        }
        mv.addObject("page",page);
        return mv;
    }
}

