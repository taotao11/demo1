package com.ssm.controller;


import com.ssm.entity.Comment;
import com.ssm.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * <p>
 *  前端控制器 评论
 * </p>
 *
 * @author 
 * @since 2018-05-05
 */
@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @ResponseBody
    @RequestMapping("/add")
    public String addC(Comment comment){
        comment.setTime(new Date());
        boolean insert = commentService.insert(comment);
        if (insert){
            return "success";
        }else {
            return "loser";
        }
    }
    /**
     * 评论景点
     * @param id
     * @return
     */
    
    @RequestMapping("/delete")
    public ModelAndView delete(long id,int type){
        ModelAndView mv = new ModelAndView();
        boolean delete = commentService.deleteById(id);
        if (delete){
            mv.addObject("success","删除评论成功!!!");
        }else {
            mv.addObject("error","删除评论失败");
        }
        switch (type){
            case 1:mv.setViewName("html/web/jindian");break;
            case 2:mv.setViewName("html/web/activity");break;
            case 3:mv.setViewName("html/web/topic");break;
        }
        return mv;
    }

}

