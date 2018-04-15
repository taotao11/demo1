package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.common.SelectForm;
import com.ssm.entity.Goods;
import com.ssm.service.AdminService;
import com.ssm.service.GoodsService;
import com.ssm.service.UserService;
import com.ssm.utils.GetUUid;
import com.ssm.utils.UploadFlies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

/**
 * <p>
 *  前端控制器
 *  义捐物品控制类
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;

    /**
     * 义捐物品添加
     * @param goods
     * @param request
     * @return
     */
    @RequestMapping("/addGoods")
    public ModelAndView AddGoos(Goods goods, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        List<MultipartFile> files = ((MultipartHttpServletRequest) request)
                .getFiles("files");
        //如果文件不为空，写入上传路径
        StringBuilder filesname = new StringBuilder();
        if (files.size() != 0 && goods != null) {
            String path = request.getSession().getServletContext().getRealPath("WEB-INF/page/upload/goods");
            System.out.println(path);
            for (MultipartFile file: files){
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
                    mv.setViewName("addGoods");
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
                    mv.setViewName("addGoods");
                    mv.addObject("error",e.getMessage());
                    return mv;
                }
            }

        }
        //设置图片地址
        goods.setGurl(filesname.toString());
        //设置创建时间
        goods.setCreatTime(new Date());
        //设置物品状态 0 以创建 1 未通过 2 已通过 3以卖出
        goods.setType(0);
        goodsService.insert(goods);
        mv.setViewName("addGoods");
        mv.addObject("success","上传成功");
        return mv;
    }

    /**
     * 管理员高级查询
     * @param form
     * @return
     */
    @RequestMapping("/heightSelect")
    public ModelAndView heightSelectAdmin(SelectForm form){
        ModelAndView mv = new ModelAndView();
        //得到查询条件

        EntityWrapper<Goods> wrapper = GetUUid.heightSelect(new EntityWrapper<Goods>(),form);
        Page<Goods> page = new Page<Goods>(form.getCurrent(),5);
        Page<Goods> pages = goodsService.selectPage(page,wrapper);
        mv.addObject("page",pages);
        mv.setViewName("myGoods");
        return mv;
    }

    /**
     * 会员查询义捐物品
     * @param uid
     * @param current
     * @return
     */

    @RequestMapping("/selectGoodsByUid")
    public ModelAndView selectGoodsByUid(@RequestParam(value = "uid") Long uid,@RequestParam(value = "current") int current){
        ModelAndView mv = new ModelAndView();

        Page<Goods> page = new Page<Goods>(current,5);
        Page<Goods> pages = goodsService.selectPage(page,
                new EntityWrapper<Goods>()
                .eq("uid",uid));
        mv.addObject("page",pages);
        mv.setViewName("myGoods");
        return mv;
    }

    /**
     *物品详细信息
     * @return
     */
    @RequestMapping("/selectGoodsInfo")
    public ModelAndView selectGoodsInfo(long id){
        ModelAndView mv = new ModelAndView();
        Goods goods = goodsService.selectById(id);
        String user = userService.selectById(goods.getUid()).getName();
        goods.setUser(user);
        String[] urls = goods.getGurl().split(";");
        mv.setViewName("goodsInfo");
        mv.addObject("goods",goods);
        mv.addObject("imgUrl",urls);
        return mv;
    }
    /**
     * 管理员审核
     * @param goods
     * @return
     */
    @RequestMapping("/updateGoods")
    public ModelAndView updateGoods(Goods goods){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/goods");
        try {
            boolean isUpdae = goodsService.updateById(goods);
            if (isUpdae){
                mv.addObject("success","审核成功!!!");
            }else {
                mv.addObject("error","审核失败!!!");
            }
        }catch (Exception e){
            mv.addObject("error",e.getMessage());
        }

        return mv;
    }

    /**
     * 管理员查询所有物品
     * @param current
     * @return
     */
    @RequestMapping("/selectAllGoods")
    public ModelAndView selectAllGoods(int current){
        ModelAndView mv = new ModelAndView();
        Page<Goods> page = goodsService.selectPage(new Page<Goods>(current,5),
                new EntityWrapper<Goods>().orderBy("type"));
        //拿到admin 名称
        for (int i = 0; i< page.getRecords().size();i++){
            long uid = page.getRecords().get(i).getUid();

            String user = userService.selectById(uid).getName();
            System.out.println(user);
            page.getRecords().get(i).setUser(user);

            if (page.getRecords().get(i).getAid() == null){

            }else {
                long aid = page.getRecords().get(i).getAid();
                String admin = adminService.selectById(aid).getName();
                page.getRecords().get(i).setAdmin(admin);
            }
        }
        mv.setViewName("admin/goods");
        mv.addObject("page",page);
        return mv;
    }

    /**
     * 义卖大厅查询
     * @param current
     * @return
     */
    @RequestMapping("selectByType")
    public ModelAndView selectByType(int current){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ces");
        //ne、neq不相等，   gt大于， lt小于 gte、ge大于等于   lte、le 小于等于   not非
        Page<Goods> page = goodsService.selectPage(new Page<Goods>(current,6),
                new EntityWrapper<Goods>().eq("type",2));
        for (int i = 0; i< page.getRecords().size();i++) {
            long uid = page.getRecords().get(i).getUid();
            String user = userService.selectById(uid).getName();
            System.out.println(user);
            page.getRecords().get(i).setUser(user);
         //拿到所有的图片路劲
            String [] src = page.getRecords().get(i).getGurl().split(";");
             List<String> list = new ArrayList<String>();
             for (String s : src){
                 list.add(s);
             }
             page.getRecords().get(i).setPicUrl(list);
        }
        mv.addObject("page",page);
        return mv;
    }
}
