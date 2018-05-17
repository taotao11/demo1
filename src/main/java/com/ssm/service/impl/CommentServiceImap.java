package com.ssm.service.impl;

import com.ssm.entity.Comment;
import com.ssm.mapper.CommentMapper;
import com.ssm.service.CommentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 
 * @since 2018-05-05
 */
@Service
public class CommentServiceImap extends ServiceImpl<CommentMapper, Comment> implements CommentService {

}
