/**
 * 
 */
package com.zvidia.backend.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zvidia.backend.repository.FunctionRepository;
import com.zvidia.backend.repository.RoleRepository;
import com.zvidia.backend.repository.UserRepository;
import com.zvidia.common.entity.RoleInfo;
import com.zvidia.common.security.SecurityUtils;

/**
 * @author jiangzm
 * 
 */
@Controller
@RequestMapping("/security")
public class SecurityController {
	Log log = LogFactory.getLog(getClass());

	@Autowired
	UserRepository userRepository;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	FunctionRepository functionRepository;

	@RequestMapping("/menu")
	public ModelAndView sidebarMenu() {
		ModelAndView mv = new ModelAndView("/inc/sidebar");
		GrantedAuthority checkAuthority = SecurityUtils.checkAuthority();
		RoleInfo role = (RoleInfo)checkAuthority;
		return mv;
	}
}
