package com.dongnaoedu.vip.shiro.core.shiro.cache.impl;

import com.dongnaoedu.vip.shiro.core.shiro.cache.JedisManager;
import com.dongnaoedu.vip.shiro.core.shiro.cache.JedisShiroCache;
import com.dongnaoedu.vip.shiro.core.shiro.cache.ShiroCacheManager;
import org.apache.shiro.cache.Cache;

/**
 * 开发公司：SOJSON在线工具 <p>
 * 版权所有：© www.sojson.com<p>
 * 博客地址：http://www.sojson.com/blog/  <p>
 * <p>
 * <p>
 * JRedis管理
 * <p>
 * <p>
 * <p>
 * 区分　责任人　日期　　　　说明<br/>
 * 创建　周柏成　2016年6月2日 　<br/>
 *
 * @author zhou-baicheng
 * @version 1.0, 2016年6月2日 <br/>
 * @email so@sojson.com
 */
public class JedisShiroCacheManager implements ShiroCacheManager {

    private JedisManager jedisManager;

    @Override
    public <K, V> Cache<K, V> getCache(String name) {
        return new JedisShiroCache<K, V>(name, getJedisManager());
    }

    @Override
    public void destroy() {
        //如果和其他系统，或者应用在一起就不能关闭
        //getJedisManager().getJedis().shutdown();
    }

    public JedisManager getJedisManager() {
        return jedisManager;
    }

    public void setJedisManager(JedisManager jedisManager) {
        this.jedisManager = jedisManager;
    }
}
