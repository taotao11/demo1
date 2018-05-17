package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ssm.entity.Follow;
import com.ssm.entity.User;
import com.ssm.service.FollowService;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * <p>
 *  前端控制器 -- 关注控制器
 * </p>
 *
 * @author 
 * @since 2018-05-09
 */
@Controller
@RequestMapping("/follow")
public class FollowController {
    @Autowired
    private FollowService followService;
    @Autowired
    private UserService userService;
    @Autowired
    private HttpSession httpSession;
    /**
     * 添加关注
     * @param gid
     * @param bid
     * @return
     */
    @ResponseBody
    @RequestMapping("/add")
    public String add(long gid,long bid){
        if (gid == bid){
            return "1";
        }
        Follow follow = new Follow();
        follow.setBid(bid);
        follow.setGid(gid);
        follow.setCreatTime(new Date());
        boolean insert = followService.insert(follow);
        if (insert){
            return "success";
        }else {
            return "lose";
        }
    }

    /**
     * 取消关注
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public ModelAndView delete(long id){
        ModelAndView mv = new ModelAndView();
        boolean delete = followService.deleteById(id);
        if (delete){
           mv.setViewName("html/user/follow");
        }else {
            mv.setViewName("html/user/follow");
        }
        return mv;
    }

    /**
     * 查询
     * @return
     */
    @RequestMapping("/selectAll")
    public ModelAndView selectAll(long id){
        ModelAndView mv = new ModelAndView();
        List<Follow> list = followService.selectList(new EntityWrapper<Follow>()
        .eq("gid",id));
        for (int i = 0; i < list.size(); i++){
            User user = userService.selectById(list.get(i).getBid());
            list.get(i).setUser(user);
        }
        mv.addObject("follow",list);
        mv.setViewName("html/user/follow");
        return mv;
    }
}

