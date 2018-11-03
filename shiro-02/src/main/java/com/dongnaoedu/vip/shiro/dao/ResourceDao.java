package com.dongnaoedu.vip.shiro.dao;

import com.dongnaoedu.vip.shiro.entity.Resource;

import java.util.List;

public interface ResourceDao {

    public Resource createResource(Resource resource);

    public Resource updateResource(Resource resource);

    public void deleteResource(Long resourceId);

    Resource findOne(Long resourceId);

    List<Resource> findAll();

}
