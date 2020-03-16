package com.shallowan.seckill.dao;

import com.shallowan.seckill.domain.SeckillUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * @author ShallowAn
 */
@Mapper
public interface SeckillUserDao {

    @Select("select * from miaosha_user where id = #{id}")
    SeckillUser getByid(@Param("id") long id);

    @Update("update miaosha_user set password = #{password} where id = #{id}")
    void update(SeckillUser toBeUpdate);
}
