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

import java.util.Collection;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zvidia.backend.entity.RoleInfo;
import com.zvidia.backend.entity.UserInfo;
import com.zvidia.backend.repository.FunctionRepository;
import com.zvidia.backend.repository.RoleRepository;
import com.zvidia.backend.repository.UserRepository;
import com.zvidia.common.controller.AbstractAjaxCRUDController;

/**
 * Created with IntelliJ IDEA. User: jiangzm Date: 13-5-13 Time: 下午9:55 To
 * change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/user")
public class UserController extends AbstractAjaxCRUDController<UserInfo, Long> {
	@Autowired
	UserRepository userRepository;

	@Autowired
	FunctionRepository functionRepository;

	@Autowired
	RoleRepository roleRepository;

	@Override
	protected Page<UserInfo> doPageQuery(Pageable pageable, HashMap<String, Object> query) {
		return userRepository.findAll(pageable);
	}

	protected Object beforeFTLRender(HttpServletRequest request) {
		return roleRepository.findAll();
	}

	@Override
	protected void afterPageQuery(Page<UserInfo> result) {

	}

	@Override
	protected UserInfo doSave(UserInfo entity) {
		return userRepository.save(entity);
	}

	@Override
	protected void doDelete(Long id) {
		userRepository.delete(id);
	}

	@Override
	protected UserInfo doGet(Long id) {
		return userRepository.findOne(id);
	}

	@Override
	protected void beforeSaveRequest(UserInfo entity, HttpServletRequest request) {
		long roleId = Long.parseLong(request.getParameter("roleId"));
		RoleInfo roleInfo = roleRepository.findOne(roleId);
		Collection<RoleInfo> authorities = entity.getAuthorities();
		authorities.add(roleInfo);
		entity.setAuthorities(authorities);
	}
}
