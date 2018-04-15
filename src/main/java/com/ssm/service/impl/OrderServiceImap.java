package com.ssm.service.impl;

import com.ssm.entity.OrderUser;
import com.ssm.mapper.OrderMapper;
import com.ssm.service.OrderService;
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
public class OrderServiceImap extends ServiceImpl<OrderMapper, OrderUser> implements OrderService {

}
