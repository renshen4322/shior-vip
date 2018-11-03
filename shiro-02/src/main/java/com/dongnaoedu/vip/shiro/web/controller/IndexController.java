package com.dongnaoedu.vip.shiro.web.controller;

import com.dongnaoedu.vip.shiro.entity.Resource;
import com.dongnaoedu.vip.shiro.entity.User;
import com.dongnaoedu.vip.shiro.service.ResourceService;
import com.dongnaoedu.vip.shiro.service.UserService;
import com.dongnaoedu.vip.shiro.web.bind.annotation.CurrentUser;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Set;

@Controller
public class IndexController {

    @Autowired
    private ResourceService resourceService;
    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String index(@CurrentUser User loginUser, Model model) {
        Set<String> permissions = userService.findPermissions(loginUser.getUsername());
        List<Resource> menus = resourceService.findMenus(permissions);
        model.addAttribute("menus", menus);
        return "index";
    }

    @RequestMapping("/welcome")
    public String welcome() {
        return "welcome";
    }

    @RequiresRoles("admin")
    @RequestMapping("/testRole")
    @ResponseBody
    public String testRole() {
        return "testRole success";
    }

    @RequiresRoles("admin1")
    @RequestMapping("/testRole1")
    @ResponseBody
    public String testRole1() {
        return "testRole1 success";
    }

}
