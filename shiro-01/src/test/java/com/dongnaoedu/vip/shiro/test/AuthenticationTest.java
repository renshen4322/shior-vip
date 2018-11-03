package com.dongnaoedu.vip.shiro.test;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.SimpleAccountRealm;
import org.apache.shiro.subject.Subject;
import org.junit.Before;
import org.junit.Test;

public class AuthenticationTest {

    SimpleAccountRealm simpleAccountRealm = new SimpleAccountRealm();

    @Before
    public void addUser() {
        simpleAccountRealm.addAccount("allen", "123", "admin", "user");
    }

    /**
     * 认证和授权
     */
    @Test
    public void testAuthentication() {

        // 1、得到SecurityManager实例 并绑定给SecurityUtils
        DefaultSecurityManager defaultSecurityManager = new DefaultSecurityManager();
        defaultSecurityManager.setRealm(simpleAccountRealm);
        SecurityUtils.setSecurityManager(defaultSecurityManager);

        // 2、得到Subject及创建用户名/密码身份验证Token（即用户身份/凭证）
        AuthenticationToken token = new UsernamePasswordToken("allen", "123");
        Subject subject = SecurityUtils.getSubject();

        try {
            // 3、登录，即身份验证
            subject.login(token);
        } catch (AuthenticationException e) {
            // 4、身份验证失败
        }

        //Assert.assertEquals(true, subject.isAuthenticated()); // 断言用户已经登录
        System.out.println("isAuthenticated：" + subject.isAuthenticated());

        subject.checkRole("admin");
        subject.checkRoles("admin", "user");

        // 退出
        subject.logout();

        System.out.println("退出后再验证：" + subject.isAuthenticated());
    }

}
