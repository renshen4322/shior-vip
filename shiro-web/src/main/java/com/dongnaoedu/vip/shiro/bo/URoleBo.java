package com.dongnaoedu.vip.shiro.bo;

import com.dongnaoedu.vip.shiro.model.URole;
import com.dongnaoedu.vip.shiro.utils.StringUtils;

import java.io.Serializable;

/**
 * 用户角色选择
 *
 * @author allen
 */
public class URoleBo extends URole implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 用户ID (用String， 考虑多个ID，现在只有一个ID)
     */
    private String userId;
    /**
     * 是否勾选
     */
    private String marker;

    public boolean isCheck() {
        return StringUtils.equals(userId, marker);
    }

    public String getMarker() {
        return marker;
    }

    public void setMarker(String marker) {
        this.marker = marker;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

}
