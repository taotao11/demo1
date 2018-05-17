package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Notice1;
import com.ssm.service.NoticeService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器 -- 公告添加
 * </p>
 *
 * @author 
 * @since 2018-05-09
 */
@Controller
@RequestMapping("/notice")
public class NoticeController1 {
    @Autowired
    private NoticeService1 noticeService;

    /**
     * 添加公告
     * @param notice
     * @return
     */
    @RequestMapping("/add")
    public ModelAndView add(Notice1 notice){
        ModelAndView mv = new ModelAndView();
        notice.setCreatTime(new Date());
        boolean insert = noticeService.insert(notice);
        if (insert){
            mv.addObject("error","添加成功!!");
        }else {
            mv.addObject("success","添加失败!!!");
        }
        mv.setViewName("html/web/add");
        return mv;
    }

    /**
     * 所有查询
     * @param current
     * @return
     */
    @RequestMapping("selectAll")
    public ModelAndView selectAll(int current){
        ModelAndView mv = new ModelAndView();
        List<String> desc = new ArrayList<String>();
        desc.add("id");
        Page<Notice1> page = noticeService.selectPage(new Page<Notice1>(current,10),new EntityWrapper<Notice1>()
        .orderBy("creat_time",false));
        mv.addObject("page",page);
        mv.setViewName("html/web/notice");
        return mv;
    }

    /**
     * 单个查询
     * @param id
     * @return
     */
    @RequestMapping("/select")
    public ModelAndView select(long id){
        ModelAndView mv = new ModelAndView();
        Notice1 notice = noticeService.selectById(id);
        mv.addObject("notice",notice);
        mv.setViewName("html/jie/notice");
        return mv;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("delete")
    public ModelAndView delete(long id){
        ModelAndView mv = new ModelAndView();
        noticeService.deleteById(id);
        mv.setViewName("html/web/notice");
        return mv;
    }

    /**
     *修改页跳转
     * @param id
     * @return
     */
    @RequestMapping("/set")
    public ModelAndView set(long id){
        ModelAndView mv = new ModelAndView();
        Notice1 notice = noticeService.selectById(id);
        mv.addObject("obj",notice);
        mv.setViewName("html/web/nupdate");
        return mv;
    }

    /**
     * 公告修改
     * @param
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView update(Notice1 notice){
        ModelAndView mv = new ModelAndView();
        boolean update = noticeService.updateById(notice);

        if (update){
            mv.addObject("success","修改成功!!");
        }else {
            mv.addObject("error","修改失败!!");
        }
        Notice1 notice1 = noticeService.selectById(notice.getId());
        mv.addObject("obj",notice1);
        mv.setViewName("html/web/nupdate");
        return mv;
    }
}

