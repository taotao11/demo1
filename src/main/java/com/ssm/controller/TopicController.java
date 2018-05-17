package com.ssm.controller;


import com.ssm.entity.Topic;
import com.ssm.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 
 * @since 2018-05-05
 */
@Controller
@RequestMapping("/topic")
public class TopicController {
    @Autowired
    private TopicService topicService;

    /**
     * 添加话题
     * @param topic
     * @return
     */
    @RequestMapping("/add")
    public ModelAndView add(Topic topic){
        ModelAndView mv = new ModelAndView();
        topic.setCreatTime(new Date());
        boolean insert = topicService.insert(topic);
        if (insert){
            mv.addObject("success","话题添加成功!!!");
        }else {
            mv.addObject("error","话题添加失败!!!");
        }
        mv.setViewName("html/jie/add");
        return mv;
    }

    /**
     * 话题删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public ModelAndView delete(long id,int type){
        ModelAndView mv = new ModelAndView();
        boolean delete = topicService.deleteById(id);
        if (delete){
            mv.addObject("success","删除成功!!!");
        }else {
            mv.addObject("error","删除失败");
        }
        if (type == 0) {
            mv.setViewName("html/web/topic");
        }else {
            mv.setViewName("html/user/index");
        }

        return mv;
    }

    /**
     *修改页跳转
     * @param id
     * @return
     */
    @RequestMapping("/set")
    public ModelAndView set(long id,int type){
        ModelAndView mv = new ModelAndView();
        Topic activity = topicService.selectById(id);
        mv.addObject("obj",activity);

        if (type == 0) {
            mv.setViewName("html/web/tupdate");
        }else {
            mv.setViewName("html/user/tupdate");
        }
        return mv;
    }

    /**
     * 话题修改
     * @param topic
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView update(Topic topic,int type){
        ModelAndView mv = new ModelAndView();
        boolean update = topicService.updateById(topic);

        if (update){
            mv.addObject("success","修改成功!!");
        }else {
            mv.addObject("error","修改失败!!");
        }
        Topic t = topicService.selectById(topic.getId());
        mv.addObject("obj",t);
        if (type == 0) {
            mv.setViewName("html/web/tupdate");
        }else {
            mv.setViewName("html/user/tupdate");
        }

        return mv;
    }
}

