package com.dongnaoedu.vip.shiro.mapper;

import com.dongnaoedu.vip.shiro.bo.UPermissionBo;
import com.dongnaoedu.vip.shiro.model.UPermission;

import java.util.List;
import java.util.Set;

public interface UPermissionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UPermission record);

    int insertSelective(UPermission record);

    UPermission selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UPermission record);

    int updateByPrimaryKey(UPermission record);

    List<UPermissionBo> selectPermissionById(Long id);

    //根据用户ID获取权限的Set集合
    Set<String> findPermissionByUserId(Long id);
}