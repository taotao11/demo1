package com.ssm.service.impl;

import com.ssm.entity.User;
import com.ssm.mapper.UserMapper;
import com.ssm.service.UserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 
 * @since 2018-04-11
 */
@Service
public class UserServiceImap extends ServiceImpl<UserMapper, User> implements UserService {

}
