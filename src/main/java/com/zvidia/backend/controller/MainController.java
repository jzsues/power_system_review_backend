/*******************************************************************************
 * Copyright (C) 2013 ZVIDIA Co., Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.
 *
 * Contributors:
 *     ZVIDIA Corporation - initial API and implementation
 *******************************************************************************/
package com.zvidia.backend.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zvidia.common.entity.FunctionInfo;
import com.zvidia.common.entity.RoleInfo;
import com.zvidia.common.entity.UserInfo;
import com.zvidia.common.repository.UserRepository;
import com.zvidia.common.security.SecurityUtils;

/**
 * Created with IntelliJ IDEA. User: jiangzm Date: 13-5-13 Time: 下午8:49 To
 * change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	UserRepository userRepository;

	@RequestMapping("")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("main");
		String checkUsername = SecurityUtils.checkUsername();
		UserInfo userInfo = userRepository.findByUsername(checkUsername);
		if (userInfo != null) {
			mv.addObject("department", userInfo.getDepartment());
			mv.addObject("nickName", userInfo.getNickName());
			mv.addObject("userId", userInfo.getId());
			Collection<RoleInfo> authorities = userInfo.getAuthorities();
			Map<String, List<FunctionInfo>> menus = new HashMap<String, List<FunctionInfo>>();
			for (RoleInfo role : authorities) {
				Collection<FunctionInfo> funcs = role.getFuncs();
				for (FunctionInfo func : funcs) {
					String category = func.getCategory();
					List<FunctionInfo> list = menus.get(category);
					if (list == null) {
						list = new ArrayList<FunctionInfo>();
					}
					list.add(func);
					menus.put(category, list);
				}
			}
			mv.addObject("menus", menus);
		}
		return mv;
	}
}
