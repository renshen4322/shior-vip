package com.dongnaoedu.vip.shiro.model;

import java.io.Serializable;

/**
 * 用户{@link UUser} 和角色 {@link URole} 中间表
 *
 * @author allen
 */
public class UUserRole implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long uid;
    private Long rid;

    public UUserRole(Long uid, Long rid) {
        this.uid = uid;
        this.rid = rid;
    }

    public UUserRole() {
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }
}