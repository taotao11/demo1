package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.*;
import com.ssm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * <p>
 *  前端控制器--订单表控制器
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private RechangeService rechangeService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private MoneyService moneyService;
    /**
     * 会员购买操作
     * @param uid
     * @param gid
     * @param pwd
     * @param address
     * @return
     */
    //事务管理
    @Transactional
    @RequestMapping("/addOrderByUser")
    public ModelAndView addOrderByUser(int uid,int gid,String pwd, String address,String ipone){
        ModelAndView mv = new ModelAndView();
        if (uid == 0|| gid == 0 || pwd == null || pwd.equals("")
                || address == null || address.equals("")){
            mv.addObject("error","请先登录!!!");
            mv.setViewName("login");
            return mv;
        }

        //先查询会员信息
        User user = userService.selectById(uid);
        if (user == null){
            mv.setViewName("login");
            mv.addObject("error","请先登录!!!");
            return mv;
        }
        if (!user.getPwd().equals(pwd)){
            mv.addObject("error","密码不正确请重试!!!");
            mv.setViewName("goodsInfo");
            return mv;
        }
        //在查询物品信息
        Goods goods = goodsService.selectById(gid);
        if (goods == null || goods.getType() == 0 || goods.getType() == 1 || goods.getType() == 3){
            mv.addObject("error","物品不存在!!");
            mv.setViewName("goodsInfo");
            return mv;
        }
        //比对会员的金币与物品价格
        if (goods.getPice() > user.getMeny()){
            mv.addObject("error","金币不足");
            mv.setViewName("goodsInfo");
            return mv;
        }

        user.setMeny(user.getMeny() - goods.getPice());

        user.setUpdateTime(new Date());
        try {
            //会员金币减少
            userService.updateById(user);
            //生成记录
            Rechange rechange = new Rechange();
            rechange.setUid(user.getId());
            rechange.setType("购买物品");
            rechange.setMoney(-goods.getPice());
            rechange.setCreatTime(new Date());
            rechangeService.insert(rechange);
//            int i = 1/0;
            //物品状态改变
            goods.setType(3);
            goods.setEndTime(new Date());
            goodsService.updateById(goods);

            //平台金池数增加
            Money money = moneyService.selectById(1);
            money.setMoney(money.getMoney() + goods.getPice());
            money.setUpdateTime(new Date());
            moneyService.updateById(money);

            //生成订单
            OrderUser orderUser = new OrderUser();
            //生成时间
            orderUser.setCreatTime(new Date());
            //收获地址
            orderUser.setAdress(address);
            //联系电话
            orderUser.setIpone(ipone);
            // 价格
            orderUser.setPice(goods.getPice());
            //物品id
            orderUser.setGid(goods.getId());
            //卖家id
            orderUser.setSid(goods.getUid());
            //买家id
            orderUser.setBid(user.getId());
            orderService.insert(orderUser);


        }catch (Exception e){
            mv.setViewName("goodsInfo");
            mv.addObject("error","系统错误,请联系管理员!!!");
            System.out.println(e.getMessage());
            return mv;
        }

        mv.setViewName("ordersUserInfo");
        mv.addObject("success","购买成功!!!");
        return mv;
    }

    /**
     *会员查询订单
     * @param uid
     * @return
     */
    @RequestMapping("selectOrderByUid")
    public ModelAndView selectByUid(long uid,int current){
        ModelAndView mv = new ModelAndView();
        Page<OrderUser> page = orderService.selectPage(new Page<OrderUser>(current,5),
                new EntityWrapper<OrderUser>().eq("bid",uid));

        for (int i = 0; i < page.getRecords().size(); i++){
            //卖家名
            long sid = page.getRecords().get(i).getSid();
            String sname = userService.selectById(sid).getName();
            page.getRecords().get(i).setSname(sname);
            //买家名
            long bid = page.getRecords().get(i).getBid();
            String bname = userService.selectById(bid).getName();
            page.getRecords().get(i).setBname(bname);
            //物品名称
            long gid = page.getRecords().get(i).getGid();
            String goodsName = goodsService.selectById(gid).getName();
            page.getRecords().get(i).setGoodsName(goodsName);
        }
        mv.setViewName("ordersUserInfo");
        mv.addObject("page",page);
        return mv;
    }

    /**
     *管理员查询订单 selectOrderByPubilc
     * @param
     * @return
     */
    @RequestMapping("selectOrderByAdmin")
    public ModelAndView selectByAdmin(int current){
        ModelAndView mv = new ModelAndView();
        Page<OrderUser> page = orderService.selectPage(new Page<OrderUser>(current,5),
                new EntityWrapper<OrderUser>());

        for (int i = 0; i < page.getRecords().size(); i++){

            //买家名
            long bid = page.getRecords().get(i).getBid();
            String bname = userService.selectById(bid).getName();
            page.getRecords().get(i).setBname(bname);
            //卖家名
            long sid = page.getRecords().get(i).getSid();
            String sname = userService.selectById(sid).getName();
            page.getRecords().get(i).setSname(sname);

            //物品名称
            long gid = page.getRecords().get(i).getGid();
            String goodsName = goodsService.selectById(gid).getName();
            page.getRecords().get(i).setGoodsName(goodsName);
        }
        mv.setViewName("admin/ordersUserInfo");
        mv.addObject("page",page);
        return mv;
    }

    /**
     *订单公开信息
     * @param
     * @return
     */
    @RequestMapping("selectOrderByPubilc")
    public ModelAndView selectOrderByPubilc(int current){
        ModelAndView mv = new ModelAndView();
        Page<OrderUser> page = orderService.selectPage(new Page<OrderUser>(current,5),
                new EntityWrapper<OrderUser>());

        for (int i = 0; i < page.getRecords().size(); i++){

            //买家名
            long bid = page.getRecords().get(i).getBid();
            String bname = userService.selectById(bid).getName();
            page.getRecords().get(i).setBname(bname);
            //卖家名
            long sid = page.getRecords().get(i).getSid();
            String sname = userService.selectById(sid).getName();
            page.getRecords().get(i).setSname(sname);

            //物品名称
            long gid = page.getRecords().get(i).getGid();
            String goodsName = goodsService.selectById(gid).getName();
            page.getRecords().get(i).setGoodsName(goodsName);
        }
        mv.setViewName("pubilcInfo");
        mv.addObject("page",page);
        return mv;
    }
}

