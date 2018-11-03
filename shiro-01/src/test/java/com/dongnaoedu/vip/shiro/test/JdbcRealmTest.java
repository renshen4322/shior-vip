package com.dongnaoedu.vip.shiro.test;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.jdbc.JdbcRealm;
import org.apache.shiro.subject.Subject;
import org.junit.Test;

public class JdbcRealmTest {

    DruidDataSource druidDataSource = new DruidDataSource();

    {
        druidDataSource.setUrl("jdbc:mysql://localhost:3306/shiro");
        //druidDataSource.setDriverClassName("com.mysql.jdbc.Driver"); // 不加会自动判断
        druidDataSource.setUsername("root");
        druidDataSource.setPassword("123456");
    }

    /**
     * JdbcRealm测试
     */
    @Test
    public void testJdbcRealm() {

        JdbcRealm jdbcRealm = new JdbcRealm();
        jdbcRealm.setDataSource(druidDataSource);

        // 使用jdbc一定要记得开启，默认是关闭的
        jdbcRealm.setPermissionsLookupEnabled(true);

        // 1、得到SecurityManager实例 并绑定给SecurityUtils
        DefaultSecurityManager defaultSecurityManager = new DefaultSecurityManager();
        defaultSecurityManager.setRealm(jdbcRealm);
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

        System.out.println("isAuthenticated：" + subject.isAuthenticated());

        subject.checkRole("admin");
        subject.checkPermission("user:delete");
        subject.checkPermissions("user:delete", "user:update");

        // 退出
        subject.logout();

        System.out.println("退出后再验证：" + subject.isAuthenticated());
    }

    /**
     * JdbcRealm测试，自定义sql
     */
    @Test
    public void testJdbcRealm_SQL() {

        JdbcRealm jdbcRealm = new JdbcRealm();
        jdbcRealm.setDataSource(druidDataSource);

        // 使用jdbc一定要记得开启，默认是关闭的
        jdbcRealm.setPermissionsLookupEnabled(true);

        // 使用自定义sql
        String atSQL = "select password from test_users where username = ?";
        jdbcRealm.setAuthenticationQuery(atSQL);

        // 1、得到SecurityManager实例 并绑定给SecurityUtils
        DefaultSecurityManager defaultSecurityManager = new DefaultSecurityManager();
        defaultSecurityManager.setRealm(jdbcRealm);
        SecurityUtils.setSecurityManager(defaultSecurityManager);

        // 2、得到Subject及创建用户名/密码身份验证Token（即用户身份/凭证）
        AuthenticationToken token = new UsernamePasswordToken("tony", "123");
        Subject subject = SecurityUtils.getSubject();

        try {
            // 3、登录，即身份验证
            subject.login(token);
        } catch (AuthenticationException e) {
            // 4、身份验证失败
        }

        System.out.println("isAuthenticated：" + subject.isAuthenticated());

        // 要换都得换哦
//        subject.checkRole("admin");
//        subject.checkPermission("user:delete");
//        subject.checkPermissions("user:delete", "user:update");

        // 退出
        subject.logout();

        System.out.println("退出后再验证：" + subject.isAuthenticated());
    }


}
