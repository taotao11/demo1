package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Money;
import com.ssm.entity.Qzmessage;
import com.ssm.entity.User;
import com.ssm.service.*;
import com.ssm.utils.UploadFlies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  救助申请控制器
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
@Controller
@RequestMapping("/qzmessage")
public class QzmessageController {
    @Autowired
    private QzmessageService qzmessageService;

    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;
    @Autowired
    MoneyService moneyService;

    /**
     * 公共信息
     * @param current
     * @return
     */
    @RequestMapping("pqzshow")
    public ModelAndView pqzhomeShow(int current){
        ModelAndView mv = new ModelAndView();
        //只有通过管理员认同之后才显示大厅
        Page<Qzmessage> page = qzmessageService.selectPage(new Page<Qzmessage>(current,6),
                new EntityWrapper<Qzmessage>().eq("type",1));
        for (int i = 0; i< page.getRecords().size();i++){

            long uid = page.getRecords().get(i).getUid();
            String user = userService.selectById(uid).getName();
            page.getRecords().get(i).setUser(user);

            String [] src = page.getRecords().get(i).getPicurl().split(";");
            List<String> list = new ArrayList<String>();
            for (String s : src){
                list.add(s);
            }
            page.getRecords().get(i).setUrls(list);
        }
        mv.setViewName("pintaijuan");
        mv.addObject("page",page);
        return mv;
    }

    /**
     * 救助大厅展示
     * @param current
     * @return
     */
   @RequestMapping("qzshow")
   public ModelAndView qzhomeShow(int current){
       ModelAndView mv = new ModelAndView();
       //只有通过管理员认同之后才显示大厅
       Page<Qzmessage> page = qzmessageService.selectPage(new Page<Qzmessage>(current,6),
               new EntityWrapper<Qzmessage>().eq("type",1));
       for (int i = 0; i< page.getRecords().size();i++){

           long uid = page.getRecords().get(i).getUid();
           String user = userService.selectById(uid).getName();
           page.getRecords().get(i).setUser(user);

           String [] src = page.getRecords().get(i).getPicurl().split(";");
           List<String> list = new ArrayList<String>();
           for (String s : src){
               list.add(s);
           }
           page.getRecords().get(i).setUrls(list);
       }
       mv.setViewName("contribute");
       mv.addObject("page",page);
       return mv;
   }
    /**
     * 所有救助申请查询
     * @param current
     * @return
     */
    @RequestMapping("selectAllQz")
    public ModelAndView selectAllQz(int current){
        ModelAndView mv = new ModelAndView();
        Page<Qzmessage> page = qzmessageService.selectPage(new Page<Qzmessage>(current,5),
                new EntityWrapper<Qzmessage>().orderBy("type"));
        mv.setViewName("/admin/Applays");
        //拿到admin 名称
        for (int i = 0; i< page.getRecords().size();i++){

           long uid = page.getRecords().get(i).getUid();
           String user = userService.selectById(uid).getName();
            page.getRecords().get(i).setUser(user);
            if (page.getRecords().get(i).getAid() == null){

            }else {
                long aid = page.getRecords().get(i).getAid();
                String admin = adminService.selectById(aid).getName();
                page.getRecords().get(i).setAdmin(admin);
            }
        }
        mv.addObject("page",page);
        return mv;
    }

    /**
     * 审核救助申请
     * @param qzmessage
     * @return
     */
    @Transactional
    @RequestMapping("updateQzmessage")
    public  ModelAndView updateQzmessage(Qzmessage qzmessage){
        ModelAndView mv = new ModelAndView();
        qzmessage.setEndTime(new Date());
        try {
            //给钱
            if (qzmessage.getType() == 1){
                User user = userService.selectById(qzmessage.getUid());
                user.setMeny(user.getMeny() + qzmessage.getQpice());
                user.setUpdateTime(new Date());
                Money money = moneyService.selectById(1);
                money.setUpdateTime(new Date());
                money.setMoney(money.getMoney() - qzmessage.getQpice());
                moneyService.updateById(money);
                userService.updateById(user);
            }
            boolean isUpdate  = qzmessageService.updateById(qzmessage);
            if (isUpdate){
                mv.addObject("success","审核救助申请成功!!!");
            }else {
                mv.addObject("error","审核救助申请失败!!!");
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
            mv.addObject("error","系统错误!!!");
            mv.setViewName("admin/Applays");
            return mv;
        }

        mv.setViewName("admin/Applays");
        return mv;
    }

    /**
     * 救助申请
     * @param qzmessage
     * @return
     */
    @RequestMapping("/addMessage")
    public ModelAndView addQzmessage(Qzmessage qzmessage, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("applyAssistance");

        List<MultipartFile> files = ((MultipartHttpServletRequest) request)
                .getFiles("files");
        //如果文件不为空，写入上传路径
        StringBuilder filesname = new StringBuilder();
        if (files.size() != 0 && qzmessage != null) {
            String path = request.getSession().getServletContext().getRealPath("WEB-INF/page/upload/qzmessage");
            System.out.println(path);
            for (MultipartFile file: files){
                System.out.println(file.getOriginalFilename());
                String type = file.getOriginalFilename().substring(file.getOriginalFilename().length() -4);
                List<String> list = new ArrayList<String>();
                list.add(".jpg");
                list.add(".gif");
                list.add(".png");
                //格式检查
                boolean isType = false;
                for (String s : list){

                    if (type.equals(s)){
                        isType = true;
                    }
                }
                if (!isType){
                    mv.addObject("error","不支持上传" + type + "类型文件");
                    return mv;
                }

                //上传文件名
                String  filename = new Date().getTime() + type;
                File filepath = new File(path, filename);
                //判断路径是否存在，如果不存在就创建一个
                if (!filepath.getParentFile().exists()) {
                    System.out.println(filepath.getPath());
                    filepath.getParentFile().mkdirs();
                }
                //将上传文件保存到一个目标文件当中
                try {
                    UploadFlies.uploadFile(file.getBytes(), path, filename);
                    filesname.append(filename);
                    filesname.append(";");
                } catch (Exception e) {
//                e.printStackTrace();
                    mv.addObject("error",e.getMessage());
                    return mv;
                }
            }

        }
        //设置图片地址
        qzmessage.setPicurl(filesname.toString());
        qzmessage.setCreatTime(new Date());
        /**
         * 求助信息状态 0 以创建 1 以通过打款 2 不通过
         */
        qzmessage.setType(0);
        try {
            boolean isInsert = qzmessageService.insert(qzmessage);
            if (isInsert){
                mv.addObject("success","申请成功,请等待管理员审核");
            }else {
                mv.addObject("error","申请失败请重试!!");
            }
        }catch (Exception e){
            mv.addObject("error",e.getMessage());
        }
        return mv;
    }

    /**
     * 会员查询救助列表
     * @param uid
     * @param current
     * @return
     */
    @RequestMapping("/selectApplayByUid")
    public ModelAndView selectGoodsByUid(@RequestParam(value = "uid") Long uid, @RequestParam(value = "current") int current){
        ModelAndView mv = new ModelAndView();

        Page<Qzmessage> page = new Page<Qzmessage>(current,5);
        //排序字段
        List<String> list = new ArrayList<String>();
        list.add("type");
        Page<Qzmessage> pages = qzmessageService.selectPage(page,
                new EntityWrapper<Qzmessage>()
                        .eq("uid",uid).orderAsc(list));
        mv.addObject("page",pages);
        mv.setViewName("myApplay");
        return mv;
    }

    /**
     * 救助列表详细信息查询
     * @return
     */
    @RequestMapping("/selectApplayByQid")
    public ModelAndView selectApplayByQid(long id){
        ModelAndView mv = new ModelAndView();
        Qzmessage qzmessage = qzmessageService.selectById(id);
       //申请求助的会员名
        long uid = qzmessage.getUid();
        String user = userService.selectById(uid).getName();
        qzmessage.setUser(user);
        //管理员名称
        if (qzmessage.getAid() == null){

        }else {
            long aid = qzmessage.getAid();
            String admin = adminService.selectById(aid).getName();
            qzmessage.setAdmin(admin);
        }
        //设置图片地址
        String [] src = qzmessage.getPicurl().split(";");
        List<String> list = new ArrayList<String>();
        for (String s : src){
            list.add(s);
        }
        qzmessage.setUrls(list);
        mv.setViewName("qzmessageInfo");
        mv.addObject("qz",qzmessage);
        return mv;
    }
}

