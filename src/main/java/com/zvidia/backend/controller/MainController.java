package com.zvidia.backend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created with IntelliJ IDEA.
 * User: jiangzm
 * Date: 13-5-13
 * Time: 下午8:49
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/main")
public class MainController {

    @RequestMapping("")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("main");
        return mv;
    }

}
