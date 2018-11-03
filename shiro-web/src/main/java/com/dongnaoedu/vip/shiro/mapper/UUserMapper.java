package com.dongnaoedu.vip.shiro.mapper;

import com.dongnaoedu.vip.shiro.bo.URoleBo;
import com.dongnaoedu.vip.shiro.model.UUser;

import java.util.List;
import java.util.Map;

public interface UUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UUser record);

    int insertSelective(UUser record);

    UUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UUser record);

    int updateByPrimaryKey(UUser record);

    UUser login(Map<String, Object> map);

    UUser findUserByEmail(String email);

    List<URoleBo> selectRoleByUserId(Long id);

}