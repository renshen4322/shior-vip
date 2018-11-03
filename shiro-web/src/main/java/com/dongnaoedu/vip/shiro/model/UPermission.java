package com.dongnaoedu.vip.shiro.model;

import java.io.Serializable;

/**
 * 权限实体
 *
 * @author allen
 */
public class UPermission implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    /**
     * 操作的url
     */
    private String url;
    /**
     * 操作的名称
     */
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}