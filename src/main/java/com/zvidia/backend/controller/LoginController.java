/**
 * 
 */
package com.zvidia.backend.controller;

import java.util.concurrent.Callable;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zvidia.backend.repository.UserRepository;
import com.zvidia.common.entity.AjaxResponse;
import com.zvidia.common.entity.UserInfo;
import com.zvidia.common.meta.AjaxResponseCode;
import com.zvidia.common.meta.AjaxResponseStatus;
import com.zvidia.common.security.SecurityUtils;

/**
 * @author jiangzm
 * 
 */
@Controller
@RequestMapping("/login")
public class LoginController {
	Log logger = LogFactory.getLog(getClass());

	@Autowired
	UserRepository userRepository;

	@RequestMapping(value = "/do", method = { RequestMethod.POST })
	public @ResponseBody
	Callable<AjaxResponse> login(@RequestParam final String username, @RequestParam final String password) {
		return new Callable<AjaxResponse>() {

			@Override
			public AjaxResponse call() throws Exception {
				UserInfo user = userRepository.findByUsername(username);
				if (user == null) {
					return new AjaxResponse(AjaxResponseStatus.FORBIDDEN.getCode(), AjaxResponseCode.ERROR.getCode());
				}
				String md5 = SecurityUtils.md5(password);
				if (!md5.equals(user.getPassword())) {
					return new AjaxResponse(AjaxResponseStatus.FORBIDDEN.getCode(), AjaxResponseCode.ERROR.getCode());
				}
				return new AjaxResponse(user);
			}
		};
	}
}
