package com.dongnaoedu.vip.shiro.bo;

import com.dongnaoedu.vip.shiro.model.UPermission;
import com.dongnaoedu.vip.shiro.utils.StringUtils;

import java.io.Serializable;

/**
 * 权限选择
 *
 * @author allen
 */
public class UPermissionBo extends UPermission implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 是否勾选
     */
    private String marker;
    /**
     * role Id
     */
    private String roleId;

    public boolean isCheck() {
        return StringUtils.equals(roleId, marker);
    }

    public String getMarker() {
        return marker;
    }

    public void setMarker(String marker) {
        this.marker = marker;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

}
