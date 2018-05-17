package com.ssm.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.*;
import com.ssm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 页面跳转控制器
 * 
 */
@Controller
public class HomeController {
    @Autowired
    private UserService userService;
    @Autowired
    private ImgService imgService;
    @Autowired
    private TopicService topicService;
    @Autowired
    private JindianService jindianService;
    @Autowired
    private ActivityService activityService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private FollowService followService;
    @Autowired
    private NoticeService1 noticeService;
    /**
     * 首页跳转
     * @return
     */
    @RequestMapping(value = {"/","/index"})
    public ModelAndView index(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/index");
        setMv(mv);
        return mv;
    }
    public void setMv(ModelAndView mv){
        //景点
        Page<Jindian> page = jindianService.selectPage(new Page<Jindian>(0,2),new EntityWrapper<Jindian>());
        int i = 0;
        for (Jindian jindian : page.getRecords()){
            List<Img> im = imgService.selectList(new EntityWrapper<Img>()
                    .eq("j_id",jindian.getId()));
            page.getRecords().get(i).setUrl(im.get(0).getImgUrl());
            i++;
        }
        mv.addObject("jin",page.getRecords());
        //公告
        Page<Notice1> noticePage = noticeService.selectPage(new Page<Notice1>(0,4),new EntityWrapper<Notice1>()
                .orderBy("creat_time",true));
        mv.addObject("notice",noticePage.getRecords());
        //活动
        Page<Activity> activityPage = activityService.selectPage(new Page<Activity>(0,4),new EntityWrapper<Activity>());
        List<CommentUser> list = getCu(activityPage);
        mv.addObject("xg",list);
        System.out.println(list);
        //近期活动
        List<String> strings = new ArrayList<String>();
        strings.add("beginTime");
        Page<Activity> activitys = activityService.selectPage(new Page<Activity>(0,4)
                ,new EntityWrapper<Activity>().orderDesc(strings));
        List<CommentUser> lists = getCu(activitys);
        mv.addObject("jq",lists);
        System.out.println(lists);

        //热门话题
        Page<Topic> topicPage = topicService.selectPage(new Page<Topic>(0,3),new EntityWrapper<Topic>());
        List<CommentUser> list1 = new ArrayList<CommentUser>();
        for (int j = 0;j<topicPage.getRecords().size();j++){
            User user = userService.selectById(topicPage.getRecords().get(j).getUid());
            List<Img> imgs = imgService.selectList(new EntityWrapper<Img>().eq("u_id",user.getId()));
            user.setUrl(imgs.get(0).getImgUrl());
            CommentUser commentUser = new CommentUser();
            commentUser.setTopic(topicPage.getRecords().get(j));
            commentUser.setUser(user);
            list1.add(commentUser);
        }
        mv.addObject("rm",list1);
    }
    public List getCu(Page<Activity> page){
        List<CommentUser> list = new ArrayList<CommentUser>();
        for (int j = 0;j<page.getRecords().size();j++){
            User user = userService.selectById(page.getRecords().get(j).getUid());
            List<Img> imgs = imgService.selectList(new EntityWrapper<Img>().eq("u_id",user.getId()));
            user.setUrl(imgs.get(0).getImgUrl());
            CommentUser commentUser = new CommentUser();
            commentUser.setActivity(page.getRecords().get(j));
            commentUser.setUser(user);
            list.add(commentUser);
        }
        return list;
    }
    /**
     * 登录页跳转
     */
    @RequestMapping("/login")
    public String login(){
        return "html/user/login";
    }

    /**
     * 注册跳转
     * @return
     */
    @RequestMapping("/reg")
    public String reg(){
        return "html/user/reg";
    }

    /**
     * 设置跳转
     * @return
     */
    @RequestMapping("/set")
    public String set(){
        return "html/user/set";
    }

    /**
     *个人主页跳转
     * @return
     */
    @RequestMapping("/myIndex/{id}")
    public ModelAndView myIndex(@PathVariable("id") long id){
        ModelAndView mv = new ModelAndView();
        User user = userService.selectById(id);
        List<Img> imgs = imgService.selectList(new EntityWrapper<Img>().eq("u_id",user.getId()));
        user.setUrl(imgs.get(0).getImgUrl());
        //景点
        List<Jindian> jindians = jindianService.selectList(new EntityWrapper<Jindian>()
                .eq("uid",id));
        //活动
        List<Activity> activities = activityService.selectList(new EntityWrapper<Activity>()
                .eq("uid",id));

        //话题
        List<Topic> topics = topicService.selectList(new EntityWrapper<Topic>()
                .eq("uid",id));
        //评论
        List<String> desc = new ArrayList<String>();
        desc.add("time");
        List<Comment> list = commentService.selectList(new EntityWrapper<Comment>()
        .eq("uid",id).isNotNull("tid").orderDesc(desc));
        List<CommentUser> commentUsers = new ArrayList<CommentUser>();
        int i = 0;
        for (Comment comment : list){
            Topic topic = topicService.selectById(comment.getTid());
            CommentUser commentUser = new CommentUser(null,comment);
            commentUser.setTopic(topic);
            commentUsers.add(commentUser);
            if (i < 4){
                break;
            }
            i++;
        }
        mv.addObject("jindians",jindians);
        mv.addObject("activities",activities);
        mv.addObject("topics",topics);
        mv.addObject("c",commentUsers);
        mv.setViewName("html/user/home");
        mv.addObject("userI",user);
        return mv;
    }

    /**
     * 帖子集合
     * @param id
     * @return
     */
    @RequestMapping("/userIndex")
    public ModelAndView userIndex(long id){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/user/index");
        //景点
        List<Jindian> jindians = jindianService.selectList(new EntityWrapper<Jindian>()
        .eq("uid",id));
        //活动
        List<Activity> activities = activityService.selectList(new EntityWrapper<Activity>()
        .eq("uid",id));
        //话题
        List<Topic> topics = topicService.selectList(new EntityWrapper<Topic>()
        .eq("uid",id));
        mv.addObject("jindians",jindians);
        mv.addObject("activities",activities);
        mv.addObject("topics",topics);
        return mv;
    }

    /**
     * 景点添加
     * @return
     */
    @RequestMapping("/addJ")
    public String addJindian(){
        return "html/jie/add";
    }

    /**
     * 详情
     */
    @RequestMapping("/detail/{id}")
    public ModelAndView detail(@PathVariable("id") long id){
        ModelAndView mv = new ModelAndView();
        Jindian jindian = jindianService.selectById(id);
        User user = userService.selectById(jindian.getUid());
        //关注判断
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        List<Follow> follows = followService.selectList(new EntityWrapper<Follow>()
        .eq("gid",u.getId())
        .eq("bid",user.getId()));
        if (follows.size() > 0){
            mv.addObject("guan","guanzhu");
        }
        List<Img> imgs = imgService.selectList(new EntityWrapper<Img>()
        .eq("u_id",user.getId()));
        List<Img> im = imgService.selectList(new EntityWrapper<Img>()
                .eq("j_id",jindian.getId()));
        user.setUrl(imgs.get(0).getImgUrl());
        jindian.setUrl(im.get(0).getImgUrl());
        mv.addObject("jindian",jindian);
        mv.addObject("u",user);

        List<Comment> list = commentService.selectList(new EntityWrapper<Comment>()
        .eq("jid",jindian.getId()));
        List<CommentUser> commentUserList = new ArrayList<CommentUser>();
        for (Comment comment : list){
           User user1 = userService.selectById(comment.getUid());
            List<Img> img = imgService.selectList(new EntityWrapper<Img>()
                    .eq("u_id",user1.getId()));
            user1.setUrl(img.get(0).getImgUrl());
           commentUserList.add(new CommentUser(user1,comment));
        }
        mv.addObject("c",commentUserList);
        mv.setViewName("html/jie/detail");
        return mv;
    }

    /**
     *活动详情
     */
    @RequestMapping("/activity/{id}")
    public ModelAndView activity(@PathVariable("id") long id){
        ModelAndView mv = new ModelAndView();
        Activity activity = activityService.selectById(id);

        User user = userService.selectById(activity.getUid());

        //关注判断
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        List<Follow> follows = followService.selectList(new EntityWrapper<Follow>()
                .eq("gid",u.getId())
                .eq("bid",user.getId()));
        if (follows.size() > 0){
            mv.addObject("guan","guanzhu");
        }
        List<Img> imgs = imgService.selectList(new EntityWrapper<Img>()
                .eq("u_id",user.getId()));
        user.setUrl(imgs.get(0).getImgUrl());

        List<Img> im = imgService.selectList(new EntityWrapper<Img>()
                .eq("a_id",activity.getId()));
        activity.setUrl(im.get(0).getImgUrl());
        mv.addObject("activity",activity);
        mv.addObject("u",user);

        List<Comment> list = commentService.selectList(new EntityWrapper<Comment>()
                .eq("aid",activity.getId()));
        List<CommentUser> commentUserList = new ArrayList<CommentUser>();

        for (Comment comment : list){
            User user1 = userService.selectById(comment.getUid());
            List<Img> img = imgService.selectList(new EntityWrapper<Img>()
                    .eq("u_id",user1.getId()));
            user1.setUrl(img.get(0).getImgUrl());
            commentUserList.add(new CommentUser(user1,comment));
        }

        mv.addObject("c",commentUserList);
        mv.setViewName("html/jie/activity");
        return mv;
    }
    /**
     *话题详情
     */
    @RequestMapping("/topic/{id}")
    public ModelAndView topic(@PathVariable("id") long id){
        ModelAndView mv = new ModelAndView();
        Topic topic = topicService.selectById(id);

        User user = userService.selectById(topic.getUid());
        //关注判断
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        List<Follow> follows = followService.selectList(new EntityWrapper<Follow>()
                .eq("gid",u.getId())
                .eq("bid",user.getId()));
        if (follows.size() > 0){
            mv.addObject("guan","guanzhu");
        }
        List<Img> imgs = imgService.selectList(new EntityWrapper<Img>()
                .eq("u_id",user.getId()));
        user.setUrl(imgs.get(0).getImgUrl());

        mv.addObject("topic",topic);
        mv.addObject("u",user);

        List<Comment> list = commentService.selectList(new EntityWrapper<Comment>()
                .eq("tid",topic.getId()));
        List<CommentUser> commentUserList = new ArrayList<CommentUser>();

        for (Comment comment : list){
            User user1 = userService.selectById(comment.getUid());
            List<Img> img = imgService.selectList(new EntityWrapper<Img>()
                    .eq("u_id",user1.getId()));
            user1.setUrl(img.get(0).getImgUrl());
            commentUserList.add(new CommentUser(user1,comment));
        }

        mv.addObject("c",commentUserList);
        mv.setViewName("html/jie/topic");
        return mv;
    }
    /**
     * 帖子查询
     * @return
     */
    @RequestMapping("/selectJ")
    public ModelAndView selectJ(int type,String seach){
        ModelAndView mv = new ModelAndView();
        if (seach == null || "".equals(seach)){
           mv.setViewName("html/index");
            return mv;
        }
        if (type == 0){
            Page<Jindian> page =jindianService.selectPage(new Page<Jindian>(1,20),
                    new EntityWrapper<Jindian>().like("title",seach));
            List<CommentUser> commentUserList = new ArrayList<CommentUser>();
            for (int i = 0;i<page.getRecords().size();i++){
                User user1 = userService.selectById(page.getRecords().get(i).getUid());
                List<Img> img = imgService.selectList(new EntityWrapper<Img>()
                        .eq("u_id",user1.getId()));
                user1.setUrl(img.get(0).getImgUrl());
                CommentUser user = new CommentUser();
                user.setUser(user1);
                user.setJindian(page.getRecords().get(i));
                commentUserList.add(user);
            }
            mv.addObject("page",page);
            mv.addObject("c",commentUserList);
            mv.setViewName("html/jie/index");
        }
        if (type == 1){
            Page<Activity> page =activityService.selectPage(new Page<Activity>(1,20),
                    new EntityWrapper<Activity>().like("title",seach));
            List<CommentUser> commentUserList = new ArrayList<CommentUser>();
            for (int i = 0;i<page.getRecords().size();i++){
                User user1 = userService.selectById(page.getRecords().get(i).getUid());
                List<Img> img = imgService.selectList(new EntityWrapper<Img>()
                        .eq("u_id",user1.getId()));
                user1.setUrl(img.get(0).getImgUrl());

                CommentUser user = new CommentUser();
                user.setUser(user1);
                user.setActivity(page.getRecords().get(i));
                commentUserList.add(user);
            }
            mv.addObject("page",page);
            mv.addObject("c",commentUserList);
            mv.setViewName("html/jie/aitems");
        }

        if (type == 2){

            Page<Topic> page =topicService.selectPage(new Page<Topic>(1,20)
                    ,new EntityWrapper<Topic>().like("title",seach));
            List<CommentUser> commentUserList = new ArrayList<CommentUser>();

            for (int i = 0;i<page.getRecords().size();i++){
                User user1 = userService.selectById(page.getRecords().get(i).getUid());
                List<Img> img = imgService.selectList(new EntityWrapper<Img>()
                        .eq("u_id",user1.getId()));
                user1.setUrl(img.get(0).getImgUrl());
                CommentUser user = new CommentUser();
                user.setUser(user1);
                user.setTopic(page.getRecords().get(i));
                commentUserList.add(user);
            }
            mv.addObject("page",page);
            mv.addObject("c",commentUserList);
            mv.setViewName("html/jie/titems");
        }

        return mv;
    }
    /**
     * 景点列表
     * @return
     */
    @RequestMapping("/jList")
    public ModelAndView jindian(int current,int type){
        ModelAndView mv = new ModelAndView();
        Page<Jindian> page =jindianService.selectPage(new Page<Jindian>(current,10),new EntityWrapper<Jindian>());
        List<CommentUser> commentUserList = new ArrayList<CommentUser>();
        for (int i = 0;i<page.getRecords().size();i++){
            User user1 = userService.selectById(page.getRecords().get(i).getUid());
            List<Img> img = imgService.selectList(new EntityWrapper<Img>()
                    .eq("u_id",user1.getId()));
            user1.setUrl(img.get(0).getImgUrl());
            CommentUser user = new CommentUser();
            user.setUser(user1);
            user.setJindian(page.getRecords().get(i));
            commentUserList.add(user);
        }
        mv.addObject("page",page);
        mv.addObject("c",commentUserList);
        if (type == 0){
            mv.setViewName("html/jie/index");
        }else {
            mv.setViewName("html/web/jindian");
        }

        return mv;
    }

    /**
     * 活动列表
     * @param current
     * @return
     */
    @RequestMapping("/aList")
    public ModelAndView activity(int current,int type){
        ModelAndView mv = new ModelAndView();
        Page<Activity> page =activityService.selectPage(new Page<Activity>(current,10),new EntityWrapper<Activity>());
        List<CommentUser> commentUserList = new ArrayList<CommentUser>();
        for (int i = 0;i<page.getRecords().size();i++){
            User user1 = userService.selectById(page.getRecords().get(i).getUid());
            List<Img> img = imgService.selectList(new EntityWrapper<Img>()
                    .eq("u_id",user1.getId()));
            user1.setUrl(img.get(0).getImgUrl());

            CommentUser user = new CommentUser();
            user.setUser(user1);
            user.setActivity(page.getRecords().get(i));
            commentUserList.add(user);
        }
        mv.addObject("page",page);
        mv.addObject("c",commentUserList);
        if (type == 0){
            mv.setViewName("html/jie/aitems");
        }else {
            mv.setViewName("html/web/activity");
        }

        return mv;
    }

    /**
     * 话题列表
     * @param current
     * @return
     */
    @RequestMapping("/tList")
    public ModelAndView topic(int current,int type){
        ModelAndView mv = new ModelAndView();

        Page<Topic> page =topicService.selectPage(new Page<Topic>(current,10),new EntityWrapper<Topic>());
        List<CommentUser> commentUserList = new ArrayList<CommentUser>();

        for (int i = 0;i<page.getRecords().size();i++){
            User user1 = userService.selectById(page.getRecords().get(i).getUid());
            List<Img> img = imgService.selectList(new EntityWrapper<Img>()
                    .eq("u_id",user1.getId()));
            user1.setUrl(img.get(0).getImgUrl());
            CommentUser user = new CommentUser();
            user.setUser(user1);
            user.setTopic(page.getRecords().get(i));
            commentUserList.add(user);
        }
        mv.addObject("page",page);
        mv.addObject("c",commentUserList);
        if (type == 0){
            mv.setViewName("html/jie/titems");
        }else {
            mv.setViewName("html/web/topic");
        }

        return mv;
    }
}
