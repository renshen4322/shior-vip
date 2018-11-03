package com.dongnaoedu.vip.shiro.config;

import org.apache.shiro.subject.Subject;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * @Auther: allen
 * @Date: 2018/9/1 19:08
 */
public class RolesOrFilter extends org.apache.shiro.web.filter.authz.AuthorizationFilter {
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        Subject subject = getSubject(request, response);

        String[] roles = (String[]) mappedValue;

        if (roles == null || roles.length == 0) {
            return true;
        }

        for (String role : roles) {
            if (subject.hasRole(role)) {
                return true;
            }
        }

        return false;
    }
}
