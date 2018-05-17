package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ssm.entity.Activity;
import com.ssm.entity.Img;
import com.ssm.entity.Jindian;
import com.ssm.service.ActivityService;
import com.ssm.service.ImgService;
import com.ssm.utils.UploadFlies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器 活动
 * </p>
 *
 * @author 
 * @since 2018-05-05
 */
@Controller
@RequestMapping("/activity")
public class ActivityController {
    @Autowired
    private ActivityService activityService;
    @Autowired
    private ImgService imgService;

    /**
     * 添加活动
     * @param activity
     * @param file
     * @param request
     * @return
     */
    @RequestMapping("/addA")
    public ModelAndView addA(Activity activity,MultipartFile file, HttpServletRequest request,String time){
        ModelAndView mv = new ModelAndView();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        mv.setViewName("html/jie/add");
        if (activity.getTitle() == null || "".equals(activity.getTitle()) || activity.getUid() == null){
            mv.addObject("error","标题不为空!!");
            return mv;
        }
        //图片接收格式
        String path = request.getSession().getServletContext().getRealPath("WEB-INF/page/res/aimg");
        String type = file.getOriginalFilename().substring(file.getOriginalFilename().length() -4);
        List<String> list = new ArrayList<String>();
        String name = new Date().getTime() + type;
        list.add(".jpg");
        list.add(".gif");
        list.add(".png");
        boolean isType = false;

        if (file != null){
            //格式检查
            for (String s : list){
                if (type.equals(s)){
                    isType = true;
                }
            }
            if (isType){
                try {
                    UploadFlies.uploadFile(file.getBytes(),path,name);
                    //景点添加
                    Date newTime = format.parse(time);
                    activity.setBeginTime(newTime);
                    boolean insert = activityService.insert(activity);
                    if (insert){
                        List<Activity> jindians = activityService.selectList(new EntityWrapper<Activity>()
                                .eq("title",activity.getTitle())
                                .and()
                                .eq("uid",activity.getUid()));
                        Img img = new Img();
                        img.setaId(jindians.get(0).getId());
                        img.setImgUrl("res/aimg/" + name);
                        imgService.insert(img);
                    }else {
                        mv.addObject("error","活动添加失败!!");
                    }

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    mv.addObject("error",e.getMessage());
                }
                mv.addObject("success","上传成功!!");
            }else {
                mv.addObject("error","格式不正确");
            }
        }
        return mv;
    }
    @RequestMapping("/add")
    public String add(Activity activity){
        System.out.println(1111);
        return "hhh";
    }

    /**
     * 活动删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public ModelAndView delete(long id,int type){
        ModelAndView mv = new ModelAndView();
        boolean delete = activityService.deleteById(id);
        if (delete){
            mv.addObject("success","删除成功!!!");
        }else {
            mv.addObject("error","删除失败");
        }

        if (type == 0) {
            mv.setViewName("html/web/activity");
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
        Activity activity = activityService.selectById(id);
        mv.addObject("obj",activity);
        if (type == 0) {
            mv.setViewName("html/web/aupdate");
        }else {
            mv.setViewName("html/user/aupdate");
        }
        return mv;
    }

    /**
     * 活动修改修改
     * @param activity
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView update(Activity activity,int type){
        ModelAndView mv = new ModelAndView();
        boolean update = activityService.updateById(activity);

        if (update){
            mv.addObject("success","修改成功!!");
        }else {
            mv.addObject("error","修改失败!!");
        }
        Activity act = activityService.selectById(activity.getId());
        mv.addObject("obj",act);
        if (type == 0) {
            mv.setViewName("html/web/aupdate");
        }else {
            mv.setViewName("html/user/aupdate");
        }

        return mv;
    }
}

