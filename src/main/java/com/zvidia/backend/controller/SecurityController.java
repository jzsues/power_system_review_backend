/**
 * 
 */
package com.zvidia.backend.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.zvidia.backend.repository.FunctionRepository;
import com.zvidia.backend.repository.RoleRepository;
import com.zvidia.backend.repository.UserRepository;

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

}
