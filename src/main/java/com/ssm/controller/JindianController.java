package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ssm.entity.Img;
import com.ssm.entity.Jindian;
import com.ssm.service.ImgService;
import com.ssm.service.JindianService;
import com.ssm.utils.UploadFlies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器 景点表操作
 * </p>
 *
 * @author 
 * @since 2018-05-05
 */
@Controller
@RequestMapping("/jindian")
public class JindianController {
    @Autowired
    private JindianService jindianService;
    @Autowired
    private ImgService imgService;

    /**
     * 添加景点
     * @param jindian
     * @param file
     * @return
     */
    @RequestMapping("/addJD")
    public ModelAndView addJD(Jindian jindian, MultipartFile file, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/jie/add");
        if (jindian.getTitle() == null || "".equals(jindian.getTitle()) || jindian.getUid() == null){
            mv.addObject("error","标题不为空!!");
            return mv;
        }
        //图片接收格式
        String path = request.getSession().getServletContext().getRealPath("WEB-INF/page/res/jimg");
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
                        jindian.setBeginTime(new Date());
                        boolean insert = jindianService.insert(jindian);
                        if (insert){
                            List<Jindian> jindians = jindianService.selectList(new EntityWrapper<Jindian>()
                            .eq("title",jindian.getTitle())
                            .and()
                            .eq("uid",jindian.getUid()));
                            Img img = new Img();
                            img.setjId(jindians.get(0).getId());
                            img.setImgUrl("res/jimg/" + name);
                            imgService.insert(img);
                        }else {
                            mv.addObject("error","景点添加失败!!");
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

    /**
     * 删除景点
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public ModelAndView delete(long id,int type){
        ModelAndView mv = new ModelAndView();
       boolean delete = jindianService.deleteById(id);
       if (delete){
          mv.addObject("success","删除成功!!!");
       }else {
           mv.addObject("error","删除失败");
       }
        if (type == 0) {
            mv.setViewName("html/web/jindian");
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
        Jindian activity = jindianService.selectById(id);
        mv.addObject("obj",activity);

        if (type == 0) {
            mv.setViewName("html/web/jupdate");
        }else {
            mv.setViewName("html/user/jupdate");
        }
        return mv;
    }

    /**
     * 景点修改
     * @param jindian
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView update(Jindian jindian,int type){
        ModelAndView mv = new ModelAndView();
        boolean update = jindianService.updateById(jindian);

        if (update){
            mv.addObject("success","修改成功!!");
        }else {
            mv.addObject("error","修改失败!!");
        }
        Jindian jindian1 = jindianService.selectById(jindian.getId());
        mv.addObject("obj",jindian1);
        if (type == 0) {
            mv.setViewName("html/web/jupdate");
        }else {
            mv.setViewName("html/user/jupdate");
        }

        return mv;
    }
}

