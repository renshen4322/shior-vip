package com.dongnaoedu.vip.shiro.model;

import java.io.Serializable;

/**
 * 角色{@link URole}和 权限{@link UPermission}中间表
 *
 * @author allen
 */
public class URolePermission implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long rid;

    private Long pid;

    public URolePermission() {
    }

    public URolePermission(Long rid, Long pid) {
        this.rid = rid;
        this.pid = pid;
    }

    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

}